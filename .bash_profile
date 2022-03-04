if [ -r ~/.bashrc ]; then
    . ~/.bashrc
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.poetry/bin:$PATH"

export PATH="/usr/local/opt/llvm@9/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm@9/lib"
export CPPFLAGS="-I/usr/local/opt/llvm@9/include"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export LLVM_CONFIG=/usr/local/Cellar/llvm@11/11.1.0_2/bin/llvm-config
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
