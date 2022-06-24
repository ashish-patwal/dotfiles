set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# custom alias
source ~/.config/fish/custom/alias.fish

# aliases
alias ls "exa --icons"
alias la "exa -a"
alias ll "exa -l -g --icons"
alias ld "ll -d"
alias lla "ll -a"
# command -qv nvim && alias vim nvim

set -gx EDITOR nvim

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# Gem
set -gx PATH $HOME/.gem/ruby/3.0.0/bin $PATH

# Global Gem
set -gx PATH /root/.local/share/gem/ruby/3.0.0 $PATH

# lua-language-server
set -gx PATH $HOME/build_packages/lua-language-server/bin $PATH

# Android SDK
set -g ANDROID_HOME $HOME/Android/Sdk
set -g ANDROID_SDK_ROOT $HOME/Android/Sdk
set -gx PATH $ANDROID_SDK_ROOT/emulator $PATH
set -gx PATH $ANDROID_SDK_ROOT/platform-tools $PATH

# luarocks PATH
eval (luarocks path --bin)
# set -g LUA_PATH /home/lucifer/.luarocks/share/lua/5.4 /usr/share/lua/5.4/\?.lua /usr/share/lua/5.4/\?/init.lua /usr/lib/lua/5.4/\?.lua /usr/lib/lua/5.4/\?/init.lua ./\?.lua ./\?/init.lua /home/lucifer/.luarocks/share/lua/5.4/\?.lua /home/lucifer/.luarocks/share/lua/5.4/\?/init.lua
# set -g LUA_CPATH /home/lucifer/.luarocks/share/lua/5.4 /usr/lib/lua/5.4/\?.so /usr/lib/lua/5.4/loadall.so ./\?.so /home/lucifer/.luarocks/lib/lua/5.4/\?.so
# set -gx PATH $LUA_PATH $LUA_CPATH $PATH

# Master Path
set -gx PATH /opt/pyenv/plugins/pyenv-virtualenv/shims /home/lucifer/.pyenv/shims /home/lucifer/.pyenv/bin /home/lucifer/.emacs.d/bin /home/lucifer/.npm-global/bin /home/lucifer/bin /usr/local/bin /home/lucifer/go/bin node_modules/.bin /home/lucifer/.local/bin /home/lucifer/bin bin /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/lib/jvm/default/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /var/lib/snapd/snap/bin /home/lucifer/.local/bin /home/lucifer/.npm-local/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
