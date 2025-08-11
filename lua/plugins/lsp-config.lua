return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "ansiblels",
                    "arduino_language_server",
                    "azure_pipelines_ls",
                    "bashls",
                    "helm_ls",
                    "jsonls",
                    "lua_ls",
                    "markdown_oxide",
                    "powershell_es",
                    "pyright",
                    "systemd_ls",
                    "ts_ls",
                    "yamlls"
                }
            }
        end
    }
}
