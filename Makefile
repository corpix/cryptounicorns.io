.DEFAULT_GOAL := all

DESTDIR ?= $(out)

.PHONY: all
all:

.PHONY: install
install:
	cp -f index.html $(DESTDIR)

.PHONY: clean
clean:

include nix.mk
