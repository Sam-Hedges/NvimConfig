local plugins = {

    -- Treesitter and related plugins
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        opts = {
            ensure_installed = { "rust", "c", "cpp", "c_sharp", "lua" },
        },
    },
    { "nvim-lua/plenary.nvim",      lazy = false },
    { "nvim-treesitter/playground", lazy = false },
    { "theprimeagen/vim-be-good",   lazy = false },
    { "theprimeagen/vim-apm",       lazy = false },
    { "theprimeagen/harpoon",       lazy = false },
    { "tpope/vim-fugitive",         lazy = false },
    {
        "mbbill/undotree",
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.none-ls"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require("core.utils").load_mappings "dap"
        end,
    },
    { "cdelledonne/vim-cmake", lazy = false },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            return require "custom.configs.copilot"
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            filters = {
                custom = { "meta" },
            },
            view = {
                adaptive_size = true,
            },
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = false,
            },
        },
    },
    {
        "ahmedkhalf/project.nvim",
        lazy = false,
        config = function()
            require("project_nvim").setup {
                manual_mode = true,
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "CMakeLists.txt" },
            }
            require("telescope").load_extension "projects"
        end,
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup {
                theme = "hyper",
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        { desc = "󰒲LLazy Sync", group = "@property", action = "Lazy sync", key = "s" },
                        {
                            desc = " Files",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },
                        {
                            desc = "󰏌 New Buffer",
                            group = "DiagnosticHint",
                            action = "enew",
                            key = "a",
                        },
                        {
                            desc = " .Dotfiles",
                            group = "Number",
                            action = "enew | cd $USERPROFILE\\AppData\\Local\\nvim\\lua | NvimTreeToggle | NvimTreeFocus",
                            key = "d",
                        },
                    },
                    packages = { enable = true }, -- show how many plugins neovim loaded
                    -- limit how many projects list, action when you press key or enter it will run this action.
                    -- action can be a functino type, e.g.
                    -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
                    project = {
                        enable = true,
                        limit = 8,
                        icon = " ",
                        label = "Projects",
                        action = "Telescope projects",
                    },
                    mru = { limit = 5, icon = " ", label = "Files", cwd_only = false },
                },
            }
        end,
        requires = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            show_current_context = true,
            show_current_context_start = false,
        },
    },
}

return plugins
