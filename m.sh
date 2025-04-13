#!/bin/bash

# Shell script to convert the 2nd column containing numbers followed by 'm' into decimal values
# Usage: ./convert_column_m_to_decimal.sh input.csv output.csv

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_file output_file"
    exit 1
fi

input_file=$1
output_file=$2

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' does not exist."
    exit 1
fi

# Process the file and convert the 2nd column
awk -F',' 'BEGIN {OFS=","} 
{
    # Check if the 2nd column ends with 'm'
    if ($2 ~ /^[0-9]+m$/) {
        # Remove 'm' and divide the numeric part by 1000
        $2 = substr($2, 1, length($2)-1) / 1000;
    }
    print $0;
}' "$input_file" > "$output_file"

echo "Conversion complete. Processed file saved to '$output_file'."
