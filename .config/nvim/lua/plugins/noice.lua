require("noice").setup({
  presets = {
    bottom_search = true,
    command_palette = false,
    long_message_to_split = false,
  },
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 2, 3 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
  cmdline = {
    format = {
      cmdline = { pattern = "^:", icon = ":", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "h" },
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },
})
