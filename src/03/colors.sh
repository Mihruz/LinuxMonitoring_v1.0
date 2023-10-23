#!/bin/bash

colors=("white" "red" "green" "blue" "purple" "black")
selected_colors=()

while true; do
  clear

  # Выводим диалоговое окно для выбора фона названий значений (HOSTNAME, TIMEZONE и т.д.)
  dialog --backtitle "Select Colors" --radiolist "Select Background for Labels" 0 0 0 \
    1 "White" off \
    2 "Red" off \
    3 "Green" off \
    4 "Blue" off \
    5 "Purple" off \
    6 "Black" off 2> temp.txt

  choice=$(cat temp.txt)
  if [[ $choice == "" ]]; then
    echo "Script was cancelled."
    rm temp.txt
    exit
  fi
  selected_colors[0]=$choice

  clear

  # Выводим диалоговое окно для выбора цвета шрифта названий значений
  dialog --backtitle "Select Colors" --radiolist "Select Text Color for Labels" 0 0 0 \
    1 "White" off \
    2 "Red" off \
    3 "Green" off \
    4 "Blue" off \
    5 "Purple" off \
    6 "Black" off 2> temp.txt

  choice=$(cat temp.txt)
  if [[ $choice == "" ]]; then
    echo "Script was cancelled."
    rm temp.txt
    exit
  fi
  selected_colors[1]=$choice

  clear

  # Выводим диалоговое окно для выбора фона значений (после знака '=')
  dialog --backtitle "Select Colors" --radiolist "Select Background for Values" 0 0 0 \
    1 "White" off \
    2 "Red" off \
    3 "Green" off \
    4 "Blue" off \
    5 "Purple" off \
    6 "Black" off 2> temp.txt

  choice=$(cat temp.txt)
  if [[ $choice == "" ]]; then
    echo "Script was cancelled."
    rm temp.txt
    exit
  fi
  selected_colors[2]=$choice

  clear

  # Выводим диалоговое окно для выбора цвета шрифта значений (после знака '=')
  dialog --backtitle "Select Colors" --radiolist "Select Text Color for Values" 0 0 0 \
    1 "White" off \
    2 "Red" off \
    3 "Green" off \
    4 "Blue" off \
    5 "Purple" off \
    6 "Black" off 2> temp.txt

  choice=$(cat temp.txt)
  if [[ $choice == "" ]]; then
    echo "Script was cancelled."
    rm temp.txt
    exit
  fi
  selected_colors[3]=$choice
  rm temp.txt

  if [[ ${selected_colors[0]} == ${selected_colors[2]} || ${selected_colors[1]} == ${selected_colors[3]} ]]; then
    dialog --msgbox "The background and text colors for a column cannot be the same. Please choose again." 0 0
  else
    break
  fi
done

# Создаем функцию, которая устанавливает цвета шрифта и фона
set_color() {
  local background_color
  local text_color

  case $1 in
    "white") background_color=0; text_color=7 ;;
    "red") background_color=1; text_color=0 ;;
    "green") background_color=2; text_color=7 ;;
    "blue") background_color=4; text_color=7 ;;
    "purple") background_color=5; text_color=7 ;;
    "black") background_color=0; text_color=0 ;;
    *) background_color=0; text_color=7 ;;
  esac

  printf "\033[%d;3%dm" $background_color $text_color
}

# Вызываем функцию set_color для каждой части вывода
set_color
