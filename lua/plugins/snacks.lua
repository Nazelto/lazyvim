return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.styles = opts.styles or {}

      opts.styles.float = vim.tbl_deep_extend("force", opts.styles.float or {}, {
        width = 0.5,
        height = 0.5,
      })

      opts.styles.split = vim.tbl_deep_extend("force", opts.styles.split or {}, {
        width = 0.5,
        height = 0.5,
      })

      opts.terminal = opts.terminal or {}
      opts.terminal.win = vim.tbl_deep_extend("force", opts.terminal.win or {}, {
        width = 0.5,
        height = 0.5,
      })
    end,
  },
}
