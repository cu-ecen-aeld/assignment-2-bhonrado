#!/bin/sh
# usage example: finder.sh /tmp/aesd/assignment1 linux

# path to a directory on the filesystem
filesdir=$1
# text string which will be searched within these files
searchstr=$2

if [ -z "$filesdir" ]; then
    echo "First argument is missing"
    exit 1
elif [ ! -d "$filesdir" ]; then
    echo "The specified directory does not exist."
    exit 1
fi

if [ -z "$searchstr" ]; then
    echo "Second argument is missing"
    exit 1
fi

# wc = word count (or new line count in this case)
num_files=$(find "$filesdir" -type f | wc -l)

num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"