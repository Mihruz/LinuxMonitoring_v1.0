#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo -e "\e[31mError! Please specify a directory path as a parameter.\e[0m"
  exit 1
fi

last_char="${1: -1}"
if [ "$last_char" != "/" ]; then
  echo -e "\e[31mError! Path parameter should end with a slash ('/'). Please enter a valid path.\e[0m"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo -e "\e[31mError! The provided parameter is not a valid directory path.\e[0m"
  exit 1
fi

