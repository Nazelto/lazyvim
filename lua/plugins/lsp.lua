-- lua/plugins/lsp.lua
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "haskell-language-server"
      end, opts.ensure_installed)

      if not vim.tbl_contains(opts.ensure_installed, "haskell-debug-adapter") then
        table.insert(opts.ensure_installed, "haskell-debug-adapter")
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = true,
      },
      servers = {
        taplo = { enabled = false },
      },
      setup = {
        hls = function()
          return true
        end,
      },
    },
    init = function()
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

      vim.api.nvim_set_hl(0, "LspInlayHint", {
        fg = "#7f849c",
        bg = "NONE",
        italic = false,
      })
    end,
  },
}
