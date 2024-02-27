return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        require("chatgpt").setup({
            api_key_cmd = 'echo -n " "',
            api_host_cmd = "echo -n https://gpt.coding-jedi-knight.ru/v1",
            actions_paths = { "~/.config/nvim/lua/plugins/chatgpt-actions.json" },
            predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/CodingJediKnight/awesome-chatgpt-prompts/main/prompts.csv",
            openai_params = {
                model = "gpt-3.5-turbo",
                --model = "mixtral:8x7b-instruct-v0.1-q5_K_M",
                --frequency_penalty = 0,
                --presence_penalty = 0,
                timeout = 300,
                max_tokens = 1024,
                temperature = 0.7,
                top_p = 0.7,
                stop = "### Instruction",
            },
            openai_edit_params = {
                model = "gpt-3.5-turbo",
                --model = "mixtral:8x7b-instruct-v0.1-q5_K_M",
                --frequency_penalty = 0,
                --presence_penalty = 0,
                max_tokens = 2048,
                temperature = 0.7,
                top_p = 0.7,
                n = 1,
                stream = false,
            },
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
}
