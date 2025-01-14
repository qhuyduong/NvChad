local M = {}

M.setup_lsp = function(on_attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = { "solargraph", "tsserver", "jdtls" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = on_attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   -- disable tsserver formatter
   lspconfig.tsserver.setup {
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         on_attach(client, bufnr)
      end,
   }

   lspconfig.solargraph.setup {
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         on_attach(client, bufnr)
      end,
   }
end

return M
