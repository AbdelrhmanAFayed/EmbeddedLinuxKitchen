#!/bin/bash

# Variables
U_BOOT="/home/fazloka/ITI/EmbLinux/u-boot/u-boot"
SD_IMG="/home/fazloka/sd.img"

# Command to run QEMU
QEMU_CMD="sudo qemu-system-arm -M vexpress-a9 -nographic -kernel $U_BOOT -sd $SD_IMG -net nic -net tap"

# Command to configure the tap0 interface
IP_CMD="sudo ip a add 192.168.1.19/24 dev tap0"

# Launch QEMU in a new terminal (and close the terminal after QEMU exits)
echo "Starting QEMU in a new terminal..."
x-terminal-emulator -e "bash -c '$QEMU_CMD'" &

# Wait for a short time to allow QEMU to create the tap0 interface
echo "Waiting for tap0 interface to be created..."
sleep 10

# Configure the tap0 interface in the original terminal
echo "Configuring tap0 interface in the original terminal..."
$IP_CMD
if [ $? -eq 0 ]; then
    echo "IP address configured successfully."
else
    echo "Failed to configure IP address."
fi


