bash_conf=~/.bash

# TODO: alias関係, cui関係 を分ける
. $bash_conf/alias.bash     # aliasの設定
set -o vi

# Install Ruby Gems to ~/gems  
# jekyll の時に必要 
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
