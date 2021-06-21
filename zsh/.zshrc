export ZSH="$HOME/.oh-my-zsh"
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
bindkey '^Q' expand-or-complete

export PATH="$PATH:/home/f0rizen/.local/bin"
