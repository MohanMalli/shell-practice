#!/bin/bash

echo "All variables passed to script: $@"
echo "number of variables passed: $#"
echo "Script name: $0"
echo "current Directoru: $PWD"
echo "home directory of user: $HOME"
echo "user running the Script: $USER"
echo "PID of the current script : $$"
sleep 10 &
echo "PID of last command in background: $!"