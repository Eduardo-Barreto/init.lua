return {

    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },


    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },


    { "edluffy/hologram.nvim" },

    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn install",
    },

    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false
    },

    { "cdelledonne/vim-cmake" },


}
