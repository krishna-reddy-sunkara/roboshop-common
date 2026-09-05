#!/bin/bash

source ./common.sh
app_name=shipping

check_root
app_set
python_setup

systemd_setup 
print_total_time