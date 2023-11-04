#!/bin/bash

default_column1_background=6
default_column1_font_color=1
default_column2_background=2
default_column2_font_color=4

default_flag=0

if [ "$#" -ne 0 ]; then
  echo -e "\033[31mError! Please do not use any parameters. Parameters must be specified in the config file.\033[0m"
  exit 1
fi
if ! [[ $column1_background =~ ^[1-6]$ && $column1_font_color =~ ^[1-6]$ && $column2_background =~ ^[1-6]$ && $column2_font_color =~ ^[1-6]$  ]]; then
    echo -e "\033[31mError! Invalid parameters in config.txt. Please use a numbers from 1 to 6. Using default colors.\033[0m"
    echo
    column1_background=$default_column1_background
    column1_font_color=$default_column1_font_color
    column2_background=$default_column2_background
    column2_font_color=$default_column2_font_color
    default_flag=1
fi

if [[ $column1_background == $column1_font_color || $column2_background == $column2_font_color ]]; then
  echo -e "\033[31mError! Font and background colors must not match. Using default colors.\033[0m"
  echo
  column1_background=$default_column1_background
  column1_font_color=$default_column1_font_color
  column2_background=$default_column2_background
  column2_font_color=$default_column2_font_color
  default_flag=1
fi