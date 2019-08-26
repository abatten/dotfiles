#=============================================================
# title       : .bashrc
# author      : Adam Batten
# year        : 2018
# notes       :
#=============================================================

# DARKGRAY='\e[1;30m'
# LIGHTRED='\e[1;31m'
# GREEN='\e[1;32m'
# YELLOW='\e[1;33m'
# LIGHTBLUE='\e[1;34m'
# NC='\e[m'


if [ $HOSTNAME == "katara" ]; then

    PS1='\[\e[1;32m\][\w] \[\e[m\]'
    # PS1='\[\e[1;31m\][\u @ \h] \e[1;32m\][\w] \[\e[m\]'
    export PS1
    #PS1='\[\e[1;31m\][\u @ \h] \e[1;32m\][\w] \[\e[m\]'

else
    #PS1="[\u@\h \W]\\$ "
    #PS1='\[\e[1;31m\][\u @ \h] \e[1;32m\][\w] \[\e[m\]'
    PS1="\[$(tput bold)\]\[\033[38;5;161m\][\u @ \h] \[$(tput sgr0)\]\[\033[38;5;46m\][\w] \[$(tput sgr0)\]"
    export PS1
    #PS1="\[\033[38;5;161m\][\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;161m\]@\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;161m\]\h]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;46m\][\w]\[$(tput sgr0)\]"

fi


#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

# If coreutils in installed
#if brew list | grep coreutils > /dev/null ; then
#  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
#  #alias ls='ls -F --show-control-chars --color=auto'
#  eval `gdircolors -b $HOME/.dir_colors`
#fi

extract () {
    if [ -f $1 ] ; then
        case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

function nf () {
    if [ $1 ] ; then
        dir=$1
        echo $dir
    else
        dir=.
        pwd
    fi

    ls $dir | wc -l


}

# Add bash aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Using Laptop
if [ $HOSTNAME == "katara" ]; then
    export PATH="/Users/abatten/anaconda3/bin:$PATH"
fi

# Using Ozstar
#if [ $HOSTNAME == "farnarkle1" ] || [ $HOSTNAME == "farnarkle2" ]; then

    


#fi
