.PHONY: install uninstall reinstall help

help:
	@echo "uw-helper"
	@echo ""
	@echo "Targets:"
	@echo "  make install     Install uw-helper to ~/.local/bin and seed templates to ~/.config"
	@echo "  make uninstall   Remove uw-helper from ~/.local/bin (keeps templates by default)"
	@echo "  make reinstall   Uninstall then install"

install:
	@./install.sh

uninstall:
	@./uninstall.sh

reinstall:
	@./uninstall.sh
	@./install.sh
