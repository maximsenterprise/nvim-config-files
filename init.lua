require("maxvdec.core.init")
require("maxvdec.lazy")
-- Agrega esto al principio de tu init.lua

local function insert_sign()
	-- Obtiene el nombre del archivo con su extensión
	local file_name = vim.fn.expand("%:t")

	-- Obtiene el nombre de la carpeta actual del proyecto
	local current_folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

	-- Obtiene el año actual
	local current_year = os.date("%Y")

	-- Define el texto que queremos insertar, usando una tabla para múltiples líneas
	local lines = {
		"",
		string.format(" %s", file_name),
		string.format(" As part of the %s project", current_folder),
		string.format(" Created by Maxims Enterprise in %s", current_year),
		" --------------------------------------------------",
		string.format(" Description: %s", vim.fn.input("Description: ")),
		string.format(" Copyright (c) %s Maxims Enterprise", current_year),
	}

	if vim.bo.filetype == "python" then
		table.insert(lines, 1, '"""')
		table.insert(lines, '"""')
	end

	-- Inserta las líneas en una nueva línea al principio del archivo
	vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)

	if vim.bo.filetype == "python" then
		return
	end
	-- Mueve el cursor a la línea recién insertada
	vim.api.nvim_cmd({ cmd = "normal", args = { "gg" } }, {})
	vim.api.nvim_cmd({ cmd = "normal", args = { "V" .. #lines .. "j" } }, {})

	local not_block_langauges = {
		"asm",
		"make",
		"ld",
	}
	if vim.tbl_contains(not_block_langauges, vim.bo.filetype) then
		vim.api.nvim_cmd({ cmd = "normal", args = { "gc" } }, {})
	else
		vim.api.nvim_cmd({ cmd = "normal", args = { "gb" } }, {})
	end
end

-- Define el comando `:sign` que llama a la función `insert_sign`
vim.api.nvim_create_user_command(
	"Sign",
	insert_sign,
	{ desc = "Insert a sign block with file name, current folder, and year" }
)
