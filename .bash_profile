# PATH
export PATH="~/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"

# Development Environment
source ~/.bash_partials/bash.sh
source ~/.bash_partials/homebrew.sh
source ~/.bash_partials/ssh.sh
source ~/.bash_partials/git.sh

# Language Environment
source ~/.bash_partials/nodenv.sh
source ~/.bash_partials/pyenv.sh
source ~/.bash_partials/rbenv.sh
source ~/.bash_partials/exenv.sh

# Data stores
source ~/.bash_partials/mongodb.sh
source ~/.bash_partials/mysql.sh
source ~/.bash_partials/postgres.sh
source ~/.bash_partials/redis.sh
source ~/.bash_partials/couchdb.sh

# App Environment
source ~/.bash_partials/ruby_and_rails.sh
source ~/.bash_partials/elasticsearch.sh
source ~/.bash_partials/go.sh

# Editors & IDEs
source ~/.bash_partials/text_editors.sh

# Servers & Infrastructures
source ~/.bash_partials/heroku.sh
source ~/.bash_partials/ansible.sh
source ~/.bash_partials/docker.sh
source ~/.bash_partials/google-cloud.sh

# General
source ~/.bash_partials/general_aliases.sh
