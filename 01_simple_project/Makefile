.PHONY: all
all: clear project build run

TARGET=app
BUILD_DIR=./build/
SOURCE_DIR=./source/

.PHONY: project
project:
	mkdir -p ${BUILD_DIR}
	cd ${BUILD_DIR} && cmake -G "Unix Makefiles" ../${SOURCE_DIR}

.PHONY: build
build:
	cmake --build ${BUILD_DIR} --config Release --target ${TARGET}

.PHONY: run
run:
	${BUILD_DIR}/${TARGET}

.PHONY: clear
clear:
	rm -rf ${BUILD_DIR}
