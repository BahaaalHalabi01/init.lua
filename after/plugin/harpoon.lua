local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a",mark.add_file,{desc ='harpoon mark'})
vim.keymap.set("n", "<C-e>",ui.toggle_quick_menu, {desc = 'harpoon ui'})

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end,{desc = 'harpoon 1 file'})
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end,{desc = 'harpoon 2 file'})
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end,{desc = 'harpoon 3 file'})
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end,{desc = 'harpoon 4 file'})
