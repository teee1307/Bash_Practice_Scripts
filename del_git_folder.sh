#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <repository_directory>, eneter a directory name"
    exit 1
fi

repository_dir=$1

# Check if the directory exists
if [ ! -d "$repository_dir" ]; then
    echo "Error: Directory '$repository_dir' not found."
    exit 1
fi

# Check if it's a Git repository
if [ ! -d "$repository_dir/.git" ]; then
    echo "Error: '$repository_dir' is not a Git repository."
    exit 1
fi

# Delete the .git folder
rm -rf "$repository_dir/.git"

echo ".git folder deleted from '$repository_dir'."
