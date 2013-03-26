if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# MacPorts Installer addition on 2011-02-18_at_16:10:03: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export PATH=~/bin:$PATH
export EDITOR=~/bin/vim

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

alias vim='mvim -v'
alias vi='mvim -v'
