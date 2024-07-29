################################################################################
# Makefile
################################################################################

#===========================================================
# Check
#===========================================================
EXP_INFO := sel4devkit-maaxboard-microkit-docker-dev-env 1 *
CHK_PATH_FILE := /check.mk
ifeq ($(wildcard ${CHK_PATH_FILE}),)
    HALT := TRUE
else
    include ${CHK_PATH_FILE}
endif
ifdef HALT
    $(error Expected Environment Not Found: ${EXP_INFO})
endif

#===========================================================
# Layout
#===========================================================
DEP_PATH := dep
TMP_PATH := tmp
OUT_PATH := out

DEP_MKT_PATH := ${DEP_PATH}/microkit

#===========================================================
# Usage
#===========================================================
.PHONY: usage
usage: 
	@echo "usage: make <target>"
	@echo ""
	@echo "<target> is one off:"
	@echo "all"
	@echo "clean"

#===========================================================
# Target
#===========================================================

# Prefer relative. Only use where absolutely essential.
ROOT_PATH := $(shell dirname $(realpath $(firstword ${MAKEFILE_LIST})))

.PHONY: all
all: ${OUT_PATH}/program.img

${TMP_PATH}:
	mkdir ${TMP_PATH}

${OUT_PATH}:
	mkdir ${OUT_PATH}

${DEP_MKT_PATH}/out/microkit-sdk-1.3.0:
	make -C ${DEP_MKT_PATH} all

${OUT_PATH}/program.img: ${TMP_PATH}/loader.img | ${OUT_PATH}
	cp $< $@

${TMP_PATH}/loader.img: ${DEP_MKT_PATH}/out/microkit-sdk-1.3.0 | ${TMP_PATH}
	make -C ${DEP_MKT_PATH}/out/microkit-sdk-1.3.0/board/maaxboard/example/hello BUILD_DIR=${ROOT_PATH}/${TMP_PATH} MICROKIT_SDK=${ROOT_PATH}/${DEP_MKT_PATH}/out/microkit-sdk-1.3.0 MICROKIT_BOARD=maaxboard MICROKIT_CONFIG=debug

.PHONY: clean
clean:
	make -C ${DEP_MKT_PATH} clean
	rm -rf ${TMP_PATH}
	rm -rf ${OUT_PATH}

################################################################################
# End of file
################################################################################
