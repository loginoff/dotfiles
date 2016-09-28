#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BACKUP_DIR=~/.dotfiles_backup
if [ -e $BACKUP_DIR ]
then
    echo "$BACKUP_DIR already exists"
else
    mkdir -v $BACKUP_DIR
fi

#If we are invoked without arguments, link these files
FILES=${@-".bashrc .vimrc .zshrc .tmux.conf .gitconfig"}
for file in $FILES
do
    [ -f $BASEDIR/$file ] || {
        echo "No such file $file"
        continue
    }

    #The case where we have an actual dotfile, not link
    [ -f ~/$file -a ! -h ~/$file ] && {
        mv -v ~/$file $BACKUP_DIR
    }

    #In case we have a file or no file
    [ -h ~/$file ] || ln -sv $BASEDIR/$file ~/$file
done
