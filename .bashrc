#   -----------------------------------------------------
#               Make the terminal preeetty
#   -----------------------------------------------------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n --> "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


#   -----------------------------------------------------
#if command -v tmux>/dev/null; then
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi

#   -----------------------------------------------------
#                Make the terminal better
#   -----------------------------------------------------
alias ls="ls -GFh"              #  Preferred 'ls' implementation
alias la="ls -GFha"             #  Show hidden files easier
alias mkdir="mkdir -pv"         #  Preferred 'mkdir' implementation
alias edit="sublime"            #  Open any file in SublimeText
alias f="open -a Finder ./"     #  Open current directory in Finder
alias jn="jupyter-notebook"     #  Open jupyter notebook
alias python="ipython"          #  Always open ipython over python

#   -----------------------------------------------------
alias sshg2="ssh abatten@g2.hpc.swin.edu.au -X -Y"
alias sshraijin="ssh ab3463@raijin.nci.org.au -X -Y"
alias sshozstar="ssh abatten@ozstar.swin.edu.au -X -Y"

#   -----------------------------------------------------
#   extract:  Extract most know archives with one command
#             Finding this changed my life.
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/abatten/splash/giza

# added by Anaconda3 5.1.0 installer
export PATH="/Users/abatten/anaconda3/bin:$PATH"
