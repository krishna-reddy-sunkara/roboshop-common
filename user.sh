#!/bin/bash

source ./common.sh
app_name=catalogue

check_root
app_set
nodejs_setup

systemd_setup
print_total_time
