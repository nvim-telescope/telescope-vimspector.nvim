local actions = require('telescope.actions')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')


return require('telescope').register_extension {
    exports = {
        configurations = function(opts)
            opts = opts or {}

            if vim.g.loaded_vimpector == nil then
                error("Vimspector is not loaded")
            end

            local configurations = vim.api.nvim_call_function("vimspector#GetConfigurations", {})

            if vim.tbl_isempty(configurations) then
                return
            end

            pickers.new(opts, {
                prompt_title = 'Vimspector Launch',
                finder    = finders.new_table {
                    results = configurations
                },
                sorter = sorters.get_generic_fuzzy_sorter(),
                attach_mappings = function(prompt_bufnr, map)
                    local start_debugger = function()
                        local selection = actions.get_selected_entry(prompt_bufnr)
                        actions.close(prompt_bufnr)

                        vim.fn["vimspector#LaunchWithSettings"]({configuration = selection.value})
                    end

                    map('i', '<CR>', start_debugger)
                    map('n', '<CR>', start_debugger)

                    return true
                end
            }):find()
        end
    }
}
