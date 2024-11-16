#!/bin/bash

FILE=/home/ubuntu/importent_file/*
formatted_date=$(date +"%Y-%m-%d %H:%M:%S")
zip -r "$FILE-$formatted_date.zip" $FILE
mkdir back_ups
mv /home/ubuntu/importent_file/*.zip back_ups