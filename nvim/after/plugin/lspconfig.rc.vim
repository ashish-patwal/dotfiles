if !exists('g:lspconfig')
  finish
endif

lua << EOF
--vim.lsp.set_log_level("debug")
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'
local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- formatting

  -- if client.name == 'tsserver' then
    -- client.resolved_capabilities.document_formatting = false                           
  -- end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  -- Add additional capabilities supported by nvim-cmp
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  -- protocol.SymbolKind = { }
   -- protocol.CompletionItemKind = {
   -- '', -- Text
   -- '', -- Method
   -- '', -- Function
   -- '', -- Constructor
   -- '', -- Field
   -- '', -- Variable
   -- '', -- Class
   -- 'ﰮ', -- Interface
   -- '', -- Module
   -- '', -- Property
   -- '', -- Unit
   -- '', -- Value
   -- '', -- Enum
   -- '', -- Keyword
   -- '﬌', -- Snippet
   -- '', -- Color
   -- '', -- File
   -- '', -- Reference
   -- '', -- Folder
   -- '', -- EnumMember
   -- '', -- Constant
   -- '', -- Struct
   -- '', -- Event
   -- 'ﬦ', -- Operator
   -- '', -- TypeParameter
   -- }

end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  rootPattern = {".luarc.json", ".luacheckrc", ".stylua.toml", "selene.toml", ".git" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

nvim_lsp.golangci_lint_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls", "serve" },
--  cmd = { "golangci-lint-langserver" },
  filetypes = { "go", "gomod" },
  rootPattern = { "go.work", "go.mod", ".git", ".golangci.yaml" },
--  init_options = {
--    command = {
--      "golangci-lint", "run", "--out-format", "json"
--    }
--  }
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp" },
  rootDir = dirname
}

--[[
nvim_lsp.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "Dockerfile", "dockerfile" },
  rootPatterns = { "Dockerfile" }
}
]]

nvim_lsp.vimls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vim-language-server", "--stdio" },
  rootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
  filetypes = { "vim" },
  init_options = {
    diagnostic = {
      enable = true
    },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true
    },
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true
    },
    vimruntime = ""
  },
}

nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
  rootPatterns = { ".flowconfig.js", ".git", "package.json", "tsconfig.json", "javascript", "javascript.jsx" }
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  rootPatterns = { "javascript", "javascriptreact", "javascript.jsx", "package.json", "tsconfig.json", "jsconfig.json", ".git" }
}

--[[
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile' }
}
]]

nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile' }
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python', 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'vim' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git', '.eslintrc.js', 'package.json' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
        },
      pylint = {
          sourceName = "pylint",
          command = "pylint",
          args = {
              "--output-format",
              "text",
              "--score",
              "no",
              "--msg-template",
              "'{line}:{column}:{category}:{msg} ({msg_id}:{symbol})'",
              "%file"
          },
          formatPattern = {
              "^(\\d+?):(\\d+?):([a-z]+?):(.*)$",
              {
                line = 1,
                column = 2,
                security = 3,
                message = 4
              }
          },
          rootPatterns = { ".vim", ".git", "pyproject.toml", "setup.py" },
            securities = {
              informational = "hint",
              refactor = "info",
              convention = "info",
              warning = "warning",
              error = "error",
              fatal = "error"
            },
            offsetColumn = 1,
            formatLines = 1
      },
    },
    filetypes = {
      python = 'pylint',
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' }
      },
      prettier = {
        command = 'prettier_d_slim',
        args = { '--stdin', '--stdin-filepath', '%filename' }
      },
      black = {
        command = 'black',
        args = { '--quiet', '-' },
      },
      autopep8 = {
        command = 'autopep8',
        args = { '-' }
      }
    },
    formatFiletypes = {
      python = { 'autopep8', 'black' },
      css = 'prettier',
      javascript = { 'eslint_d', 'prettier' },
      javascriptreact = { 'eslint_d', 'prettier' },
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = { 'eslint_d', 'prettier' },
      typescriptreact = { 'eslint_d', 'prettier' },
      markdown = 'prettier',
    }
  }
}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

EOF
