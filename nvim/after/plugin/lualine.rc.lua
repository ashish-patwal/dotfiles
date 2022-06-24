local status, lualine = pcall(require, "lualine")
if (not status) then return end

local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  peach  = '#ffafaf',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.cyan } },
  visual = { a = { fg = colors.black, bg = colors.red } },
  replace = { a = { fg = colors.black, bg = colors.blue } },
  command = { a = { fg = colors.black, bg = colors.peach } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = bubbles_theme,
    section_separators = { left = '', right = '' },
    component_separators = {left = ')', right = '('},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {{
      'mode',
      fmt = function (current_mode)
        if current_mode == 'INSERT' then
          return 'इंसर्ट'
        elseif current_mode == 'NORMAL' then
          return 'नार्मल'
        elseif current_mode == 'VISUAL' then
          return 'विजुअल'
        elseif current_mode == 'REPLACE' then
          return 'रिप्लेस'
        elseif current_mode == 'COMMAND' then
          return 'कमांड'
        elseif current_mode == 'V-BLOCK' then
          return 'विजुअल ब्लॉक'
        elseif current_mode == 'V-LINE' then
          return 'विजुअल लाइन'
        else return current_mode
        end
      end
    }},
    lualine_b = {'branch', 'diff'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
      lualine_a = {},
      lualine_b = {'buffers'},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {{'tabs', file_status = true}}
  },
  extensions = {'fugitive'}
}
