#!/bin/bash

# Variables
MAKEFILE_DIR="/home/fazloka/ITI/EmbLinux/u-boot"

##export CROSS_COMPILE=arm-linux-gnueabi-
export CROSS_COMPILE="/home/fazloka/x-tools/arm-fazloka-linux-gnueabihf/bin/arm-fazloka-linux-gnueabihf-"
export ARCH="arm"

# Navigate to the Makefile directory
cd "$MAKEFILE_DIR" || { echo "Directory not found: $MAKEFILE_DIR"; exit 1; }

# Export environment variables
##export CROSS_COMPILE=$CROSS_COMPILE
##export ARCH=$ARCH

echo "CROSS_COMPILE is set to: $CROSS_COMPILE"

# Run the Makefile with the 'clean' target
## echo "Running make clean..."
## make clean || { echo "make clean"; exit 1; }

# Run the Makefile with the 'vexpress_ca9x4_defconfig' target
echo "Running make vexpress_ca9x4_defconfig..."
make vexpress_ca9x4_defconfig || { echo "make vexpress_ca9x4_defconfig failed"; exit 1; }

# Run the Makefile with the 'menuconfig' target
echo "Running make menuconfig..."
make menuconfig || { echo "make menuconfig failed"; exit 1; }

echo "Script completed successfully."


cd /home/fazloka/ITI/playground

