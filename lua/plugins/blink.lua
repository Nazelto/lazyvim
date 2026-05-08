return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts = opts or {}
      opts.snippets = vim.tbl_deep_extend("force", opts.snippets or {}, {
        preset = "luasnip",
      })
      opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          border = "rounded",
          winblend = 20, -- 20 = 80% opacity；如果你真想“80%透明”，改成 80
          scrollbar = false,
          draw = {
            padding = { 0, 1 },
            gap = 1,
            treesitter = { "lsp" },
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
            winblend = 80, -- 同上
            scrollbar = false,
            max_width = 80,
            max_height = 20,
          },
        },
        ghost_text = {
          enabled = true,
        },
      })

      vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#1e2132" })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "#1e2132", fg = "#6b7089" })
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#181b28" })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "#181b28", fg = "#6b7089" })

      -- 选中项本身没法做真正“圆角块”，这是 Neovim 浮窗高亮的限制；
      -- 常见做法是用强对比背景模拟胶囊感。
      vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
        bg = "#2b3046",
        fg = "#c6c8d1",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "#414868" })
      vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { bg = "#1e2132" })

      return opts
    end,
  },
}
