# .bashrc

#export EDITOR=$(which vi)
export EDITOR=notepad
export VAGRANT_PUBLIC_NETWORK_ENABLED_ALREADY=true

alias ls='ls --color'
alias ll='ls -lah --color'
alias untar='tar -xvf'
alias rspec='rspec --color'
alias path='echo $PATH | tr ":" "\n"'
alias vagrantfile='vi ~/.vagrant.d/Vagrantfile'
alias notepad++='start notepad++'
alias npp='start notepad++'
alias n++='start notepad++'
alias knife2='/c/opscode/chefdk/embedded/bin/knife'
alias vs='vagrant status'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vssh='vagrant ssh'
alias vp='vagrant provision'
alias hostfile='edit_hostfile'

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


export ONEVIEWSDK_INTEGRATION_CONFIG='~/workspace/_one_view_config.json'
export ONEVIEWSDK_INTEGRATION_SECRETS='~/workspace/_one_view_secrets.json'
