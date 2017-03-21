# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Prefer US English
export LC_ALL="en_US.UTF-8"
# use UTF-8
export LANG="en_US"

export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups

# ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# Make some commands not show up in history
export HISTIGNORE="h"
export EDITOR=nvim
#export EDITOR=emacsclient
#export ALTERNATE_EDITOR=vim
#alias ke='emacsclient -e "(kill-emacs)"'

alias sudo="sudo -E"

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

alias v="$EDITOR"

alias docker-machine="docker"
alias brc="$EDITOR ~/.bashrc"
alias zrc="$EDITOR ~/.zshrc"
alias vrc="$EDITOR ~/.vimrc"
alias nrc="$EDITOR ~/.config/nvim/init.vim"
alias prc="$EDITOR ~/.profile"

alias gw+="X86_64-W64-Mingw32-g++ -static"

PATH=$HOME/.npm-global/bin:$PATH
# PATH=$HOME/.yarn-global/bin:$PATH
PATH=$HOME/.rbenv/bin:$PATH
PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PATH
# export DISPLAY=:0.0
