#!/bin/bash


if [ "$#" -ne 1 ]; then
  echo -e "\033[31mError! Please specify a directory path as a parameter.\033[0m"
  exit 1
fi

last_char="${1: -1}"
if [ "$last_char" != "/" ]; then
  echo -e "\033[31mError! Path should end with a slash ('/'). Please enter a valid path.\033[0m"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo -e "\033[31mError! The provided parameter is not a valid directory path.\033[0m"
  exit 1
fi

