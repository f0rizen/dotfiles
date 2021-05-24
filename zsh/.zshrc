export ZSH="/home/f0rizen/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
		git
		zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Import aliases
source ~/.aliases

# Import functions
source ~/.functions

H=$HOME
bindkey '^A' expand-or-complete
