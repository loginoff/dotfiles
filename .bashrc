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

function duh {
    if [[ ! "$1" = "" ]] && [[ ! -d $1 ]];
    then
        echo "Enter a directory!"
        return
    fi
    du -sk ${1}/* | sort -nr | awk '
        function bytes_to_readable(bytes) {
            tb = bytes / (1024*1024*1024*1024)
            if(tb >= 1){
                printf "%.3fTB", tb
                return
            }

            gb = bytes / (1024*1024*1024)
            if(gb >= 1){
                printf "%.3fGB", gb
                return
            }

            mb = bytes / (1024*1024)
            if(mb >= 1){
                printf "%.3fMB", mb
                return
            }

            kb = bytes / (1024)
            if(kb >= 1){
                printf "%.3fKB", kb
                return
            }

            printf "%dB", bytes
        }

        {
            print bytes_to_readable($1*1024),$2
        }'
}
