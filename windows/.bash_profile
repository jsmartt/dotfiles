# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi
if [ -f ~/.bash_secrets ]; then . ~/.bash_secrets ; fi

# User specific environment and startup programs

if [ -d "$HOME/bin" ]; then PATH="$PATH:$HOME/bin" ; fi
export PATH

# Load ssh keys
if [ -f ~/.ssh/id_rsa ]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add ~/.ssh/id_rsa > /dev/null # 2>&1
fi

if [ -f ~/.ssh/putty_id_rsa ]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add ~/.ssh/putty_id_rsa > /dev/null # 2>&1
fi


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

if [ $(pwd) == "/" ]; then cd ; fi
