#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

# -e stands for enabling colors

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR::Please run this script with root access $N"
    exit 1
else 
    echo -e " you are running with root access "  

fi
VALIDATE(){
    if [$1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N"
    else
        echo -e "Installing $2 is ... $R FAILURE $N"
        exit 1
    fi
 }

dnf list instelled mysql # here it gives a $? is 0 if installed . if not installed then $? is 1
if [ $? -ne 0 ]
then
    echo -e "$R MYSQL is not installed...$G going to install it $N" 
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "Nothing to do MySQL...$Y already installed $N"

fi       

dnf list installed Python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
   echo -e "Nothing to do python3...$Y already installed $N"
fi
 
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
   echo -e "Nothing to do nginx...$Y already installed $N"
fi
