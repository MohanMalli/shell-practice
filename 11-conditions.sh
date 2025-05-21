#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]
then 
     echo "Given number $NUMBER is less then 10"
else
     echo "Given number $NUMBER is not less then 10"
     exit 1
fi     