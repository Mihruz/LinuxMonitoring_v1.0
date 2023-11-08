#!/bin/bash

color_code=()
color_code+=('0') # blank
color_code+=('37') # white
color_code+=('31') # red
color_code+=('32') # green
color_code+=('34') # blue
color_code+=('35') # purple
color_code+=('30') # black

# Сброс цветов
reset_colors='\033[0m'

print_color(){
  echo "\033[$((${color_code[$1]} + 10))m\033[${color_code[$2]}m"
}

print_color_1=$(print_color $column1_background $column1_font_color)
print_color_2=$(print_color $column2_background $column2_font_color)

for i in "${!labels[@]}"; do
  echo -e "${print_color_1}${labels[i]}$reset_colors${print_color_2}${values[i]}$reset_colors"
done
echo

color_name() {
  case "$1" in
    1) echo "white" ;;
    2) echo "red" ;;
    3) echo "green" ;;
    4) echo "blue" ;;
    5) echo "purple" ;;
    6) echo "black" ;;
  esac
}
if [[ $default_flag -eq 0 ]]
then
  echo "Column 1 background = ${column1_background} ($(color_name $column1_background))"
  echo "Column 1 font color = ${column1_font_color} ($(color_name $column1_font_color))"
  echo "Column 2 background = ${column2_background} ($(color_name $column2_background))"
  echo "Column 2 font color = ${column2_font_color} ($(color_name $column2_font_color))"
else
  echo "Column 1 background = default ($(color_name $column1_background))"
  echo "Column 1 font color = default ($(color_name $column1_font_color))"
  echo "Column 2 background = default ($(color_name $column2_background))"
  echo "Column 2 font color = default ($(color_name $column2_font_color))"
fi
