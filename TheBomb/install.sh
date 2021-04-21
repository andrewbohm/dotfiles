
#!/usr/bin/env bash
echo "Creating Dirs"
mkdir -p ~/.config/nvim-nightly/plugin
mkdir -p ~/.config/nvim-nightly/after/plugin
mkdir -p ~/.config/nvim-nightly/lua

echo "Linking files"
# link wholesale
# for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
for f in `find * -regex ".*\.vim$\|.*\.lua$"`; do
    echo "TEST $f"
    rm -rf ~/.config/nvim-nightly/$f
    ln -s ~/dotfiles/TheBomb/$f ~/.config/nvim-nightly/$f
done

read -p "Do you want to install LS_COLORS for zsh: (y/n) " -n 1 -r
echo "More info: https://github.com/trapd00r/LS_COLORS"
echo "Installing LS_COLORS"
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    mkdir /tmp/LS_COLORS && curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1
    ( cd /tmp/LS_COLORS && sh install.sh )
fi
