#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR::Please run this script with root access $N"
    exit 1
else 
    echo -e "you are running with root access"

fi

