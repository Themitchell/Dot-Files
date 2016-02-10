export GITHUB_API_KEY=mygithubapikey
export ORGNAME=crowdsurge
export OPSCODE_USER=myopscodeusername
export DEV_VM_USERNAME=myusername
export DEV_VM_HOST=my.dev.vm
export DEV_VM_CODE_DIR=Code

alias sshvm="ssh $DEV_VM_USERNAME@$DEV_VM_HOST"
# alias codeshare="sshfs -o IdentityFile=~/.ssh/id_rsa -o defer_permissions -o Ciphers=arcfour -o Compression=no $DEV_VM_USERNAME@$DEV_VM_HOST:Code ~/Songkick/VMCode"

sync() {
  echo "Syncing $(basename $(pwd)) from $(pwd) to $DEV_VM_USERNAME@$DEV_VM_HOST:$DEV_VM_CODE_DIR/$(basename $(pwd))/"
  rsync -avrx --delete --exclude=log --exclude=tmp --exclude=vendor/bundle --filter='P vendor/bundle' --exclude=.bundle --filter='P .bundle' --exclude=.git -e ssh . $DEV_VM_USERNAME@$DEV_VM_HOST:$DEV_VM_CODE_DIR/$(basename $(pwd))/
}

watch-sync() {
  filewatcher_path=$(which filewatcher)

  if [ -x $filewatcher_path ]; then
    echo "Watching for changes and waiting to sync..."
    filewatcher -i 0.2 '**/*' "rsync -avrx --delete --exclude=log --exclude=tmp --exclude=vendor/bundle --filter='P vendor/bundle' --exclude=.bundle --filter='P .bundle' --exclude=.git -e ssh . $DEV_VM_USERNAME@$DEV_VM_HOST:$DEV_VM_CODE_DIR/$(basename $(pwd))/"

  else
    echo "Cannot find filewatcher; Install using 'gem install filewatcher' and make sure it's in your path"
    exit 1
  fi
}
