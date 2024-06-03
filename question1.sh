#!/bin/bash

# Check if the log file exists and is readable
if [ $# -ne 1 ]; then
  echo "Usage: $0 <log_file_path>"
  exit 1
fi

log_file=$1
if [! -f "$log_file" ]; then
  echo "Error: Log file $log_file does not exist"
  exit 1
fi
if [! -r "$log_file" ]; then
  echo "Error: Log file $log_file is not readable"
  exit 1
fi

# Total Requests Count
total_requests=$(wc -l < "$log_file")
echo "Total Requests: $total_requests"

# Percentage of Successful Requests
successful_requests=$(grep -cE 'HTTP/[0-9\.]+ 2[0-9][0-9]' "$log_file")
percentage_successful=$(awk "BEGIN {printf \"%.2f%%\", ($successful_requests / $total_requests) * 100}")
echo "Percentage of Successful Requests: $percentage_successful"

# Most Active User
most_active_user=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')
echo "Most Active User: $most_active_user"
