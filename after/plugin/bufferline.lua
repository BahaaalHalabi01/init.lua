vim.opt.termguicolors = true
vim.keymap.set("n","]b","<Cmd>BufferLineCycleNext<CR>",{desc = "next buffer"})
vim.keymap.set("n","[b","<Cmd>BufferLineCyclePrev<CR>",{desc = "prev buffer"})

vim.keymap.set("n","<leader>bp","<Cmd>BufferLinePick<CR>",{desc = "pick buffer"})
vim.keymap.set("n","<leader>bd","<Cmd>BufferLinePickClose<CR>",{desc = "pick close buffer"})
vim.keymap.set("n","<leader>bc","<Cmd>bd<CR>",{desc = "close buffer"})
 require('bufferline').setup{
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            themable = true, 
            numbers =  "ordinal",
            close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
            left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
            middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style =  'underline'
            },
            buffer_close_icon = '󰅖',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 18,
            diagnostics = "nvim_lsp" ,
            diagnostics_update_in_insert = false,
            -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return "("..count..")"
            end,
            -- NOTE: this will be called a lot so don't do any heavy processing here
            custom_filter = function(buf_number, buf_numbers)
                -- filter out filetypes you don't want to see
                if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                    return true
                end
                -- filter out by buffer name
                if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                    return true
                end
                -- filter out based on arbitrary rules
                -- e.g. filter out vim wiki buffer from tabline in your work repo
                if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                    return true
                end
                -- filter out by it's index number in list (don't show first buffer)
                if buf_numbers[1] ~= buf_number then
                    return true
                end
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer" ,
                    text_align ="center",
                    separator = true
                }
            },
            color_icons = true, -- whether or not to add the filetype icon highlights
            get_element_icon = function(element)
              -- element consists of {filetype: string, path: string, extension: string, directory: string}
              -- This can be used to change how bufferline fetches the icon
              -- for an element e.g. a buffer or a tab.
              -- e.g.
              local hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
              return hl
            end,
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = false,
            show_close_icon =  false,
            show_tab_indicators = true ,
            show_duplicate_prefix = true , -- whether to show duplicate buffer prefix
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style =  "thin" ,
            enforce_regular_tabs = false ,
            always_show_bufferline = true ,
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
            sort_by = 'insert_after_current'
        }
    }
