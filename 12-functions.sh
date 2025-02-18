#!/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0]
    then
        echo "Please run the script with root privileges"
        exit 1
        fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is..FAILED"
        exit 1
    else
        echo "$2 is..SUCCESS"
    fi
}

CHECK_ROOT

dnf list installed git # Just checking whether installed or not

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y # here installing
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed..going to install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already Installed, Nothing to do.."
fi