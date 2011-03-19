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