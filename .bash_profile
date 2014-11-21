# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# Load ssh key
if [ -f ~/.ssh/id_rsa ]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add ~/.ssh/id_rsa > /dev/null
  ssh-add -l
fi
