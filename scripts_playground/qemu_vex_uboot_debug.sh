#!/bin/bash

# Variables
U_BOOT="/home/fazloka/ITI/EmbLinux/u-boot/u-boot"
SD_IMG="/home/fazloka/sd.img"



# Command to run QEMU
QEMU_CMD="sudo qemu-system-arm -M vexpress-a9 -kernel $U_BOOT -sd $SD_IMG -net nic -net tap -nographic -audiodev id=none,driver=none -S -s"

# Check if the script is running in a terminal
if [ -t 0 ]; then
    # If running in a terminal, launch a new terminal and run QEMU
    x-terminal-emulator -e "bash -c '$QEMU_CMD; echo Press Enter to close...; read; exec bash'"
else
    # If not running in a terminal (e.g., double-clicked), run QEMU directly
    $QEMU_CMD
fi

