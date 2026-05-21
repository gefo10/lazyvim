-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Option 1: use <leader>p as prefix
--vim.keymap.set("n", "<leader>cd", function()
--  vim.lsp.buf.definition({
--    on_list = function(options)
--      if #options.items > 0 then
--        vim.lsp.util.preview_location(options.items[1].user_data, {})
--      end
--    end,
--  })
--end, { desc = "Peek Definition" })
--
--vim.keymap.set("n", "<leader>ci", function()
--  vim.lsp.buf.implementation({
--    on_list = function(options)
--      if #options.items > 0 then
--        vim.lsp.util.preview_location(options.items[1].user_data, {})
--      end
--    end,
--  })
--end, { desc = "Peek Implementation" })

vim.keymap.set("n", "<leader>dq", function()
  Snacks.picker.files({
    cwd = vim.fn.expand("~/.local/share/lazyvim/dadbod_ui"),
    args = { "-E", "tmp", "-E", "connections.json" },
  })
end, { desc = "Search DB Queries" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "<leader>dK", function()
  local ok, dap = pcall(require, "dap")
  if ok then
    pcall(dap.terminate)
    pcall(dap.disconnect, { terminateDebuggee = true })
  end
  vim.system({ "pkill", "-INT", "-f", "dlv" }, { detach = true })
  vim.notify("Detached DAP and sent SIGINT to dlv", vim.log.levels.INFO)
end, { desc = "DAP: detach + kill dlv" })
