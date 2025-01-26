# Scripts Documentation

This directory contains the following scripts:

---

## `U-BOOT Scripts`

- **Description**: These scripts are intended to configure and build U-boot depending on the desired config.

### `u_boot.sh`

- **Description**: configures and then builds u-boot.

## `Linux Scripts`

- **Description**: These scripts are intended to configure and build Linux depending on the desired config.

### `linux.sh`

- **Description**: configures and then builds the linux kernel.

## `QEMU Scripts`

- **Description**: These scripts are intended to run QEMU depending on the desired target and desired outcome.
- **Future Plan**: Make one script that takes input from user and based on that choose from available targets and behaviours rather than the current approach of having seperate a script for each target and each desired behaviour and to be able to run multiple process (for example a script that both runs qemu and then handles the virtual networking config to be able to use it).

### `qemu_vex.sh`

- **Description**: runs u-boot on qemu for vexpress-a9 target in a new terminal.

### `qemu_vex_debug.sh`

- **Description**: runs u-boot on qemu for vexpress-a9 target in a new terminal but with the added options -S -s for debugging.
