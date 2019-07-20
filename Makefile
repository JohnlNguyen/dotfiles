OS ?= $(shell uname)

install: install-brew install-zsh install-dotfiles install-iterm install-iterm-theme install-sublime

install-brew:
	@curl https://raw.githubusercontent.com/Homebrew/install/master/install > brew-install
	@ruby brew-install
	@rm brew-install

install-zsh:
	@brew install zsh zsh-completions
	@chsh -s /bin/zsh
	@sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

install-dotfiles:
	@sh ./setup.sh

install-iterm-theme:
	@open ./OneDark.itermcolors

install-iterm:
	@curl https://iterm2.com/downloads/stable/iTerm2-3_2_9.zip > iTerm2-3_2_9.zip
	@unzip iTerm2-3_2_9.zip
	@mv iTerm.app /Applications/
	@rm iTerm2-3_2_9.zip

install-sublime:
	@curl https://download.sublimetext.com/Sublime%20Text%20Build%203207.dmg > SublimeText.dmg
	@ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
	@rm SublimeText.dmg

test:
	@docker build -f Dockerfile -t dotfiles/test:latest .
	@docker run -it dotfiles/test:latest

show-os:
	@echo "Current OS is (${OS})"
