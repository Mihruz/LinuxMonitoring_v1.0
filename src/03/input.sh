#!/bin/bash

if [ "$#" -ne 4 ]; then
  echo -e "\033[31mError! Please provide four numeric parameters (from 1 to 6) for background and text colors.\033[0m"
  exit 1
fi

for param in "$@"; do
  if ! [[ "$param" =~ ^[1-6]$ ]]; then
    echo -e "\033[31mError! Invalid parameter $param. Please use a number from 1 to 6.\033[0m"
    exit 1
  fi
done

column1_background=$1
column1_font_color=$2
column2_background=$3
column2_font_color=$4

if [[ $column1_background == $column1_font_color || $column2_background == $column2_font_color ]]; then
  echo -e "\033[31mError! Font and background colors must not match.\033[0m"
  exit 1
fi