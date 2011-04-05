[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# MacPorts Installer addition on 2011-02-18_at_16:10:03: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export PATH=~/bin:$PATH
export EDITOR=~/bin/vim

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
