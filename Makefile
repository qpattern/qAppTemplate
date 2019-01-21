__makefile_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

OUT_DIR := "${__makefile_dir}/.build"
PRO_FILE := "${__makefile_dir}/RenameMe.pro"
QMAKE ?= "qmake"

.PHONY: all build clean help qmake

all: qmake build

build: ## Build the binary file
	$(MAKE) -C ${OUT_DIR} -j$(nproc)

clean: ## Remove previous build
	@rm -rf ${OUT_DIR}/*

help: ## Display this help screen
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

qmake: ## generate a Makefile that is used to build the project
	@${QMAKE} ${PRO_FILE} -o ${OUT_DIR}/Makefile CONFIG+=x86_64 CONFIG+=qtquickcompiler
	@cd ${OUT_DIR}/
	$(MAKE) -C ${OUT_DIR} qmake_all
