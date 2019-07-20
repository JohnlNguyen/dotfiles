OS ?= $(shell uname)

install: install-brew install-zsh install-dotfiles

install-brew:
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-zsh:
	@brew install zsh zsh-completions
	@chsh -s /bin/zsh
	@sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

install-dotfiles:
	@sh ./setup.sh

test:
	@docker build -f Dockerfile -t dotfiles/test:latest .
	@docker run -it dotfiles/test:latest

show-os:
	@echo "Current OS is (${OS})"

verify:
	@echo "OK!"