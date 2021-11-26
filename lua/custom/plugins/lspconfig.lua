local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   lspconfig.solargraph.setup {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 150,
      },
   }

   lspconfig.tsserver.setup {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 150,
      },
      handlers = {
         ["textDocument/publishDiagnostics"] = function() end,
      },
   }

   lspconfig.diagnosticls.setup {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css" },
      init_options = {
         filetypes = {
            javascript = "eslint",
            typescript = "eslint",
            javascriptreact = "eslint",
            typescriptreact = "eslint",
         },
         linters = {
            eslint = {
               sourceName = "eslint",
               command = "./node_modules/.bin/eslint",
               rootPatterns = {
                  ".eslitrc.js",
                  "package.json",
               },
               debounce = 100,
               args = {
                  "--cache",
                  "--stdin",
                  "--stdin-filename",
                  "%filepath",
                  "--format",
                  "json",
               },
               parseJson = {
                  errorsRoot = "[0].messages",
                  line = "line",
                  column = "column",
                  endLine = "endLine",
                  endColumn = "endColumn",
                  message = "${message} [${ruleId}]",
                  security = "severity",
               },
               securities = {
                  [2] = "error",
                  [1] = "warning",
               },
            },
         },
      },
   }

   lspconfig.jdtls.setup {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
         debounce_text_changes = 150,
      },
   }
end

return M
