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
    if [ ! -f $BASEDIR/$file ]
    then
        echo "No such file $file"
        continue
    fi
    if [ -f ~/$file -a ! -h ~/$file ]
    then
        mv -v ~/$file $BACKUP_DIR
    fi
    ln -sv $BASEDIR/$file ~/$file
done
