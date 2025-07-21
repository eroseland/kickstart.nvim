#!/bin/bash
# .bashrc

# -------------------- environment variables --------------------

export LANG=en_US.UTF-8
export USER=$(whoami)
export GITUSER="${USER}_verisk"
export REPOS="$HOME/workspace"
export GHREPOS="${REPOS}/github.com"
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"
export NVM_DIR="$HOME/.nvm"
export WEZTERM_CONFIG_FILE="$HOME/.wezterm.lua"
export XDG_CONFIG_HOME="$HOME/.config"
export WORKSPACE="$HOME/workspace"

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias k='kubectl'
alias kc='kubectl config get-contexts'
alias ku='kubectl config use-context'
alias la='ls -la'

complete -C '/usr/local/bin/aws_completer' aws
# source <(flux completion bash)
source <(kubectl completion bash)
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/node@18/bin:${PATH}:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"

brew_etc="$(brew --prefix)/etc" && [[ -r "${brew_etc}/profile.d/bash_completion.sh" ]] && . "${brew_etc}/profile.d/bash_completion.sh"


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# history size
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTTIMEFORMAT="%F %T "  # add timestamp to history entries
shopt -s histappend
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"


# colors
RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[1;34m\]"
PURPLE="\[\033[1;35m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"


# ------------------- enable python env ---------------------

source "$WORKSPACE/general/.venv/bin/activate"


# ------------------- nvm settings -----------------------

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Determine active Python virtualenv details.
function set_virtualenv () {
        if test -z "$VIRTUAL_ENV" ; then
                PYTHON_VIRTUALENV=""
        else
                PYTHON_VIRTUALENV="${RED}(`basename \"$VIRTUAL_ENV\"`)${COLOR_NONE} "
        fi
}

# set the full bash prompt
function set_bash_prompt () {
        # set the python_virtualenv variable.
        set_virtualenv

        ps1="${python_virtualenv}${white}\u${yellow}@${purple}\h\[\033[00m\]${blue}\w\[\033[00m\]${green}$(parse_git_branch)\n${color_none}:~$ "
}

# Execute this function before displaying prompt
PROMPT_COMMAND=set_bash_prompt

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init bash)"
