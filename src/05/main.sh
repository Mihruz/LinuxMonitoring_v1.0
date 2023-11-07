#!/bin/bash

start_time=$(date +%s)
source input.sh
source info.sh

get_info "$1"
end_time=$(date +%s)

echo "Script execution time: $((end_time - start_time)) seconds"