if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF

require('nvim-ts-autotag').setup()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
--    "jsdoc",
--    "comment",
    "yaml",
    "toml",
    "fish",
    "json",
    "yaml",
    "html",
    "scss",
--    "bash",
    "cmake",
--    "cpp",
--    "css",
--    "dockerfile",
    "graphql",
    "json5",
--    "lua",
--    "regex",
--    "python",
--    "javascript",
--    "go",
--    "typescript",
--    "vim"
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF
