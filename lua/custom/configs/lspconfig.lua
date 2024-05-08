---@diagnostic disable: different-requires
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
-- lspconfig.rust_analyzer.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {"rust"},
--     root_dir = lspconfig.util.root_pattern("Cargo.toml"),
-- })

lspconfig.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.mod"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
                shadow = true,
            }
        }
    }
}

-- lspconfig.emmet_language_server.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     root_dir = lspconfig.util.root_pattern("package.json"),
-- })

lspconfig.tsserver.setup {
    disable_commands = false,
    on_attach = on_attach,
    capabilities = capabilities,
    -- filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
    cmd = {"typescript-language-server", "--stdio"}
}

lspconfig.dagger.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

-- lspconfig.yamlls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {"yml", "yaml", "yaml.docker-compose"},
-- }
--
