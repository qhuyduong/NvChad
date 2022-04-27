return {
   {
      "aserowy/tmux.nvim",
      config = function()
         require "custom.plugins.tmux"
      end,
   },
   { "tpope/vim-surround" },
   { "tpope/vim-projectionist" },
   { "vim-test/vim-test", requires = "preservim/vimux" },
   {
      "qhuyduong/lazygit.nvim",
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
   { "chrisbra/csv.vim" },
}
