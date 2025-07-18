#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; 
then
    echo "ERROR:: Please run this script with root access"
    exit 1  # Give other than 0 upto 127
else
    echo "you are runnig with root access"
fi

dnf install mysql -y

if [ $? = 0 ]
then
    echo "installing Mysql is success"
else
    echo "ERROR:: installing Mysql failed"
    #exit 1
fi