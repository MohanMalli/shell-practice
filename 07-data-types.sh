#!/bin/bash

NUMBER1=100
NUMBER2=200

TIMESTAMP=$(date) # here date value will store in TIMESTAMP

echo "Script execute at: $TIMESTAMP "

SUM=$(($NUMBER1+$NUMBER2)) # here add two numbers

echo "sum of $NUMBER1 and $NUMBER2 is: $SUM"

