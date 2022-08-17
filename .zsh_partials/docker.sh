# if which docker-machine > /dev/null; then eval $(docker-machine env default); fi

export DOCKER_BACKUP_DATE_TIME_FORMAT="%Y-%m-%d %H-%M"
export DOCKER_VOLUME_PATH="/var/lib/docker/volumes"
export DOCKER_VOLUME_BACKUP_PATH="$HOME/Docker/Volumes/Backup"

docker_nuke() {
  docker stop $(docker ps -a -q) && \
  docker rm $(docker ps -a -q) && \
  docker rmi $(docker images -aq)
}

docker_volume_backup() {
  docker run --rm -it \
    -v ${DOCKER_VOLUME_BACKUP_PATH}:/backup \
    -v ${DOCKER_VOLUME_PATH}:/volumes \
    alpine:edge \
    tar cfz "backup/$(date +$DOCKER_BACKUP_DATE_TIME_FORMAT).tgz" volumes
  echo "Bacukp completed to $DOCKER_VOLUME_BACKUP_PATH"
}

docker_volume_restore() {
  most_recent_backup=$(ls -r ~/Docker/Volumes/Backup | head -1)

  docker run --rm -it \
    -v ${DOCKER_VOLUME_BACKUP_PATH}:/backup \
    -v ${DOCKER_VOLUME_PATH}:/volumes \
    alpine:edge \
    tar zxf backup/$most_recent_backup -C volumes --strip-components=1
}
