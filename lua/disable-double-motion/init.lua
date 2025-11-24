local M = {}

function M.disableDoubles()
	function _G.lineMotion()
		local lastOperator = vim.v.operator

		if lastOperator == "d" then
			local lineContent = vim.fn.getline(".")
			if lineContent:match("%S") == nil then
				vim.api.nvim_feedkeys('"_dd', "n", true)
			else
				vim.api.nvim_feedkeys('dd', "n", true)
			end
		elseif lastOperator == "c" then
			vim.cmd('normal! ^v$h')
		else
			vim.api.nvim_feedkeys(lastOperator .. lastOperator, "n", true)
		end
	end

	vim.keymap.set("x","u", "V", { desc = "Currentline" })
	vim.keymap.set("o", "u", _G.lineMotion, { desc = "Current line" })


	local doubles = { "d", "y", "c", "=", "<", ">", "v" }
	local mode = "o"

	for _, double in ipairs(doubles) do
		vim.keymap.set(mode, double, "<NOP>")
	end
end

return M
