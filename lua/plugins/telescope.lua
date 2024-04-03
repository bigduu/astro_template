return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
  },
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"
    return {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = actions.preview_scrolling_down,
            ["<C-d>"] = actions.preview_scrolling_up,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
          },
          n = { q = actions.close, ["<Esc>"] = actions.close },
        },
      },
    }
  end,
}
