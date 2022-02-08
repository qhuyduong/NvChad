local M = {}

M.options = {
   clipboard = "unnamed",
   relativenumber = true,
}

M.ui = {
   italic_comments = true,
   theme = "tokyonight",
}

local userPlugins = require "custom.plugins"

M.plugins = {
   install = userPlugins,
   status = {
      vim_matchup = false,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
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
      copy_whole_file = "yig",
   },
   terminal = {
      esc_termmode = { "JK" },
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
