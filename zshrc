ZSH=$HOME/.oh-my-zsh

###### HOMEBREW
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

###### OH-MY-ZSH
# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)
# Useful plugins for Rails development with Sublime Text. Syntax Highlighting is always last
plugins=(git gitfast last-working-dir common-aliases sublime history-substring-search osx rbenv ruby zsh-syntax-highlighting)

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

###### RUBY + RAILS

# Load rbenv if installed
# export PATH="${HOME}/.rbenv/bin:${PATH}"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Paths used to run gem commands from command line, e.g. RSPEC
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.5.0/bin:$PATH

eval "$(rbenv init -)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

###### MISCELLANEOUS

# OLD exported PATH
# export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/opt/bin:/usr/local/bin:$PATH"

# Store your own aliases in the ~/.aliases file and load them here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
