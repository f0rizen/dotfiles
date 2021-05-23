#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.functions
source ~/.aliases

H='/root'

PS1="[\e[0;31m\u\e[0m@\h \W] # "