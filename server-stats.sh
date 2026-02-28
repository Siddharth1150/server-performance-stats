#!/bin/bash

echo "==============================================="
echo "          SERVER PERFORMANCE STATS             "
echo "==============================================="

# 1. Total CPU usage
echo "---- CPU Usage ----"
# We use top in batch mode to grab the idle CPU percentage ($8) and subtract it from 100
top -bn1 | grep "Cpu(s)" | awk '{printf "Total CPU Usage: %.2f%%\n", 100 - $8}'
echo ""

# 2. Total memory usage (Free vs Used including percentage)
echo "---- Memory Usage ----"
# Using free -m to get stats in MB. $2=Total, $3=Used, $4=Free
free -m | awk 'NR==2{printf "Total: %s MB | Used: %s MB | Free: %s MB | Usage: %.2f%%\n", $2, $3, $4, $3*100/$2 }'
echo ""

# 3. Total disk usage (Free vs Used including percentage)
echo "---- Disk Usage ----"
# df -h --total provides human-readable sizes and a grand total row at the bottom
df -h --total | awk '/^total/ {printf "Total: %s | Used: %s | Free: %s | Usage: %s\n", $2, $3, $4, $5}'
echo ""

# 4. Top 5 processes by CPU usage
echo "---- Top 5 Processes by CPU Usage ----"
# ps formats the output. We sort descending by %cpu and take the top 6 lines (1 header + 5 processes)
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo ""

# 5. Top 5 processes by memory usage
echo "---- Top 5 Processes by Memory Usage ----"
# Similar to above, but sorting descending by %mem
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6
echo ""

# ================= STRETCH GOALS =================
echo "---- System Information ----"

# OS Version
if [ -f /etc/os-release ]; then
    OS_VERSION=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2)
    echo "OS Version: $OS_VERSION"
fi

# Uptime
UPTIME=$(uptime -p)
echo "Uptime: $UPTIME"

# Load Average
LOAD_AVG=$(uptime | awk -F'load average:' '{ print $2 }' | xargs)
echo "Load Average: $LOAD_AVG"

# Logged in users
LOGGED_USERS=$(who | wc -l)
echo "Logged-in Users: $LOGGED_USERS"

# Failed login attempts
# Note: Different Linux distributions use different auth logs (auth.log for Debian/Ubuntu, secure for RHEL/CentOS)
if [ -r /var/log/auth.log ]; then
    FAILED_LOGINS=$(grep -c "Failed password" /var/log/auth.log 2>/dev/null)
    echo "Failed Login Attempts: $FAILED_LOGINS"
elif [ -r /var/log/secure ]; then
    FAILED_LOGINS=$(grep -c "Failed password" /var/log/secure 2>/dev/null)
    echo "Failed Login Attempts: $FAILED_LOGINS"
else
    echo "Failed Login Attempts: Cannot read auth logs (Try running script with sudo)"
fi

echo "==============================================="
