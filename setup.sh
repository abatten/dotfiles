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
    echo "FOUND: Pathogen"
    echo "LOCATION: ~/.vim/autoload/pathogen.vim"
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
    echo "FOUND: Monokai"
    echo "LOCATION: ~/.vim/colors/monokai.vim" 
    echo " "
fi

# Download vim-flake8 if not installed
if [ ! -d ~/.vim/bundle/vim-flake8 ]; then
    echo "vim-flake8 not found"
    echo "Getting vim-flake8 from: https://github.com/nvie/vim-flake8"
    git clone https://github.com/nvie/vim-flake8 ~/.vim/bundle/ 
    echo " "
else
    echo "FOUND: vim-flake8"
    echo "LOCATION: ~/.vim/bundle/vim-flake8"
    echo " "
fi

PWD="`pwd`"
BASEDIR="`(cd \"$PWD\"; pwd -P)`"

#  Use hidden files
shopt -s dotglob

OLD_DOTS=~/.old_dotfiles

if [ ! -d $OLD_DOTS ]; then
    echo "NOT FOUND:" $OLD_DOTS
    mkdir $OLD_DOTS
    echo " "
else
    echo "FOUND:" $OLD_DOTS
    echo " "
fi

DIR=$LOC/files
for FILE in $DIR/*; do
    BASE=`basename $FILE`
    echo $BASE
    if [ -e ~/$BASE ]; then
        echo "FOUND $BASE"
        echo "Moving $BASE to $OLD_DOTS" 
        mv ~/$BASE $OLD_DOTS
    fi
    ln -s $FILE ~/$BASE
    echo "Created $BASE symlink"
    echo " "
done

#ln -s ~/.dotfiles/setup2.sh ~/.testing_file
