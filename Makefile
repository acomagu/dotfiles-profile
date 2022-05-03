.PHONY: install
install:
	ln -s $(CURDIR)/profile $(HOME)/.profile
	@echo 'You may need to add the following line to your ~/.bash_profile.'
	@echo
	@echo '[[ -f ~/.profile ]] && . ~/.profile'
