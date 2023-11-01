#!/bin/bash

get_subnet_mask() {
input_mask=$(ip a | awk '/inet / {print $2}' | cut -d '/' -f 2 | awk 'NR==2')
num="${input_mask##*/}"

bitmask=$(( 0xffffffff << (32 - num) ))

octet1=$(( (bitmask >> 24) & 0xff ))
octet2=$(( (bitmask >> 16) & 0xff ))
octet3=$(( (bitmask >> 8) & 0xff ))
octet4=$(( bitmask & 0xff ))

formatted_mask="${octet1}.${octet2}.${octet3}.${octet4}"
echo $formatted_mask
}

get_sys_info() {
  echo "HOSTNAME = $(hostname)"
  echo "TIMEZONE = $(timedatectl | grep "Time zone" | awk '{print $3}')"
  echo "USER = $(whoami)"
  echo "OS = $(cat /etc/issue | sed 's/\\n//g; s/\\l//g')"
  echo "DATE = $(date +"%d %B %Y %T")"
  echo "UPTIME = $(uptime -p)"
  echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"
  echo "IP = $(ip a | grep 'inet ' | awk 'NR==2 {print $2}' | cut -d '/' -f 1)"
  echo "MASK = $(get_subnet_mask)"
  echo "GATEWAY = $(ip -4 route show default | awk '/via/ {print $3}')"
  echo "RAM_TOTAL = $(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2 / 1024^2}')"
  echo "RAM_USED = $(vmstat -s | grep 'used m' | awk '{ printf "%.3f GB", $1 / 1024^2 }')"
  echo "RAM_FREE = $(grep MemFree /proc/meminfo | awk '{ printf "%.3f GB", $2 / 1024^2 }')"
  echo "SPACE_ROOT = $(df -hT | grep '/$' | awk '{ printf "%.2f MB", $3 * 1024 }')"
  echo "SPACE_ROOT_USED = $(df -hT | grep '/$' | awk '{ printf "%.2f MB", $4 * 1024 }')"
  echo "SPACE_ROOT_FREE = $(df -hT | grep '/$' | awk '{ printf "%.2f MB", $5 * 1024 }')"
}
