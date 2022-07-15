return {
   -- format & linting
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.configs.null-ls"
      end,
   },

   ["Pocco81/AutoSave.nvim"] = {
      module = "autosave",
      config = function()
         require("custom.configs.autosave").autosave()
      end,
   },

   ["hashivim/vim-terraform"] = {},

}
