PROG ?= fzfgit
PREFIX ?= /usr/local
DESTDIR ?= $(PREFIX)/bin
# DESTDIR ?= $(PREFIX)/fzfgit
# SHELL := /bin/zsh
# export PATH=$(DESTDIR):$$PATH; echo $$PATH;

all:
	@echo "To install $(PROG) scripts run \"make install\"."
	@echo "The $(PROG) scripts require some other packages:"
	@echo "         brew install fzf bat delta"

install:
	@install -vd "$(DESTDIR)/"
	@install -vm755 fadd "$(DESTDIR)/fadd"
	@echo "fadd installed successfully"
	@install -vm755 fbackup "$(DESTDIR)/fbackup"
	@echo "fbackup installed successfully"
	@install -vm755 fcheckout "$(DESTDIR)/fcheckout"
	@echo "fcheckout installed successfully"
	@install -vm755 fedit "$(DESTDIR)/fedit"
	@echo "fedit installed successfully"
	@install -vm755 flog "$(DESTDIR)/flog"
	@echo "flog installed successfully"
	@install -vm755 freset "$(DESTDIR)/freset"
	@echo "freset installed successfully"
	@install -vm755 fstash "$(DESTDIR)/fstash"
	@echo "fstash installed successfully"
	@install -vm755 fstat "$(DESTDIR)/fstat"
	@echo "fstat installed successfully"
	@install -vm755 funtrack "$(DESTDIR)/funtrack"
	@echo "funtrack installed successfully"
	@install -vm755 fzgrep "$(DESTDIR)/fzgrep"
	@echo "fzgrep installed successfully"
	@install -vm755 fgit_helper "$(DESTDIR)/fgit_helper"
	@echo "fgit_helper installed successfully"
	@install -vm755 preview.sh "$(DESTDIR)/preview.sh"
	@echo "preview.sh installed successfully"
	@echo
	@echo "fzfgit successfully completed installation "
	@echo

uninstall:
	@rm -vrf \
		"$(DESTDIR)/fadd" \
		"$(DESTDIR)/fcheckout" \
		"$(DESTDIR)/fedit" \
		"$(DESTDIR)/flog" \
		"$(DESTDIR)/freset" \
		"$(DESTDIR)/freset" \
		"$(DESTDIR)/fstash" \
		"$(DESTDIR)/fstat" \
		"$(DESTDIR)/funtrack" \
		"$(DESTDIR)/fzgrep" \
		"$(DESTDIR)/fgit_helper" \
		"$(DESTDIR)/preview.sh"
