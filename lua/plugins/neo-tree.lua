return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    default_component_configs = {
      file_size = {
        enabled = true,
        required_width = 50,
      },
    },
    window = {
      width = 10,
      auto_expand_width = true,
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
      group_empty_dirs = true,
    },
  },
}
