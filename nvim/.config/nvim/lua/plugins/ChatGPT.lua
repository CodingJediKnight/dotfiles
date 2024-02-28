return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			api_key_cmd = 'echo -n " "',
			api_host_cmd = "echo -n https://gpt.coding-jedi-knight.ru/v1",
			actions_paths = ({ "~/.config/nvim/lua/plugins/chatgpt-actions.json" }),
			predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/CodingJediKnight/awesome-chatgpt-prompts/main/prompts.csv",
			openai_params = {
				model = "gpt-3.5-turbo",
				max_tokens = 4096,
				temperature = 0.7,
				top_p = 0.7,
				stop = "### Instruction",
			},
			openai_edit_params = {
				model = "gpt-3.5-turbo",
				max_tokens = 4096,
				temperature = 0.7,
				top_p = 0.7,
				stop = "### Instruction",
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>oc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
		{ "<leader>oe", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
		{ "<leader>og", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
		{ "<leader>ot", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
		{ "<leader>ok", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
		{ "<leader>od", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
		{ "<leader>oa", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
		{ "<leader>oo", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
		{ "<leader>os", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
		{ "<leader>of", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
		{ "<leader>ox", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
		{ "<leader>or", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
		{
			"<leader>ol",
			"<cmd>ChatGPTRun code_readability_analysis<CR>",
			desc = "Code Readability Analysis",
			mode = { "n", "v" },
		},
	},
}
