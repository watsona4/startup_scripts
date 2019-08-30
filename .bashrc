# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
GIT_PS1_DESCRIBE_STYLE=describe
GIT_PS1_SHOWCOLORHINTS=true

. ~/.git-prompt.sh

retcode="$?"
red='\[\e[31m\]'
blue='\[\e[34m\]'
green='\[\e[32m\]'
purple='\[\e[35m\]'
boldputple='\[\e[1;35m\]'
reverse='\[\e[7m\]'
bold='\[\e[1m\]'
off='\[\e[0m\]'

function prompt_before {

    prompt="${reverse}(\H: \@)${off} ${bold}[${off} ${blue}\w${off}"

    printf "${prompt}"
}

function prompt_after {

    prompt=''

    if [ -n "${VIRTUAL_ENV}" ]; then
        name="$(basename $(dirname ${VIRTUAL_ENV}))/$(basename ${VIRTUAL_ENV})"
        prompt="${prompt} ${blue}(${name})"
    fi

    if [[ ${retcode} == 0 ]]; then
	prompt="${prompt} ${green}:)${off}"
    else
	prompt="${prompt} ${red}:(${off}"
    fi

    prompt="${prompt}${off} ${bold}]\n"

    if [ -n "${LSB_JOBID}"]; then
        prompt="${prompt}${boldpurple}{${LSB_JOBID}}${off} ${bold}"
    fi

    prompt="[\!] >${off} "

    printf "${prompt}"
}

PROMPT_COMMAND='export retcode="$?"; __git_ps1 "$(prompt_before)" "$(prompt_after)"; unset retcode'

# Unset LESS variable for coloring in git
unset LESS

# User specific aliases and functions
alias ls='/bin/ls -lh --color=auto'
