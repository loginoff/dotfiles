#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

################### Aliases #####################
alias ls='ls --color=auto'
alias vi=vim
alias ll="ls -la --color=auto"

################### ENV variables #####################
export EDITOR=vim

PS1='[\u@\h \W]\$ '

function sshf {
    if [ $# -lt 1 ];
    then
        echo "Specify port to forward!"
        return
    elif [ $# -eq 2 ];
    then
        ssh -N -L${1}:localhost:${1} $2
    elif [ $# -eq 1 ];
    then
        ssh -N -L${1}:localhost:${1} blackbird
    fi
}
