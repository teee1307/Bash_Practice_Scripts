#!/bin/bash

# Specify the directory where you want to search for files
search_directory=$1

# Use find to get the list of files and sort them based on the date in the filename
files_to_keep=$(find "$search_directory" -type f -name "batch_log-*" | \
  sort -t '-' -k 2 -r | \
  head -n 7)

# Use find to get the list of files to delete (exclude the ones to keep) grep -vE excludes
files_to_delete=$(find "$search_directory" -type f -name "batch_log-*" | \
  grep -vE "$(echo "$files_to_keep" | sed 's/$/|/' | tr -d '\n' | sed 's/|$//')")

# Delete the files
echo "$files_to_delete" | xargs rm
