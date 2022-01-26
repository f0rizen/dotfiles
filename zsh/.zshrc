export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="philips"
plugins=(
		git
)

source $ZSH/oh-my-zsh.sh

# Import aliases
source ~/.aliases

# Import functions
source ~/.functions

H=$HOME
EDITOR=/usr/local/bin/nvim
bindkey '^A' expand-or-complete

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/lib64/ruby/gems/2.6.0/bin"
if [[ $(whoami) == "root" ]]; then
    export PATH="$PATH:/usr/local/bin"
fi
