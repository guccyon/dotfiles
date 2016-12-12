#
# User configuration sourced by interactive shells
#

[ -f ~/.zsh/zshrc.mine ]  && source ~/.zsh/zshrc.mine
[ -f ~/.zsh/zshrc.local ] && source ~/.zsh/zshrc.local

if [ -f ~/.zplug/init.zsh ]; then
	source ~/.zplug/init.zsh
	zplug zsh-users/zsh-completions
	zplug zsh-users/zsh-history-substring-search
	zplug zsh-users/zsh-autosuggestions
	zplug zsh-users/zsh-syntax-highlighting, defer:2
	zplug felixr/docker-zsh-completion
# 	zplug "mollifier/anyframe"
	zplug "themes/steeef", from:oh-my-zsh
# 	zplug 'dracula/zsh', as:theme

	if ! zplug check --verbose; then
		printf "Install? [y/N]: "
		if read -q; then
			echo; zplug install
		fi
	fi

	zplug load --verbose
fi

[ -e $HOME/bin ] && export PATH=$HOME/bin:$PATH
