#!/bin/bash

FILE=/home/ubuntu/importan_files/*
formatted_date=$(date +"%Y-%m-%d %H:%M:%S")

while true; do
        zip -r "$FILE-$formatted_date.zip" $FILE
done
~                                                                                                                                                                                                           
~              
