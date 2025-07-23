#!/bin/bash

USERID=$(id -u)
R="\e[31m"   # Red
G="\e[32m"   # Green
Y="\e[33m"   # Blue
N="\e[0m"    # Reset
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: $N Please run this script with root access $N"
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access"
fi

# validate functions takes input as exit status, 
# what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo  -e "Installing $2 is ... $G SUCCESS  $N"
    else
        echo -e "Installing $2 is ... $R FAILURE $N"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "MySQL is already installed... $Y already installed $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "Nothing to do python....$Y already installed $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e  "nginx is already installed...$Y already installed $N"
fi

