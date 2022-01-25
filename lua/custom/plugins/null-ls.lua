local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
   -- Formatting
   b.formatting.stylua,
   b.formatting.prettier,

   -- Diagnostics
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
   b.diagnostics.eslint,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()"
         end
      end,
   }
end

return M
