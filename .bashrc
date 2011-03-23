. ~/bin/bash_colors.sh

export TERM='xterm-color'
export LSCOLORS="ExgxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(%s)"`
        echo ${GIT_PROMPT}
    fi
}

rvm_version() {
	local RVM=`~/.rvm/bin/rvm-prompt i v g`
 	echo ${RVM//ruby-/}
}


export PS1="${BRIGHT_BLUE}\w${BRIGHT_CYAN}\$(grb_git_prompt) ${BRIGHT_YELLOW}\$(rvm_version) ${YELLOW}\$ ${NORMAL}"

source ~/bin/git-completion.bash

tab()
{
	osascript -e "
	tell application \"iTerm\"
	 tell the first terminal
	  set currentSession to current session
	  launch session \"Default Session\"
	  tell the last session
	   write text \"cd $(pwd)\"
	  end tell
	  select currentSession
	 end tell
	end tell"
}

open_command() {
  $(tab)
  osascript -e "
    tell application \"iTerm\"
      tell the first terminal
        tell the last session
          write text \"$1\"
	  set name to \"$2\"
        end tell
      end tell
    end tell
  "
}
open_rails() {
  open_command "rails s" "Rails"
}
open_spork() {
  open_command "spork" "Spork"
}  
open_autotest() {
  open_command "autotest" "Autotest"
}
open_logtail() {
  open_command "tail -f log/development.log" "Log - Development"
}

rails_dev() {
  open_spork
  sleep 5
  open_rails
  open_autotest
  open_logtail
}
