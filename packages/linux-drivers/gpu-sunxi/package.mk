# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gpu-sunxi"
PKG_VERSION="r9p0-01rel0"
PKG_SHA256="7a67127341d17640c1fff5dad80258fb2a37c8a2121b81525fe2327e4532ce2b"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SITE="https://developer.arm.com/products/software/mali-drivers/utgard-kernel"
PKG_URL="https://developer.arm.com/-/media/Files/downloads/mali-drivers/kernel/mali-utgard-gpu/DX910-SW-99002-$PKG_VERSION.tgz"
PKG_SOURCE_DIR="DX910-SW-99002-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="gpu-sunxi: Linux drivers for Mali GPUs found in Allwinner SoCs"
PKG_TOOLCHAIN="manual"
PKG_IS_KERNEL_PKG="yes"

PKG_DRIVER_DIR=$PKG_BUILD/driver/src/devicedrv/mali/

make_target() {
  if [ "${DEVICE}" = "H5" ]; then
    kernel_make -C $(kernel_path) M=$PKG_DRIVER_DIR MALI_PLATFORM_FILES=platform/sunxi/sunxi.c \
      EXTRA_CFLAGS="-DCONFIG_MALI_DVFS -DMALI_FAKE_PLATFORM_DEVICE=1 -DCONFIG_MALI450" \
      CONFIG_MALI400=m CONFIG_MALI_DVFS=y CONFIG_MALI400_DEBUG=y USING_UMP=0 BUILD=release USING_PROFILING=0 MALI_PLATFORM=sunxi USING_DVFS=1 USING_DEVFREQ=0
  else
    kernel_make -C $(kernel_path) M=$PKG_DRIVER_DIR MALI_PLATFORM_FILES=platform/sunxi/sunxi.c \
      EXTRA_CFLAGS="-DCONFIG_MALI_DVFS -DMALI_FAKE_PLATFORM_DEVICE=1 -DCONFIG_MALI_DMA_BUF_MAP_ON_ATTACH" \
      CONFIG_MALI400=m CONFIG_MALI_DVFS=y CONFIG_MALI400_DEBUG=y
  fi
}

makeinstall_target() {
  kernel_make -C $(kernel_path) M=$PKG_DRIVER_DIR \
    INSTALL_MOD_PATH=$INSTALL/$(get_kernel_overlay_dir) INSTALL_MOD_STRIP=1 DEPMOD=: \
    modules_install
}
