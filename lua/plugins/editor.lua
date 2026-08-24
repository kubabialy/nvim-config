return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").git_files() end, desc = "Find git files" },
      { "<leader>fs", function() require("telescope.builtin").live_grep({ additional_args = { "--hidden", "--glob", "!.git/*" } }) end, desc = "Search all files" },
      { "<leader>fb", function() require("telescope.builtin").buffers({ sort_lastused = true }) end, desc = "Search buffers" },
    },
    opts = {
      defaults = {
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
      },
    },
  },
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("flexoki-dark")
    end,
  },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
  { "lewis6991/gitsigns.nvim", opts = {} },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon file" },
      { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
    },
  },
}
