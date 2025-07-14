#!/bin/bash

MEM_WARN=10
DISK_WARN=90
critical_issues=0
echo "===== System Health Check ====="
echo "Date: $(date '+%a, %d %b %Y %H:%M:%S')"
echo "-----------------------------"
uptime_days=$(uptime | awk '{print $3}' | tr -d ',')
echo -e "Uptime: $(uptime -p) (since ${uptime_days} days)"
read -r total used _ <<< $(free -m | awk '/Mem:/ {print $2,$3,$7}')
free_percent=$(( (used * 100) / total ))
free_mb=$(( total - used ))
if [ "$free_percent" -gt "$MEM_WARN" ]; then
    echo -e "Memory: Warning! Only ${free_mb}MB (${free_percent}%) free"
    critical_issues=1
else
    echo -e "Memory: ${free_mb}MB (${free_percent}%) free"
fi
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$disk_usage" -ge "$DISK_WARN" ]; then
    echo -e "Disk: Warning! ${disk_usage}% used"
    critical_issues=1
else
    echo -e "Disk: ${disk_usage}% used"
fi
load=$(uptime | awk -F 'load average: ' '{print $2}' | cut -d, -f1)
echo -e "CPU Load: $load"
echo -e "\nTop 3 Memory Users:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 4
echo "-----------------------------"
if [ "$critical_issues" -gt 0 ]; then
    echo -e "CRITICAL ISSUES DETECTED"
    exit 1
else
    echo -e "System OK"
    exit 0
fi