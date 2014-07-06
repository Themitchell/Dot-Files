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

alias start-mysql="mysql.server start"
