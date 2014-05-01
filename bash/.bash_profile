###############################################################################
################################### environment ###############################
###############################################################################

# vars
export EDITOR="sublime"
export HISTCONTRAL=ignoredups
export HISTFILESIZE=10000
export HISTZIE=10000
export HISTIGNORE=""
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export LSCOLORS=gxfxcxdxbxggedabagacad
export CLICOLOR=1
#export DYLD_FORCE_FLAT_NAMESPACE=1 # fix for brew macvim on mavericks

# path vars
export SSH_ENV="$HOME/.ssh/environment"
export NODE_PATH="/usr/local/lib/jsctags:/usr/local/lib/node"
export ANDROID_HOME="$HOME/android/android-sdk-macosx"
export TODO="$HOME/Dropbox/todo.txt"

# colors
export DIRECTORY_COLOR="\033[38;05;222m"
export GIT_COLOR="\033[38;05;172m"
export STAGED_COLOR="\033[38;05;226m"
export MODIFIED_COLOR="\033[38;05;112m"
export UNTRACKED_COLOR="\033[38;05;117m"
export PROMPT_COLOR="\033[38;05;88m"
export USER_COLOR="\033[38;05;130m"
export HOST_COLOR="\033[38;05;130m"
export RESET_COLOR="\033[m"

export COLOR_GREEN="\[\033[0;32m\]"
export COLOR_GRAY="\033[38;05;241m"
export COLOR_YELLOW="\[\033[0;33m\]"

# less settings
export PAGER=less

# path
PATH=/usr/local/bin
PATH=${PATH}:/opt/local/bin
PATH=${PATH}:/opt/local/sbin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/local/lib
PATH=${PATH}:/usr/local/php5/bin
PATH=${PATH}:/usr/local/mysql/bin
PATH=${PATH}:/usr/X11/bin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/sbin
PATH=${PATH}:~/bin
PATH=${PATH}:.
PATH=${PATH}:${ANDROID_HOME}/tools
PATH=${PATH}:${ANDROID_HOME}/platform-tools
PATH=${PATH}:/Library/Frameworks/Python.framework/Versions/Current/bin
PATH=${PATH}:~/.rvm/gems/ruby-1.9.3-p484/bin

# options
shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend
shopt -s nocaseglob

###############################################################################
################################### sub-scripts ###############################
###############################################################################

# functions
if [ -f "$HOME/.functions" ]; then
    . $HOME/.functions
fi

# alias
if [ -f "$HOME/.alias" ]; then
    . $HOME/.alias
fi

# z.sh
if [ -f "$HOME/.zsh" ]; then
    . $HOME/.zsh
fi

# git-completion
if exists brew; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

# git flow completion
if [ -f "$HOME/bin/.git-flow-completion.sh" ] ; then
    source $HOME/bin/.git-flow-completion.sh
fi

###############################################################################
##################################### scripts #################################
###############################################################################

# use vim on the command line
# set -o vi

# display todo list
todo

###############################################################################
##################################### prompt ##################################
###############################################################################

PS1="\n\[$DIRECTORY_COLOR\]\w \[$GIT_COLOR\]\$(parse_git_branch)\[$STAGED_COLOR\]\$(gitstaged)\[$MODIFIED_COLOR\]\$(gitmodified)\[$UNTRACKED_COLOR\]\$(gituntracked)\[$RESET_COLOR\]\n\[$COLOR_GREEN\]\u\[$RESET_COLOR\]@\[$COLOR_GRAY\]\h\[$COLOR_YELLOW\] \! \[$PROMPT_COLOR\]\@ $ \[$RESET_COLOR\]"

###############################################################################
##################################### bashrc ##################################
###############################################################################

if [ -f "$HOME/.bashrc" ] ; then
    . ~/.bashrc
fi

# vim: set sw=4 ts=4 sts=4 et tw=78 nospell:

# allow for .bash_local overrides
if [ -f "$HOME/.bash_local" ] ; then
    . ~/.bash_local
fi