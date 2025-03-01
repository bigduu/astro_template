vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.clipboard.osc52").copy,
    ["*"] = require("vim.clipboard.osc52").copy,
  },
  paste = {
    ["+"] = require("vim.clipboard.osc52").paste,
    ["*"] = require("vim.clipboard.osc52").paste,
  },
}
