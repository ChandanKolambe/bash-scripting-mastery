#!/bin/bash
# Personalized greeting with command-line arguments
# Your task:
# 1. Accept username as first argument ($1)
# 2. Accept time of day (morning/afternoon/evening) as second argument ($2)
# 3. If no arguments given, use "Guest" and current time-based greeting
# 4. If only one argument given, use current time-based greeting
# 5. Output: "Good [time], [user]! Have a great day."

# Time-based greeting rules:
# morning: 05:00 - 11:59
# afternoon: 12:00 - 16:59
# evening: 17:00 - 20:59
# night: 21:00 - 04:59