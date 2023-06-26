local M = {}

local will_rename = require('lsp-file-operations.will-rename')
local log = require('lsp-file-operations.log')

local default_config = {
  debug = false
}

M.setup = function(opts)
  opts = vim.tbl_deep_extend("force", default_config, opts or {})
  if opts.debug then
    log.level = "debug"
  end
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesActionRename',
    callback = function(args)
      will_rename.callback(args.data)
    end
  })
end

return M
