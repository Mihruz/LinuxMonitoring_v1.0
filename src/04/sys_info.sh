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
labels+=("MASK = ") values+=("$(get_subnet_mask)")
labels+=("GATEWAY = ") values+=("$(ip -4 route show default | awk '/via/ {print $3}')")
labels+=("RAM_TOTAL = ") values+=("$(grep MemTotal /proc/meminfo | awk '{printf "%.3f GB", $2 / 1024^2}')")
labels+=("RAM_USED = ") values+=("$(vmstat -s | grep 'used m' | awk '{ printf "%.3f GB", $1 / 1024^2 }')")
labels+=("RAM_FREE = ") values+=("$(grep MemFree /proc/meminfo | awk '{ printf "%.3f GB", $2 / 1024^2 }')")
labels+=("SPACE_ROOT = ") values+=("$(df -hT | grep '/$' | awk '{ printf "%.2f MB", $3 * 1024 }')")
labels+=("SPACE_ROOT_USED = ") values+=("$(df -hT | grep '/$' | awk '{ printf "%.2f MB", $4 * 1024 }')")
labels+=("SPACE_ROOT_FREE = ") values+=("$(df -hT | grep '/$' | awk '{ printf "%.2f MB", $5 * 1024 }')")
