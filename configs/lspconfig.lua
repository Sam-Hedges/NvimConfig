local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local pid = vim.fn.getpid()
local omnisharp_bin = "C:/Users/samhe/AppData/Local/nvim-data/mason/packages/omnisharp/libexec/OmniSharp.exe"

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
}

lspconfig.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
}
