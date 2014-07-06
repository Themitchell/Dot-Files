# Ruby & Rails
alias tt="touch tmp/restart.txt"
alias be="bundle exec"

alias db-rebuild="be rake db:drop db:create db:migrate db:test:prepare && be rake db:seed"
alias db-create="be rake db:drop db:create"
alias db-migrate="be rake db:migrate db:test:prepare"
