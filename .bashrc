source ~/bin/bash_colors.sh
source ~/bin/git-completion.bash

export TERM='xterm-color'
export LSCOLORS="ExgxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export PATH=~/bin:$PATH
export EDITOR=~/bin/vim

alias vim='mvim -v'
alias vi='mvim -v'

minutes_since_last_commit() {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}

grb_git_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
    if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 31 ]; then
      COLOR=${RED}
    elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
      COLOR=${YELLOW}
    else
      COLOR=${GREEN}
    fi
    local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${BRIGHT_CYAN}"
    # The __git_ps1 function inserts the current git branch where %s is
    local GIT_PROMPT=$(__git_ps1 "(${SINCE_LAST_COMMIT}|%s)")
    echo ${GIT_PROMPT}
  fi
}

ruby_version() {
  echo `rbenv version-name`
}

set_prompt() {
  export PS1="${BRIGHT_BLUE}\w${BRIGHT_CYAN}$(grb_git_prompt) ${BRIGHT_YELLOW}\$(ruby_version) ${YELLOW}\$ ${NORMAL}"
}

PROMPT_COMMAND=set_prompt

tab()
{
  osascript -e "
  tell application \"iTerm\"
  tell the current terminal
  launch session \"Default Session\"
  tell the last session
  write text \"cd $(pwd)\"
  end tell
  end tell
  end tell"
}

open_command() {
  osascript -e "
  tell application \"iTerm\"
  tell the current terminal
  tell the last session
  write text \"$1\"
  set name to \"$2\"
  end tell
  end tell
  end tell
  "
}
open_rails() {
  $(tab)
  open_command "rails s" "Rails"
}
open_spork() {
  open_command "spork" "Spork"
}  
open_autotest() {
  $(tab)
  open_command "autotest" "Autotest"
}
open_logtail() {
  $(tab)
  open_command "tail -f log/development.log" "Log - Development"
}

_rails_dev() {
  open_spork
  open_rails
  open_autotest
  open_logtail
}

rails_dev() {
  osascript -e "
  tell application \"iTerm\"
  activate
  set myterm to (make new terminal)
  tell myterm
  launch session \"Default Session\"
  tell the last session
  write text \"cd $(pwd)\"
  write text \"_rails_dev\"
  end tell
  end tell
  end tell
  "
}
