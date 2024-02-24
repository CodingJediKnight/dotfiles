return {
	"lewis6991/gitsigns.nvim",
	keys = {
        {"<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", desc="[H]unk [S]tage"},
        {"<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", desc="[H]unk [R]eset"},
        {"<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", desc="[H]unk [S]tage whole buffer"},
        {"<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc="[H]unk [U]ndu"},
        {"<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", desc="[H]unk [R]eset whole buffer"},
        {"<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", desc="[H]unk [P]review"},
        {"<leader>hd", "<cmd>Gitsigns diffthis<cr>", desc="[H]unk [D]iff stage"},
        {"<leader>hD", "<cmd>Gitsigns diffthis ~<cr>", desc="[H]unk [D]iff head"},
        {"<leader>ht", "<cmd>Gitsigns toggle_deleted<cr>", desc="[H]unk [T]oggle dzeleted"},
        {"<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc="[T]oggle [B]lame"},
	},
}
