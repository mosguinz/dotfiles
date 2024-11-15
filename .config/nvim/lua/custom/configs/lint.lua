require("lint").linters_by_ft = {
  javascript = {"biomejs"},
  javascriptreact = {"biomejs"},
  typescript = {"biomejs"},
  typescriptreact = {"biomejs"},
}

-- Run linter on save.
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
