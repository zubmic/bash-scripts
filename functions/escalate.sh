#!/bin/bash
#
# Author: zubmic
# Use: Prompts for sudo password if the user is not root

escalate_privileges () {
    if [ $(id -u) != 0 ]; then
        echo -e "\e[1;33m### This script requires root permissions! ###\e[0m"
        sudo "$0" "$@"
        exit
    fi
}