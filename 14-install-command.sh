#!/bin/bash
if [ $? -ne 0 ]  # [ 0 = 0 ]
then
    echo "Installing MySQL is ... SUCCESS"
else
   echo "Installing MySQL is ... FAILURE"
   exit 1 # give other than 0 up to  127
fi