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
