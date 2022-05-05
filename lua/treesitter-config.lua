require('nvim-treesitter.configs').setup {
    ensure_installed = { "python", "typescript", "javascript" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
