-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Downloading folke/lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
  require "utils".error("Error downloading lazy.nvim")
  return
end

lazy.setup("plugins", {
  defaults = { lazy = true },
  dev = {
    path = "~/Sources/nvim",
  },
  install = { colorscheme = { "lua-embark", "rogue" } },
  checker = { enabled = false },
  ui = {
    border = "rounded",
    custom_keys = {
      ["<localleader>l"] = false,
      ["<localleader>t"] = false,
    },
  },
  debug = false,
})
