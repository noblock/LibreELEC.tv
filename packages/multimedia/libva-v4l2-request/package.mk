# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018 Team LibreELEC (https://libreelec.tv)

PKG_NAME="libva-v4l2-request"
PKG_VERSION="e62c2d1c8e13774a758a093f605f2326ccb3a011"
PKG_ARCH="any"
PKG_LICENSE="LGPL+MIT"
PKG_SITE="https://www.bootlin.com"
PKG_URL="https://github.com/bootlin/libva-v4l2-request/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="libva-v4l2-request-$PKG_VERSION*"
PKG_LONGDESC="libva-v4l2-request"
PKG_TOOLCHAIN="autotools"
PKG_DEPENDS_TARGET="toolchain libdrm libva"

PKG_CONFIGURE_OPTS_TARGET=""
