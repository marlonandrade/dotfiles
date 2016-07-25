export PATH="$HOME/.rbenv/bin":$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
