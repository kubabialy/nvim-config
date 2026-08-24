# Neovim Configuration

This is a lightweight Neovim setup focused on C, C++, Go, and Odin.

## Keymaps

- `<Space>ff`: find files tracked by the current Git repository
- `<Space>fs`: grep all files, including hidden files except `.git`
- `<Space>fb`: search open buffers, ordered by recent use
- `<Space>a`: add the current file to Harpoon
- `<C-e>`: open the Harpoon menu

Language servers are installed through Mason: `clangd`, `gopls`, and `ols`.
