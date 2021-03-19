
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
