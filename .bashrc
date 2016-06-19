#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable the annoying terminal output stop function
# This leaves Ctrl + S and Ctrl + Q free for binding in Vim for example
stty stop ''
stty start ''

################### Aliases #####################
alias ls='ls --color=auto'
alias vi=vim
alias ll="ls -la --color=auto"

################### ENV variables #####################
export PATH=~/bin:$PATH
export EDITOR=vim

PS1='[\u@\h \W]\$ '

################## Useful functions ###################

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
    if [[ ! $# = 1 ]] || [[ ! -d $1 ]];
    then
        echo "Enter a directory!"
        return
    fi
    du -sk ${1}/* | sort -n | awk '
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
            bytes=bytes_to_readable($1*1024);
            $1="";
            print bytes,$0
        }'
}

function dockerbash() {
    case $# in
        0)
            echo "Enter at least the name of a container"
            return 1
            ;;
        1)
            docker exec -t -i $1 /bin/bash
            ;;
        3)
            if [ ! "$2" = "-u" ]
            then
                echo "Use: dockerbash [containername] -u [user]"
                return 1
            fi
            container=$1
            user=$3
            docker exec -ti -u $user $container /bin/bash
            ;;
    esac
}

function docker-pid() {
    docker inspect --format '{{ .State.Pid }}' "$@"
}

alias dockerclean='docker images -qf dangling=true | xargs docker rmi'

function ignoredir() {
    local DIR=${1:-$(pwd)}
    if [ ! -d "$DIR" ];
    then
        echo $DIR is not a directory
        return 1
    fi

    echo '*' >> $DIR/.gitignore
    echo '!.gitignore' >> $DIR/.gitignore
}

################## History options ###################
# Append to the history file, don't overwrite it
shopt -s histappend

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000
HISTTIMEFORMAT="%Y-%m-%d %T "
