#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.functions
source ~/.aliases

H=$HOME

if [[ $(whoami) != "root" ]]
then PS1="\e[0;33m\u@\h: \e[0;34m\w \e[m$ "
else PS1="\e[0;31m\u@\h: \e[0;34m\w \e[m# "
fi
