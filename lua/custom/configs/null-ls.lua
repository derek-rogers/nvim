local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
    sources = {
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.prettier_d_slim,
        null_ls.builtins.formatting.cueimports,
        null_ls.builtins.formatting.cue_fmt,
        -- null_ls.builtins.formatting.gofumpt,
        -- null_ls.builtins.formatting.goimports_reviser,
        -- null_ls.builtins.formatting.golines,
    },

    on_attach = function(client, bufnr)
        -- if client.supports_method("textDocument/formatting") then
        --     vim.api.nvim_clear_autocmds({
        --         group = augroup,
        --         buffer = bufnr,
        --     })
        --     vim.api.nvim_create_autocmd("BufWritePre", {
        --         group = augroup,
        --         buffer = bufnr,
        --         callback = function()
        --             vim.lsp.buf.format({bufnr = bufnr})
        --         end,
        --     })
        -- end
        local augroup_id = vim.api.nvim_create_augroup(
            "FormatModificationsDocumentFormattingGroup",
            { clear = false }
        )
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd(
            { "BufWritePre" },
            {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    local lsp_format_modifications = require "lsp-format-modifications"
                    lsp_format_modifications.format_modifications(client, bufnr)
                end,
            }
        )

        vim.api.nvim_buf_create_user_command(
            bufnr,
            "FormatModifications",
            function()
                local lsp_format_modifications = require "lsp-format-modifications"
                lsp_format_modifications.attach(client, bufnr, { format_on_save = false })
            end,
            {}
        )
    end,
}
return opts
