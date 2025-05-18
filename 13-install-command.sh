#!/bin/bash
if [ $? -ne 0 ] #[1 =/ 0 ]
then 
  echo "MySQL is not installed ... goining to install it"

  dnf install mysql -y
fi
if [ $? -eq 0 ]  # [ 0 = 0 ]
then
    echo "Installing MySQL is ... SUCCESS"
else
   echo "Installing MySQL is ... FAILURE"
   exit 1 # give other than 0 up to  127
fi
if
else 
    echo "mysql is already installed"

fi