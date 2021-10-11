export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lukerandall"
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

export JAVA_HOME=/opt/openjdk-bin-11
export JAVA_CMD="/opt/openjdk-bin-11/bin/java"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/lib64/ruby/gems/2.6.0/bin"
if [[ $(whoami) == "root" ]]; then
    export PATH="$PATH:/usr/local/bin"
fi
export PATH=$PATH:$JAVA_HOME/bin
