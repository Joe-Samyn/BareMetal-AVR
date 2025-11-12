
CC := gcc 
AVR_CC := avr-gcc
CFLAGS := -O0 
MCU := -mmcu=attiny85

BIN_NAME := blinky

SRC := src/blinky.c
HEADER := src/avr.h

OBJ := $(patsubst src/%.c, build/%.o, ${SRC}) 

BUILD_DIR := ./build
BIN_DIR := ./bin
SRC_DIR := ./src

ELF := ${BIN_DIR}/${BIN_NAME}.elf
HEX := $(ELF:.elf=.hex)

INCLUDES := -I${HEADER}

flash: ${HEX}
	sudo avrdude -p t85 -c usbasp-clone -U flash:w:${HEX}:i  

build: ${HEX}


${BIN_DIR}/${BIN_NAME}.hex: compile
	avr-objcopy -j .text -j .data -O ihex ${ELF} $@  

# Basic compilation for ATTiny85 and AVR platforms
compile: ${OBJ}
	@# Creating binary directory if does not exist
	@mkdir -p ${BIN_DIR}
	@echo "Linking object files and creating binary - ${BIN_NAME}.."
	
	${AVR_CC} ${OBJ} -o ${ELF}

${BUILD_DIR}/%.o: ${SRC}
	@# Create build folder if it does not already exist
	mkdir -p ${BUILD_DIR}

	@echo "Building object files.."	
	${AVR_CC} ${CFLAGS} ${MCU} -c ${SRC} -o $@


clean: 
	@echo "Cleaning binary directory.."
	rm -rf ${BIN_DIR}

	@echo "Cleaning build directory.."
	rm -rf ${BUILD_DIR}
