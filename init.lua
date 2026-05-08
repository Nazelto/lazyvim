-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h12"
  vim.g.neovide_opacity = 0.92
  vim.g.neovide_normal_opacity = 1.0
  vim.o.winblend = 12
  vim.o.pumblend = 12

  vim.g.neovide_floating_corner_radius = 0.2
  vim.g.neovide_normal_opacity = 1.0
end
