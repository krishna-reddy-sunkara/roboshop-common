
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-roboshop"
LOGS_FILE="$LOGS_FOLDER/$0.log"
SCRIPT_DIR=$PWD
START_TIME=$(date +%S)

 mkdir -p $LOGS_FOLDER

echo "$(date "+%y-%m-%d %H:%M:%S")|script started excuting at: $(date) | tee -a $LOGS_FILE

check_root(){ 

  if [ $USERID -ne 0 ]; then
      echo " please run this script with sudo user " | tee -a $LOGS_FILE
      exit 1
  fi
}
   
 VALIDATE(){
    if [ $1 -ne 0 ]; then
    echo "$(date "+%y-%m-%d %H:%M:%S")| $2 .... failure " | tee -a $LOGS_FILE
    exit 1
    else 
    echo "$( date "+%y-%m-%d %H:%M:%S")| $2 .... success " | tee -a $LOGS_FILE
    fi
}   

END_TIME=$(date +%S)

print_total_time(){

TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "$( date "+%y-%m-%d %H:%M:%S") |excuting time is : $TOTAL_TIME in seconds | tee -a $LOGS_FILE
}