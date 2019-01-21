__makefile_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

OUT_DIR := "${__makefile_dir}/.build"
PRO_FILE := "${__makefile_dir}/RenameMe.pro"
QMAKE ?= "qmake"

.PHONY: all build clean help qmakeRelease qmakeDebug test

all: build

build: qmakeRelease ## Build the binary file
	$(MAKE) -C ${OUT_DIR} -j$(nproc)

clean: ## Remove previous build
	@rm -rf ${OUT_DIR}/*

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

qmakeDebug: ## generate a Makefile that is used to build the project
	$(eval OUT_DIR := ${OUT_DIR}/debug)
	@${QMAKE} ${PRO_FILE} -o ${OUT_DIR}/Makefile CONFIG+=debug CONFIG+=x86_64 CONFIG+=qml_debug CONFIG+=TEST
	@cd ${OUT_DIR}/
	$(MAKE) -C ${OUT_DIR} qmake_all

qmakeRelease: ## generate a Makefile that is used to build the project
	$(eval OUT_DIR := ${OUT_DIR}/release)
	@${QMAKE} ${PRO_FILE} -o ${OUT_DIR}/Makefile CONFIG+=x86_64 CONFIG+=qtquickcompiler
	@cd ${OUT_DIR}/
	$(MAKE) -C ${OUT_DIR} qmake_all

test: qmakeDebug ## run all the tests
	$(MAKE) -C ${OUT_DIR} check
