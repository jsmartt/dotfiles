# .bashrc

#export EDITOR=$(which vi)
export EDITOR=notepad
export VAGRANT_PUBLIC_NETWORK_ENABLED_ALREADY=true

alias ls='ls --color'
alias ll='ls -lah --color'
alias notepad++='start notepad++'
alias npp='start notepad++'
alias n++='start notepad++'
alias untar='tar -xvf'
alias rspec='rspec --color'
alias path='echo $PATH | tr ":" "\n"'
alias knife2='/c/opscode/chefdk/embedded/bin/knife'
alias vs='vagrant status'
alias vu='vagrant up'
alias vssh='vagrant ssh'
alias vp='vagrant provision'
alias vh='vagrant halt'
alias vagrantfile='vi ~/.vagrant.d/Vagrantfile'
alias hostfile='edit_hostfile'
alias sneakyssh='ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile /dev/null"'

# Add all the secret stuff
if [ -f ~/.bash_secrets ]; then . ~/.bash_secrets ; fi

# Load ssh keys
eval "$(ssh-agent -s)" > /dev/null
if [ -f ~/.ssh/id_rsa ]; then
  ssh-add ~/.ssh/id_rsa > /dev/null # 2>&1
fi

if [ -f ~/.ssh/putty_id_rsa ]; then
  ssh-add ~/.ssh/putty_id_rsa > /dev/null # 2>&1
fi


genpasswd() {
  local l=$1
  [ "$l" == "" ] && l=12
  tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l}
}

edit_hostfile() {
  if [ -f "$SYSTEMROOT/System32/drivers/etc/hosts" ]; then
    echo "Editing $SYSTEMROOT\\System32\\drivers\\etc\\hosts ..."
    notepad $SYSTEMROOT\\System32\\drivers\\etc\\hosts
  elif [ -f "/etc/hosts" ]; then
    echo "Editing /etc/hosts ..."
    vi /etc/hosts
  else
    echo "Can't find hosts file at /etc/hosts or \$SYSTEMROOT\\System32\\drivers\\etc\\hosts"
  fi
}

# Add Virtualbox to path
if [ -d "/c/Program Files/Oracle/VirtualBox" ]; then
  export PATH="$PATH:/c/Program Files/Oracle/VirtualBox"
fi

# ChefDK shell-init for GitBash:
if [ -d "/c/opscode/chefdk" ]; then
  # eval "$(chef shell-init bash)"
  RUBY_VERSION=$(ls --color=no -A1 /c/opscode/chefdk/embedded/lib/ruby/gems/)
  export PATH="$PATH:/c/opscode/chefdk/bin:$HOME/.chefdk/gem/ruby/$RUBY_VERSION/bin:/c/opscode/chefdk/embedded/bin"
  export GEM_ROOT="/c/opscode/chefdk/embedded/lib/ruby/gems/$RUBY_VERSION"
  export GEM_HOME="$HOME/.chefdk/gem/ruby/$RUBY_VERSION"
  export GEM_PATH="$HOME/.chefdk/gem/ruby/$RUBY_VERSION:/c/opscode/chefdk/embedded/lib/ruby/gems/$RUBY_VERSION"
  export CHEFDK_HOME="$HOME/.chefdk"
fi
