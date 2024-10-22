# Variables
FILES := .p10k.zsh .zshplugins .zshrc wezterm.lua .aliases
WEZTERM_CONFIG := ~/.config/wezterm/wezterm.lua

# Targets
.PHONY: all clean backup restore

all: install restore

clean:
	rm -f $(FILES)

install:
	@brew install --cask wezterm
	@git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
	@brew install eza zsh-completions zsh-syntax-highlighting zsh-autosuggestions fzf zoxide neovim
	@git clone https://github.com/LunarVim/Neovim-from-scratch.git ~/.config/nvim

backup: clean
	cp ~/.p10k.zsh .
	cp ~/.zshplugins .
	cp ~/.zshrc .
	cp $(WEZTERM_CONFIG) wezterm.lua
	cp ~/.aliases .
	git add . && git commit -m "Backup" && git push

restore:
	cp wezterm.lua $(WEZTERM_CONFIG)
	cp .p10k.zsh ~/.p10k.zsh
	cp .zshplugins ~/.zshplugins
	cp .zshrc ~/.zshrc
	cp .aliases ~/.aliases
	zsh
