local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "gopls",
                -- "emmet-language-server",
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        ft = "*",
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings("gopher")
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "joechrisellis/lsp-format-modifications.nvim",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
    },
}
return plugins
