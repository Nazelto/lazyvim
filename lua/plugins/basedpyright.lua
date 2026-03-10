return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = { enabled = false },
      basedpyright = {
        enabled = true,
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
              -- Inlay Hints 配置
              inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
                callArgumentNames = true,
                pytestParameters = true,
                genericTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
