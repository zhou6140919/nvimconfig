packer = require("packer")
packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- 你的插件列表...
		-- colorscheme
		use("folke/tokyonight.nvim")
		use({ "catppuccin/nvim", as = "catppuccin" })
		-- nvim-tree
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		--bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		--lualine
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- telescope extensions
		use("LinArcX/telescope-env.nvim")
		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- project
		use("ahmedkhalf/project.nvim")
		-- treesitter （新增）
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		--------------------- LSP --------------------
		use("williamboman/mason.nvim")
		-- Lspconfig
		use("williamboman/mason-lspconfig.nvim")
		use("neovim/nvim-lspconfig")
		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-- ui
		use("tami5/lspsaga.nvim")
		use("onsails/lspkind-nvim")
		use({ "xiyaowong/nvim-transparent", as = "transparent" })
		use("norcalli/nvim-colorizer.lua")
		-- copilot
		-- use({
		-- 	"zbirenbaum/copilot.lua",
		-- 	event = "VimEnter",
		-- 	config = function()
		-- 		vim.defer_fn(function()
		-- 			require("copilot").setup()
		-- 		end, 100)
		-- 	end,
		-- })
		-- use({
		-- 	"zbirenbaum/copilot-cmp",
		-- 	after = { "copilot.lua" },
		-- 	config = function()
		-- 		require("copilot_cmp").setup({
		-- 			method = "getCompletionsCycling",
		-- 		})
		-- 	end,
		-- })
		-- autopairs
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})
		-- formatter
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		-- auto complete
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		-- use("hrsh7th/cmp-vsnip")
		use({ "L3MON4D3/LuaSnip" })
		use({ "saadparwaiz1/cmp_luasnip" })
		use("hrsh7th/cmp-cmdline")
		use("rafamadriz/friendly-snippets")
	end,
	config = {
		-- 以浮动窗口打开安装列表
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
	},
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
