#!/bin/bash
function CheckFile() {
    # Function to handle file not found error
    handle_file_not_found() {
    sleep 2
    echo "File not found: $1"
}

#trap for error
trap 'handle_file_not_found "$@"' ERR
    # Check if file exists
    if [ -f "$1" ]; then
        echo "File exists"
    else
        ~/tanaya_run.sh 2>/dev/null  # Redirect stderr to /dev/null to suppress the stderr message
    fi
}

function count() {
    # Trap for SIGINT (Ctrl+C)
    trap "echo Interrupt detected" SIGINT

    while ((COUNT < 5)); do
        sleep 2
        ((COUNT++))
        echo $COUNT
    done

   
}

CheckFile $1 & #to put the process in background
count &
wait # to wait for all the processes to finish 
