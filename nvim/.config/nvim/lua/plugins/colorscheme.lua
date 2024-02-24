return {
  -- add gruvbox
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_current_word = "underline"
      vim.g.gruvbox_material_colors_override = {
        ["bg0"] = { "#111", 234 },
        ["bg1"] = { "#111", 234 },
        ["bg2"] = { "#111", 234 },
        ["bg3"] = { "#1d2021", 234 },
        ["bg4"] = { "#282828", 235 },
        ["bg5"] = { "#32302f", 236 },
        ["bg_statusline1"] = { "#282828", 235 },
        ["bg_statusline2"] = { "#32302f", 236 },
        ["bg_statusline3"] = { "#45403d", 237 },
        ["grey0"] = { "#45403d", 238 },
        ["grey1"] = { "#504945", 239 },
        ["grey2"] = { "#665c54", 241 },
        ["yellow"] = { "#b47109", 136 },
        ["green"] = { "#98971a", 2 },
        ["red"] = { "#c14a4a", 88 },
        ["orange"] = { "#d79921", 3 },
        ["blue"] = { "#458588", 4 },
        ["purple"] = { "#b16286", 5 },
        ["aqua"] = { "#689d6a", 6 },
        ["bg_green"] = { "#6f8352", 100 },
        ["bg_yellow"] = { "#a96b2c", 130 },
        ["bg_red"] = { "#ae5858", 88 },
      }
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_visual = "red background"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
