# 2023-10-27
# dfir-jesseee
# put this in crontab -e
# At every 5 minutes, see https://crontab.guru/#*/5_*_*_*_*
# */5 * * * *

#!/bin/bash

# Define the file path
file_path="/tmp/class_goals.txt"

# Check if the file exists
if [ -f "$file_path" ]; then
    # Read the content from the file
    class_goals=$(cat "$file_path")

    # Send the content to the wall command
    wall <<< "$class_goals"
else
    echo "Class goals file not found."
fi
