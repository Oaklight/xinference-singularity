#!/bin/bash

# Port where xinference-local is running
PORT=9997

# Find the PID associated with the given port
PID=$(lsof -t -i :$PORT)

# Check if the process is running
if [ -z "$PID" ]; then
  echo "No process found listening on port $PORT."
  exit 1
else
  # Kill the process
  echo "Stopping process (PID: $PID) running on port $PORT..."
  kill $PID
  
  # Check if the process was successfully terminated
  if [ $? -eq 0 ]; then
    echo "Successfully stopped the process running on port $PORT."
  else
    echo "Failed to stop the process running on port $PORT."
  fi
fi
