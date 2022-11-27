#!/bin/bash
#
# Author: zubmic
# Use: Prints log message with appropiate color

# Define list of arguments expected in the input
optstring=":eisw:"

log() (

    # Inner help function
    help() {
        echo -e "\e[1;34m### Help: ${FUNCNAME[1]} [-eisw] <string> ###\e[0m"
        echo '    -e prints error message'
        echo '    -i prints informational message'
        echo '    -s prints success message'
        echo '    -w prints warning message'
        exit 0
    }
    
    # Print help instructions if function was invoked without parameters
    if [ ${#} -eq  0 ]; then
        help
    fi

    # Parse the options and trigger actions
    while getopts ${optstring} arg; do
        case "${arg}" in
            e) echo -e "\e[1;31m### $2 ###\e[0m";;
            i) echo -e "\e[1;34m### $2 ###\e[0m";;
            s) echo -e "\e[1;32m### $2 ###\e[0m";;
            w) echo -e "\e[1;33m### $2 ###\e[0m";;

            ?)
            echo -e "\e[1;31m### Invalid option used: -${OPTARG} ###\e[0m"
            help
            ;;
        esac
    done

    exit 0
)