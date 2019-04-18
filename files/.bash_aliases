#=============================================================
# title       : .bash_aliases
# author      : Adam Batten
# year        : 2018
# notes       :
#=============================================================

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                    GENERAL ALIASES
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# The 'ls' family
#-------------------------------------------------------------
if [ $HOSTNAME == "katara" ]; then
    alias ls="gls -Fhx --color=auto --group-directories-first"
else
    alias ls="ls -FHx --color=auto"
fi

alias la="ls -Fha"                      #  Show hidden files easier
alias lla="ls -Fhla"                    #  Show long hidden files
alias lx="ls -lXB"                       #  Sort by extension

# Personal Aliases
#-------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

alias mkdir="mkdir -pv"                  #  Preferred 'mkdir' implementation

alias sudo="sudo "                       #  Fixes using sudo and aliases together

alias subl="sublime"                     #  Open any file in SublimeText
alias f="open -a Finder ./"              #  Open current directory in Finder
alias jn="jupyter-notebook"              #  Open jupyter notebook

alias restart="source ~/.bashrc"         #  Quickly refresh shell

alias usedspace="du -ch -d 1"
alias freespace="df -h"

alias grep="grep --color=auto -n"       #  Color grep output
alias grepi="grep --color=auto -ni"     #  Ignore case of grep term

alias ssh="ssh -X -Y"
#alias nf="ls | wc -l"                   #  Number of files in a dir
# Now moved to function in bashrc

# Edit .bashrc and .vimrc quicker
#-------------------------------------------------------------
alias vb="vim ~/.bashrc"
alias vba="vim ~/.bash_aliases"
alias vv="vim ~/.vimrc"

# Git aliases
#-------------------------------------------------------------
alias gpom="git push origin master"
alias gpo="git push origin"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias gcheck="git checkout"

# IP Address
#-------------------------------------------------------------
alias ip="ipconfig getifaddr en0"
alias ipext="curl -s http://checkip.dyndns.org/ | grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*'"


alias psi="python3 setup.py install"
alias pssb="python3 setup.py sdist bdist_wheel"
alias twineup="twine upload"

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#               HOST SPECIFIC ALIASES
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if [ $HOSTNAME == "katara" ]; then
    alias borealis="cd ~/PhD/scripts/borealis/"


    # Hide messy desktop during presentations
    #----------------------------------------------------------
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false; killall Finder;"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true; killall Finder;"

fi

if [ $HOSTNAME == "farnarkle1" ] || [ $HOSTNAME == "farnarkle2" ]; then
    alias sq="squeue --user abatten"
    alias dsstoredel="find . -name '*.DS_Store' -type f -delete"

fi

