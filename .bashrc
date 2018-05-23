

DARKGRAY='\e[1;30m'
LIGHTRED='\e[1;31m'
GREEN='\e[32m'
YELLOW='\e[1;33m'
LIGHTBLUE='\e[1;34m'
NC='\e[m'


if [ $HOSTNAME == "katara" ]; then
    PS1="\n$GREEN[\w] \n $YELLOW-> $NC"
else
    PS1="$LIGHTBLUE[\u]@$LIGHTRED[\h] \n$GREEN[\w] \n $YELLOW-> $NC"
fi

PS1="\n$GREEN[\w] \n $YELLOW-> $NC"
#$DARKGRAY($PCT\t$DARKGRAY)-($PCT\u$DARKGRAY)-($PCT\!$DARKGRAY)$YELLOW-> $NC"



#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[31;0m\]\w\[\033[m\]\n --> "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# If coreutils in installed
if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  #alias ls='ls -F --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`
fi

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

# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/abatten/splash/giza

# added by Anaconda3 5.1.0 installer
export PATH="/Users/abatten/anaconda3/bin:$PATH"
