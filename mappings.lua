local M = {}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue the debugger",
        }
    }
}

M.lsp = {
    plugin = false, -- Set to false as this is a Neovim native feature, not a plugin
    n = {
        ["<leader>ca"] = {
            "<cmd>lua vim.lsp.buf.code_action()<cr>",
            "Apply LSP Code Action",
        }
    }
}

M.copilot = {
    plugin = true,
    i = {
        ["<M-l>"] = {
            "<cmd> Copilot suggestion accept <CR>",
            "Accept Copilot Suggestion"
        },
        ["<M-]>"] = {
            "<cmd> Copilot suggestion next <CR>",
            "Next Copilot Suggestion"
        },
        ["<M-[>"] = {
            "<cmd> Copilot suggestion prev <CR>",
            "Previous Copilot Suggestion"
        },
        ["<C-]>"] = {
            "<cmd> Copilot suggestion dismiss <CR>",
            "Dismiss Copilot Suggestion"
        },
    }
}

M.general = {
    plugin = false,
    x = {
        ["<leader>ca"] = {
            "<cmd>lua vim.lsp.buf.code_action()<cr>",
            "apply lsp code action",
        },
    },
    v = {
        ["<A-j>"] = {
            ":m '>+1<CR>gv=gv",
            "move selected text down",
        },
        ["<A-k>"] = {
            ":m '<-2<CR>gv=gv",
            "move selected text up",
        },
    }
}

return M
