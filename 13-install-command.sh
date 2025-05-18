#!/bin/bash
if [ $? -ne 0 ] #[1 =/ 0 ]
then 
  echo "nginx is not installed ... goining to install it"

  dnf install nginx -y
if [ $? -eq 0 ]  # [ 0 = 0 ]
then
    echo "Installing nginx is ... SUCCESS"
else
   echo "Installing nginx is ... FAILURE"
   exit 1 # give other than 0 up to  127
fi
else 
    echo "nginx is already installed ... nothing to do"
if     