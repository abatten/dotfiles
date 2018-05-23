#        .bash_aliases 
#        Adam Batten ~ 2018
#
#
#-------------------------------------------------------------
# The 'ls' family
#-------------------------------------------------------------
alias ls="gls -Fh --color=auto --group-directories-first" 
alias la="ls -GFha"                      #  Show hidden files easier
alias lla="ls -GFhla"                    #  Show long hidden files
alias lx="ls -lXB"                       #  Sort by extension

#-------------------------------------------------------------
# Personal Aliases
#-------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias mkdir="mkdir -pv"                  #  Preferred 'mkdir' implementation

alias sudo="sudo "                       #  Fixes using sudo and aliases together


alias edit="sublime"                     #  Open any file in SublimeText
alias f="open -a Finder ./"              #  Open current directory in Finder
alias jn="jupyter-notebook"              #  Open jupyter notebook
alias python="ipython"                   #  Always open ipython over python
alias restart="source ~/.bashrc"         #  Quickly refresh shell 
alias usedspace="du -ch -d 1"
alias freespace="df -h"
alias plz="sudo !!"

alias grep="grep --color=auto -n"       #  Colorise grep output
alias grepi="grep --color=auto -ni"     #  Ignore case of grep term


#-------------------------------------------------------------
# Hide messy desktop during presentations
#-------------------------------------------------------------
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false; killall Finder;"
alias showdesktop="defaults write com.apple.finder CreateDeskto -bool true; killall Finder;"

#-------------------------------------------------------------
# Edit .bashrc and .vimrc quicker
#-------------------------------------------------------------
alias vb="vim ~/.bashrc"
alias vba="vim ~/.bash_aliases"
alias vv="vim ~/.vimrc"

#-------------------------------------------------------------
# Git aliases
#-------------------------------------------------------------
alias gpom="git push origin master"
alias ga="git add"
alias gc="git commit"

#-------------------------------------------------------------
# IP Address
#-------------------------------------------------------------
alias ip="ipconfig getifaddr en0"
alias ipext="curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*'"
