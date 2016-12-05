#
# User configuration sourced by interactive shells
#

if [ -f ~/.zplug/init.zsh ]; then
  source ~/.zplug/init.zsh
  zplug "felixr/docker-zsh-completion"
  zplug "zsh-users/zsh-completions"
  zplug "mollifier/anyframe"
  zplug load --verbose
fi

[ -f ~/.zsh/zshrc.mine ]  && source ~/.zsh/zshrc.mine
[ -f ~/.zsh/zshrc.local ] && source ~/.zsh/zshrc.local

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
 source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

