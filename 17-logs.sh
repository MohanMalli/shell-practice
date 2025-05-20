#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

LOGS_FLODER="/var/log/shellscript-logs"  # we have to create directory
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)  # here we are seperating each script in with they script name
LOG_FILE="$LOGS_FLODER/$SCRIPT_NAME.log"

mkdir -p  $LOGS_FLODER                   # -p stands for creating a directory .if not create or else if created it just leave it goes forward
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR::Pease run this script with root access $N" | tee -a $LOG_FILE #ere & means store both outputs >> append the data.
    exit 1
else 
    echo  "you are running with root access" | tee -a $LOG_FILE

fi
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
 }

# here it gives a $? is 0 if installed . if not installed then $? is 1
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "$R MYSQL is not installed... $G going to install it $N" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "Nothing to do MySQL...$Y already installed $N" | tee -a $LOG_FILE

fi       

dnf list installed Python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it" | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
   echo -e "Nothing to do python3...$Y already installed $N" | tee -a $LOG_FILE
fi
 
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
   echo -e "Nothing to do nginx...$Y already installed $N" | tee -a $LOG_FILE
fi
