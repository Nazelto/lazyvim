return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      {
        "folke/snacks.nvim",
        optional = true,
        opts = {
          input = {},

          picker = {
            actions = {
              opencode_send = function(...)
                return require("opencode").snacks_picker_send(...)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
          terminal = {},
        },
      },
    },
    config = function()
      -- 官方示例提到：为了让事件触发后的文件重载正常工作，需要 autoread
      vim.o.autoread = true
      local opencode_cmd = "opencode --port"

      local function terminal_win_opts(with_setup)
        return {
          win = {
            position = "right",
            enter = false,
            on_win = function(win)
              if with_setup then
                require("opencode.terminal").setup(win.win)
              end
            end,
          },
        }
      end

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- 先尽量保持默认，稳定后再细调
        -- 下面这个是可选的实验特性，不建议一上来就开
        lsp = {
          enabled = true,
        },

        -- 如果你想强制使用 snacks 右侧终端，可以打开下面这段 server 配置
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, terminal_win_opts(true))
          end,
          stop = function()
            require("snacks.terminal").get(opencode_cmd, terminal_win_opts(false)):close()
          end,
          toggle = function()
            require("snacks.terminal").toggle(opencode_cmd, terminal_win_opts(true))
          end,
        },
      }
    end,

    keys = {
      -- 主入口
      {
        "<leader>aa",
        function()
          require("opencode").toggle()
        end,
        desc = "OpenCode Toggle",
      },

      -- 直接提问
      {
        "<leader>ai",
        function()
          require("opencode").ask("", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Ask",
      },
      {
        "<leader>aI",
        function()
          require("opencode").ask("@this: ", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Ask With Context",
      },
      {
        "<leader>ab",
        function()
          -- `@buffer` injects the whole current buffer as context before sending.
          require("opencode").ask("@buffer ", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Ask Buffer",
      },

      -- 功能菜单
      {
        "<leader>as",
        function()
          require("opencode").select({ submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Select",
      },

      -- Prompt
      {
        "<leader>ap",
        function()
          require("opencode").prompt("@this", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Prompt",
      },

      -- 内置 prompts
      {
        "<leader>ape",
        function()
          require("opencode").prompt("explain", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Explain",
      },
      {
        "<leader>apf",
        function()
          require("opencode").prompt("fix", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Fix",
      },
      {
        "<leader>apd",
        function()
          require("opencode").prompt("diagnose", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Diagnose",
      },
      {
        "<leader>apr",
        function()
          require("opencode").prompt("review", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Review",
      },
      {
        "<leader>apt",
        function()
          require("opencode").prompt("test", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "OpenCode Test",
      },

      -- 把当前范围/对象送进上下文
      {
        "go",
        function()
          return require("opencode").operator("@this ")
        end,
        expr = true,
        mode = { "n", "x" },
        desc = "OpenCode Add Range",
      },
      {
        "goo",
        function()
          return require("opencode").operator("@this ") .. "_"
        end,
        expr = true,
        mode = "n",
        desc = "OpenCode Add Line",
      },

      -- 消息滚动
      {
        "<C-u>",
        function()
          require("opencode").command("session.half.page.up")
        end,
        mode = { "t" },
        desc = "OpenCode Half Page Up",
      },
      {
        "<C-d>",
        function()
          require("opencode").command("session.half.page.down")
        end,
        mode = { "t" },
        desc = "OpenCode Half Page Down",
      },
      {
        "<A-l>",
        function()
          vim.cmd("vertical resize +8")
        end,
        mode = { "t" },
        desc = "OpenCode Wider",
      },
      {
        "<A-h>",
        function()
          vim.cmd("vertical resize -8")
        end,
        mode = { "t" },
        desc = "OpenCode Narrower",
      },
    },
  },
}
