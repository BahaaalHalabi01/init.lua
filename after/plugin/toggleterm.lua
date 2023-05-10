vim.keymap.set("n","<leader>tt",vim.cmd.ToggleTerm)

require("toggleterm").setup({
    size = 50,
    direction = "float"

})
