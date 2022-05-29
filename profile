append_path () {
  PATH="${PATH:+$PATH:}$1"
}

_add_path() {
  for path in "$@"; do
    [ -d "$path" ] && append_path "$path"
  done
  true
}

_add_path /home/linuxbrew/.linuxbrew/bin

if command -v brew; then
  export HOMEBREW_ROOT "$(brew --prefix)"

  _add_path "$HOMEBREW_ROOT/opt/coreutils/libexec/gnubin"
  _add_path "$HOMEBREW_ROOT/opt/findutils/libexec/gnubin"
  _add_path "$HOMEBREW_ROOT/opt/gnu-sed/libexec/gnubin"

  NVM_DIR="$(readlink -e "$HOMEBREW_ROOT/opt/nvm")" && export NVM_DIR
  export CFLAGS="$CFLAGS -I$HOMEBREW_ROOT/include"
  export CPATH="$CPATH $HOMEBREW_ROOT/include"
  export HOMEBREW_VERBOSE=1
  export LDFLAGS="$LDFLAGS -L$HOMEBREW_ROOT/lib"
  export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:/usr/local/lib:$HOMEBREW_ROOT/lib"
  export LIBRARY_PATH="$LIBRARY_PATH $HOMEBREW_ROOT/lib"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig:/usr/lib/pkgconfig:$HOMEBREW_ROOT/lib/pkgconfig:$HOMEBREW_ROOT/share/pkgconfig"
fi

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DESKTOP_DIR=$HOME/Desktop
export XDG_DOCUMENTS_DIR=$HOME/Desktop
export XDG_DOWNLOAD_DIR=$HOME/Desktop
export XDG_MUSIC_DIR=$HOME/Desktop
export XDG_PICTURES_DIR=$HOME/Desktop
export XDG_PUBLICSHARE_DIR=$HOME/Desktop
export XDG_TEMPLATES_DIR=$HOME/Desktop
export XDG_VIDEOS_DIR=$HOME/Desktop

MAKEFLAGS="-j $(nproc)" && export MAKEFLAGS
export ANDROID_HOME=$XDG_DATA_HOME/android-sdk
export ANDROID_SDK_HOME=$XDG_DATA_HOME/android-sdk
export ANDROID_SDK_ROOT=$XDG_DATA_HOME/android-sdk
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials
export BASH_ENV=$XDG_CONFIG_HOME/bash/profile # The startup file loaded when Bash is not login nor interactive shell.
export CARGO_HOME=$XDG_DATA_HOME/cargo
export CDK_HOME=$XDG_DATA_HOME/cdk
export DIFFPROG='nvr -d'
export EDITOR='nvr -cc split --remote-wait'
export GHQ_ROOT=$HOME/.local/src
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GOPATH=$HOME/.local
export GOPROXY=https://proxy.golang.org
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export LESSHISTFILE=$XDG_DATA_HOME/less/history
export LESSKEY=$XDG_DATA_HOME/less/keys
export MKSHELL=rc
export MOZ_USE_XINPUT2=1
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer
export MYPYPATH=$XDG_DATA_HOME/mypy
export NODE_PATH=$XDG_DATA_HOME/npm/lib/node_modules
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NVM_PATH=$XDG_DATA_HOME/nvm
export QT_LOGGING_RULES='*.debug=false;qt.qpa.*=false'
export RBENV_ROOT=$XDG_DATA_HOME/rbenv
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export STEAM_LIBRARY_PATH=$XDG_DATA_HOME/Steam
export VST_PATH=$VST_PATH:$XDG_DATA_HOME/vst
export WINEPREFIX=$XDG_DATA_HOME/wine
export Z_DATA=$XDG_DATA_HOME/z/history

_add_path "$HOME/.local/bin"
_add_path "$ANDROID_SDK_HOME/platform-tools"
_add_path "$HOME/.local/opt/android-studio/bin"
_add_path "$XDG_DATA_HOME/npm/bin"
_add_path "$CARGO_HOME/bin"

gem_paths="$XDG_DATA_HOME/gem/ruby/*/bin"
for gem_path in $gem_paths; do
  _add_path "$gem_path"
done

appengine_paths="$HOME/.local/opt/google-cloud-sdk /usr/lib/google-cloud-sdk"
for appengine_path in $appengine_paths; do
  _add_path "$appengine_path/bin"
  _add_path "$appengine_path/platform/google_appengine"
done
