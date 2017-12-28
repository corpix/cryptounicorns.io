.DEFAULT_GOAL := all

modules_bin := ./node_modules/.bin

DESTDIR ?= $(out)

.PHONY: all
all: build

.PHONY: build
build:
	@true

.PHONY: optimize
optimize: $(modules_bin)
	svgo -i images/logo.plain.svg -o images/logo.svgo.svg

.PHONY: install
install:
	mkdir -p $(DESTDIR)
	cp -f  index.html $(DESTDIR)/
	cp -rf images     $(DESTDIR)/

.PHONY: clean
clean:

$(modules_bin): package.json
	npm install

include nix.mk
