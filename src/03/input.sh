#!/bin/bash

if [ "$#" -ne 4 ]; then
  echo "Please provide four numeric parameters (from 1 to 6) for background and text colors."
  exit 1
fi

for param in "$@"; do
  if ! [[ "$param" =~ ^[1-6]$ ]]; then
    echo "Invalid parameter $param. Please use a number from 1 to 6."
    exit 1
  fi
done

column1_background=$1
column1_font_color=$2
column2_background=$3
column2_font_color=$4

if [[ $column1_background == $column1_font_color || $column2_background == $column2_font_color ]]; then
  echo "Error: Font and background colors must not match."
  exit 1
fi