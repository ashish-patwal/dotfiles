if !exists('g:loaded_devicons') | finish | endif

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
   motoko = {
      icon = "",
      color = "#9772FB",
      cterm_color = "99",
      name = "Motoko",
     }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

EOF
