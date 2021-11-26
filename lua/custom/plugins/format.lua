local present, format = pcall(require, "format")
if not present then
   return
end

local fmt = string.format
format.setup {
   vim = {
      {
         cmd = {
            function(file)
               return fmt("stylua --config-path ~/.config/stylua/stylua.toml %s", file)
            end,
         },
         start_pattern = "^lua << EOF$",
         end_pattern = "^EOF$",
      },
   },
   lua = {
      {
         cmd = {
            function(file)
               return fmt("stylua --config-path ~/.config/stylua/stylua.toml %s", file)
            end,
         },
      },
   },
   javascript = {
      {
         cmd = { "./node_modules/.bin/prettier --write" },
      },
   },
   html = {
      {
         cmd = { "prettier --write --parser html" },
      },
   },
   markdown = {
      {
         cmd = { "prettier --write --parser markdown" },
      },
      {
         cmd = {
            "yapf -i",
         },
         start_pattern = "^```python$",
         end_pattern = "^```$",
         target = "current",
      },
   },
   css = {
      {
         cmd = { "prettier --write --parser css" },
      },
   },
   scss = {
      {
         cmd = { "prettier --write --parser scss" },
      },
   },
   json = {
      {
         cmd = { "prettier --write --parser json" },
      },
   },
   yaml = {
      {
         cmd = { "prettier --write --parser yaml" },
      },
   },
   ruby = {
      {
         cmd = { "bundle exec rubocop --auto-correct" },
      },
   },
   typescriptreact = {
      {
         cmd = { "./node_modules/.bin/prettier --write" },
      },
   },
   java = {
      {
         cmd = { "google-java-format --aosp --replace" },
      },
   },
}
