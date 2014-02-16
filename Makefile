#!/usr/bin/make -f

.PHONY: DEFAULT_TARGET
DEFAULT_TARGET: libpng-install

include config.mk
include Makefile.zlib
include Makefile.libpng
