if which docker-machine > /dev/null; then eval $(docker-machine env default); fi

alias docker-nuke="docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi $(docker images -aq)"
