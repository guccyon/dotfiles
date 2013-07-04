# The following lines were added by compinstall
#zstyle :compinstall filename '/home/tetsu/.zshrc'

## environment #############################
export LANG=ja_JP.UTF-8
export EDITOR=vi
export LESS="-R"

#export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -e $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi

## colors ##################################
autoload -Uz colors
colors

if [ -f ~/.dircolors ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors)
  elif type gdircolors > /dev/null 2>&1; then
    eval $(gdircolors ~/.dircolors)
  fi
fi

## prompt ##################################
setopt prompt_subst

case ${UID} in
  0)
  #PROMPT="[%n@%m] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT="[%n] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  ;;
  *)
  PROMPT="%{$fg_bold[blue]%}%n@%m%{$fg_bold[white]%}%%%{$reset_color%} "  
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  #PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
          PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
esac


## assist command option ##################
fpath=(~/.zsh/functions/Completion ${fpath})
fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -Uz compinit
compinit -d ~/.zsh/zcompdump
setopt list_packed
setopt list_types
  
## zstyle ############### 
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*' group-name ''  #マッチ種別を別々に表示
[ -n "$LS_COLORS" ] && zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## keymap ###################################
bindkey -e # emacs keybind
#bindkey -v # vi keybind

## changing directory #######################
setopt auto_cd 
setopt autopushd
setopt pushdignoredups
setopt pushdminus

chpwd_functions=(ls_abbrev)
zle -N do_enter
bindkey '^m' do_enter

## history ##################################
HISTFILE=~/.zsh/history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
setopt hist_no_store
setopt hist_expand
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
function history-all { history -E 1 }

## vcs ######################################
autoload -Uz vcs_info
BASE_FORMAT="%{$fg_bold[yellow]%}%n@%m"
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats ':%{'$fg[red]'%}(%s)%b%{'$reset_color'%}'
zstyle ':vcs_info:git:*' actionformats ':%{'$fg[red]'%}(%s)%c%u%b<%a>'

setopt prompt_subst
precmd () {
  LANG=en_US.UTF-8 vcs_info
  PROMPT='%{$fg_bold[white]%}$BASE_FORMAT${vcs_info_msg_0_}%{$fg_bold[white]%}%%%{$reset_color%} '
}

## zsh-syntax-highlighting ##################
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

## editor ###################################
autoload zed


## options ##################################
setopt nolistbeep 
setopt nobeep
setopt auto_menu
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash
setopt correct
setopt noautoremoveslash
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす


## aliases ##################################
setopt complete_aliases
alias ls="ls -G -v -F --color=auto"
alias la="ls -a"
alias lf="ls -F"
alias ll='ls -l'
alias du="du -h"
alias df="df -h"
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
alias grep="egrep --color=always"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias src='source'
alias diff='colordiff'


## functions ################################

function ls_abbrev() {
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-CF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    # ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}

[ -f ~/.zsh/zshrc.mine ] && source ~/.zsh/zshrc.mine
