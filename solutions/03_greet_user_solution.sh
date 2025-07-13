#!/bin/bash
user=${1:-"Guest"}
hour=$(date +%H)
if [ "$hour" -ge 5 ] && [ "$hour" -lt 12 ]; then
    default_time="morning"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 17 ]; then
    default_time="afternoon"
elif [ "$hour" -ge 17 ] && [ "$hour" -lt 21 ]; then
    default_time="evening"
else
    default_time="night"
fi
time_of_day=${2:-$default_time}
echo "Good $time_of_day, $user! Have a great day."