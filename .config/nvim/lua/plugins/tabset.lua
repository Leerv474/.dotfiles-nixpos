return {
  "FotiadisM/tabset.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("tabset").setup({
      defaults = {
        tabwidth = 4,
        expandtab = true,
      },
      languages = {
        {
          filetypes = {
            "nix",
            "cpp",
            "lua",
            "html",
            "css",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "json",
            "yaml",
          },
          config = {
            tabwidth = 2,
          },
        },
      },
    })
  end,
}
