return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      window = {
        width = 15,
      },
    },
    config = function()
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal<CR>')
        vim.keymap.set('n', '<C-m>', ':Neotree toggle<CR>')
    end
}
