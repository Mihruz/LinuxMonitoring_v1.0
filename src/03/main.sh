#!/bin/bash

source sys_info.sh
get_sys_info
#source colors.sh

if [ "$#" -ne 4 ]; then
  echo "Please provide four numeric parameters (from 1 to 6) for background and text colors."
  exit 1
fi

column1_background=$1
column1_font_color=$2
column2_background=$3
column2_font_color=$4

# Проверяем, что переданные параметры находятся в диапазоне от 1 до 6

if ! [[ "$column1_background" =~ ^[1-6]$ ]]; then
  echo "Invalid background color for labels. Please use a number from 1 to 6."
  exit 1
fi

if ! [[ "$text_color_labels" =~ ^[1-6]$ ]]; then
  echo "Invalid text color for labels. Please use a number from 1 to 6."
  exit 1
fi

if ! [[ "$bg_color_values" =~ ^[1-6]$ ]]; then
  echo "Invalid background color for values. Please use a number from 1 to 6."
  exit 1
fi

if ! [[ "$text_color_values" =~ ^[1-6]$ ]]; then
  echo "Invalid text color for values. Please use a number from 1 to 6."
  exit 1
fi

# Остальная часть скрипта, которая устанавливает цвета, может остаться неизменной
# ... (вставьте здесь код, который устанавливает цвета) ...

# Создаем функцию, которая устанавливает цвета шрифта и фона
set_color() {
  local background_color
  local text_color

  case $1 in
    "1") background_color=1; text_color=7 ;;
    "2") background_color=2; text_color=0 ;;
    "3") background_color=3; text_color=7 ;;
    "4") background_color=4; text_color=7 ;;
    "5") background_color=5; text_color=7 ;;
    "6") background_color=0; text_color=0 ;;
    *) background_color=0; text_color=7 ;;
  esac

  printf "\033[%d;3%dm" $background_color $text_color
}

# Вызываем функцию set_color для каждой части вывода
set_color $bg_color_labels
# Вставьте оставшиеся вызовы set_color для остальных частей вывода
