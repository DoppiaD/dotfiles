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

If error: `/usr/local must be writable` run:

```bash
sudo chown -R $USER:admin /usr/local
brew update
```

Basic packages to install with brew:

```bash
brew install git wget jq openssl rbenv pyenv node sqlite yarn tree
```

Basic apps to install with brew. **Do not open them until finished DotFiles install!!**:

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
Oh-my-zsh will ask to switch to Zsh shell as default: ACCEPT!.

To apply the changes you make you need to either start new shell instance or run:

```bash
$ source ~/.zshrc
```

Install syntax highliting in the terminal:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Step 5: Dotfiles Install

Clone dotfiles from Github and run install script from inside the cloned folder

```bash
# Clone dotfiles
git clone https://github.com/DoppiaD/dotfiles.git

# Install dotfiles
zsh install.sh
```


## Step 6: Sublime Text config

Open twice ST with following command. Each time Wait for all packages to install (they are defined in DotFiles preferences).  

```bash
stt
```

## Step 7: GitHub

Test if Git is properly installed:

```bash
git --version
```
And which git should output /usr/local/bin/git.

Next, we'll define your Git user (should be the same name and email you use for GitHub):

```bash
git config --global user.name "Your Name Here"
git config --global user.email "your_email@youremail.com"
```
They will get added to your .gitconfig file.

To push code to your GitHub repositories, we're going to use the recommended HTTPS method (versus SSH). To prevent git from asking for your username and password every time you push a commit you can cache your credentials by running the following command, as described in the [instructions](https://help.github.com/en/articles/caching-your-github-password-in-git).

```bash
git config --global credential.helper osxkeychain
```
FOR SSH auth or other setup:

- Follow [this guide](https://sourabhbajaj.com/mac-setup/Git/) for config.

AND/OR

- Follow [official guide](https://help.github.com/en/articles/set-up-git) to Set up GitHub terminal login


## Step 8: Ruby

[Official Rbenv guide](https://github.com/rbenv/rbenv#choosing-the-ruby-version)

Command to set up rbenv in the shell, after setup complete close terminal window and reopen new one:
```bash
rbenv init
```

Verify that rbenv is properly set up using this rbenv-doctor script:
```bash
$ curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
```

Pick latest or desired Ruby version to install. Select version (2.6.3 latest at time of writing):
```bash
# list all available versions:
rbenv install -l

# install a Ruby version:
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

### Basic gems install

```bash
gem install hub bundler rspec rubocop rubocop-performance pry pry-byebug colored octokit rake rails
```

## Postgresql

```bash
brew install postgresql
brew services start postgresql
```

To check if it worked:

```bash
psql -d postgres
```

Result of above command should be (To quit type `\q):

```bash
psql (12.1)
Type "help" for help.

postgres=#
```

## Step 9 (Optional): Python

Add pyenv init to your shell to enable shims and autocompletion. Please make sure eval "$(pyenv init -)" is placed toward the end of the shell configuration file since it manipulates PATH during the initialization.

```bash
# If .zshrc is installed through dotfiles install skip this step
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zhsrc
```
Pick latest or desired Python version to install. Select version (2.7.4 latest at time of writing):
```bash
# list all available versions:
pyenv install --list

# install a Ruby version:
pyenv install 2.7.4
```

## Step 10: Install macos dotfile:
Run the following command from the terminal:
```bash
./.macos
```

# ALL DONE..! Now reboot....


## QUICK NOTES
- gaa - git add all
- gcam - git commit all -m
- ggp - git push origin $(current_branch)

Source: https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index


Special thanks to:
- This [MacOs setup guide](https://sourabhbajaj.com/mac-setup/Homebrew/Cask.html) by Sourabh Bajaj
- Mathias dotfiles [mathiasbynens](https://mths.be/dotfiles)
