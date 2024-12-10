require('toggleterm').setup {
            open_mapping = [[\\]],
            direction = 'float',
            close_on_exit = true,
            size = 20,
            hider_numbers = true,
            auto_scroll = true,
            start_in_insert = true,
            -- automatically scroll to the bottom on terminal output
            -- This field is only relevant if direction is set to 'float'
            float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border =  'double' ,
                -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
                -- width = <value>,
                --height = <value>,
                --row = <value>,
                --col = <value>,
                winblend = 3,
                --zindex = <value>,
                title_pos = 'center',
            },
            on_open = function(term)
                vim.cmd('cd ' .. vim.fn.getcwd())  -- Change to current working directory
            end,
}

