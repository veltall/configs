#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# variable sets
alias ls='ls --color=auto'
export PAGER="/usr/bin/most -s"

# prompt settings

PS1='\n\[\e[0;36m\]\A   \[\e[1;34m\]\u\[\e[0;36m\]@\[\e[1;34m\]\h   \[\e[0;32m\]$PWD\n\[\e[0;38m\]\$ '


## startup scripts
archey
feh --bg-scale /home/kafeaulait/totoro2.png
#ls colors
eval `dircolors ~/.dircolors`
