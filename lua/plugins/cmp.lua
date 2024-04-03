return {
  {
    "zbirenbaum/copilot-cmp",
    event = { "InsertEnter", "LspAttach" },
    opts = function() require("copilot_cmp").setup() end,
    fix_pairs = true,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "InsertEnter", "LspAttach" },
    opts = function()
      return {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  {
    "tzachar/cmp-tabnine",
    event = { "InsertEnter", "LspAttach" },
    cmd = { "TabnineStatus", "TabnineDisable", "TabnineEnable", "TabnineToggle" },
    build = {
      "./install.sh",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    keys = { ":", "/", "?" },
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.mapping = {
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Replace }
          else
            fallback()
          end
        end, { "i", "c" }),
        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Replace }
          else
            fallback()
          end
        end, { "i", "c" }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(function()
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            else
              cmp.confirm()
            end
          else
            cmp.complete()
          end
        end, { "i", "s", "c" }),
      }

      local lspkind = require "lspkind"

      opts.format = lspkind.cmp_format {
        mode = "symbol",
        max_width = 50,
        symbol_map = { Copilot = "", TabNine = "" },
      }

      opts.sources = cmp.config.sources {
        { name = "copilot", priority = 1300 },
        { name = "cmp_tabnine", priority = 1200 },
        { name = "nvim_lsp", priority = 1000 },
        { name = "emoji", priority = 900 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }
    end,
    config = function(_, opts)
      local cmp = require "cmp"

      cmp.setup(opts)

      cmp.setup.cmdline("/", {
        enabled = true,
        mapping = cmp.mapping.preset.cmdline {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
        },
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':'.
      cmp.setup.cmdline(":", {
        enabled = true,
        mapping = cmp.mapping.preset.cmdline {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
        },
        sources = cmp.config.sources({ { name = "cmdline" } }, { { name = "path" } }),
      })
    end,
  },
}
