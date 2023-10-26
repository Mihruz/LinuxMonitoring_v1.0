#!/bin/bash

if [ "$#" -ne 0 ]; then
  echo "Please do not use any parameters. Parameters must be specified in the config file."
  exit 1
fi

default_column1_background=6
default_column1_font_color=1
default_column2_background=2
default_column2_font_color=4

column1_background="${column1_background:-$default_column1_background}"
column1_font_color="${column1_font_color:-$default_column1_font_color}"
column2_background="${column2_background:-$default_column2_background}"
column2_font_color="${column2_font_color:-$default_column2_font_color}"

if [[ $column1_background == $column1_font_color || $column2_background == $column2_font_color ]]; then
  echo "Error: font and background colors must not match. Using default colors."
  column1_background=$default_column1_background
  column1_font_color=$default_column1_font_color
  column2_background=$default_column2_background
  column2_font_color=$default_column2_font_color
  exit 1
fi