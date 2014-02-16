#!/usr/bin/make -f

.PHONY: DEFAULT_TARGET
DEFAULT_TARGET: zlib-install

include config.mk
include Makefile.zlib
