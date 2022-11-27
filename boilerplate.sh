#!/bin/bash
#
# Author: zubmic
# Use: generates boilerplate for scripts
# Reference: https://www.golinuxcloud.com/bash-getopts/

cat << EOF
#!/bin/bash
#
# Author: zubmic
# Use:

help() {
    echo -e "\e[36m### help: $(basename ./boilerplate.sh) [-abcd] ###\e[0m"
    echo '    -a shows a in the output'
    echo '    -b shows b in the output'
    echo '    -c shows c in the output'
    echo '    -d shows d in the output'
    exit 0
}

# Print help instructions if script was invoked without parameters
if [ \${#} -eq  0 ]; then
    help
fi

# Define list of arguments expected in the input
optstring=":abcd"

# Parse the options and trigger actions
while getopts \${optstring} arg; do
  case "\${arg}" in
    a) echo "Option 'a' was called" ;;
    b) echo "Option 'b' was called" ;;
    c) echo "Option 'c' was called" ;;
    d) echo "Option 'd' was called" ;;

    ?)
      echo "Invalid option: -\${OPTARG}."
      echo
      help
      ;;
  esac
done
EOF