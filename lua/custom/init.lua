-- MAPPINGS
local map = require("core.utils").map
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
vim.cmd [[
iabbrev JIRA https://employmenthero.atlassian.net/browse/<c-o>:call getchar()<CR>
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

augroup Fugitive
  autocmd!
  autocmd BufEnter fugitive://* nnoremap <buffer> <C-n> :cnext<CR> | nnoremap <buffer> <C-p> :cprevious<CR>
augroup END

autocmd FileType c,cpp setlocal shiftwidth=8 tabstop=8 noexpandtab
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType xml setlocal shiftwidth=4 tabstop=4
]]
