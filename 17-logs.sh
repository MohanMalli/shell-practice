#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N='\e[0m"

LOGS_FLODER="/var/log/shellscript-logs"  # we have to create directory
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)  # here we are seperating each script in wth they script name. 
LOG_FILE="$LOGS_FOLDER/SCRIPT_NAME.log"

mkdir -p $LOG_FLODER   #here -p stands for creating a directory .if not creadted or else if created it just leave it goes forward.

echo "Script started executing at: $(date)" &>>$LOG_FILE

   # -e strand for enabling colors

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR::Please run this script with root access $N"  &>>$LOG_FILE  # here & means store both outputs >> append the data.

    exit 1
else 
    echo -e "you are running with root access"   &>>$LOG_FILE

fi
VALIDATE(){
    if [$1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N"  &>>$LOG_FILE

    else
        echo -e "Installing $2 is ... $R FAILURE $N"  &>>$LOG_FILE

        exit 1
    fi
 }

# here it gives a $? is 0 if installed . if not installed then $? is 1
dnf list instelled mysql   &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$R MYSQL is not installed...$G going to install it $N" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "Nothing to do MySQL...$Y already installed $N" &>>$LOG_FILE

fi       

dnf list installed Python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
   echo -e "Nothing to do python3...$Y already installed $N" &>>$LOG_FILE
fi
 
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it" &>>$LOG_FILE
    dnf install nginx -y  &>>$LOG_FILE
    VALIDATE $? "nginx"
else
   echo -e "Nothing to do nginx...$Y already installed $N" &>>$LOG_FILE
fi
