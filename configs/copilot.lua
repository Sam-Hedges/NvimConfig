local copilot = require("copilot")

local config = {
    copilot.setup({
        suggestion = {
            auto_trigger = true,
            debounce = 75,
        },
        filetypes = {
            yaml = true,
            markdown = true,
            gitcommit = true,
            gitrebase = true,
        },
    })
}

return config
