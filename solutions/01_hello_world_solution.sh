#!/bin/bash

# Get user input
echo -n "Enter your name: " # -n keeps cursor on same line
read name

# Handle empty input
if [ -z "$name" ]; then
    name="Guest"
fi

# Get current time
current_time=$(date +"%H:%M")

# Print greeting
echo "Hello, $name! The time is $current_time."