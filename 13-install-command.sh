#!/bin/bash
USERID=$(id -u) # userid = 1001

if [ $USERID -ne 0 ] # here 1001 is not equal to 0  -->  ## [1001 =/ 0] ##
then
    echo "ERROR: Please run this Script with root access"
    exit 1 # give other than 0 up to  127
else 
    echo "you are running with  root access"
fi
dnf install mysql -y

if [ $? -ne 0 ] #[1 =/ 0 ]
then 
  echo "mysql is not installed ... goining to install it"

  dnf install mysql -y
if [ $? -eq 0 ]  # [ 0 = 0 ]
then
    echo "Installing mysql is ... SUCCESS"
else
   echo "Installing mysql is ... FAILURE"
   exit 1 # give other than 0 up to  127
fi
else 
    echo "mysql is already installed ... nothing to do"
fi   