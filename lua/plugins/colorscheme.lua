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
    priority = 1000,
  },
  {
    "nordtheme/vim",
    -- transparent也可以用类型的方法
    config = function()
      vim.cmd.colorscheme("nord")
      -- 修复浮动窗口背景色
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatTitle", { bg = "NONE" })
    end,
  },
  {
    "cocopon/iceberg.vim",
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "doric-water",
    },
  },
}
