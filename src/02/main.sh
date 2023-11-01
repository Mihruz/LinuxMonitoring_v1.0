#!/bin/bash

if [ "$#" -ne 0 ]; then
  echo -e "Error! Please do not use any parameters"
  exit 1
fi

source sys_info.sh
get_sys_info
source save_file.sh


