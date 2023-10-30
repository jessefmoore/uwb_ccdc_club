#2023-10-27
# dfir-jesseee
# This requires this script to complete the crontab activity: https://github.com/jessefmoore/uwb_ccdc_club/blob/main/fun/wall.sh

#!/bin/bash

# Ask the user for their input
read -p "What do you want to get out of class? " user_input

# Define the file path
file_path="/tmp/class_goals.txt"

# Write the user's input to a file
echo "$user_input" > "$file_path"

echo "Your class goals have been saved to $file_path."
