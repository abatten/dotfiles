#   -----------------------------------------------------
#                Make the terminal better
#   -----------------------------------------------------
alias ls="ls -GFh"              #  Preferred 'ls' implementation
alias la="ls -GFha"             #  Show hidden files easier
alias lla="ls -GFhla"           #  Show long hidden files
alias mkdir="mkdir -pv"         #  Preferred 'mkdir' implementation
alias edit="sublime"            #  Open any file in SublimeText
alias f="open -a Finder ./"     #  Open current directory in Finder
alias jn="jupyter-notebook"     #  Open jupyter notebook
alias python="ipython"          #  Always open ipython over python
alias gpom="git push origin master"
alias restart="source ~/.bashrc"
alias usedspace="du -ch -d 1"
alias freespace="df -h"
#alias plz="fc -l -1 | cut -d' ' -f2- | xargs sudo"
alias plz="sudo !!"

alias grep="grep --color=auto -n"       # Colorise grep output
alias grepi="grep --color=auto -ni"     # Ignore case of grep term
alias sudo="sudo "

alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false; killall Finder;"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true; killall Finder;"
