local keymap = require('utils.keymap').keymap

local ddc = {
  enable = vim.fn['ddc#enable'],
  patch_global = vim.fn['ddc#custom#patch_global'],
  patch_filetype = vim.fn['ddc#custom#patch_filetype'],
  get_complete_info = vim.fn['ddc#complete_info'],
  manual_complete = vim.fn['ddc#map#manual_complete']
}

local termcode = function(keycode)
  return vim.api.nvim_replace_termcodes(keycode, true, false, true)
end

function _G.ddc_completion()
  local complete_info = ddc.get_complete_info()
  if (complete_info.pum_visible == 1) then
    return termcode('<C-n>')
  end

  local col = vim.fn.col(".")
  if col == 1 then
    return termcode('<TAB>')
  end

  return ddc.manual_complete
end

function _G.ddc_completion_back()
  local complete_info = ddc.get_complete_info()
  if (complete_info.pum_visible == 1) then
    return termcode('<C-p>')
  else
    return termcode('<C-h>')
  end
end

ddc.patch_global {
  ui = 'native',
  sources = {'around', 'skkeleton', 'nvim-lsp'},
  sourceOptions = {
    around = {
      mark = 'A'
    },
    skkeleton = {
      mark = 'skkeleton',
      matchers = {'skkeleton'},
      sorters = {},
      minAutoCompleteLength = 2,
    },
    _ = {
      matchers = {'matcher_head'},
      sorters = {'sorter_rank'}
    },
  }
}

-- lua上ではnvim-lspを指定できなかったので
vim.cmd([[
call ddc#custom#patch_global('sourceOptions', {
\ 'nvim-lsp': {
\   'mark': 'lsp',
\   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
\ })
]])

ddc.patch_filetype('markdown', {
  sourceParams = {
    around = {
      maxSize = 100
    }
  }
})

keymap('i', '<TAB>', 'v:lua.ddc_completion()', {silent = true, expr = true})
keymap('i', '<S-TAB>', 'v:lua.ddc_completion()', {expr = true})

ddc.enable()
