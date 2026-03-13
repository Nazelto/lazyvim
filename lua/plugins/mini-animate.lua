return {
  "nvim-mini/mini.animate",
  version = false,
  event = "VeryLazy",
  config = function()
    local animate = require("mini.animate")

    animate.setup({
      -- 光标动画
      cursor = {
        enable = false,
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
      },

      -- 滚动动画
      scroll = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 200, unit = "total" }),
      },

      -- ✅ 窗口大小变化动画（分屏拖拽、调整大小）
      resize = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
      },

      -- ✅ 窗口打开动画
      open = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
      },

      -- ✅ 窗口关闭动画
      close = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
      },
    })
  end,
}
