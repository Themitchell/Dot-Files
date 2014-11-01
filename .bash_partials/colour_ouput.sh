# Command Line Colours
#
#
# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White



env_version_cmd() {
    echo "$($1env version-name)"
}

output_env_version() {
    if [ "$(env_version_cmd $1)" == "" ]
    then
        echo "$1: Version not installed! "
    elif [ "$(env_version_cmd $1)" == "system" ]
    then
        echo ""
    else
        echo "$1: $(env_version_cmd $1) "
    fi
}


case "$TERM" in
xterm*)
        PS1='\[\033[0;92m\]$(output_env_version py)\[\033[0;95m\]$(output_env_version rb)\[\033[0;91m\]$(output_env_version nod)\[\033[0;96m\]\u\[\033[0;97m\]@\[\033[0;96m\]\h\[\033[00m\]:\[\033[0;97m\]\w\[\033[0;93m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
        ;;
*)
        PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '
        ;;
esac
