.PHONY: all
all: clear project build run

TARGET_1=app_with_multiple_sources
TARGET_2=app_with_static_lib
TARGET_3=app_with_shared_lib
BUILD_DIR=./build/
SOURCE_DIR=./source/

.PHONY: project
project:
	mkdir -p ${BUILD_DIR}
	cd ${BUILD_DIR} && cmake ../${SOURCE_DIR}

.PHONY: build
build:
	cmake --build ${BUILD_DIR}

.PHONY: run
run:
	${BUILD_DIR}/${TARGET_1}
	${BUILD_DIR}/${TARGET_2}
	${BUILD_DIR}/${TARGET_3}

.PHONY: clear
clear:
	rm -rf ${BUILD_DIR}
