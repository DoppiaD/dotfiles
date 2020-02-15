cd "$(dirname "${BASH_SOURCE}")";

echo "Moving dotfiles now..."

for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    if [ "$name" != '\.sh$' ]; then
      echo "-----> Copying your new $target"
      rsync -avh --no-perms "$PWD/$name" "$target"; # this updates the changes from the target and add a . in front of the name
    fi
  fi
done

zsh ~/.zshrc


echo "All finished"


####################################################################################
####################################################################################
# OLD FUNCTIONS
####################################################################################
####################################################################################
#
# function doIt() {
# 	rsync --exclude ".git/" \
# 		--exclude ".DS_Store" \
# 		--exclude ".osx" \
# 		--exclude "bootstrap.sh" \
# 		--exclude "README.md" \
# 		--exclude "LICENSE-MIT.txt" \
# 		-avh --no-perms . ~;
# 	source ~/.bash_profile;
# }
#
# if [ "$1" == "--force" -o "$1" == "-f" ]; then
# 	doIt;
# else
# 	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
# 	echo "";
# 	if [[ $REPLY =~ ^[Yy]$ ]]; then
# 		doIt;
# 	fi;
# fi;
# unset doIt;


# REGULAR="\\033[0;39m"
# YELLOW="\\033[1;33m"
# GREEN="\\033[1;32m"

# # zsh plugins
# CURRENT_DIR=`pwd`
# ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
# mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
# if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
#   echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
#   git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
# fi
# cd "$CURRENT_DIR"
#
# setopt nocasematch
# if [[ ! `uname` =~ "darwin" ]]; then
#   git config --global core.editor "subl -n -w $@ >/dev/null 2>&1"
#   echo 'export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"' >> zshrc
# else
#   git config --global core.editor "'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -n -w"
#   bundler_editor="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
#   echo "export BUNDLER_EDITOR=\"${bundler_editor} -a\"" >> zshrc
# fi
#
# # Sublime Text
# if [[ ! `uname` =~ "darwin" ]]; then
#   SUBL_PATH=~/.config/sublime-text-3
# else
#   SUBL_PATH=~/Library/Application\ Support/Sublime\ Text\ 3
# fi
# mkdir -p $SUBL_PATH/Packages/User $SUBL_PATH/Installed\ Packages
# backup "$SUBL_PATH/Packages/User/Preferences.sublime-settings"
# curl -k https://sublime.wbond.net/Package%20Control.sublime-package > $SUBL_PATH/Installed\ Packages/Package\ Control.sublime-package
# ln -s $PWD/Preferences.sublime-settings $SUBL_PATH/Packages/User/Preferences.sublime-settings
# ln -s $PWD/Package\ Control.sublime-settings $SUBL_PATH/Packages/User/Package\ Control.sublime-settings
# ln -s $PWD/SublimeLinter.sublime-settings $SUBL_PATH/Packages/User/SublimeLinter.sublime-settings

# git pull origin master;
#
# echo "Install Command Line tools?"
# read clt_reply
#
# if [[ clt_reply =~ ^[Yy]$ ]]; then
#   xcode-select --install
# fi;
#
# echo "CLT all done"
#
# echo "Install HomeBrew and Git + Sqlite + PyEnv + Rbenv + other basic formulae?"
# read brew_reply
#
# if [[ brew_reply =~ ^[Yy]$ ]]; then
#   ./brew.sh
# fi;
#
# echo "Brew all done"

# echo "New Mac? Do you want to install basic preferences?"
# read mac_reply
#
# if [[ mac_reply =~ ^[Yy]$ ]]; then
#   source .macos
# fi;
#
# echo "MacOS preferences all done"

# backup() {
#   target=$1
#   if [ -e "$target" ]; then           # Does the config file already exist?
#     if [ ! -L "$target" ]; then       # as a pure file?
#       mv "$target" "$target.backup"   # Then backup it
#       echo "-----> Moved your old $target config file to $target.backup"
#     fi
#   fi
# }
#
# for name in *; do
#   if [ ! -d "$name" ]; then
#     target="$HOME/.$name"
#     # if [[ "$name" != '\.sh$' ]] && [ "$name" != 'README.md' ] && [[ "$name" != '\.sublime-settings$' ]] && [[ ! "$name" =~ '\.macos' ]]; then
#       if [ "$name" != '\.sh$' ]; then
#       # backup $target
#
#       # if [ ! -e "$target" ]; then
#       echo "-----> Copying your new $target"
#         # ln -s "$PWD/$name" "$target" # This symlincs the target
#       rsync -avh --no-perms "$PWD/$name" "$target"; # this updates the changes from the target and add a . in front of the name
#       # fi
#     fi
#   fi
# done
