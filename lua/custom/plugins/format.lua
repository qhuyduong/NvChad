local present, format = pcall(require, "format")
if not present then
   return
end

local fmt = string.format
format.setup {
   ["*"] = {
      -- remove trailing whitespaces
      {
         cmd = {
            "sed -i 's/[ \t]*$//'",
         },
      },
   },
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
         cmd = { "prettier -w", "./node_modules/.bin/prettier -w" },
      },
   },
   html = {
      {
         cmd = { "prettier -w --parser html" },
      },
   },
   markdown = {
      {
         cmd = { "prettier -w --parser markdown" },
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
         cmd = { "prettier -w --parser css" },
      },
   },
   scss = {
      {
         cmd = { "prettier -w --parser scss" },
      },
   },
   json = {
      {
         cmd = { "prettier -w --parser json" },
      },
   },
   yaml = {
      {
         cmd = { "prettier -w --parser yaml" },
      },
   },
   ruby = {
      {
         cmd = { "rubocop --auto-correct" },
      },
   },
}
