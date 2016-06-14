alias gbr='git br'
alias gba='git br -a'
alias gc='git ci -v'
alias gci='git ci'
alias gco='git co'
alias gdf='git df'
alias gdc='git df --cached'
alias gpl='git plr'
alias gmg='git mrg'
alias gps='git ps'
alias gsh='git sh'
alias gpo='git pop'
alias gst='git status'
alias gad='git add'
alias gg='git grep'
alias gll='git log --pretty=format:"%x1b[33m%h %Cgreen%m%Creset %s %Cgreen(%an)%Creset" -n 30'


complete -o default -o nospace -F _git_branch gbr
complete -o default -o nospace -F _git_branch gba
complete -o default -o nospace -F _git_commit gc
complete -o default -o nospace -F _git_commit gci
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_diff gdf
complete -o default -o nospace -F _git_pull gpl
complete -o default -o nospace -F _git_merge gmg
complete -o default -o nospace -F _git_push gps
complete -o default -o nospace -F _git_stash gsh
