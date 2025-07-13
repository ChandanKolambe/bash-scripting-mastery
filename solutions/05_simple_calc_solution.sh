#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: $0 num1 op num2"
    echo "Operations: + - * / %"
    echo "Example: $0 5 '*' 3"
    exit 1
fi
if [ $# -ne 3 ]; then
    echo "Error: Need exactly 3 arguments"
    echo "Got $# arguments: $@"
    exit 2
fi
num1=$1
op=$2
num2=$3
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Not valid numbers"
    exit 3
fi
case $op in
    +|-|*|/)
        if [ "$op" = "/" ] && [ $(echo "$num2 == 0" | bc) -eq 1 ]; then
            echo "Error: Division by zero!"
            exit 4
        fi
        result=$(echo "scale=4; $num1 $op $num2" | bc)
        ;;
    %)
        result=$((num1 % num2))
        ;;
    *)
        echo "Error: Invalid operator '$op'"
        echo "Valid ops: + - * / %"
        exit 5
        ;;
esac		
if [[ "$result" =~ \.0+$ ]]; then
    result=${result%.*}
fi
echo "Result: $result"