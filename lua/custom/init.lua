-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
   -- Visual selection
   map("v", "*", "y/\\V<C-r>=escape(@\",'/\\')<CR><CR>")

   -- Projectionist
   map("n", "<leader>a", "<cmd>A<CR>")

   -- Test
   map("n", "<leader>tf", "<cmd>TestFile<CR>")
   map("n", "<leader>tl", "<cmd>TestLast<CR>")
   map("n", "<leader>tn", "<cmd>TestNearest<CR>")
   map("n", "<leader>ts", "<cmd>TestSuite<CR>")
   map("n", "<leader>tv", "<cmd>TestVisit<CR>")

   -- Telescope
   map("n", "<leader>*", "<cmd>Telescope grep_string<CR>")
   map(
      "v",
      "<leader>*",
      'y:lua require("telescope.builtin").grep_string({ default_text = "<C-r>=escape(@",\'/\\\')<CR>" })<CR>'
   )
   map("n", "<leader>d/", '<cmd>Telescope live_grep search_dirs={"%:p:h"}<CR>')
   map("n", "<leader>d*", '<cmd>Telescope grep_string search_dirs={"%:p:h"}<CR>')
   map("n", "<leader>'", "<cmd>Telescope resume<CR>")

   -- LazyGit
   map("n", "<leader>go", "<cmd>LazyGit<CR>")

   -- Ranger
   map("n", "<leader>or", "<cmd>Ranger<CR>")

   -- Fugitive
   map("n", "<leader>gl", "<cmd>Git log -10 -- %<CR>")
   map("n", "<leader>gb", "<cmd>Git blame<CR>")
   map("n", "<leader>gt", "<cmd>%Gclog<CR>")

   -- Windows
   map("n", "<leader>ws", "<cmd>split<CR>")
   map("n", "<leader>wv", "<cmd>vsplit<CR>")
   map("n", "<leader>wd", "<C-W>c")

   -- Hop
   map("n", "S", "<cmd>HopChar2BC<CR>")
   map("n", "s", "<cmd>HopChar2AC<CR>")
   map("n", "gk", "<cmd>HopLineBC<CR>")
   map("n", "gj", "<cmd>HopLineAC<CR>")

   -- Copy relative file path to clipboard
   map("n", "<leader>fy", ':let @+=expand("%")<CR>')

   -- Copy github link to clipboard
   map("n", "<leader>gy", "<cmd>GetCommitLink<CR>")
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
   use {
      "folke/which-key.nvim",
      config = function()
         require("which-key").setup()
      end,
   }

   use {
      "aserowy/tmux.nvim",
      config = function()
         require "custom.plugins.tmux"
      end,
   }

   use {
      "blackCauldron7/surround.nvim",
      config = function()
         vim.g.surround_load_autogroups = false
         vim.g.surround_mappings_style = "surround"
         vim.g.surround_load_keymaps = true
         require("surround").setup {}
      end,
   }

   use {
      "lukas-reineke/format.nvim",
      config = function()
         require "custom.plugins.format"
      end,
   }

   use "tpope/vim-projectionist"

   use { "vim-test/vim-test", requires = "preservim/vimux" }

   use {
      "kdheepak/lazygit.nvim",
      requires = "plenary.nvim",
      cmd = { "LazyGit", "LazyGitConfig" },
   }

   use {
      "francoiscabrol/ranger.vim",
      requires = "rbgrouleff/bclose.vim",
   }

   use "tversteeg/registers.nvim"

   use {
      "Avimitin/nerd-galaxyline",
      commit = "f2a29784520c6ed55297f90a1a258c7076050ed4",
      requires = "glepnir/galaxyline.nvim",
   }

   use {
      "phaazon/hop.nvim",
      config = function()
         require("hop").setup()
      end,
   }

   use {
      "romgrk/nvim-treesitter-context",
      after = "nvim-treesitter",
      config = function()
         require("treesitter-context").setup {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            throttle = true, -- Throttles plugin updates (may improve performance)
         }
      end,
   }

   use "knsh14/vim-github-link"

   use {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   }

   use {
      "tpope/vim-fugitive",
      cmd = {
         "Gclog",
         "Gdiff",
         "Gdiffsplit",
         "Git",
         "Gvdiffsplit",
         "Gw",
         "Gwrite",
      },
   }
end)

-- options
local opt = vim.opt

opt.smartcase = true

-- global variables
local g = vim.g

g.projectionist_heuristics = {
   ["*.rb"] = {
      ["lib/*.rb"] = {
         ["alternate"] = "spec/lib/{}_spec.rb",
         ["type"] = "source",
      },
      ["app/*.rb"] = {
         ["alternate"] = "spec/{}_spec.rb",
         ["type"] = "source",
      },
      ["spec/*_spec.rb"] = {
         ["alternate"] = { "{}.rb", "app/{}.rb" },
         ["type"] = "spec",
      },
   },
   ["*.js"] = {
      ["*.spec.js"] = {
         ["alternate"] = "{dirname}/../{basename}.js",
         ["type"] = "spec",
      },
      ["*.js"] = {
         ["alternate"] = "{dirname}/__tests__/{basename}.spec.js",
         ["type"] = "source",
      },
   },
}

-- vim-test
g["test#strategy"] = "vimux"
g["test#preserve_screen"] = 1
g["test#javascript#runner"] = "jest"
g["test#javascript#jest#executable"] = "yarn test --watchAll=false"

-- ranger
g.ranger_map_keys = 0

-- autocmds
vim.cmd "iabbrev JIRA https://employmenthero.atlassian.net/browse/<c-o>:call getchar()<CR>"

vim.cmd [[
  augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]]

vim.cmd [[
  augroup Fugitive
    autocmd!
    autocmd BufEnter fugitive://* nnoremap <buffer> <C-n> :cnext<CR> | nnoremap <buffer> <C-p> :cprevious<CR>
  augroup END
]]

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
