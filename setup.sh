#!/bin/bash

# Zshのインストール
sudo apt update && sudo apt install -y zsh

# Oh My Zshのインストール
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Powerlevel10kのクローン（テーマファイルはクローンし直す）
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
fi

# 設定ファイルのコピー
cp ./zshrc ~/.zshrc
cp ./p10k.zsh ~/.p10k.zsh

# Zshをデフォルトシェルに設定
chsh -s $(which zsh)

echo "ZshとPowerlevel10kの設定が完了しました。新しいシェルを起動するか、'exec zsh'を実行してください。"
