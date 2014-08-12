# PATH
export PATH="~/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:$PATH"

# Development Environment
source ~/.bash_partials/ssh.sh
source ~/.bash_partials/git.sh

# Language Environment
source ~/.bash_partials/ndenv.sh
source ~/.bash_partials/pyenv.sh
source ~/.bash_partials/rbenv.sh

# Data stores
source ~/.bash_partials/mongodb.sh
source ~/.bash_partials/mysql.sh
source ~/.bash_partials/postgres.sh
source ~/.bash_partials/redis.sh

# App Environment
source ~/.bash_partials/ruby_and_rails.sh
source ~/.bash_partials/elasticsearch.sh

# Editors & IDEs
source ~/.bash_partials/text_editors.sh

# Servers & Infrastructures
# source ~/.bash_partials/ec2.sh
source ~/.bash_partials/heroku.sh

# General
source ~/.bash_partials/general_aliases.sh
source ~/.bash_partials/colour_ouput.sh
