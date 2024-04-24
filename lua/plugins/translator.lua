return {
  "uga-rosa/translate.nvim",
  event = { "InsertEnter", "LspAttach" },
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
