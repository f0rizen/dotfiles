export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="mrtazz"
plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.aliases
source ~/.functions

H=$HOME
EDITOR=/usr/bin/nvim
bindkey '^A' expand-or-complete

if [[ $(whoami) == "root" ]]; then
    export PATH="$PATH:/usr/local/bin"
fi
export PATH="$PATH:/usr/local/lib64/ruby/gems/2.6.0/bin"
export PATH="$PATH:$HOME/.local/bin"

DISABLE_AUTO_TITLE="true"
case $TERM in xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac
