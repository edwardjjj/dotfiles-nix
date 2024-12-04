return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' 󰁂 %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end
    require('ufo').setup {
      fold_virt_text_handler = handler,
      provider_selector = function(bufnr, filetype, buftype)
        return { 'lsp', 'indent' }
      end,
    }
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open All Folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close All Folds' })
    vim.keymap.set('n', 'K', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = 'Peek Folded lines' })
    vim.keymap.set('n', '[z', function()
      require('ufo').goPreviousClosedFold()
      require('ufo').peekFoldedLinesUnderCursor()
    end, { desc = 'Go Previous Fold and Peek' })
    vim.keymap.set('n', ']z', function()
      require('ufo').goNextClosedFold()
      require('ufo').peekFoldedLinesUnderCursor()
    end, { desc = 'Go Next Fold and Peek' })
  end,
}
