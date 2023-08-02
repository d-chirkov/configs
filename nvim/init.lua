vim.cmd('source ~/.config/nvim/old_init.vim')


--tree-sitter
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'cmake', 'kotlin', 'java', 'bash', 'dockerfile', 'markdown', 'make' },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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
    vim.keymap.set('n', '<Esc>',     api.tree.close,                        opts('Close'))
end

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    on_attach = on_attach,
    view = {
        centralize_selection = true,
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                return {
                    border = 'rounded',
                    relative = 'editor',
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
        width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
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

--term-edit
require 'term-edit'.setup {
    prompt_end = ':',
}

--treesitter
require'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]]"] =  "@function.outer",
                --["<C-n>"] =  "@function.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[["] = "@function.outer",
                --["<C-m>"] =  "@function.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
            },
        },
    },
}

--lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'material',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {{
            'tabs',
            mode = 2,
            max_length = 2 * vim.o.columns / 3,
            --use_mode_colors = true,
            fmt = function(name, context)
                local buflist = vim.fn.tabpagebuflist(context.tabnr)
                local winnr = vim.fn.tabpagewinnr(context.tabnr)
                local bufnr = buflist[winnr]
                local mod = vim.fn.getbufvar(bufnr, '&mod')

                return (mod == 1 and '*' or '') .. name
            end
        }},
        lualine_b = {},
        lualine_c = { {'filename', path = 1 } },
        lualine_x = {},
        lualine_y = {'progress', 'selectioncount'},
        lualine_z = {'mode'},
    },
    extensions = {}
}

--fzf-lua
require("fzf-lua").setup({
    grep = {
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
    },
    winopts = {
        preview = {
            layout = 'vertical',
        },
    },
    oldfiles = {
        include_current_session = true,
    },
    keymap = {
        fzf = {
            ["esc"] = "abort",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
            ["ctrl-a"] = "beginning-of-line",
            ["ctrl-e"] = "end-of-line",
            ["alt-a"] = "toggle-all",
        },
    },
})

--bindings
vim.keymap.set('n', 'gh', [[<Cmd>wincmd h<CR>]], {silent = true, noremap = true})
vim.keymap.set('n', 'gj', [[<Cmd>wincmd j<CR>]], {silent = true, noremap = true})
vim.keymap.set('n', 'gk', [[<Cmd>wincmd k<CR>]], {silent = true, noremap = true})
vim.keymap.set('n', 'gl', [[<Cmd>wincmd l<CR>]], {silent = true, noremap = true})
vim.keymap.set('n', '<C-g>', "0", {silent = true, noremap = true})
vim.keymap.set('i', '<C-g>', "<esc>0i", {silent = true, noremap = true})
vim.keymap.set('n', '<C-h>', "^", {silent = true, noremap = true})
vim.keymap.set('i', '<C-h>', "<esc>^i", {silent = true, noremap = true})
vim.keymap.set('n', '<C-l>', "$", {silent = true, noremap = true})
vim.keymap.set('i', '<C-l>', "<esc>$a", {silent = true, noremap = true})
vim.keymap.set('n', '<C-j>', "10j", {silent = true, noremap = true})
vim.keymap.set('n', '<C-k>', "10k", {silent = true, noremap = true})
vim.keymap.set('n', '<space>', "", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "ga", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<c-f>', '<ESC>:FzfLua grep_visual<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-f>', ':FzfLua grep_cword<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gn", ":FzfLua oldfiles<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'gm', ':FzfLua files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'g.', ':FzfLua live_grep<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'g/', ':FzfLua grep_curbuf<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gb', ':FzfLua grep_curbuf<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', ':FzfLua resume<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tp", [[:let @" = expand("%:p:h")<cr>:tabnew<cr>:terminal<cr>acd <c-\><c-n>pa<cr>clear<cr>]] ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>tt", [[:tabnew<cr>:terminal<cr>a]] ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gt", [[:tabnew<cr>:terminal<cr>a]] ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gp", [[:let @" = expand("%:p:h")<cr>:tabnew<cr>:terminal<cr>acd <c-\><c-n>pa<cr>clear<cr>]] ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gs", "<S-*>ggn" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "go", ":call CurtineIncSw()<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gf", [[:w<cr>:!ya style %<cr>:e<cr>]] ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "g=", ":set number!<cr>:set relativenumber!<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gc", "<ESC>:tabnew<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<c-t>", "<ESC>:tabnew<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gx", "<ESC>:tabc<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "g9", ":tabp<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "g0", ":tabn<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>f", ":ClangFormat<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("v", "<leader>f", ":ClangFormat<cr>" ,{silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "g]", ":call gutentags#setup_gutentags()<cr>:FzfLua tags_grep_cword<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("v", "g]", "<ESC>:call gutentags#setup_gutentags()<cr>:FzfLua tags_grep_visual<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gw", ":qa<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gq", "@q", {silent = true, noremap = true})
vim.keymap.set('n', '<cr>', '<cr>', {})
