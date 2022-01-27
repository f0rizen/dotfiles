#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.functions
source ~/.aliases
source ~/.cargo/env

H=$HOME
EDITOR=/usr/local/bin/nvim

bind "\C-A":menu-complete

if [[ $(whoami) != "root" ]]; then
    PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $\[\033[00m\] "
else
    PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;31m\]\h\[\033[01;34m\] \w #\[\033[00m\] "
fi

export JAVA_HOME=/opt/openjdk-bin-11
export JAVA_CMD="/opt/openjdk-bin-11/bin/java"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/12/bin:$HOME/.local/bin:/usr/local/lib64/ruby/gems/2.6.0/bin:$JAVA_HOME/bin
. "$HOME/.cargo/env"
