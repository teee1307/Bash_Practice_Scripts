#!/bin/bash

# Calculate the remaining time until 6 pm
current_time=$(date +%s)
office_closing_time=$(date -d "18:00" +%s)
remaining_time=$((office_closing_time - current_time))

# Function to format seconds into HH:MM:SS
format_seconds() {
  local seconds=$1
  local hours=$((seconds / 3600))
  local minutes=$(( (seconds % 3600) / 60 ))
  local seconds=$((seconds % 60))
  printf "%02d:%02d:%02d" $hours $minutes $seconds
}

# Notify every half an hour
while [ $remaining_time -gt 0 ]; do
  echo "Time remaining until office hours finish: $(format_seconds $remaining_time)"
  sleep 1800  # sleep for 30 minutes
  current_time=$(date +%s)
  remaining_time=$((office_closing_time - current_time))
done

echo "Office hours have finished!"
