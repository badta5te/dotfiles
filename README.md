# dotfiles

Restored on a new Mac via [GNU Stow](https://www.gnu.org/software/stow/): this
repo is cloned to `~/dotfiles` and stowed into `~`, so `~/.zshrc`,
`~/.config/nvim`, etc. end up as symlinks back into the repo.

## Fresh machine setup

1. Xcode Command Line Tools: `xcode-select --install`
2. Homebrew: https://brew.sh
3. Clone this repo:
   ```
   git clone git@github.com:badta5te/dotfiles.git ~/dotfiles
   ```
4. Install everything in `Brewfile` (formulae, casks, VS Code extensions):
   ```
   cd ~/dotfiles && brew bundle install
   ```
5. oh-my-zsh (not managed by Homebrew):
   ```
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   git clone https://github.com/reobin/typewritten.git ~/.oh-my-zsh/custom/themes/typewritten
   git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
   ```
6. Symlink dotfiles into `$HOME` (existing real files/dirs at the target,
   e.g. `~/.config`, are left alone — stow only links what doesn't already
   exist there):
   ```
   cd ~/dotfiles && stow -t ~ .
   ```
7. Open a new terminal (picks up `.zshrc`) and `nvim` (Lazy will sync
   plugins on first launch).

## Manual steps (can't be scripted)

- **Karabiner-Elements**: grant Input Monitoring / Accessibility in System
  Settings, then it picks up `~/.config/karabiner/karabiner.json` on its own.
- **1Password**: sign in; `op` CLI auth follows from the desktop app.
- Sign in to whatever else needs it: GitHub CLI (`gh auth login`), Heroku, etc.

## Updating the Brewfile snapshot

After installing/removing packages, refresh the tracked list with:
```
cd ~/dotfiles && brew bundle dump --force
```
