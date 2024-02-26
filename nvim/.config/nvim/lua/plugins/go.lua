return {
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("dapui").setup()
            vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint'})
        end,
        keys = {
            {mode = "n", "<leader>dt", ":DapUiToggle<CR>", desc = "Dap Ui Toggle"},
            {mode = "n", "<leader>db", ":DapToggleBreakpoint<CR>", desc = "Dap Toggle Breakpoint"},
            {mode = "n", "<leader>dc", ":DapContinue<CR>", desc = "Dap Continue"},
            {mode = "n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", desc = "Dap Reset"},
        },
    },
    { "theHamsta/nvim-dap-virtual-text" },
    { "nvim-telescope/telescope-dap.nvim" },
    {
        "leoluz/nvim-dap-go",
        config = function()
            require("dap-go").setup()
        end,
    },
}
