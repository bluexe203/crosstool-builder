
SRC_NAME       ?= $(GCC_VERSION)
BUILD_NAME     ?= $(SRC_NAME)-static
BUILDER_NAME   ?= gcc-static.mk

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
	  --enable-languages=c \
	  --disable-libatomic \
	  --disable-libitm \
	  --disable-libgomp \
	  --disable-libmudflap \
	  --disable-libquadmath \
	  --disable-libsanitizer \
	  --disable-libssp \
	  --disable-libstdcxx-pch \
	  --enable-long-long \
	  --enable-lto \
	  --disable-multiarch \
	  --disable-multilib \
	  --disable-nls \
	  --disable-plugin \
	  --disable-shared \
	  --disable-threads \
	  --enable-__cxa_atexit \
	  --without-headers \
	  --with-local-prefix=$(SYSROOT) \
	  --with-newlib \
	  --with-sysroot=$(SYSROOT) \
	  --with-arch=armv7-a --with-fpu=neon-vfpv4 --with-float=hard \
	  --with-pkgversion="testtest"

build-body:
	$(MAKE) -C $(BUILD_DIR) all-gcc
	$(MAKE) -C $(BUILD_DIR) all-target-libgcc

install-body:
	$(MAKE) -C $(BUILD_DIR) install-gcc
	$(MAKE) -C $(BUILD_DIR) install-target-libgcc

clean-body:
	$(MAKE) -f $(BUILDER_NAME) $@-default

distclean-body:
	$(MAKE) -f $(BUILDER_NAME) $@-default

allclean-body:
	$(MAKE) -f $(BUILDER_NAME) $@-default
