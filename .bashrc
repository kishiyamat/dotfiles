bash_conf=~/.bash

# TODO: alias関係, cui関係 を分ける
. $bash_conf/alias.bash     # aliasの設定
set -o vi

# Install Ruby Gems to ~/gems  
# jekyll の時に必要 
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
. "$HOME/.cargo/env"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
