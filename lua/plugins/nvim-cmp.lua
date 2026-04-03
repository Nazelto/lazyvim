return {
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function(_, opts)
      opts = opts or {}
      opts.panel = vim.tbl_extend("force", opts.panel or {}, {
        enabled = false,
      })
      opts.suggestion = vim.tbl_extend("force", opts.suggestion or {}, {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        keymap = vim.tbl_extend("force", (opts.suggestion and opts.suggestion.keymap) or {}, {
          accept = "<Tab>",
        }),
      })
      return opts
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    optional = true,
    enabled = false,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts = opts or {}

      -- 不用 nvim 的伪透明，直接让 FVim 亚克力接管
      vim.opt.pumblend = 0
      vim.opt.winblend = 0

      -- 亚克力友好的窗口高亮：
      -- Pmenu / NormalFloat / FloatBorder 的背景需要在 colorscheme 里设成 NONE
      local window_config = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          side_padding = 1,
          col_offset = -3,
          scrollbar = false,
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          max_width = 80,
          max_height = 20,
          scrollbar = false,
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None",
        }),
      }

      -- 主编辑器窗口样式
      opts.window = vim.tbl_deep_extend("force", opts.window or {}, window_config)

      -- 命令行 : 模式
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        window = {
          completion = window_config.completion,
        },
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })

      -- 搜索 / 和 ? 模式
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        window = {
          completion = window_config.completion,
        },
        sources = {
          { name = "buffer" },
        },
      })

      return opts
    end,
  },
}
