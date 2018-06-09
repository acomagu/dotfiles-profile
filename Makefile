.PHONY: install
install:
ifeq (,$(wildcard $(HOME)/.profile))
	cat profile >> $(HOME)/.profile
else
	ln -s $(CURDIR)/profile $(HOME)/.profile
endif
