-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = true,
      },
    },
    init = function()
      -- 设置 inlay hints 背景透明
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "LspInlayHint", {
            fg = "#7f849c",
            bg = "NONE",
            italic = false,
          })
        end,
      })
      -- 立即应用（针对当前 colorscheme）
      vim.api.nvim_set_hl(0, "LspInlayHint", {
        fg = "#7f849c",
        bg = "NONE",
        italic = false,
      })
    end,
  },
}
