# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1) HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f /home/sah4ez/private_environment ]; then export $(cat /home/sah4ez/private_environment | xargs); fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

set -o vi


#JDK
#export JAVA_HOME="$HOME/.opt/jdk1.8.0_131"
export JAVA_HOME="$HOME/.opt/jdk"
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:/sbin:/usr/sbin
export PATH=$PATH:/snap/bin
export PATH=$PATH:$HOME/bin
export JAVA_OPTS="-Dfile.encoding=UTF-8 -Xms1024m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=768m"
export BASEDIR=$HOME

#MAVEN
export M2_HOME="$HOME/.m2"

# MY Scripts
export PATH=$PATH:$HOME/scripts

findprocess(){
  ps aux | grep -i $1
}

decode(){
    echo "Output:"
    echo "$1" | base64 --decode
    echo ""
}

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
#source /usr/local/bin/virtualenvwrapper.sh
# Go env
export PATH=$PATH:/home/sah4ez/go/bin
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export GOPROXY=""
export GOPRIVATE="gitlab.com/g.sokol99"
export LOG_LEVEL=debug
export BUILD_TAGS=debug
pdf (){
  evince $1
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sah4ez/.sdkman"
[[ -s "/home/sah4ez/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sah4ez/.sdkman/bin/sdkman-init.sh"


# get current context 
parse_current_k8s_context() {
	CONTEXT=`cat ~/.kube/config | egrep "current-context" | awk -F ': ' '{print $2}' | sed -r 's,",,g' | sed -r "${CLUSTER_NAME_REPLACE}"`
	if [ ! "${CONTEXT}" == "" ]; 
	then
		TTY=$(tty)
		NS=`cat /tmp/kcns${TTY}/current 2> /dev/null`
		if [ "${NS}" == "" ]; then
			NS=`echo -en "\e[1;91mNONE\e[m"`
		else 
			NS=`echo -en "\e[1;93m${NS}\e[m"`
		fi
		echo -en "\e[1;93m[${CONTEXT}\e[m:${NS}\e[1;93m]\e[m"
	else
		echo ""
	fi
}


# get current branch in git repo
parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
parse_git_dirty() {
	status=`LC_ALL=en_GB git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\`parse_current_k8s_context\`\[\e[1;92m\]\`parse_git_branch\`\[\e[m\]\[\e[1;95m\]\t\[\e[m\]:\[\e[1;32m\]\u\[\e[m\]\[\e[1;32m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\n\\$ "

# DEV SETTINGS

export PHONE_0=012311111
export ACCESS_TOKEN=1
export CODE=0
export UUID=0
export USER_ID=0
export OAUTH_FRONTEND_HOST_AND_PORT=127.0.0.1:8000

if [ -f $HOME/.gpg-agent-info ]; then
    . $HOME/.gpg-agent-info
    export GPG_AGENT_INFO
fi

if [ ! -f $HOME/.gpg-agent.conf ]; then
  cat <<EOM >$HOME/.gpg-agent.conf
default-cache-ttl 604800
max-cache-ttl 604800
default-cache-ttl-ssh 604800
max-cache-ttl-ssh 604800
EOM
fi

#if [ -n "${GPG_AGENT_INFO}" ]; then
#    nc  -U "${GPG_AGENT_INFO%%:*}" >/dev/null </dev/null
#    if [ ! -S "${GPG_AGENT_INFO%%:*}" -o $? != 0 ]; then
#        # set passphrase cache so I only have to type my passphrase once a day
#        eval $(gpg-agent --options $HOME/.gpg-agent.conf --daemon --write-env-file $HOME/.gpg-agent-info --use-standard-socket --log-file $HOME/tmp/gpg-agent.log --verbose)
#    fi
#fi
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LD_LIBRARY_PATH=/usr/local/lib/

export SCALA_HOME=/home/sah4ez/.opt/scala
export PATH=$PATH:$SCALA_HOME/bin
export BROWSER="firefox %s"
export GRADLE_HOME=/home/sah4ez/.opt/gradle
export PATH=$PATH:$GRADLE_HOME/bin

#if [ -f /tmp/xrandr.lock ]
#then
#	dotlockfile -t /tmp/xrandr.lock
#else
#	/usr/bin/xrandr --output DVI-D-1 --right-of VGA-1
#	dotlockfile -l /tmp/xrandr.lock
#fi

if [ -n "$DISPLAY" ]; then
	  xset b off
fi

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi

export CHTSH_CURL_OPTIONS='-A curl'
. ~/.bash.d/cht.sh

source ~/scripts/use-ssh-autocomplete

export PATH=$PATH:/opt/kafka/bin

#source ~/scripts/git-completion.bash
export REVIEW_BASE=master

mkdir -p /tmp/cquery_cache
source ~/scripts/kctx.bash
source ~/scripts/kcns.bash
export COLORSCHEME=gruvbox
export COLORSCHEME_BG=dark

export KUBECTL_VERSION=1.15.4

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sah4ez/.opt/google-cloud-sdk/google-cloud-sdk/path.bash.inc' ]; then . '/home/sah4ez/.opt/google-cloud-sdk/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sah4ez/.opt/google-cloud-sdk/google-cloud-sdk/completion.bash.inc' ]; then . '/home/sah4ez/.opt/google-cloud-sdk/google-cloud-sdk/completion.bash.inc'; fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$PATH:/opt/vertica/bin"
