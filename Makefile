__makefile_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

OUT_DIR := "${__makefile_dir}/.build"
PRO_FILE := "${__makefile_dir}/RenameMe.pro"
QMAKE ?= "qmake"

.PHONY: all build clean coverage help qmakeDebug qmakeRelease test

all: build

build: qmakeRelease ## Build the binary file
	$(MAKE) -C ${OUT_DIR} -j$(nproc)

clean: ## Remove previous build
	@rm -rf ${OUT_DIR}/*

coverage: test ## run all the test with coverage
	$(eval __out_dir_coverage := ${OUT_DIR}/coverage)
	$(eval __out_dir_html := ${__out_dir_coverage}/html)
	@mkdir -p ${__out_dir_html}
	# Generate our initial info
	@lcov -d "${OUT_DIR}" -c -o "${__out_dir_coverage}/coverage.info"
	# Remove some paths/files which we don't want to calculate the code coverage (e.g. third party libraries) and generate a new coverage file filtered (feel free to edit it when necessary)
	@lcov -r "${__out_dir_coverage}/coverage.info" "*Qt*.framework*" "*.h" "*/tests/*" "*Xcode.app*" "*.moc" "*moc_*.cpp" "*/test/*" "*/build*/*" -o "${__out_dir_coverage}/coverage-filtered.info"
	# Generate the HTML files
	@genhtml --branch-coverage -o "${__out_dir_html}" "${__out_dir_coverage}/coverage-filtered.info"
	# Reset our counts
	@lcov -d "${__out_dir_coverage}" -z
	# Print summary
	@lcov --list "${__out_dir_coverage}/coverage-filtered.info"
	@echo "Coverage results generated in the file: ${__out_dir_html}/index.html"

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
