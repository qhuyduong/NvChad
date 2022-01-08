local M = {}

M.options = {
   clipboard = "unnamed",
   relativenumber = true,
}

M.ui = {
   italic_comments = true,
   theme = "tokyonight", -- default theme
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig", -- path of file containing setups of different lsps
      },
      statusline = {
         style = "round",
      },
   },
   default_plugin_config_replace = {
      nvim_autopairs = "custom.plugins.autopairs",
   },
}

M.mappings = {
   misc = {
      copy_whole_file = "yig", -- copy all contents of current buffer
   },
}

M.mappings.plugins = {
   comment = {
      toggle = "gc",
   },
   telescope = {
      buffers = "<leader>bb",
      find_files = "<leader>ff",
      find_hiddenfiles = "<leader>fa",
      git_commits = "<leader>cm",
      git_status = "<leader>gs",
      help_tags = "<leader>hh",
      live_grep = "<leader>/",
      oldfiles = "<leader>fr",
   },
}

return M
