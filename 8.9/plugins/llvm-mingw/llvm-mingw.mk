# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := llvm-mingw
$(PKG)_WEBSITE  := https://github.com/mstorsjo/llvm-mingw
$(PKG)_DESCR    := An LLVM/Clang/LLD based mingw-w64 toolchain
$(PKG)_IGNORE   :=
# https://api.github.com/repos/mstorsjo/llvm-mingw/tarball/26e56ed5f6f4bc918884b9303a55cfa1dc92bba8
$(PKG)_VERSION  := 26e56ed
$(PKG)_CHECKSUM := 8355ed7a9dbd1c16b6e45f28b5efdd3f52c851451cfa241ddb1176cec7991ab1
$(PKG)_PATCHES  := $(realpath $(sort $(wildcard $(dir $(lastword $(MAKEFILE_LIST)))/patches/llvm-mingw-[0-9]*.patch)))
$(PKG)_GH_CONF  := mstorsjo/llvm-mingw/branches/master
$(PKG)_DEPS     := llvm mingw-w64

# The minimum Windows version we support is Windows 7, as libc++ uses
# TryAcquireSRWLockExclusive which didn't exist until Windows 7. See:
# https://github.com/mstorsjo/llvm-mingw/commit/dcf34a9a35ee3d490a85bdec02999cf96615d406
# https://github.com/mstorsjo/llvm-mingw/blob/master/build-mingw-w64.sh#L5-L6
# Install the headers in $(PREFIX)/$(TARGET)/mingw since
# we need to distribute the /include and /lib directories
# Note: Building with --with-default-msvcrt=ucrt breaks 
# compatibility with the prebuilt Rust binaries that 
# is built in msvcrt mode.
define $(PKG)_BUILD_mingw-w64
    # install the usual wrappers
    $($(PKG)_PRE_BUILD)

    # install mingw-w64 headers
    $(call PREPARE_PKG_SOURCE,mingw-w64,$(BUILD_DIR))
    mkdir '$(BUILD_DIR).headers'
    cd '$(BUILD_DIR).headers' && '$(BUILD_DIR)/$(mingw-w64_SUBDIR)/mingw-w64-headers/configure' \
        --host='$(TARGET)' \
        --prefix='$(PREFIX)/$(TARGET)/mingw' \
        --enable-idl \
        --with-default-msvcrt=msvcrt \
        --with-default-win32-winnt=0x601 \
        $(mingw-w64-headers_CONFIGURE_OPTS)
    $(MAKE) -C '$(BUILD_DIR).headers' install

    # build mingw-w64-crt
    mkdir '$(BUILD_DIR).crt'
    cd '$(BUILD_DIR).crt' && '$(BUILD_DIR)/$(mingw-w64_SUBDIR)/mingw-w64-crt/configure' \
        --host='$(TARGET)' \
        --prefix='$(PREFIX)/$(TARGET)/mingw' \
        --with-default-msvcrt=msvcrt \
        @mingw-crt-config-opts@
    $(MAKE) -C '$(BUILD_DIR).crt' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR).crt' -j 1 $(INSTALL_STRIP_TOOLCHAIN)
endef

define $(PKG)_PRE_BUILD
    $(foreach EXEC, clang-target dlltool ld objdump, \
        $(SED) -i -e 's|^DEFAULT_TARGET=.*|DEFAULT_TARGET=$(TARGET)|' \
                  -e 's|^DIR=.*|DIR="$(PREFIX)/$(TARGET)/bin"|' '$(SOURCE_DIR)/wrappers/$(EXEC)-wrapper.sh'; \
        $(INSTALL) -m755 '$(SOURCE_DIR)/wrappers/$(EXEC)-wrapper.sh' '$(PREFIX)/$(TARGET)/bin';)

    $(foreach EXEC, clang clang++ gcc g++ cc c99 c11 c++, \
        ln -sf '$(PREFIX)/$(TARGET)/bin/clang-target-wrapper.sh' '$(PREFIX)/bin/$(TARGET)-$(EXEC)';)

    $(BUILD_CC) $(SOURCE_DIR)/wrappers/windres-wrapper.c \
        -o '$(PREFIX)/bin/$(TARGET)-windres' \
        -O2 -Wl,-s -DLLVM_RC="\"rc\"" -DLLVM_CVTRES="\"cvtres\"" -DDEFAULT_TARGET="\"$(TARGET)\""

    $(foreach EXEC, dlltool ld objdump, \
        ln -sf '$(PREFIX)/$(TARGET)/bin/$(EXEC)-wrapper.sh' '$(PREFIX)/bin/$(TARGET)-$(EXEC)';)
endef

$(PKG)_BUILD_x86_64-w64-mingw32 = $(subst @mingw-crt-config-opts@,--disable-lib32 --enable-lib64,$($(PKG)_BUILD_mingw-w64))
$(PKG)_BUILD_i686-w64-mingw32   = $(subst @mingw-crt-config-opts@,--enable-lib32 --disable-lib64,$($(PKG)_BUILD_mingw-w64))
$(PKG)_BUILD_armv7-w64-mingw32   = $(subst @mingw-crt-config-opts@,--disable-lib32 --disable-lib64 --enable-libarm32,$($(PKG)_BUILD_mingw-w64))

# TODO: This target needs to be tested
$(PKG)_BUILD_aarch64-w64-mingw32 = $(subst @mingw-crt-config-opts@,--disable-lib32 --disable-lib64 --enable-libarm64,$($(PKG)_BUILD_mingw-w64))
