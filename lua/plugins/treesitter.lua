return {
    "nvim-treesitter/nvim-treesitter", 
    branch = "master", 
    lazy = false, 
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = { 
                "c_sharp",
                "css",
                "gitignore",
                "go",
                "groovy",
                "html",
                "http",
                "javascript",
                "jq",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "nginx",
                "php",
                "perl",
                "powershell",
                "python",
                "regex",
                "rust",
                "sql",
                "terraform",
                "toml",
                "typescript",
                "vim",
                "yaml"
            }
        })
    end
}
