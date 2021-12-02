local present1, autopairs = pcall(require, "nvim-autopairs")
local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
local present3, cmp = pcall(require, "cmp")

if not (present1 and present2 and present3) then
   return
end

autopairs.setup()
autopairs.add_rules(require "nvim-autopairs.rules.endwise-ruby")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
