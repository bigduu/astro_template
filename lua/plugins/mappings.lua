return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<C-q>"] = false,
          ["<LEADER>b"] = { name = "Buffers" },
          ["<LEADER>b]"] = {
            function() require("astrocore.buffer").nav(1) end,
            desc = "Next tab",
          },
          ["<LEADER>b["] = {
            function() require("astrocore.buffer").nav(-1) end,
            desc = "Previous tab",
          },
          ["<LEADER>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          ["<LEADER>bx"] = {
            function()
              local current = vim.api.nvim_get_current_buf()
              require("astrocore.buffer").close(current)
            end,
            desc = "Close current buffer",
          },
          ["<LEADER>v"] = {
            function() vim.cmd.Neotree "reveal_force_cwd" end,
            desc = "Locate file in tree",
          },
          ["<LEADER>e"] = {
            function()
              local manager = require "neo-tree.sources.manager"
              local renderer = require "neo-tree.ui.renderer"
              local filesystem_state = manager.get_state "filesystem"
              local buffers_state = manager.get_state "buffers"
              local git_status_state = manager.get_state "git_status"
              local filesystem_window_exists = renderer.window_exists(filesystem_state)
              local git_status_window_exists = renderer.window_exists(git_status_state)
              local buffers_window_exists = renderer.window_exists(buffers_state)
              if filesystem_window_exists or buffers_window_exists or git_status_window_exists then
                vim.cmd.Neotree "close"
              else
                vim.cmd.Neotree "last"
              end
            end,
            desc = "Toggle neo tree",
          },
          ["<LEADER>tt"] = {
            "viw<cmd>Translate zh-CN<CR><esc>b",
            desc = "Translate word under cursor",
          },
          ["<LEADER>fp"] = {
            "<cmd>Telescope projects<CR>",
            desc = "Find project",
          },
        },
        v = {
          ["<leader>tt"] = {
            "<cmd>Translate zh-CN<CR>",
            desc = "Translate word under cursor",
          },
        },
        i = {},
        t = {},
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
          gi = {
            function() require("telescope.builtin").lsp_implementations { reuse_win = true } end,
            desc = "Implementations of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
