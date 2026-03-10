-- ~/.config/nvim/lua/plugins/rust/rustaceanvim.lua
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              enable = true,
              parameterHints = { enable = true },
              typeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = {
                enable = true,
                minLines = 5,
              },
              -- 生命周期省略提示
              lifetimeElisionHints = {
                enable = "always",
                useParameterNames = true,
              },
              implicitDrops = { enable = true },
              bindingModeHints = { enable = true },
              reborrowHints = { enable = "always" },
              expressionAdjustmentHints = { enable = "always" },
              closureReturnTypeHints = { enable = "always" },
              discriminantHints = { enable = "always" },
            },
            checkOnSave = {
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
