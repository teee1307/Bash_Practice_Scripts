#!/bin/bash
echo "You are executing this script from $PWD Location"

MY_VARIABLE="Hello,I'm a variable" #available within the shell session and to child processes
export MY_VARIABLE
echo $(printenv | grep MY_VARIABLE)
#source it to integrate into the terminal 
export AGE=22
age=22

#both age and AGE Accessible since the commands of the other script are integrated here
#source ~/Bash_Scripts_Practice/test_child.sh

# Run another independent process (subshell)
(~/Bash_Scripts_Practice/test_child.sh) #process spawned from current shell, only AGE accessible
