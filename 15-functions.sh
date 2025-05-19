#!/bin/bash

USERID=$( id -u)

if [ $USERID -eq 0 ]
then
    echo  "your running with root user"
    
else
    echo " ERROR : we are running with not root user.Please run with root user" 
    exit 1
fi       
