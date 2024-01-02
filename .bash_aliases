# system maint
alias fucking="sudo "
alias apt="sudo apt"
alias update=update_system

# shell stuff
alias c="clear"
alias r="reset"
alias hg="history |grep"

# crypto
alias sha1="openssl sha1"

# etc
alias ap="ansible-playbook"

# functions
update_system () {
    DISTRO_ID=$(cat /etc/os-release |grep "^ID=" |cut -d "=" -f2)
    if [ $DISTRO_ID == "arch" ]
    then
        sudo pacman -Syu
    elif [ $DISTRO_ID == "debian" ]
    then
        sudo apt update && sudo apt upgrade
    else
        echo "Distribution unkown."
    fi
}
