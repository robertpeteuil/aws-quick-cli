PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

help:
	@echo "Please use 'make <command>' where <command> is one of"
	@echo "  install  - to install utilities to ${BINDIR}"
	@echo "uninstall  - to remove utilities from ${BINDIR}"

install:
	@mkdir -p ${BINDIR}
	@cp -f aws-info ${BINDIR}
	@cp -f aws-list ${BINDIR}
	@cp -f aws-ssh ${BINDIR}
	@cp -f aws-start ${BINDIR}
	@cp -f aws-stop ${BINDIR}
	@echo "aws-quick-cli utilities installed to ${BINDIR}"

uninstall:
	@rm -f aws-info ${BINDIR}
	@rm -f aws-list ${BINDIR}
	@rm -f aws-ssh ${BINDIR}
	@rm -f aws-start ${BINDIR}
	@rm -f aws-stop ${BINDIR}
	@echo "aws-quick-cli utilities removed from ${BINDIR}"

.PHONY: help install uninstall
