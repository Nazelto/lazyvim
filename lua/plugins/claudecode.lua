return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  opts = {
    terminal = {
      split_side = "right", -- "left" 或 "right"
      split_width_percentage = 0.50, -- 0.5 = 50% 宽度
    },
  },
}
