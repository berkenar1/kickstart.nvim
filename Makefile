.PHONY: help install check sync clean uninstall

help:
	@echo "kickstart.nvim-FreeBSD Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  make install    - Install FreeBSD dependencies"
	@echo "  make check      - Check if all dependencies are installed"
	@echo "  make sync       - Start Neovim and sync plugins"
	@echo "  make clean      - Clean Neovim cache and swap files"
	@echo "  make uninstall  - Remove Neovim configuration"
	@echo "  make help       - Show this help message"

install:
	@echo "Installing FreeBSD dependencies..."
	sudo sh install-freebsd.sh

check:
	@echo "Checking dependencies..."
	sh check-freebsd.sh

sync:
	@echo "Starting Neovim and syncing plugins..."
	nvim +Lazy sync +q

clean:
	@echo "Cleaning Neovim cache..."
	rm -rf ~/.local/share/nvim/swap
	rm -rf ~/.local/state/nvim
	@echo "Clean complete"

uninstall:
	@echo "Uninstalling Neovim configuration..."
	sh uninstall-freebsd.sh

.DEFAULT_GOAL := help
