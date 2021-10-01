# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
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
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/lib64/ruby/gems/2.6.0/bin"
if [[ $(whoami) == "root" ]]; then
    export PATH="$PATH:/usr/local/bin"
fi
export PATH=$PATH:$JAVA_HOME/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
