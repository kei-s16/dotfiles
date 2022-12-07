local keymap = require("utils.keymap").keymap

keymap("n", "<leader>g", ":<C-u>Git<CR>")
keymap("n", "<leader>L", ":<C-u>Gclog<CR>")
keymap("n", "<leader>d", ":<C-u>Gdiff<CR>")
