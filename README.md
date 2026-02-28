# Server Performance Stats Analyzer

A lightweight bash script that analyzes and outputs basic server performance statistics. This tool is designed to provide a quick, readable snapshot of system health, making it useful for basic monitoring, debugging, and system administration.

## Features

This script provides the following system metrics:
* **CPU Usage:** Total percentage of CPU currently in use.
* **Memory Usage:** Total, used, and free RAM (in MB), plus the usage percentage.
* **Disk Usage:** Total, used, and free storage space, plus the usage percentage.
* **Top Processes:** The top 5 processes consuming the most CPU and Memory.
* **System Information:** OS version, system uptime, load average, number of logged-in users, and failed login attempts.

## Prerequisites

To run this script, you need a Linux environment. This includes:
* A remote Linux server (Ubuntu, Debian, CentOS, etc.)
* A local Linux machine
* Windows Subsystem for Linux (WSL)

*Note: This script will not output full hardware metrics in translation layers like Git Bash.*

## Installation and Usage

1. **Clone or download the script** to your desired directory.
2. **Navigate to the directory** where the script is located:
   ```bash
   cd path/to/your/folder

## Make the script executable:

   chmod +x server-stats.sh

## Run the script:

   ./server-stats.sh












## EXAMPLE OUTPUT: ##


			
===============================================
          SERVER PERFORMANCE STATS             
===============================================
---- CPU Usage ----
Total CPU Usage: 1.20%

---- Memory Usage ----
Total: 2818 MB | Used: 402 MB | Free: 2016 MB | Usage: 14.27%

---- Disk Usage ----
Total: 1.9T | Used: 329G | Free: 1.5T | Usage: 19%

---- Top 5 Processes by CPU Usage ----
  PID COMMAND         %CPU %MEM
    1 systemd          0.8  0.4
  208 unattended-upgr  0.2  0.7
  122 systemd-resolve  0.1  0.4
   93 systemd-udevd    0.1  0.2
   43 systemd-journal  0.1  0.5

---- Top 5 Processes by Memory Usage ----
  PID COMMAND         %MEM %CPU
  208 unattended-upgr  0.7  0.2
   43 systemd-journal  0.5  0.1
  122 systemd-resolve  0.4  0.1
    1 systemd          0.4  0.8
  174 wsl-pro-service  0.4  0.1

---- System Information ----
OS Version: Ubuntu 24.04.4 LTS
Uptime: up 2 minutes
Load Average: 0.11, 0.14, 0.06
Logged-in Users: 1
Failed Login Attempts: 0
===============================================

		
