#!/bin/bash

path=$1
get_info() {
  echo "Total number of folders (including all nested ones) = $(find "$path" -type d | wc | awk '{print $1}')"
  echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
  echo "$(du -h "$1" 2>/dev/null | sort -hr | head -5 | awk 'BEGIN{i=1}{print i " - " $2 ", " $1; i++}' | sed -r 's/([0-9])([G-M])/\1 \2\B/g;')"
  echo "Total number of files = "
  echo "Number of: "
  echo "Configuration files (with the .conf extension) = "
  echo "Text files = "
  echo "Executable files = "
  echo "Log files (with the extension .log) = "
  echo "Archive files = "
  echo "Symbolic links = "
  echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "
  1 - /var/log/one/one.exe, 10 GB, exe
  2 - /var/log/two/two.log, 10 MB, log

  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file): "
  1 - /var/log/one/one.exe, 10 GB, 3abb17b66815bc7946cefe727737d295
  2 - /var/log/two/two.exe, 9 MB, 53c8fdfcbb60cf8e1a1ee90601cc8fe2



}