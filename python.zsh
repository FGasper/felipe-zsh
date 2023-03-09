export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

path=($(echo 'import site; print(site.getuserbase())' | python3)/bin $path)
