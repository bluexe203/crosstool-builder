
SRC_NAME       ?= $(GCC_VERSION)
BUILD_NAME     ?= $(SRC_NAME)-shared-glibc
BUILDER_NAME   ?= gcc-shared-glibc.mk

CONFIGURE_NAME ?= $(SRC_DIR)/configure
MAKEFILE_NAME  ?= $(BUILD_DIR)/Makefile
BINARY_NAME    ?= FORCE

include common.mk

# Define body targets.

configure-body:
	cd $(BUILD_DIR) && \
	$(SRC_DIR)/configure \
	  --target=$(CROSS_ARCH) \
	  --prefix=$(PREFIX) \
	  --enable-languages=c,c++ \
	  --enable-libatomic \
	  --disable-libitm \
	  --enable-libgomp \
	  --enable-libmudflap \
	  --enable-libquadmath \
	  --disable-libsanitizer \
	  --enable-libssp \
	  --enable-libstdcxx-pch \
	  --enable-long-long \
	  --enable-lto \
	  --disable-multiarch \
	  --disable-multilib \
	  --enable-nls \
	  --enable-plugin \
	  --enable-shared \
	  --enable-threads=posix \
	  --enable-__cxa_atexit \
	  --with-arch=armv7-a --with-fpu=vfp --with-float=hard \
	  --with-sysroot=$(SYSROOT)

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
