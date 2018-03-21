# if which docker-machine > /dev/null; then eval $(docker-machine env default); fi

docker_nuke() {
  docker stop $(docker ps -a -q) && \
  docker rm $(docker ps -a -q) && \
  docker rmi $(docker images -aq)
}
