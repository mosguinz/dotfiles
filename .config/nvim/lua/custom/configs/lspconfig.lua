-- Load default NVChad config
local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}

lspconfig.ruff.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"}
})


-- lspconfig.pyright.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {"python"}
-- })

-- lspconfig.biome.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   init_options = {
--     preferences = {
--       disableSuggestions = false
--     }
--   }
-- }
