#!/usr/bin/awk -f

# This script multiplies corresponding columns from two CSV files and outputs to a new CSV file.

BEGIN {
    FS = ",";   # Input field separator (comma for CSV)
    OFS = ",";  # Output field separator (comma for CSV)
}

# Read the first CSV file into an array
FNR == NR {
    file1[FNR] = $2;  # Assuming we want the 2nd column from the first file
    next;
}

# Process the second CSV file and multiply its 2nd column with the corresponding value in file1
{
    if (FNR in file1) {
        result = file1[FNR] * $2;  # Assuming we want the 2nd column from the second file
        print $1, $2, result;      # Output columns: Column 1 from file 2, Column 2 from file 2, and the result
    } else {
        print $1, $2, "N/A";       # If no corresponding value from file 1, output "N/A"
    }
}
