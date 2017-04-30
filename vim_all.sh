#!/bin/bash

echo "Checking for dei installationn"
if [ ! -e  $HOME/.vim/bundle/dein.vim ]
then
    echo "Installing dein"
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh $HOME/.vim/bundle/dein.vim
else
    echo "Already installed!"
fi

echo "Linking vimrc..."
ln -sf $HOME/dotfiles/vimrc $HOME/.vimrc

echo "Done!"
