local util = require "formatter.util"

local biomeConfig = function ()
  return {
    exe = "biome",
    args = {
      "check",
      "--write",
      "--no-errors-on-unmatched",
      "--files-ignore-unknown=true",
      "--stdin-file-path",
      util.escape_path(util.get_current_buffer_file_path()),
    },
    cwd = util.get_current_buffer_file_dir(),
    stdin = true,
  }
end

local M = {
  filetype = {
    typescript = { biomeConfig },
    typescriptreact = { biomeConfig },
    javascript = { biomeConfig },
    javascriptreact = { biomeConfig },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M
