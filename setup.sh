#!/bin/bash

SCRIPT=$(readlink -f $0)
LOC=`dirname $SCRIPT`

echo " "
echo "------------------"
echo "SETING UP DOTFILES"
echo "------------------"
echo " "


# Download pathogen for vim in not already installed
if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    echo "Pathogen not found"
    echo "Getting pathogen from: https://github.com/tpope/vim-pathogen"  
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo " "
else
    echo "Pathogen found in: ~/.vim/autoload/pathogen.vim"
    echo " "
fi

# Download Monokai colour scheme for vim if not installed
if [ ! -f ~/.vim/colors/monokai.vim ]; then
    echo "Monokai colour scheme not found"
    echo "Getting Monokai from: https://github.com/sickill/vim-monokai"
    if [ ! -d ~/.vim/colors ]; then
        echo "Making ~/.vim/colors"
        mkdir ~/.vim/colors
    fi
    wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim ~/.vim/colors
    echo " "
else
    echo "Found Monokai in: ~/.vim/colors/monokai.vim" 
fi

# Download vim-flake8 if not installed
if [ ! -d ~/.vim/bundle/vim-flake8 ]; then
    echo "vim-flake8 not found"
    echo "Getting vim-flake8 from: https://github.com/nvie/vim-flake8"
    git clone https://github.com/nvie/vim-flake8 ~/.vim/bundle/ 
    echo " "
else
    echo "Found vim-flake8 in: ~/.vim/bundle/vim-flake8"
fi

PWD="`pwd`"
BASEDIR="`(cd \"$PWD\"; pwd -P)`"

#  Use hidden files
shopt -s dotglob

OLD_DOTS=~/.old_dotfiles
mkdir ~/.old_dotfiles

DIR=$LOC/files
for FILE in $DIR/*; do
    echo FILE $FILE
    BASE=`basename $FILE`
    echo BASE ~/$BASE
    if [ -e ~/$BASE ]; then
        echo "$BASE exists"
        mv ~/$BASE $OLD_DOTS
    fi
    ln -s $FILE ~/$BASE
done

#ln -s ~/.dotfiles/setup2.sh ~/.testing_file
