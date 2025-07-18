#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; 
then
    echo "ERROR:: Please run this script with root access"
    exit 1  # Give other than 0 upto 127
else
    echo "you are runnig with root access"
fi

dnf list installed mysql

# Check already installed or not, If installed  $? is 0. then $? -ne 0
#if not installed then $? is not 0. expression
if [ $? -ne 0]
then 
    echo "Mysql is not installed, installing now"

    dnf install mysql  -y   
    if [ $? = 0 ]
    then
        echo "installing Mysql is.... success"
    else
        echo "installing Mysql is ... failed"
        exit 1
    fi
else
    echo "Mysql is already installed, skipping installation"
    #exit 0
    
fi

# dnf install mysql  -y   
# if [ $? = 0 ]
# then
#     echo "installing Mysql is.... success"
# else
#     echo "installing Mysql is ... failed"
#     exit 1
# fi


