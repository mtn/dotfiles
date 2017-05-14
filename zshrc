# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/michaelnoronha/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geoffgarside"

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

export EDITOR='vim'

#set history size
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#add timestamp for each entry
setopt EXTENDED_HISTORY

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias workspace='cd $HOME/Documents/workspace'
alias dotfiles='cd $HOME/dotfiles'
alias cs154='cd $HOME/Documents/workspace/c/cs154/mnoronha-cs154-spr-17'
alias csilm='mosh mnoronha@linux.cs.uchicago.edu'
alias csils='ssh mnoronha@linux.cs.uchicago.edu'

# redefine prompt_context for hiding user@hostname
prompt_context () { }

set -o vi

