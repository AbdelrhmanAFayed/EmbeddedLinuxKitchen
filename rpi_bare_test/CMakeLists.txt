cmake_minimum_required(VERSION 3.16)

# Project name
project(RPi3BPlusBareMetal LANGUAGES C ASM)

# Set the ARM toolchain
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)

# Set the output binary name
set(TARGET_NAME "led")

# Specify the linker script
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/linker.ld")

# Define the source files
set(SOURCES
    "${CMAKE_SOURCE_DIR}/main.c"
    "${CMAKE_SOURCE_DIR}/led.s"
)

# Define the include directories
include_directories("${CMAKE_SOURCE_DIR}")

# Specify the compiler flags
set(CMAKE_C_FLAGS "-mcpu=cortex-a53 -nostartfiles -ffreestanding -Wall -Wextra")
set(CMAKE_ASM_FLAGS "-mcpu=cortex-a53 -nostartfiles -ffreestanding")

# Add the executable
add_executable(${TARGET_NAME} ${SOURCES})

# Specify the linker flags
set_target_properties(${TARGET_NAME} PROPERTIES
    LINK_FLAGS "-T ${LINKER_SCRIPT} -nostdlib -static"
)

# Set the output format to binary
add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${TARGET_NAME}> ${TARGET_NAME}.bin
    COMMENT "Converting ELF to binary format"
)
