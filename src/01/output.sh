#!/bin/bash

if [[ $1 =~ [0-9] ]]; then
  echo "Incorrect input, please input text parameter"
else
  echo "$1"
fi