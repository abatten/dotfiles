#!/bin/bash

SCRIPT=$(readlink -f $0)
LOC=`dirname $SCRIPT`

#if [ -f ~/.vimrc ]; then
#    printf "Found existing:"
#    printf "Replacing: %-20s \t %s \n" "vimrc" "Yes"
#else
#    printf "%-20s \t %s \n" "vimrc" "No"
#fi
#
#if [ -f ~/.bashrc ]; then
#    printf "Replacing: %-20s \t %s \n" "bashrc" "Yes"
#else
#    printf "%-20s \t %s \n" "bashrc" "No"
#fi
#
#if [ -f ~/.neditrc ]; then

#else
#fi
#
#if [ -f ~/.bash_aliases ]; then
#    printf "Replacing: %-20s \t %s \n" "bash_aliases" "Yes"
#else
#    printf "%-20s \t %s \n" "bashrc_aliases" " No"
#fi

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
        echo "FOUND EXISTING: $BASE"
        mv ~/$BASE $OLD_DOTS
    fi
    ln -s $FILE ~/$BASE
done
