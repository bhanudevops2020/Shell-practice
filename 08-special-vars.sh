#!/bin/bash

echo "All variables passed the script   $@"
echo "Number of variables: $#"
echo "script name : $0"
echo "Current Directory: $PWD"
echo "user running this script: $USER"
echo "Home Directory of user: $HOME"
echo "Home directory of user: $$"
sleep 10 &
echo "Pid of last comamnd in background: $!"