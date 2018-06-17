# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/michaelnoronha/.oh-my-zsh

export PATH="/Users/michaelnoronha/.local/bin:$HOME/Library/Haskell/bin:$HOME/.cargo/bin:$PATH"

export PATH="/Library/Frameworks/R.framework/Resources/bin:$PATH"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geoffgarside"

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

export EDITOR='vim'
export PAGER='less'

#set history size
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#add timestamp for each entry
setopt EXTENDED_HISTORY

plugins=(git zsh-directory-history zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias cl='clear'
alias cls='clear; ls'

alias wo='cd $HOME/Documents/workspace'
alias woc='cd $HOME/Documents/workspace/c'
alias wocp='cd $HOME/Documents/workspace/cpp'
alias woru='cd $HOME/Documents/workspace/rust'
alias worb='cd $HOME/Documents/workspace/ruby'
alias woha='cd $HOME/Documents/workspace/haskell'
alias wopy='cd $HOME/Documents/workspace/python'
alias wojs='cd $HOME/Documents/workspace/js'

alias vimspell='vim $HOME/.vim/spell/en.utf-8.add'

alias dot='cd $HOME/dotfiles'
alias zshrc='vim $HOME/dotfiles/zshrc && source ~/.zshrc'
alias vimrc='vim $HOME/dotfiles/vim/vimrc'

alias uchi='cd $HOME/Documents/workspace/uchicago/second'
alias csilm='mosh mnoronha@linux.cs.uchicago.edu'
alias csils='ssh mnoronha@linux.cs.uchicago.edu'
alias saldep='ssh jsalavon@latentculture.com'

alias mlog='vim $HOME/Documents/workspace/log.txt'
alias ideas='vim $HOME/Documents/workspace/ideas.txt'
alias todo='vim todo.txt'

alias mkt='pdflatex *.tex && rm *.log && rm *.aux && open *.pdf'
alias rip='echo "sad"'

alias gid='git diff'
alias gidc='git diff --cached'

alias q='exit'
alias e='vim'
alias c='cat'

source /usr/local/bin/mkvenv
source /usr/local/bin/workon
source /usr/local/bin/rmvenv
export PIP_REQUIRE_VIRTUALENV=false

set -o vi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"
export PATH="$HOME/go:$PATH"
