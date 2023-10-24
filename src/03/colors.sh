#!/bin/bash

bg_color=()
bg_color+=('\e[47m') # white
bg_color+=('\e[41m') # red
bg_color+=('\e[42m') # green
bg_color+=('\e[44m') # blue
bg_color+=('\e[45m') # purple
bg_color+=('\e[40m') # black

font_color=()
font_color+=('\e[37m') # white
font_color+=('\e[31m') # red
font_color+=('\e[32m') # green
font_color+=('\e[34m') # blue
font_color+=('\e[35m') # purple
font_color+=('\e[30m') # black


# Сброс цветов
reset_colors='\e[0m'

print_color(){
  echo "bg_color{column1_background};font_color{column1_font_color}"
  echo -e
}

for i in "${!labels[@]}"; do
  echo -e "\e[31;47mRed text on white background\e[0m"
  echo -e "\e[colors{column1_background} + 10;colors{column1_font_color}\e[0m;47m${colors[i]}${labels[i]}${reset_colors} ${values[i]}"
done

