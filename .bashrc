bash_conf=~/.bash

# TODO: alias関係, cui関係 を分ける
. $bash_conf/alias.bash     # aliasの設定
set -o vi
eval 
_direnv_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("/usr/local/bin/direnv" export bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if ! [[ "${PROMPT_COMMAND:-}" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi


export PATH=$HOME/.poetry/bin:$PATH
export PATH=/Users/takeshi.kishiyama/.poetry/bin:/Users/takeshi.kishiyama/.pyenv/shims:/Users/takeshi.kishiyama/.pyenv/bin:/Users/takeshi.kishiyama/.poetry/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin

# Install Ruby Gems to ~/gems  
# jekyll の時に必要 
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
eval 
_direnv_hook() {
  local previous_exit_status=$?;
  eval "$(direnv export bash)";
  return $previous_exit_status;
};
if ! [[ "$PROMPT_COMMAND" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook;$PROMPT_COMMAND";
fi
eval 
_direnv_hook() {
  local previous_exit_status=$?;
  eval "$(direnv export bash)";
  return $previous_exit_status;
};
if ! [[ "$PROMPT_COMMAND" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook;$PROMPT_COMMAND";
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH=/home/ubuntu/.poetry/bin:/home/ubuntu/.pyenv/shims:/home/ubuntu/.pyenv/bin:/home/ubuntu/.pyenv/shims:/home/ubuntu/.pyenv/bin:/home/ubuntu/gems/bin:/Users/takeshi.kishiyama/.poetry/bin:/Users/takeshi.kishiyama/.pyenv/shims:/Users/takeshi.kishiyama/.pyenv/bin:/Users/takeshi.kishiyama/.poetry/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
eval 
_direnv_hook() {
  local previous_exit_status=$?;
  eval "$(direnv export bash)";
  return $previous_exit_status;
};
if ! [[ "$PROMPT_COMMAND" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook;$PROMPT_COMMAND";
fi
