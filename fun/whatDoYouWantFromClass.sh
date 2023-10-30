#2023-10-27
# dfir-jesseee
#
#!/bin/bash

# Ask the user for their input
read -p "What do you want to get out of class? " user_input

# Define the file path
file_path="/tmp/class_goals.txt"

# Write the user's input to a file
echo "$user_input" > "$file_path"

echo "Your class goals have been saved to $file_path."
