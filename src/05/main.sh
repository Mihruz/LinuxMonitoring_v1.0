#!/bin/bash

source input.sh
source info.sh

start_time=$(date +%s.%N)
get_info "$1"


end_time=$(date +%s.%N)
execution_time=$(echo "$end_time - $start_time" | bc)

echo "Script execution time: $execution_time seconds"