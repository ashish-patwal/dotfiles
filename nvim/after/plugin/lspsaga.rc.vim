if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  -- error_sign = '',
  -- warn_sign = ''
  -- hint_sign = '',
  -- infor_sign = '',
  -- error_sign = ' ',
  -- warn_sign = ' ',
  -- hint_sign = ' ',
  -- infor_sign = ' ',
  diagnostic_header_icon = '   ',
  code_action_icon = ' ',
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  definition_preview_icon = '  ',
  rename_prompt_prefix = '➤',
  border_style = "round",
  code_action_prompt = {
  enable = true,
  sign = true,
  sign_priority = 20,
  virtual_text = true,
},
}

EOF

nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> gp :Lspsaga preview_definition<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent> rn :Lspsaga rename<CR>

" diagnostics
nnoremap <silent> <space>e :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" code action
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
