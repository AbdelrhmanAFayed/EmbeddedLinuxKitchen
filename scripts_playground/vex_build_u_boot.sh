

MAKEFILE_DIR="/home/fazloka/ITI/EmbLinux/u-boot"

export CROSS_COMPILE="/home/fazloka/x-tools/arm-fazloka-linux-gnueabihf/bin/arm-fazloka-linux-gnueabihf-"
export ARCH="arm"

# Navigate to the Makefile directory
cd "$MAKEFILE_DIR" || { echo "Directory not found: $MAKEFILE_DIR"; exit 1; }
# Run the Makefile
echo "Running make"
make -j14 || { echo "make failed"; exit 1; }


cd /home/fazloka/ITI/playground

