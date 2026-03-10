return {
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

      -- 窗口样式配置（复用）
      local window_config = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          side_padding = 1,
          col_offset = -3,
          scrollbar = false,
          a,
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          max_width = 80,
          max_height = 20,
          scrollbar = false,
        }),
      }

      -- ✅ 主编辑器窗口样式
      opts.window = window_config

      -- ✅ 命令行 : 模式
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

      -- ✅ 搜索 / 和 ? 模式
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
