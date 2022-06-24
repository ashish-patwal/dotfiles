local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
--  map_cr = true,
--  map_complete = true,
--  auto_select = true,
--    map_char = {
--    all = '(',
--    tex = '{'
--  }
})
