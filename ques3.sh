#!/bin/bash

# Check if service names are provided as arguments
if [ $# -eq 0 ]; then
  echo "Usage: $0 <service_name> [<service_name> ...]"
  exit 1
fi

# Iterate over the service names
for SERVICE_NAME in "$@"; do
  # Check if the service is running
  if [ "$(ps -ef | grep -v grep | grep $SERVICE_NAME | wc -l)" -gt 0 ]; then
    # If the service is running, print a success message
    echo "$SERVICE_NAME is running."
  else
    # If the service is not running, print an error message
    echo "$SERVICE_NAME is not running."
  fi
done
