
MAKEFILE_DIR="/home/fazloka/ITI/EmbLinux/linux"


##export CROSS_COMPILE=arm-linux-gnueabi-
export CROSS_COMPILE="/home/fazloka/x-tools/arm-fazloka-linux-gnueabihf/bin/arm-fazloka-linux-gnueabihf-"
export ARCH="arm"

cd "$MAKEFILE_DIR" || { echo "Directory not found: $MAKEFILE_DIR"; exit 1; }

echo "Running make vexpress_defconfig..."
make vexpress_defconfig|| { echo "make vexpress_defconfig failed"; exit 1; }


# Run the Makefile with the 'menuconfig' target
echo "Running make menuconfig..."
make menuconfig || { echo "make menuconfig failed"; exit 1; }

echo "Running make....."
make -j14 || { echo "make failed"; exit 1; }

