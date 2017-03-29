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

# pyenvのhomeディレクトリ
PYENV_HOME=$HOME/.pyenv

# node_module PATH
#NODE_MODULES_HOME=$HOME/node_modules
NODEBREW_HOME=$HOME/.nodebrew/current/bin

# maven
#M2_HOME=$HOME/tool/apache-maven-3.2.5
M2_HOME=$HOME/tool/apache-maven

# java
#JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# php composer
export COMPOSER_HOME=$HOME/.config/composer

# PATHの設定
PATH=$NODEBREW_HOME:$HOME/local/bin:$RBENV_HOME/bin:$NODE_MODULES_HOME/bin:$M2_HOME/bin:$PYENV_HOME:$JAVA_HOME/bin:$COMPOSER_HOME/vendor/bin:/usr/local/bin:$PATH

# rbenvの初期化
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenvの初期化
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# goの初期化
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=$HOME/.golocal
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# phpbrew
if [ -f "$HOME/.phpbrew/bashrc" ]; then
    source $HOME/.phpbrew/bashrc
fi
