#!/bin/bash
# Author: Riman Alangari
# GitHub: https://github.com/ralangari
# Description: Interactive Slurm job statistics reporter
# License: MIT

START_DATE="2025-01-01"
END_DATE="now"

count_completed_jobs() {
    sacct -S $START_DATE -E $END_DATE -X -n -s COMPLETED -o JobID | wc -l
}

count_running_jobs() {
    squeue -h -t RUNNING | wc -l
}

total_runtime_seconds() {
    sacct -S $START_DATE -E $END_DATE -X -n -s COMPLETED -o ElapsedRaw | \
    awk '{sum+=$1} END {print sum}'
}

format_seconds() {
    local T=$1
    echo "$((T/86400))d $(( (T%86400)/3600 ))h $(( (T%3600)/60 ))m $(( T%60 ))s"
}

while true; do
    echo "=============================="
    echo " Slurm Job Statistics"
    echo "=============================="
    echo "1) Completed jobs"
    echo "2) Running jobs"
    echo "3) Total runtime"
    echo "4) Exit"
    read -rp "Choose [1-4]: " C

    case $C in
        1) echo "Completed jobs: $(count_completed_jobs)" ;;
        2) echo "Running jobs:   $(count_running_jobs)" ;;
        3)
           T=$(total_runtime_seconds)
           echo "Total runtime: $(format_seconds $T)"
           ;;
        4) exit 0 ;;
        *) echo "Invalid option" ;;
    esac

    echo
    read -rp "Press Enter to continue..."
    clear
done

