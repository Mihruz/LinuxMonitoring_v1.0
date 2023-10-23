#!/bin/bash

read -p "Save data to file? (Y/N): " response
if [[ $response =~ ^[Yy]$ ]]
then
  FILENAME=$(date +"%d_%m_%y_%H_%M_%S.status")
  get_sys_info > "$FILENAME"
  echo "Data has saved to file $FILENAME"
  else
    echo "Data not saved"
  fi