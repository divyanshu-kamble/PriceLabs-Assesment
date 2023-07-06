#!/bin/bash
dtm=("/var/log" "/home")
log_file="/var/log/disk_monitor.log"
td=80
fn_a() {
  local dir=$1
  local ol=$(find $dir -name "*.log" -mtime +30)
  if [ -n "$ol" ]; then
    tar czf $dir/logs_$(date +'%Y%m%d').tar.gz $ol
    rm $ol
  fi
}

for dir in "${dtm[@]}"; do

    fs=$(df $dir | tail -1 | awk '{print $1}')
    ug=$(df $fs | tail -1 | awk '{print $5}' | sed 's/%//')
    if [ $ug -gt $td ]; then
        fn_a $dir
    fi
done

