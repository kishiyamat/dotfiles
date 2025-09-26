bash_conf=~/.bash

# TODO: alias関係, cui関係 を分ける
. $bash_conf/alias.bash     # aliasの設定
set -o vi

# Install Ruby Gems to ~/gems  
# jekyll の時に必要 
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
# . "$HOME/.cargo/env"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

. "$HOME/.local/bin/env"

# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"
