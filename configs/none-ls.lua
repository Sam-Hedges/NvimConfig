local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
    sources = {
        null_ls.builtins.formatting.csharpier.with {
            extra_args = { "--indent-width", "4" },
        },
        null_ls.builtins.formatting.clang_format.with {
            extra_args = { "--indent-width", "4" },
        },
        null_ls.builtins.formatting.stylua.with {
            extra_args = { "--indent-width", "4" },
        },
    },
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds {
                group = augroup,
                buffer = bufnr,
            }
            vim.api.nvim_create_autocmd({
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            }, "BufWritePre")
        end
    end,
}

return opts
