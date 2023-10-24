#!/bin/bash



if [[ $# != 2 ]]; then
  echo "Usage: $0 source_directory destination_directory"
  exit 1
fi


if [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
  echo "Invalid directory path provided"
  exit 1
fi

# [TASK 1]
targetDirectory="$1"
destinationDirectory="$2"

# [TASK 2]
echo "Source directory: $1"
echo "Destination directory: $2"

# [TASK 3]
currentTS=$(date +%s)

# [TASK 4]
backupFileName="backup-${currentTS}.tar.gz"

# We're going to:
# 1: Go into the target directory
# 2: Create the backup file
# 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
origAbsPath=$(pwd)

# [TASK 6]
cd "$destinationDirectory"
destDirAbsPath=$(pwd)

# [TASK 7]
cd "$origAbsPath"

# [TASK 8]
yesterdayTS=$((currentTS - 24 * 60 * 60))

declare -a toBackup

for file in $(ls "$origAbsPath") # [TASK 9]
do
  # [TASK 10]
  if [[ $(date -r "$file" +%s) -gt $yesterdayTS ]]; then
    # [TASK 11]
    toBackup+=("$file")
  fi
done

# [TASK 12]
tar -czvf "$backupFileName" "${toBackup[@]}"

# [TASK 13]
echo "Backup file $backupFileName created in $origAbsPath"

# Congratulations! You completed the final project for this course!
