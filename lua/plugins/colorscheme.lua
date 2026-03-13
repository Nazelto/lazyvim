-- lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    opts = {
      flavour = "mocha",
      transparent_background = false,
    },
  },
  {
    "aymenhafeez/doric-themes.nvim",
    opts = {
      flavour = "water",
    },
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
