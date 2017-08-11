#!/bin/bash

cd $HOME
if [ -e $HOME/dotfiles ]
then
    echo "Overwriting local dotfiles repository!"
    rm -rf dotfiles
fi
git clone https://github.com/mtn/dotfiles.git 

echo "Checking for vim-plug installation"
if [ ! -e  $HOME/.vim/autoload/plug.vim ]
then
    echo "Installing vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vimelse
    echo "Already installed!"
fi

echo "Linking vimrc..."
if [ -e $HOME/.vimrc ]
then
    echo "Backing up old vimrc to ~/.vimrc.old..."
    mv $HOME/.vimrc $HOME/.vimrc.old
    echo "Backed up successfully!"
fi

ln -s $HOME/dotfiles/vimrc $HOME/.vimrc

echo "Done! First run will take awhile."

