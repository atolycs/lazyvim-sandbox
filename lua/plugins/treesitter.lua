return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {},
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      if not require("atolycs.util").isWindows() then
        vim.treesitter.language.register("markdown", "mdx")
      end
    end,
  },
}
