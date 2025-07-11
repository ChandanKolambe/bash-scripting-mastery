#!/bin/bash

echo " DATE FORMATTER"
echo "-----------------"
echo "$(date +"Today is: %m/%d/%Y")"
echo "$(date +"Today in words: %d-%B-%Y")"
echo "$(date +"$Week %V, Day %j of the year")"