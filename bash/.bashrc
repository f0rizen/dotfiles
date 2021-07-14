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
source ~/gitstatus/gitstatus.plugin.sh

function my_set_prompt() {
  if [[ $(whoami) != "root" ]]; then
      PS1="\e[0;33m\u@\h: \e[0;34m\w\e[m"
  else 
      PS1="\e[0;31m\u@\h: \e[0;34m\w\e[m"
  fi

  if gitstatus_query && [[ "$VCS_STATUS_RESULT" == ok-sync ]]; then
    if [[ -n "$VCS_STATUS_LOCAL_BRANCH" ]]; then
      PS1+=" \e[0;32m${VCS_STATUS_LOCAL_BRANCH//\\/\\\\}\e[m"
    else
      PS1+=" @\e[0;32m${VCS_STATUS_COMMIT//\\/\\\\}\e[m"
    fi
    (( VCS_STATUS_HAS_STAGED    )) && PS1+='+'
    (( VCS_STATUS_HAS_UNSTAGED  )) && PS1+='!'
    (( VCS_STATUS_HAS_UNTRACKED )) && PS1+='?'
  fi

  if [[ $(whoami) != "root" ]]; then
      PS1+=" $ "
  else
      PS1+=" # "
  fi

  shopt -u promptvars
}

gitstatus_stop && gitstatus_start
PROMPT_COMMAND=my_set_prompt

