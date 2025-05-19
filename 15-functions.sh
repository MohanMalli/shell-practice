#!/bin/bash

USERID=$(sudo id -u)

if [ $USERID -ne 0 ]
then
    echo " ERROR : we are running with not root user.Please run with root user"
    exit 1
else
    echo " Your running with root user "

fi       
