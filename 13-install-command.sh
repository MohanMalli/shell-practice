#!/bin/bash
USERID=$(id -u) # userid = 1001

if [ $USERID -ne 0 ] # here 1001 is not equal to 0  -->  ## [1001 =/ 0] ##
then
    echo "ERROR: Please run this Script with root access"
    exit 1 # give other than 0 up to  127
else 
    echo "you are running with  root access"
fi
# dnf list installed mysql # check already installed or not.

#  #if Installed $? is 0. then
# # if not installed $? is not 0. expression is true

# if [ $? -ne 0 ] #[1 =/ 0 ]
# then 
#   echo "mysql is not installed ... goining to install it"

#   dnf install mysql -y
# if [ $? -eq 0 ]  # [ 0 = 0 ]
# then
#     echo "Installing mysql is ... SUCCESS"
# else
#    echo "Installing mysql is ... FAILURE"
#    exit 1 # give other than 0 up to  127
# fi
# else 
#     echo "mysql is already installed ... nothing to do"
# fi   

dnf list installed nginx # check already installed or not.

 #if Installed $? is 0. then
# if not installed $? is not 0. expression is true

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
fi   