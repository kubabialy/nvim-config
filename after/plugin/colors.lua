function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- Transparent Background
	vim.api.nvim_set_hl(1, "Normal", { bg = "none" })	
	vim.api.nvim_set_hl(1, "NormalFloat", { bg = "none" })	
end

ColorMyPencils("rose-pine-moon")
