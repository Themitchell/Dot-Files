# PATH
export PATH="~/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"

# SSH
ssh-add > /dev/null 2>&1

env_version_cmd() {
    echo "$($1env version-name)"
}

output_env_version() {
    if [ "$(env_version_cmd $1)" == "" ]
    then
        echo "$1: Version not installed! "
    elif [ "$(env_version_cmd $1)" == "system" ]
    then
        echo ""
    else
        echo "$1: $(env_version_cmd $1) "
    fi
}

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source /usr/local/Cellar/rbenv/0.4.0/completions/rbenv.bash

rbenv_ruby_version() {
    echo "$(output_env_version rb)"
}

# PYENV
export PYENV_ROOT="/usr/local/opt/pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

pyenv_python_version() {
    echo "$(output_env_version py)"
}

# NDENV
export PATH="$HOME/.ndenv/bin:$PATH"
if which ndenv > /dev/null; then eval "$(ndenv init -)"; fi
export NODE_ENV=development

ndenv_node_version() {
    echo "$(output_env_version nd)"
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
alias tt="touch tmp/restart.txt"
alias be="bundle exec"

alias db-rebuild="be rake db:drop db:create db:migrate db:test:prepare && be rake db:seed"
alias db-create="be rake db:drop db:create"
alias db-migrate="be rake db:migrate db:test:prepare"

# Elastic Search
alias elasticsearch-start="elasticsearch -f -D"

# TextMate / Sublime
export EDITOR="subl -w"
export BUNDLE_DITOR="subl"
alias mate='subl'

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Amazon AWS/EC2
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"

# General
alias ls='ls -F'
alias ll='ls -lah'

# Command Line Colours
case "$TERM" in
xterm*)
        PS1='\[\033[0;92m\]$(pyenv_python_version)\[\033[0;95m\]$(rbenv_ruby_version)\[\033[0;91m\]$(ndenv_node_version)\[\033[0;96m\]\u\[\033[0;97m\]@\[\033[0;96m\]\h\[\033[00m\]:\[\033[0;97m\]\w\[\033[0;93m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
        ;;
*)
        PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '
        ;;
esac
