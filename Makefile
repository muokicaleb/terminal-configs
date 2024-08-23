# Variables
FILES := .p10k.zsh .zshplugins .zshrc wezterm.lua .aliases
WEZTERM_CONFIG := ~/.config/wezterm/wezterm.lua

# Targets
.PHONY: all clean backup restore

all: backup restore

clean:
	rm -f $(FILES)

backup: clean
	cp ~/.p10k.zsh .
	cp ~/.zshplugins .
	cp ~/.zshrc .
	cp $(WEZTERM_CONFIG) wezterm.lua
	cp ~/.aliases .

restore:
	cp wezterm.lua $(WEZTERM_CONFIG)
	cp .p10k.zsh ~/.p10k.zsh
	cp .zshplugins ~/.zshplugins
	cp .zshrc ~/.zshrc
	cp .aliases ~/.aliases
