#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory= $1
destinationDirectory= $2

# [TASK 2]
echo "command argument line $1"
echo "command argument line $2"

# [TASK 3]
currentTS=`(date +%s)`

# [TASK 4]
backupFileName="backup-[$currentTS].tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
origAbsPath=$(/mnt/c/Users/us/Documents/projects1/shell-script-final-project/current_directory)

# [TASK 6]
cd # <-
destDirAbsPath=$(/mnt/c/Users/us/Documents/projects1/shell-script-final-project/destination_directory)

# [TASK 7]
cd  current_directory
cd  destination_directory

# [TASK 8]
yesterdayTS= (($currentTs - 24 * 60 * 60))

declare -a toBackup

for file in $(origAbsPath) # [TASK 9]
do
  
  # [TASK 10]
  if ((`date -r $file +%s` > $yesterdayTS))
  then
    # [TASK 11]
    toBackup+=($file)
  fi
done

# [TASK 12]

# [TASK 13]

# Congratulations! You completed the final project for this course!
