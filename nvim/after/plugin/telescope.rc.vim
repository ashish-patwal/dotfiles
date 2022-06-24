if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> \\ <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> ;; <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <silent> ;b <cmd>Telescope file_browser<cr>
nnoremap <silent> ;c <cmd>lua require('telescope.builtin').colorscheme()<cr>
nnoremap <silent> ;/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <silent> ;gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <silent> ;gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <silent> ;gs <cmd>lua require('telescope.builtin').git_status()<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')
-- Global remapping
------------------------------
telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF

