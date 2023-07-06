#!/bin/bash
dtm=("/var/log" "/home")
# The first value passed during execution will be to the td variable
if [[ -n "$1" && "$1" =~ ^[0-9]+$ ]]; then
  td="$1"
else
  td=80
fi

# the ${@:2} will take the value for the array from the second parameters 
for directory in "${@:2}"; do
# Adding new element at the end of the array
    dtm+=("$directory")
done

fn_a() {
  local dir=$1
  local ol=$(find $dir -name "*.log" -mtime +30)
  if [ -n "$ol" ]; then
# adding the remove command at the end of the zip compression command so it will not ask for deletion of the log files
    tar czf $dir/logs_$(date +'%Y%m%d').tar.gz $ol --rm $ol
  fi
}

for dir in "${dtm[@]}"; do
# The fs variable block is removed and the disk space is directly gathered from the below command
    ug=$(df $dir | tail -1 | awk '{print $5}' | sed 's/%//')
    if [ $ug -gt $td ]; then
        fn_a $dir
    fi
done

