
function! YankRelativeWithLineNumber()
  let @+=expand("%") . ':' . line(".")
  lua << EOF
  vim.notify = require("notify")
  vim.notify("copied relative path!")
EOF
endfunction

function! myspacevim#before() abort
    nmap yuy :call YankRelativeWithLineNumber()<CR>
endfunction

function! myspacevim#after() abort
 let g:indent_blankline_char = "│"
 lua << EOF
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}


require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-/>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      guibg = "#017101",
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      guifg = "#019090",
      guibg = "#017101",
    },
  },
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = "horizontal",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  auto_scroll = true -- automatically scroll to the bottom on terminal output
}
EOF

endfunction 
