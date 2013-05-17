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

## color ###################################
autoload colors
colors
setopt PROMPT_SUBST
#local DEFAULT=$'%{\e[1;m%}'
#local RANDCOLOR=$'%{\e[1;$[31+RANDOM%6]m%}'

## prompt ##################################

          
case ${UID} in
501)
  #PROMPT="%B%{${fg[blue]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  PROMPT="[%n@%m] # "
  #PROMPT="[%{${fg[blue]}%}%n@%m%{${reset_color}%}] %{${fg[blue]}%}#%{${reset_color}%} "
  #PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
          PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
  ;;
*)
  #PROMPT="[%n@%m] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT="[%n] %{${fg[blue]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
  ;;
esac

## assist command option ##################
fpath=(~/.zsh/functions/Completion ${fpath})
fpath=(.zsh/zsh-completions/src $fpath)
autoload -Uz compinit
compinit -d ~/.zsh/zcompdump

## zstyle ############### 
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# # マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

## keymap ###################################
bindkey -e # emacs keybind
#bindkey -v # vi keybind

## history ##################################
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
setopt hist_no_store
setopt hist_expand
HISTFILE=~/.zsh/history
HISTSIZE=50000
SAVEHIST=50000

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
function history-all { history -E 1 }

## editor ###################################
autoload zed

## options ##################################
setopt correct
setopt nolistbeep 
setopt auto_cd 
setopt autopushd
setopt list_packed
setopt complete_aliases
setopt nobeep
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt noautoremoveslash
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす


## aliases ##################################
alias ls="ls -G"
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



[ -f ~/.zsh/zshrc.mine ] && source ~/.zsh/zshrc.mine

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
