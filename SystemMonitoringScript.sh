#!/bin/bash

#System Monitorig Script
#AUTHOR: ADIORAH ONUORA


CPU_THRESHOLD=80
DISK_THRESHOLD=20
LOG_FILE="sysem_report_$(date +%F_%T).log"


check_cpu_usage(){
    echo "=== CPU_USAGE ==="
    cpu_loads=$(ps -A -o %cpu | awk '{SUM+=$1} END {print SUM}' )
    echo "Currnet Cpu loads: $cpu_loads%"
    if (($(echo "$cpu_loads > $CPU_THRESHOLD" | bc -l))); then
        echo "Warning: Cpu usage above ${CPU_THRESHOLD}%!"
    fi
    echo
}

check_memory(){
    echo "=== MEMORY USAGE ==="
    memory_free=$(vm_stat | awk '/free/ {print $3}' | sed 's/\.//')
    memory_total=$(sysctl -n hw.memsize)
    memory_free_mb=$((memory_free * 4096 / 1024 / 1024))
    memory_total_mb=$((memory_total / 1024 / 1024))
    echo "Free Memory: ${memory_free_mb}MB / Total Memory: ${memory_total_mb}MB"
    echo
}

check_disk_space(){
    echo '=== DISK SPACE USAGE ==='
    df -h | grep '^/dev/' | awk '{print $1, $5, $4}' | while read -r disk usage available; do
        percent=${usage%\%}
        echo " Disk: $disk | Usage: $usage | Available: $available"
        if ((percent > (100 - DISK_THRESHOLD))); then
            echo "Warning: Low disk space on $disk!"
        fi
    done
    echo
}


top_processes(){
    echo '=== TOP 5 PROCESSES ==='
    ps -Ao user,%cpu,%mem,comm | sort -k2 -nr | head -n 6
    echo

}


generate_report(){
    echo "Generating system report...."
    {
        echo "System Report - $(date)"
        echo "__________________________"
        check_cpu_usage
        check_memory
        check_disk_space
        top_processes
        echo "__________________________"
    } >> "$LOG_FILE"
    echo "Report saved to $LOG_FILE"
}


echo "System Monitoring Script for macOS"
echo "-----------------------------------"
check_cpu_usage
check_memory
check_disk_space
top_processes


generate_report