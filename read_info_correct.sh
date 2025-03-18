#!/bin/bash

# Filepath to the CSV file
csv_file="new.csv"

# Extract the "dc op" column and store it in a list, skipping empty lines and headers
dc_op_list=($(awk -F, 'NR>3 && $2 != "" {print $2}' "$csv_file"))

# Print the list
echo "DC OP values: ${dc_op_list[@]}"