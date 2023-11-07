#!/bin/bash

path=$1
total_folders=$(find "$path" -type d | wc | awk '{print $1}')
top_5_folders=$(du -h "$path" 2>/dev/null | sort -hr | head -5 | awk 'BEGIN{i=1}{print i " - " $2 ", " $1; i++}' | sed -r 's/([0-9])([G-M])/\1 \2\B/g;')
total_files=$(find "$path" -type f | wc -l)
conf_files=$(find "$path" -type f -name "*.conf" | wc -l)
text_files=$(find "$path" -type f -name "*.txt" | wc -l)
exec_files=$(find "$path" -type f -executable | wc -l)
log_files=$(find "$path" -type f -name "*.log" | wc -l)
archive_files=$(find "$path" -type f \( -name "*.zip" -o -name "*.rar" -o -name "*.tar" -o -name "*.7z" \) | wc -l)
symlink_files=$(find "$path" -type l | wc -l)
top_10_files(){
  find "$path" -type f -exec du -h {} + | sort -rh | head -10 | awk '{print $2, $1}' | while read file; do
          file_path=$(echo "$file" | awk '{print $1}')
          file_size=$(echo "$file" | awk '{print $2}')
          file_type=$(file -b "$file_path" | awk '{print $1}'| tr '[:upper:]' '[:lower:]')
          echo "$((++i)) - $file_path, $file_size, $file_type"
      done
}

top_10_exec_files(){
  executable_files=$(find "$path" -type f -executable 2>/dev/null)
  top_10_executables=$(echo "$executable_files" | xargs du -b 2>/dev/null | sort -nr | head -10)
  IFS=$'\n'
  i=1
  for file_info in $top_10_executables; do
    file_path=$(echo "$file_info" | cut -f2)
    file_size=$(echo "$file_info" | cut -f1)
    file_hash=$(sha1sum "$file_path" | awk '{print $1}')
    echo "$i - $file_path, $(numfmt --to=iec --suffix=B "$file_size"), $file_hash"
    i=$((i + 1))
  done
}

get_info() {
  echo "Total number of folders (including all nested ones) = $total_folders"
  echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
  echo "$top_5_folders"
  echo "Total number of files = $total_files"
  echo "Number of: "
  echo "Configuration files (with the .conf extension) = $conf_files"
  echo "Text files = $text_files"
  echo "Executable files = $exec_files"
  echo "Log files (with the extension .log) = $log_files"
  echo "Archive files = $archive_files"
  echo "Symbolic links = $symlink_files"
  echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "
  top_10_files

  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file): "
  top_10_exec_files

}