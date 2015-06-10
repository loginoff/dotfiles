# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/martinl/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#This makes the prompt nice
autoload -U promptinit
promptinit
prompt walters

#Autocompletion style
#zstyle ':completion:*' menu select

#Makes compinit automatically pickup new executables in directories
setopt nohashdirs

#######Non zsh specific stuff######
alias ls='ls --color=auto'
alias vi=vim
export EDITOR=$(which vim)

export PATH=/home/martinl/code/leinigen:$PATH
