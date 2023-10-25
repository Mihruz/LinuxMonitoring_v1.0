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
reset_colors='\e[0m'

print_color(){
  echo "\e[$((${color_code[$1]} + 10))m\e[${color_code[$2]}m"
}

print_color_1=$(print_color $column1_background $column1_font_color)
print_color_2=$(print_color $column2_background $column2_font_color)

for i in "${!labels[@]}"; do
  echo -e "${print_color_1}${labels[i]}$reset_colors${print_color_2}${values[i]}$reset_colors"
done

