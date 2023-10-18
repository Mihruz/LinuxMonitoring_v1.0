#!/bin/bash

get_sys_info() {
  echo "HOSTNAME = $(hostname)"
  echo "TIMEZONE =$(timedatectl | grep "Time zone" | awk -F: '{print $2}')"
  echo "USER = $(whoami)"
  echo "OS = $(cat /etc/issue | sed 's/\\n//g; s/\\l//g')"
  echo "DATE = $(date +"%d %B %Y %T")"
  echo "UPTIME = $(uptime -p)"
  echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"
  echo "IP = $(ip a | grep 'inet ' | awk 'NR==2 {print $2}' | cut -d '/' -f 1)"
  echo "MASK = $(/sbin/ifconfig | grep -o 'netmask .*' | awk '{print $2}' | head -n 1)"
  echo "GATEWAY = $(ip -4 route show default | awk '/via/ {print $3}')"
  echo "RAM_TOTAL = $(grep MemTotal /proc/meminfo / 1024^2)"
RAM_USED = размер используемой памяти в Гб c точностью три знака после запятой
RAM_FREE = размер свободной памяти в Гб c точностью три знака после запятой
SPACE_ROOT = размер рутового раздела в Mб с точностью два знака после запятой в виде: 254.25 MB
SPACE_ROOT_USED = размер занятого пространства рутового раздела в Mб с точностью два знака после запятой
SPACE_ROOT_FREE = размер свободного пространства рутового раздела в Mб с точностью два знака после запятой









  echo "OS = $(uname)"


}
