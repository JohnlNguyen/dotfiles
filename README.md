# Oh my zsh Setup (Fast + Minimal)
<p align="center"><img src="https://s3.amazonaws.com/ohmyzsh/oh-my-zsh-logo.png" alt="Oh My Zsh"></p>

Updated for 2026

## Install Zsh

### Ubuntu

```bash
sudo apt update
sudo apt install zsh curl git
```

Set Zsh as default shell:

```bash
chsh -s $(which zsh)
```

Restart your terminal.

---

## Install Zinit (Plugin Manager)

Zinit is used as a fast and lightweight plugin manager that loads Zsh plugins asynchronously to significantly reduce shell startup time.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

---

## Install Starship Prompt

Starship is used as a fast, cross-shell prompt that provides a minimal, customizable, and performant terminal prompt.

### Ubuntu

```bash
curl -sS https://starship.rs/install.sh | sh
```

### macOS

```bash
brew install starship
```

---

## Configure `.zshrc`

Open `.zshrc`.

```bash
nvim ~/.zshrc
```

Replace contents with:

```bash
# Zinit
export ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
source $ZINIT_HOME/zinit.zsh

# Starship prompt
eval "$(starship init zsh)"
export STARSHIP_LOG=error

# Autocomplete settings
zstyle ':autocomplete:*' verbose no

# Must load first
zinit light marlonrichert/zsh-autocomplete

# Async plugins
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

# History
HISTSIZE=2000
SAVEHIST=2000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# Lazy NVM
export NVM_DIR="$HOME/.nvm"

load-nvm() {
  unset -f node npm npx nvm
  source "$NVM_DIR/nvm.sh"
}

for cmd in node npm npx nvm; do
  eval "$cmd() { load-nvm; $cmd \"\$@\" }"
done

# Completion cache
autoload -Uz compinit
compinit -C

# Compile zshrc
if [[ ! -f ~/.zshrc.zwc || ~/.zshrc -nt ~/.zshrc.zwc ]]; then
  zcompile ~/.zshrc
fi
```

Open `starship.toml`.

```bash
nvim ~/.config/starship.toml
```
Replace contents with:

```bash
# No blank line before prompt
add_newline = false

# Simple prompt layout
format = """
$directory\
$git_branch\
$git_status\
$character
"""

# Directory
[directory]
style = "cyan blue"
truncation_length = 3
truncate_to_repo = true

# Git status (very minimal)
[git_status]
style = "red"
format = '[$all_status$ahead_behind]($style) '

# Prompt symbol
[character]
success_symbol = "[❯](green)"
error_symbol = "[❯](red)"

# Disable the package module, hiding it from the prompt completely
[package]
disabled = true

[nodejs]
disabled = true

[aws]
disabled = true

[gcloud]
disabled = true

[battery]
disabled = true

[time]
disabled = true
```

Reload shell:

```bash
source ~/.zshrc
```

---

## References

* [https://github.com/zdharma-continuum/zinit](https://github.com/zdharma-continuum/zinit)
* [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [https://github.com/marlonrichert/zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
* [https://starship.rs](https://starship.rs)
