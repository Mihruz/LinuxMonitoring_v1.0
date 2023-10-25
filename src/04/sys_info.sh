#!/bin/bash

labels=()
values=()

labels+=("HOSTNAME = ") values+=("$(hostname)")
labels+=("TIMEZONE = ") values+=("$(timedatectl | grep "Time zone" | awk '{print $3}')")
labels+=("USER = ") values+=("$(whoami)")
labels+=("OS = ") values+=("$(cat /etc/issue | sed 's/\\n//g; s/\\l//g')")
labels+=("DATE = ") values+=("$(date +"%d %B %Y %T")")
labels+=("UPTIME = ") values+=("$(uptime -p)")
labels+=("UPTIME_SEC = ") values+=("$(awk '{print $1}' /proc/uptime)")
labels+=("IP = ") values+=("$(ip a | grep 'inet ' | awk 'NR==2 {print $2}' | cut -d '/' -f 1)")
labels+=("MASK = ") values+=("$(/sbin/ifconfig | grep -o 'netmask .*' | awk '{print $2}' | head -n 1)")
labels+=("GATEWAY = ") values+=("$(ip -4 route show default | awk '/via/ {print $3}')")
labels+=("RAM_TOTAL = ") values+=("$(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2 / 1024^2}')")
labels+=("RAM_USED = ") values+=("$(vmstat -s | grep 'used m' | awk '{ printf "%.3f GB", $1 / 1024^2 }')")
labels+=("RAM_FREE = ") values+=("$(grep MemFree /proc/meminfo | awk '{ printf "%.3f GB", $2 / 1024^2 }')")
labels+=("SPACE_ROOT = ") values+=("$(df -hT | grep '/$' | awk '{ printf "%.2f MB", $3 * 1024 }')")
labels+=("SPACE_ROOT_USED = ") values+=("$(df -hT | grep '/$' | awk '{ printf "%.2f MB", $4 * 1024 }')")
labels+=("SPACE_ROOT_FREE = ") values+=("$(df -hT | grep '/$' | awk '{ printf "%.2f MB", $5 * 1024 }')")

