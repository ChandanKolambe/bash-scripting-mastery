#!/bin/bash
if [ -z "$1" ]; then
    echo -e "Error: Please provide a number"
    echo "Usage: $0 <number>"
    exit 1
fi
if ! [[ "$1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo -e "Error: '$1' doesn't look like a proper number"
    exit 2
fi
number=$1
if [[ "$number" =~ \. ]]; then
    echo -e "Note: $number has decimal places - checking whole part only"
    number=${number%.*}
fi
if [ "$number" -eq 0 ]; then
    echo -e "$number is zero - neither even nor odd!"
    exit 0
elif [ "$number" -lt 0 ]; then
    echo -e "Negative number detected - checking absolute value"
    number=${number#-}
fi
if [ $((number % 2)) -eq 0 ]; then
    echo -e "$1 is even"
else
    echo -e "$1 is odd"
fi