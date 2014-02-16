#!/usr/bin/make -f

.PHONY: DEFAULT_TARGET
DEFAULT_TARGET: libjpeg-install

include config.mk
include Makefile.zlib
include Makefile.libpng
include Makefile.libjpeg
