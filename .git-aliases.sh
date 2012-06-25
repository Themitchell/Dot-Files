alias gbr='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gci='git commit'
alias gco='git checkout'
alias gdf='git diff'
alias gdc='git diff --cached'
alias gpl='git pull -r'
alias gmg='git merge'
alias gps='git push'
alias gsh='git stash'
alias gst='git status'
alias gad='git add'
alias gg='git grep'
alias gll='git log --pretty=format:"%x1b[33m%h %Cgreen%m%Creset %s %Cgreen(%an)%Creset" -n 10'


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