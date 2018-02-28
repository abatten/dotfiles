export PS1="\u @ \h \w \n --> "
#export PS2="> "

#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

#alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'


export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n --> "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


alias ls='ls -GFh'
alias mkdir="mkdir -pv"
alias edit="subl"               #  Open any file in SublimeText

#   extract:  Extract most know archives with one command

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



# added by Anaconda3 5.1.0 installer
export PATH="/Users/abatten/anaconda3/bin:$PATH"
