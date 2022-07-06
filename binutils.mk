
SRC_NAME       ?= binutils
BUILD_NAME     ?= $(SRC_NAME)
BUILDER_NAME   ?= $(BUILD_NAME).mk

CONFIGURE_NAME ?= $(SRC_DIR)/configure
MAKEFILE_NAME  ?= $(BUILD_DIR)/Makefile
BINARY_NAME    ?= FORCE

include common.mk

# Define body targets.

configure-body:
	cd $(BUILD_DIR) && \
	$(SRC_DIR)/configure \
	  --target=$(CROSS_ARCH) \
	  --prefix=$(CROSS_ROOT) \
	  --disable-werror \
	  --enable-binutils \
	  --enable-gas \
	  --enable-gdb \
	  --enable-gold \
	  --enable-gprof \
	  --enable-ld \
	  --enable-libdecnumber \
	  --enable-libreadline \
	  --enable-sim \
	  --with-expat=yes \
	  --with-lib-path=$(CROSS_ROOT)/lib \
	  --with-sysroot=$(CROSS_ROOT)

build-body:
	$(MAKE) -f $(BUILDER_NAME) $@-default

install-body:
	$(MAKE) -f $(BUILDER_NAME) $@-default

clean-body:
	$(MAKE) -f $(BUILDER_NAME) $@-default

distclean-body:
	$(MAKE) -f $(BUILDER_NAME) $@-default

allclean-body:
	$(MAKE) -f $(BUILDER_NAME) $@-default
