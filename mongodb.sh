#!/bin/bash

source ./common.sh

check_root

cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "coping mongo.repo "

dnf install mongodb-org -y &>>$LOGS_FILE
VALIDATE $? "installing mongodb "

systemctl enable mongod &>>$LOGS_FILE
VALIDATE $? "enabling mongodb "

systemctl start mongod &>>$LOGS_FILE
VALIDATE $? "starting mongodb"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
VALIDATE $? "allowing remote connections"
 
systemctl restart mongod &>>$LOGS_FILE
VALIDATE $? "restarting mongodb"
 
print_total_time