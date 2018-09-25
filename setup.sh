#!/bin/bash

echo " "
echo "------------------"
echo "SETING UP DOTFILES"
echo "------------------"
echo " "

########################################
## DOWNLOAD PACKAGES IF NOT INSTALLED ##
########################################

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

# Download better status bar if not installed
if [ ! -d ~/.vim/bundle/lightline.vim ]; then
    echo "lightline.vim not found"
    echo "Getting lightline.vim from: https://github.com/itchyny/lightline.vim"
     git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
    echo " "
else
    echo "FOUND: lightline.vim"
    echo "LOCATION: ~/.vim/bundle/lightline.vim"
    echo " "
fi

# Download GitGutter for vim
if [ ! -d ~/.vim/bundle/vim-gitgutter ]; then
    echo "vim-gitgutter not found"
    echo "Getting vim-gitgutter from: https://github.com/airblade/vim-gitgutter"
     git clone https://github.com/airblade/vim-gitgutter ~/.vim/bundle/vim-gitgutter
    echo " "
else
    echo "FOUND: vim-gitgutter"
    echo "LOCATION: ~/.vim/bundle/vim-gitgutter"
    echo " "
fi

########################################
## CREATE SYMBOLIC LINKS TO DOTFILES  ##
########################################

#  Use hidden files
shopt -s dotglob

# Find the location that this script is being run
LOC="`pwd`"

# Create directory to store previous dotfiles
OLD_DOTS=~/.old_dotfiles
if [ ! -d $OLD_DOTS ]; then
    echo "NOT FOUND:" $OLD_DOTS
    mkdir $OLD_DOTS
    echo " "
else
    echo "FOUND:" $OLD_DOTS
    echo " "
fi

# Create symbolic links to files 
DIR=$LOC/files
for FILE in $DIR/*; do
    BASE=`basename $FILE` # BASE = the name of the file
    echo $BASE

    # If the dotfile already exists in home
    # move the file to .old_dotfiles
    if [ -e ~/$BASE ]; then 
        echo "FOUND $BASE"
        echo "Moving $BASE to $OLD_DOTS" 
        mv ~/$BASE $OLD_DOTS
    fi

    ln -s $FILE ~/$BASE  # Symlink to home directory
    echo "Created $BASE symlink"
    echo " "
done
