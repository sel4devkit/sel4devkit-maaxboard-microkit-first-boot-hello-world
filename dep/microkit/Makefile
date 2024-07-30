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
TMP_PATH := tmp
OUT_PATH := out

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
.PHONY: all
all: ${OUT_PATH}/microkit-sdk-1.3.0

${TMP_PATH}:
	mkdir ${TMP_PATH}

${OUT_PATH}:
	mkdir ${OUT_PATH}

${DEP_SL4_PATH}/out/sel4:
	make -C ${DEP_SL4_PATH} all

${OUT_PATH}/microkit-sdk-1.3.0: ${TMP_PATH}/sel4devkit-maaxboard-microkit/out/microkit-sdk-1.3.0 | ${OUT_PATH}
	cp -r $< $@

${TMP_PATH}/sel4devkit-maaxboard-microkit/out/microkit-sdk-1.3.0: | ${TMP_PATH}
	# Acquire.
	git -C ${TMP_PATH} clone --branch "main" "git@github.com:sel4devkit/sel4devkit-maaxboard-microkit.git" sel4devkit-maaxboard-microkit
	# Build.
	make -C ${TMP_PATH}/sel4devkit-maaxboard-microkit all
	
.PHONY: clean
clean:
	rm -rf ${TMP_PATH}
	rm -rf ${OUT_PATH}

################################################################################
# End of file
################################################################################
