#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.functions
source ~/.aliases

H=$HOME

PS1="[\e[0;32m\u\e[0m@\h \W] $ "
