local Mapping = {}

--- キーマッピングのラッパー
-- @param mode マッピングを適用するモード。モードの先頭1文字を渡す(ex: normal = n)
-- @param keybind マッピングのキーバインド。公式ではlhs
-- @param assigncmd マッピングされたキーバインドで実行するコマンド。公式ではrhs
-- @param opts
function Mapping.keymap(mode, keybind, assigncmd, opts)
  local options = {
    noremap = true,
    silent = true
  }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, keybind, assigncmd, options)
end

return Mapping
