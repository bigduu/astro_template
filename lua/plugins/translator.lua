return {
  "uga-rosa/translate.nvim",
  lazy = false,
  priority = 5000,
  opts = function()
    return {
      preset = {
        output = {
          split = {
            append = true,
          },
        },
      },
    }
  end,
}
