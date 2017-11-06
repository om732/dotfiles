# 環境変数を重複して読み込まない
typeset -U PATH CDPATH FPATH MANPATH

# C-sの無効化
#stty stop undef

# TERMの変更
export TERM=screen-256color

# カラー設定の変更
if [ -f ~/.dircolors ]; then
    if type dircolors > /dev/null 2>&1; then
        eval $(dircolors ~/.dircolors)
    elif type gdircolors > /dev/null 2>&1; then
        eval $(gdircolors ~/.dircolors)
    fi
fi

# lsの色も変更
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# ライブラリのパスを通す
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH

# nvim
export XDG_CONFIG_HOME=~/.config

# rbenvのhomeディレクトリ
RBENV_HOME=$HOME/.rbenv
if [ -e "$RBENV_HOME" ]; then
    PATH=$RBENV_HOME/bin:$PATH
fi

# pyenvのhomeディレクトリ
PYENV_HOME=$HOME/.pyenv
if [ -e "$PYENV_HOME" ]; then
    PATH=$PYENV_HOME/bin:$PATH
fi

# nodebrew PATH
NODEBREW_HOME=$HOME/.nodebrew/current
if [ -e "$NODEBREW_HOME" ]; then
    PATH=$NODEBREW_HOME/bin:$PATH
fi

# maven
M2_HOME=$HOME/tool/apache-maven
if [ -e "$M2_HOME" ]; then
    PATH=$M2_HOME/bin:$PATH
fi

# java
export JAVA_HOME=$(/usr/libexec/java_home)
if [ -e "$JAVA_HOME" ]; then
    PATH=$JAVA_HOME/bin:$PATH
fi

# php composer
export COMPOSER_HOME=$HOME/.config/composer

export ICU4U_HOME=/usr/local/opt/icu4c
if [ -e "$ICU4U_HOME" ]; then
    PATH=$ICU4U_HOME/bin:$PATH
fi

export LIBXML2_HOME=/usr/local/opt/libxml2
if [ -e "$LIBXML2_HOME" ]; then
    PATH=$LIBXML2_HOME/bin:$PATH
fi

# goの初期化
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/go
    PATH=$GOPATH/bin:$PATH
fi

# GOOGLE CLOUD SDK
GOOGLE_CLOUD_SDK_HOME=~/.google-cloud-sdk
if [ -e "$GOOGLE_CLOUD_SDK_HOME" ]; then
    PATH=$GOOGLE_CLOUD_SDK_HOME/bin:$PATH
fi
