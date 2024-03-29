#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.functions
source ~/.aliases

H=$HOME
EDITOR=/usr/bin/nvim

bind "\C-A":menu-complete

if [[ $(whoami) != "root" ]]; then
    PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $\[\033[00m\] "
else
    PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;31m\]\h\[\033[01;34m\] \w #\[\033[00m\] "
fi

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/.local/bin:/usr/local/lib64/ruby/gems/3.0.0/bin:/usr/local/lib64/ruby/gems/3.0.0/bin
