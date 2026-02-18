#!bin/bash

mkdir backfolder

montitored_directory="/home/folder1"
backup_directory="/home/backfolder"
threshold=5

tar -czf $backup_directory -c $montitored_directory .
echo "file has been compressed"

function compress(){
   usage=$(df -h $dir | awk 'NR==2 {print $5}' | sed 's/%//g')
}

if[$usage -gte $threshold]; then
    echo "your script has to be compressed"
    compress
else 
    echo "no worries storage is there"
fi

