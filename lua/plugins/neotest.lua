return {
  {
    "nvim-neotest/neotest",
    opts = {
      -- 浮动窗口边框 (<leader>to)
      floating = {
        border = "rounded",
        max_height = 0.85,
        max_width = 0.85,
      },

      -- 输出配置
      output = {
        enabled = true,
        open_on_run = false,
      },

      -- 输出面板配置
      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },
    },

    init = function()
      -- 给输出面板添加边框（用 init 而不是 config）
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neotest-output-panel",
        callback = function()
          vim.wo.signcolumn = "no"
          vim.wo.number = false
        end,
      })

      -- 美化边框颜色
      vim.api.nvim_set_hl(0, "NeotestBorder", { fg = "#89b4fa" })
    end,
  },
}
