#!/bin/bash

# Function to display a menu and get user choice
choose_target() {
    echo "Please choose a target:"
    echo "1. Vexpress Cortex A9 (vexpress_ca9x4)"
    echo "2. Raspberry Pi 3B+ (rpi3b+)"
    read -p "Enter your choice (1 or 2): " target_choice

    case $target_choice in
        1)
            TARGET="vexpress_ca9x4"
            TOOLCHAIN="/home/fazloka/x-tools/arm-fazloka-linux-gnueabihf/bin/arm-fazloka-linux-gnueabihf-"
            DEFCONFIG="vexpress_ca9x4_defconfig"
            ;;
        2)
            TARGET="rpi3b+"
            TOOLCHAIN="/bin/aarch64-linux-gnu-"
            DEFCONFIG="rpi_3_b_plus_defconfig"
            ;;
        *)
            echo "Invalid choice. Exiting."
            exit 1
            ;;
    esac

    echo "Selected target: $TARGET"
    export CROSS_COMPILE="$TOOLCHAIN"
    export ARCH="arm"
}

# Function to ask if the user wants to configure from pre-made configs
configure_premade() {
    read -p "Do you want to configure from pre-made configs? (y/n) [Y]: " configure_choice
    configure_choice=${configure_choice:-y}  # Default to 'y' if Enter is pressed
    if [[ $configure_choice == "y" || $configure_choice == "Y" ]]; then
        echo "Running make $DEFCONFIG..."
        make "$DEFCONFIG" || { echo "make $DEFCONFIG failed"; exit 1; }
    fi
}

# Function to ask if the user wants to open menuconfig
open_menuconfig() {
    read -p "Do you want to open menuconfig? (y/n) [Y]: " menuconfig_choice
    menuconfig_choice=${menuconfig_choice:-y}  # Default to 'y' if Enter is pressed
    if [[ $menuconfig_choice == "y" || $menuconfig_choice == "Y" ]]; then
        echo "Running make menuconfig..."
        make menuconfig || { echo "make menuconfig failed"; exit 1; }
    fi
}

# Function to ask if the user wants to build
build_project() {
    read -p "Do you want to build the project? (y/n) [Y]: " build_choice
    build_choice=${build_choice:-y}  # Default to 'y' if Enter is pressed
    if [[ $build_choice == "y" || $build_choice == "Y" ]]; then
        echo "Running make..."
        make -j14 || { echo "make failed"; exit 1; }
    fi
}

# Main script
MAKEFILE_DIR="/home/fazloka/ITI/EmbLinux/u-boot"

# Navigate to the Makefile directory
cd "$MAKEFILE_DIR" || { echo "Directory not found: $MAKEFILE_DIR"; exit 1; }

# Choose target and set toolchain
choose_target

# Configure from pre-made configs
configure_premade

# Open menuconfig
open_menuconfig

# Build the project
build_project

echo "Script completed successfully."

# Navigate back to the playground directory
cd /home/fazloka/ITI/playground || { echo "Directory not found: /home/fazloka/ITI/playground"; exit 1; }