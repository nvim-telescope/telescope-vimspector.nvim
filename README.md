# telescope-vimspector.nvim

Integration for [vimspector](https://github.com/puremourning/vimspector) with
[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

# Demo

![Demo](./demo.gif)

# Installation

```viml
Plug 'puremourning/vimspector'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-vimspector.nvim'
```

# Usage

```lua
-- Fuzzy find over vimspector configurations
require('telescope').extensions.vimspector.configurations()
```
