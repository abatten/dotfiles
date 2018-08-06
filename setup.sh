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
    echo " "
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
    echo "Pathogen found in: ~/.vim/autoload/pathogen.vim"
    echo " "
fi

# Download Monokai colour scheme for vim if not installed
if [ ! -f ~/.vim/colors/monokai.vim ]; then
    echo "Monokai colour scheme not found"
    echo "Getting Monokai from: https://github.com/sickill/vim-monokai"
    echo " "
else
    echo "Found Monokai in: ~/.vim/colors/monokai.vim" 
fi

PWD="`pwd`"
BASEDIR="`(cd \"$PWD\"; pwd -P)`"

#for i in $BASEDIR/*; do
#    echo $i
#done 

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
