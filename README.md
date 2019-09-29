# New Mac setup guide with Dotfiles


## Step 1: Command Line Tools

```bash
xcode-select --install
```

## Step 2: Homebrew

Install [Homebrew](http://brew.sh/) Package Manager.

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then update:

```bash
brew update
```

If error: `/usr/local must be writable` run:

```bash
sudo chown -R $USER:admin /usr/local
brew update
```

Basic packages to install with brew:

```bash
brew install git wget jq openssl rbenv ruby-build pyenv node sqlite yarn tree
```

Basic apps to install with brew. Do not open them until finished DotFiles install!!:

```bash
brew cask install dropbox sublime-text transmission google-chrome firefox vlc grandperspective
```

Optional:
```bash
brew cask install wireshark tor-browser alfred
```

Cleanup brew:

```bash
brew cleanup
```

## Step 3: iTerm2

iTerm2

```bash
brew cask install iterm2
```

### Colors and Font Settings

Here are some suggested settings you can change or set, they are all optional.

- Set hot-key to open and close the terminal to `command + option + i`
- Go to `Preferences -> profiles -> Default -> Terminal` -> Check silence bell to disable the terminal session from making any sound
- Select Solarized Dark as preferred color scheme under `Preferences -> Profile`
- Change the cursor text and cursor color to yellow make it more visible
- Change the font to 14pt Source Code Pro Lite. Source Code Pro can be downloaded using Homebrew:
  ```bash
  brew cask install font-source-code-pro
  ```

### Setup iTerm to work with MacOS shortcuts ⌘←, ⌘→ and ⌥←, ⌥→

Open up iTerm2 `Preferences (⌘ + ,) -> Profiles -> Keys ->` Click on + icon (add new Keyboard shortcut).

| shortcut  | action  | Esc+  |
|---|---|---|
| ⌘←  |  Send Escape Sequence | OH  |
| ⌘→  |  Send Escape Sequence |  OF |
| ⌥←  |  Send Escape Sequence |  b |
| ⌥→  |  Send Escape Sequence |  f |


## Step 4: Oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

To apply the changes you make you need to either start new shell instance or run:

```bash
$ source ~/.zshrc
```


## Step 5: GitHub

Follow [this guide](https://sourabhbajaj.com/mac-setup/Git/) for config.

Follow [official guide](https://help.github.com/en/articles/set-up-git) to Set up GitHub terminal login


## Step 6: Dotfiles Install

Clone dotfiles from github and run install script


```bash
zsh install.sh
```

OPTIONAL: Run the git installer:

```bash
zsh git_setup.sh
```

### Step 7: Sublime Text config

Open twice ST with following command. Each time Wait for all packages to install (they are defined in DotFiles preferences).  

```bash
stt
```

## Step 8: Ruby

List all available Ruby versions:
```bash
rbenv versions
```

Pick latest or desired Ruby version to install:
```bash
rbenv install 2.6.3
```
Set global Ruby version:

```bash
rbenv global 2.6.3
```
Check Ruby version:
```bash
ruby -v
```

### Installing some gems

Basic Gems:

```bash
gem install hub bundler rspec rubocop rubocop-performance pry pry-byebug  colored octokit rake
```


Special thanks to this [MacOs setup guide](https://sourabhbajaj.com/mac-setup/Homebrew/Cask.html)
