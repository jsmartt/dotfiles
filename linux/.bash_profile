# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi
if [ -f ~/.bash_secrets ]; then . ~/.bash_secrets ; fi

# User specific environment and startup programs

if [ -d "$HOME/bin" ]; then PATH="$PATH:$HOME/bin" ; fi
export PATH

# Change dir color (awful blue) of ls command
LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS

# Load ssh key
if [ -f ~/.ssh/id_rsa ]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add ~/.ssh/id_rsa > /dev/null
fi

# Chef Ruby Path:
# eval $(chef shell-init bash)
