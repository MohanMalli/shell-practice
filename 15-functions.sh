#!/bin/bash

USERID=$( id -u)

if [ $USERID -eq 0 ]
then
    echo  "your running with root user"
    
else
    echo "ERROR : we are running with not root user.Please run with root user" 
    exit 1
fi 

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "MySQL is not installed ... now going to install"
    dnf install mysql -y
    
else
   echo "MySQL is installed ... nothing to do"
   

 if [ $? -eq 0 ]  # [ 0 = 0 ]
 then
    echo "Installing MySQL is ... SUCCESS"
 else
   echo "Installing MySQL is ... FAILURE"
   exit 1 # give other than 0 up to  127
 fi
fi

