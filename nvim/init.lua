vim.cmd('source ~/.config/nvim/old_init.vim')


--tree-sitter
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'cmake', 'kotlin', 'java', 'bash', 'dockerfile', 'markdown', 'make' },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

--neoclip
require('neoclip').setup({
    on_select = {
        move_to_front = false,
        close_telescope = true,
    },
    on_paste = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
    },
    on_replay = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
    },
    on_custom_action = {
        close_telescope = true,
    },
    keys = {
        telescope = {
            i = {
                paste = '<cr>',
                paste_behind = '<c-l>',
                delete = '<c-d>',
                custom = {},
            },
        },
    },
})

--nvim-surround
require("nvim-surround").setup({})

--nvim-tree
local function on_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- BEGIN_DEFAULT_ON_ATTACH
    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
    vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
    vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
    vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
    vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
    vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
    vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
    vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
    vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
    vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
    vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
    vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
    vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
    vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
    vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
    vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
    vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
    vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
    vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
    vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
    vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
    vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
    vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
    vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
    vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
    vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
    vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
    vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
    vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
    vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
    vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
    vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
    vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
    vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
    vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
    vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
    vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
    vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
    vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
    vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
    vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
    vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
    vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
    vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
    vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
    -- END_DEFAULT_ON_ATTACH
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
end
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    on_attach = on_attach,
    view = {
        centralize_selection = true,
        width = 45,
        float = {
            enable = false,
        }
    },
    tab = {
        sync = {
            open = true,
            close = true,
        },
    },
    renderer = {
        group_empty = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
    }
})
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
            vim.cmd "quit"
        end
    end
})

--telescope
local lga_actions = require("telescope-live-grep-args.actions")
local telescope_actions = require('telescope.actions')
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-l>"] = telescope_actions.select_default,
                ["<C-u>"] = telescope_actions.results_scrolling_up,
                ["<C-d>"] = telescope_actions.results_scrolling_down,
                ["<esc>"] = telescope_actions.close,
            },
            n = {
                ["<C-l>"] = telescope_actions.select_default,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
            },
        }
    }
}
local builtin = require('telescope.builtin')
require("telescope").load_extension("live_grep_args")
require('telescope').load_extension('neoclip')
require('telescope').load_extension('fzf')

--luatab
require('luatab').setup{
    devicon = function() return '' end,
}

--term-edit
require 'term-edit'.setup {
    prompt_end = ':',
}

-- bindings
vim.keymap.set('n', '<C-h>', [[<Cmd>wincmd h<CR>]], {silent = true, noremap = true})
vim.keymap.set('n', '<C-j>', [[<Cmd>wincmd j<CR>]], {silent = true, noremap = true})
vim.keymap.set('n', '<C-k>', [[<Cmd>wincmd k<CR>]], {silent = true, noremap = true})
vim.keymap.set('n', '<C-l>', [[<Cmd>wincmd l<CR>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-g>", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], {silent = true, noremap = true})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>tc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>tr', builtin.resume, {})
vim.api.nvim_set_keymap('v', '<c-f>', 'y<ESC>:Telescope live_grep_args default_text=<c-r>0<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gn", ":Telescope oldfiles<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gm", ":Telescope neoclip<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'g,', ':Telescope find_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'g.', ':Telescope live_grep_args<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tp", [[:let @" = expand("%:p:h")<cr>:tabnew<cr>:NvimTreeClose<cr>:terminal<cr>acd <c-\><c-n>pa<cr>clear<cr>]] ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>tt", [[:tabnew<cr>:NvimTreeClose<cr>:terminal<cr>a]] ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "g9", ":tabp<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "g0", ":tabn<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gs", "<S-*>ggn" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "go", ":call CurtineIncSw()<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gf", [[:w<cr>:!ya style %<cr>:e<cr>]] ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gl", ":set number!<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gc", "<ESC>:tabc<cr>" ,{silent = true, noremap = true})
vim.keymap.set('n', '<cr>', '<cr>', {})

-- may be useful

--formatter
--[[
local util = require "formatter.util"
require("formatter").setup {
    -- Enable or disable logging
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        "-assume-filename",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                    try_node_modules = true,
                }
            end
        },
        python = {
            --require("formatter.filetypes.python").black,
            function()
                return {
                    exe = "black",
                    args = {
                        "--skip-string-normalization",
                        "--line-length=120",
                        "--target-version=py310",
                        "-q",
                        "-",
                    },
                    stdin = true,
                }
            end
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
vim.api.nvim_set_keymap("n", "gf", ":Format<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gi", "gg=G" ,{silent = true, noremap = true})
]]


--vim.api.nvim_set_keymap("i", "<C-[>", "<ESC>:tabp<cr>" ,{silent = true, noremap = true})
--vim.api.nvim_set_keymap("i", "<C-]>", "<ESC>:tabn<cr>" ,{silent = true, noremap = true})
--vim.api.nvim_set_keymap("i", "<C-t>", "<ESC>:tabnew<cr>" ,{silent = true, noremap = true})
--vim.api.nvim_set_keymap("t", "<C-]>", [[<C-\><C-n>:tabn<CR>]] ,{silent = true, noremap = true})
--vim.api.nvim_set_keymap("t", "<C-[>", [[<C-\><C-n>:tabp<CR>]] ,{silent = true, noremap = true})
--vim.api.nvim_set_keymap("t", "<C-t>", [[<C-\><C-n>:tabnew<CR>]] ,{silent = true, noremap = true})
