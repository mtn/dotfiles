# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/michaelnoronha/.oh-my-zsh

export PATH="/Users/michaelnoronha/.local/bin:$HOME/Library/Haskell/bin:$HOME/.cargo/bin:$PATH"

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

alias wo='cd $HOME/Documents/workspace'
alias woc='cd $HOME/Documents/workspace/c'
alias wocp='cd $HOME/Documents/workspace/cpp'
alias woru='cd $HOME/Documents/workspace/rust'
alias worb='cd $HOME/Documents/workspace/rust'
alias worb='cd $HOME/Documents/workspace/ruby'
alias woha='cd $HOME/Documents/workspace/haskell'
alias wopy='cd $HOME/Documents/workspace/python'
alias wojs='cd $HOME/Documents/workspace/js'

alias dot='cd $HOME/dotfiles'
alias zshrc='vim $HOME/dotfiles/zshrc && source ~/.zshrc'
alias vimrc='vim $HOME/dotfiles/vim/vimrc'

alias csilm='mosh mnoronha@linux.cs.uchicago.edu'
alias csils='ssh mnoronha@linux.cs.uchicago.edu'

alias mlog='vim $HOME/Documents/workspace/log.txt'
alias todo='vim todo.txt'

alias mkt='pdflatex *.tex && rm *.log && rm *.aux && open *.pdf'

alias gid='git diff'
alias gidc='git diff --cached'

alias q='exit'
alias e='vim'
alias c='cat'

source /usr/local/bin/virtualenvwrapper.sh
export PIP_REQUIRE_VIRTUALENV=false

set -o vi


export NVM_DIR="/Users/michaelnoronha/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/Library/Haskell/bin:$PATH"

export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="/usr/local/opt/qt/bin:$PATH"
