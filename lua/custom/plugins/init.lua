return {
   {
      "aserowy/tmux.nvim",
      config = function()
         require "custom.plugins.tmux"
      end,
   },
   {
      "blackCauldron7/surround.nvim",
      config = function()
         vim.g.surround_load_autogroups = false
         vim.g.surround_mappings_style = "surround"
         vim.g.surround_load_keymaps = true
         require("surround").setup {}
      end,
   },
   { "tpope/vim-projectionist" },
   { "vim-test/vim-test", requires = "preservim/vimux" },
   {
      "kdheepak/lazygit.nvim",
      requires = "plenary.nvim",
      cmd = { "LazyGit", "LazyGitConfig" },
   },
   {
      "francoiscabrol/ranger.vim",
      requires = "rbgrouleff/bclose.vim",
   },
   { "tversteeg/registers.nvim" },
   {
      "phaazon/hop.nvim",
      config = function()
         require("hop").setup()
      end,
   },
   { "knsh14/vim-github-link" },
   {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   },
   {
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
   },
   { "kelwin/vim-smali" },
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
}
