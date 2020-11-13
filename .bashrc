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
