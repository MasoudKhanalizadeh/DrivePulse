#!/bin/bash

# Program Name: DrivePulse
# Created By: Masoud Khanalizadehimani
# Contact: masoud.khanalizadehimani@gmail.com
# Creation Date: 01 April 2025
# Description: A disk performance benchmarking tool to analyze SMART data, 
#              run sequential/random I/O tests, and provide IOPS and latency metrics.

# Function to display a numbered list of available disks
list_disks() {
  echo "List of available disks:"
  lsblk -o NAME,SIZE,TYPE | grep disk | nl -w 2 -s '. '
}

# Function to get the name of a disk based on its number
get_disk_name() {
  local number=$1
  lsblk -o NAME,SIZE,TYPE | grep disk | sed -n "${number}p" | awk '{print $1}'
}

# Function to display SMART information of a disk
smart_info() {
  local disk=$1
  echo "SMART information for disk /dev/$disk:"
  sudo smartctl -a /dev/$disk
}

# Function to perform performance tests using fio
run_fio_test() {
  local disk=$1
  local mode=$2

  echo "Running $mode test on disk $disk..."
  
  # Execute the fio test
  fio --name=${mode}_test --filename=/dev/${disk} --rw=$mode --bs=4k --size=1G --numjobs=1 --iodepth=16 --direct=1 --output=${mode}_result.txt &
  
  # Progress bar simulation
  for i in $(seq 1 10); do
    echo -n "#"
    sleep 1
  done
  echo " Done!"

  echo "$mode test completed! Results saved in ${mode}_result.txt"
}

# Function to extract IOPS and latency results
extract_results() {
  local mode=$1
  echo "Results for $mode:"
  grep -E "IOPS|lat" ${mode}_result.txt | awk '{print $1, $2, $3}'
}

# Main menu function
main() {
  list_disks
  echo -n "Enter the number corresponding to the desired disk: "
  read disk_number

  # Get the disk name from the user selection
  disk=$(get_disk_name $disk_number)

  if [ -z "$disk" ]; then
    echo "Invalid selection. Please choose a valid disk number."
    exit 1
  fi

  # Display SMART information
  echo "Retrieving SMART information..."
  smart_info $disk

  # Warn the user about data loss before running performance tests
  echo -n "Performance tests will overwrite data on the disk. Do you want to proceed? (y/n): "
  read confirmation
  if [[ "$confirmation" == "y" || "$confirmation" == "Y" ]]; then
    # Perform sequential write test
    run_fio_test $disk "write"
    extract_results "write"

    # Perform random read test
    run_fio_test $disk "randread"
    extract_results "randread"
  else
    echo "Operation canceled by the user."
    exit 0
  fi
}

# Execute the main function
main
