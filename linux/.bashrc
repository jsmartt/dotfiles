# .bashrc

export EDITOR="vi"

unset VERSION

# User specific aliases and functions
alias ls='ls --color'
alias ll='ls -lah --color'
alias untar='tar -xvf'
alias rspec='rspec --color'
alias path='echo $PATH | tr ":" "\n"'
alias df='df -h'

# Set bash prompt
export PS1='\[\033[32m\]\u@\h \[\033[33m\]$PWD\[\033[0m\]\n$ '

# Download and Source the git-prompt script to load __git_ps1 (shows git branch if in a git repo)
if [ ! -f ~/.git-prompt.sh ]; then
  echo "Downloading git-prompt.sh ..."
  curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export PS1='\[\033[32m\]\u@\h \[\033[33m\]$PWD$(__git_ps1)\[\033[0m\]\n$ '
fi

genpasswd() {
  local l=$1
  [ "$l" == "" ] && l=12
  tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l}
}
