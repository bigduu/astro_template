return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<leader>b"] = { name = "Buffers" },
          ["<leader>b]"] = {
            function()
              require("astrocore.buffer").nav(1)
            end,
            desc = "Next tab"
          },
          ["<leader>b["] = {
            function()
              require("astrocore.buffer").nav(-1)
            end,
            desc = "Previous tab"
          },
          ["<leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          ["<leader>bx"] = {
            function()
              local current = vim.api.nvim_get_current_buf()
              require("astrocore.buffer").close(current)
            end,
            desc = "Close current buffer",
          },
          ["<leader>v"] = {
            function() vim.cmd.Neotree "reveal_force_cwd" end,
            desc = "Localtion current file in Neotree",
          },
          ["<leader>tt"] = {
            "viw<cmd>Translate zh-CN<CR><esc>b",
            desc = "Translate word under cursor",
          },
          ["<leader>fp"] = {
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
        i = {

        },
        t = {
        },
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
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
          gi = {
            function()
              require("telescope.builtin").lsp_implementations { reuse_win = true }
            end,
            desc = "Implementations of current symbol",
            cond = "textDocument/declaration",
          }
        },
      },
    },
  },
}
