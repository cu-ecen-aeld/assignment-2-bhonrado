#!/bin/sh
# usage example: writer.sh /tmp/aesd/assignment1/sample.txt ios

# full path to a file (including filename)
writefile=$1
# text string which will be written within this file
writestr=$2

if [ -z "$writefile" ]; then
    echo "First argument is missing"
    exit 1
fi

if [ -z "$writestr" ]; then
    echo "Second argument is missing"
    exit 1
fi

# Extract directory path from the full file path
dirpath=$(dirname "$writefile")

# Create the directory path if it does not exist
if ! mkdir -p "$dirpath"
then
    echo "Failed to create directory path: $dirpath"
    exit 1
fi

# Now, touch can safely be used to create or update the file's timestamp
if ! touch "$writefile"
 then
    echo "Failed to create or update file: $writefile"
    exit 1
fi

if ! echo "$writestr" > "$writefile"
then
    echo "Failed to write: $writestr , to file: $writefile"
    exit 1
fi