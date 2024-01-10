#!/bin/bash
logfile=results.log

echo "The script ran at time : $(date)" > $logfile #redirecting the result to  the logfile 
/usr/bin/cat $logfile
