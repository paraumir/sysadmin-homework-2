#!/usr/bin/env bash

# System resource monitoring script.
# Usage: ./script.sh [interval_seconds] [number_of_checks]

set -u

INTERVAL="${1:-10}"
CHECKS="${2:-6}"
LOG_FILE="${LOG_FILE:-monitor.log}"

if ! [[ "$INTERVAL" =~ ^[0-9]+$ ]] || (( INTERVAL < 1 )); then
    echo "Error: interval must be a positive integer." >&2
    exit 1
fi

if ! [[ "$CHECKS" =~ ^[0-9]+$ ]] || (( CHECKS < 1 )); then
    echo "Error: number of checks must be a positive integer." >&2
    exit 1
fi

for ((i = 1; i <= CHECKS; i++)); do
    {
        echo "========================================"
        echo "Check: $i"
        echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
        echo
        echo "--- Uptime and load ---"
        uptime
        echo
        echo "--- Memory ---"
        free -h
        echo
        echo "--- Disk usage ---"
        df -h
        echo
    } | tee -a "$LOG_FILE"

    if (( i < CHECKS )); then
        sleep "$INTERVAL"
    fi
done

echo "Monitoring finished. Log: $LOG_FILE"