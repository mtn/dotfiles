#!/bin/bash

cd $HOME
if [ ! -e $HOME/dotfiles ]
then
    echo "Overwriting local dotfiles repository!"
    rm -rf dotfiles
else
git clone https://github.com/mtn/dotfiles.git 

echo "Checking for dein installation"
if [ ! -e  $HOME/.vim/bundle/dein.vim ]
then
    echo "Installing dein"
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh $HOME/.vim/bundle/dein.vim
else
    echo "Already installed!"
fi

echo "Linking vimrc..."
if [ ! -e $HOME/.vimrc ]
then
    echo "Backing up old vimrc to ~/.vimrc.old..."
    mv $HOME/.vimrc $HOME/.vimrc.old
    echo "Backed up successfully!"
fi

ln -s $HOME/dotfiles/vimrc $HOME/.vimrc

echo "Done! First run will take awhile."

