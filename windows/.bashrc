#export EDITOR="vi"
export EDITOR=notepad
export VAGRANT_PUBLIC_NETWORK_ENABLED_ALREADY=true

alias ls='ls --color'
alias ll='ls -lah'
alias notepad++='start notepad++'
alias npp='start notepad++'
alias n++='start notepad++'
alias untar='tar -xvf'
alias rspec='rspec --color'
alias path='echo $PATH | tr ":" "\n"'
alias knife2='/c/opscode/chefdk/embedded/bin/knife'
alias vs='vagrant status'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vssh='vagrant ssh'
alias vp='vagrant provision'

# Start ssh-agent
env=~/.ssh/agent.env

agent_is_running() {
  if [ "$SSH_AUTH_SOCK" ]; then
    # ssh-add returns:
    #   0 = agent running, has keys
    #   1 = agent running, no keys
    #   2 = agent not running
    ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
  else
    false
  fi
}

agent_has_keys() {
  ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
  . "$env" >/dev/null
}

agent_start() {
  (umask 077; ssh-agent >"$env")
  . "$env" >/dev/null
}

if ! agent_is_running; then
  agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa.pub or ~/.ssh/id_dsa.pub, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
  agent_start
  ssh-add
  ssh-add ~/.ssh/putty_id_rsa
elif ! agent_has_keys; then
  ssh-add
  ssh-add ~/.ssh/putty_id_rsa
fi

unset env

genpasswd() {
  local l=$1
  [ "$l" == "" ] && l=12
  tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l}
}
