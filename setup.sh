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
#    printf "Replacing: %-20s \t %s \n" "neditrc" "Yes"
#else
#    printf "Creating: %-10s \t %s \n" "neditrc" "No"
#fi
#
#if [ -f ~/.bash_aliases ]; then
#    printf "Replacing: %-20s \t %s \n" "bash_aliases" "Yes"
#else
#    printf "%-20s \t %s \n" "bashrc_aliases" " No"
#fi

#FILE=$LOC/.bashrc
#
#if [ -f $FILE ]; then
#    printf "Found existing: %s \n" $FILE
#else
#    printf "Created link for: %s \n" $FILE
#fi

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
