-- Code that chatGPT came up with to display the neovim path in the status bar
vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "BufLeave"}, {
  callback = function()
    local path = vim.fn.expand("%:p")
    if path == "" then
      path = "[No File]"
    end
    local file = io.open(os.getenv("HOME") .. "/.nvim-current-path", "w")
    if file then
      file:write(path)
      file:close()
    end
  end
})


-- Some random code I found on the internet for commenting and uncommenting
local non_c_line_comments_by_filetype = {
  lua = '--',
  python = '#',
  sql = '--',
  terraform = '#',
  bash = '#'
}

local function comment_out(opts)
  local line_comment = non_c_line_comments_by_filetype[vim.bo.filetype] or '//'
  local start = math.min(opts.line1, opts.line2)
  local finish = math.max(opts.line1, opts.line2)

  vim.api.nvim_command(start .. ',' .. finish .. 's:^:' .. line_comment .. ':')
  vim.api.nvim_command 'noh'
end

local function uncomment(opts)
  local line_comment = non_c_line_comments_by_filetype[vim.bo.filetype] or '//'
  local start = math.min(opts.line1, opts.line2)
  local finish = math.max(opts.line1, opts.line2)

  pcall(vim.api.nvim_command, start .. ',' .. finish .. 's:^\\(\\s\\{-\\}\\)' .. line_comment .. ':\\1:')
  vim.api.nvim_command 'noh'
end

vim.api.nvim_create_user_command('CommentOut', comment_out, { range = true })
vim.keymap.set('v', '<M-,>', ':CommentOut<CR>')
vim.keymap.set('n', '<M-,>', ':CommentOut<CR>')

vim.api.nvim_create_user_command('Uncomment', uncomment, { range = true })
vim.keymap.set('v', '<M-.>', ':Uncomment<CR>')
vim.keymap.set('n', '<M-.>', ':Uncomment<CR>')
