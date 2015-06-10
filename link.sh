#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BACKUP_DIR=~/.dotfiles_backup
if [ -e $BACKUP_DIR ]
then
    echo "$BACKUP_DIR already exists"
else
    mkdir -v $BACKUP_DIR
fi

FILES=".bashrc .vimrc .zshrc"
for file in $FILES
do
    if [ -f ~/$file -a ! -h ~/$file ]
    then
        mv -v ~/$file $BACKUP_DIR
    fi
    ln -s $BASEDIR/$file ~/$file
done
