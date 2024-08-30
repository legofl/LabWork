#!/bin/bash

# Run this by running the command below and replacing with the two files you would like to compare
# ./compare_found.sh found.txt found.1.txt
# If you would like to output to a file, then run ./compare_found.sh found.txt found.1.txt > output_diff.txt
# same command as above, but the > outputs to the file designated

file1=$1  # file1 is the first file input in the command (found.txt from example above)
file2=$2  # file2 is the second file input in the command (found.1.txt from example above)

lines_file1=$(wc -l < "$file1")
lines_file2=$(wc -l < "$file2")

echo "Number of lines in $file1: $lines_file1"
echo "Number of lines in $file2: $lines_file2"

diff_output=$(diff -y --suppress-common-lines "$file1" "$file2")
if [ -n "$diff_output" ]; then
    echo "Mismatched lines:"
    echo "$diff_output"
else
    echo "The files are identical."
fi

