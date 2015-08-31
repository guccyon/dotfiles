# The following lines were added by compinstall
#zstyle :compinstall filename '/home/tetsu/.zshrc'

## environment #############################
export LANG=ja_JP.UTF-8
export EDITOR=vi
export LESS="-R"
export SHELL=/bin/zsh

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
fpath=(~/.zsh/functions/Completion $fpath)
fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -Uz compinit
compinit
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
setopt complete_aliases


## aliases ##################################
# alias ls="ls -G -v -F --color=auto"
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

umask 0002

# Customize to your needs...
if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
  source ~/.zsh/antigen/antigen.zsh
  [ -f ~/.zsh/plugins.antigen ] && source ~/.zsh/plugins.antigen
  antigen apply
fi

[ -f ~/.zsh/zshrc.mine ] && source ~/.zsh/zshrc.mine

