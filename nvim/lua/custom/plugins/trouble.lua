return {
  'folke/trouble.nvim',
  cmd = { 'TroubleToggle', 'Trouble' },
  opts = { use_diagnostic_signs = true },
  keys = {
    { '<leader>td', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document [D]iagnostics' },
    { '<leader>tD', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace [D]iagnostics' },
    { '<leader>tl', '<cmd>TroubleToggle loclist<cr>', desc = '[L]ocation List' },
    { '<leader>tq', '<cmd>TroubleToggle quickfix<cr>', desc = '[Q]uickfix List' },
    { '<leader>tt', '<cmd>TodoTrouble<cr>', desc = '[T]odo list' },
    {
      '[q',
      function()
        if require('trouble').is_open() then
          require('trouble').previous { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Previous trouble/quickfix item',
    },
    {
      ']q',
      function()
        if require('trouble').is_open() then
          require('trouble').next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Next trouble/quickfix item',
    },
  },
}
