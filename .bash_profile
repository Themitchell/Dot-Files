# PATH
export PATH="~/bin;/usr/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# SSH
ssh-add

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source /usr/local/Cellar/rbenv/0.3.0/completions/rbenv.bash
alias gemset='rbenv-gemset'

rbenv_gemset() {
  gemset active 2> /dev/null | sed -e 's/\(.*\)/@\1 /'
}

rbenv_ruby_version() {
    if [ "$(rbenv version-name)" == "system" ]
    then
        echo ""
    else
        echo "$(rbenv version-name)"
    fi
}

rbenv_version_and_gemset() {
  echo "$(rbenv_ruby_version)$(rbenv_gemset)"
}


# Git
source ~/.git-completion.sh
source ~/.git-aliases.sh
alias tower="gittower"

# MySQL
switch_db() {
    echo "==> Unloading MySQL"
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

    if [ -L /usr/local/var/mysql ]; then
        echo "==> Found existing symlink. Removing now!"
        rm /usr/local/var/mysql
    else
        echo "==> Found existing directory. Moving to mysql_old!"
        mv /usr/local/var/mysql /usr/local/var/mysql_old
    fi

    if [ $1 == "main" ]; then
        echo "==> Moving mysql_old to mysql..."
        mv /usr/local/var/mysql_old /usr/local/var/mysql
    else
        echo "==> Symlinking $1 on StorageHD..."
        ln -s "/Volumes/StorageHD/$1" mysql
    fi

    echo "==> Your /usr/local/var/ directory now looks like this:-"
    ls -lah /usr/local/var/

    echo "==> Reloading MySQL"
    cp /usr/local/Cellar/mysql/5.5.20/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
    echo "==> Done!"
}

# Ruby & Rails
rails-s(){
  if [ -f "script/server" ]; then
    ruby ./script/server $1
  else
    rails server $1
  fi
}

rails-c(){
  if [ -f "script/console" ]; then
    ruby ./script/console $1
  else
    rails console $1
  fi
}
alias tt="touch tmp/restart.txt"
alias be="bundle exec"

# Node
export PATH="/usr/local/Cellar/node:/usr/local/share/npm/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export NODE_ENV=development

# TextMate / Sublime
export EDITOR="subl -w"
export BUNDLE_DITOR="subl"

# General
alias ls='ls -F'
alias ll='ls -lah'

# Comman Line Colours
case "$TERM" in
xterm*)
        PS1='\[\033[0;35m\]$(rbenv_version_and_gemset)\[\033[0;36m\]\u\[\033[0;37m\]@\[\033[0;36m\]\h\[\033[00m\]:\[\033[0;37m\]\w\[\033[0;33m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
        ;;
*)
        PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '
        ;;
esac



