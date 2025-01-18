# Variables
FILES := .p10k.zsh .zshplugins .zshrc wezterm.lua .aliases
WEZTERM_CONFIG := ~/.config/wezterm/wezterm.lua

# Targets
.PHONY: all clean backup restore

all: install restore

clean:
	rm -f $(FILES)

install:
	@brew install --cask wezterm font-meslo-lg-nerd-font
	@mkdir -p ~/.config/wezterm/
	@git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k2
	@brew install eza zsh-completions zsh-syntax-highlighting zsh-autosuggestions fzf zoxide neovim direnv
	@mv ~/.config/nvim{,.bak}
	@git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git
	@cp ./toggleterm.lua ~/.config/nvim/lua/plugins/toggleterm.lua 

backup: clean
	cp ~/.p10k.zsh .
	cp ~/.zshplugins .
	cp ~/.zshrc .
	cp ~/.config/wezterm/*.lua .
	cp ~/.aliases .
	git add . && git commit -m "Backup" && git push

restore: 
	cp *.lua cp ~/.config/wezterm/
	cp .p10k.zsh ~/.p10k.zsh
	cp .zshplugins ~/.zshplugins
	cp .zshrc ~/.zshrc
	cp .aliases ~/.aliases
	zsh
