local M = {}

M.disabled = {
    n = {
        ["<tab>"] = "",
        ["<S-tab>"] = "",
    }
}

M.general = {
    n = {
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

        -- center screen when jumping
        ["<C-d>"] = { "<C-d>zz"},
        ["<C-u>"] = { "<C-u>zz"},
        ["n"] = { "nzzzv"},
        ["N"] = { "Nzzzv"},

        ["<C-t>"] = {
            function()
                require("nvchad.tabufline").tabuflineNext()
            end,
            "Goto next buffer",
        },
        -- Not sure if this belongs here, but it works
        ["<leader>gd"] = { "<cmd> Gitsigns preview_hunk<CR>", "show inline diff"},
    },
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dus"] = {
            function()
                local widgets = require('dap.ui.widgets');
                local sidebar = widgets.sidebar(widgets.scopes);
                sidebar.open();
            end,
            "Open debugger sidebar"
        }
    }
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require('dap-go').debug_test()
            end,
            "Debug go test"
        },
        ["<leader>dgl"] = {
            function()
                require('dap-go').debug_last()
            end,
            "Debug last go test"
        }
    }
}

M.gopher = {
    plugin = true,
    n = {
        ["<leader>gie"] = {
            "<cmd> GoIfErr <CR>",
            "Generate if-err block",
        },
        ["<leader>gjt"] = {
            "<cmd> GoTagAdd json <CR>",
            "Generate json struct tags",
        },
    }
}
return M
