function tableConcat(t1, t2)
	-- loop over t2 items
	for _, v in ipairs(t2) do
		-- append entries to t1
		table.insert(t1, v)
	end
	-- return merged table
	return t1
end

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
					"hl",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = tableConcat(vim.api.nvim_get_runtime_file("", true), { "/usr/share/hypr/stubs" }),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

vim.lsp.config("roslyn", {
	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			csharp_enable_inlay_hints_for_implicit_variable_types = true,
		},
		["csharp|code_lens"] = {
			dotnet_enable_references_code_lens = true,
		},
	},
})

vim.lsp.config("tailwindcss", {
	settings = {
		tailwindCSS = {
			-- strings passed to these functions
			classFunctions = { "cn", "clsx", "cva", "cx", "tv", "twMerge", "twJoin" },
			experimental = {
				-- strings inside an object/var named *class/*classes/*className/*styles/*variants
				-- ponytail: [^}] stops at the first `}`, so nested objects lose the tail.
				-- Swap in a balanced-brace pattern only if that actually bites.
				classRegex = {
					{
						"(?:[Cc]lass(?:es|Name)?|[Ss]tyles|[Vv]ariants)\\s*[:=]\\s*\\{([^}]*)\\}",
						"[\"'`]([^\"'`]+)[\"'`]",
					},
				},
			},
		},
	},
})

local servers = require("harry.lsp.servers")
vim.lsp.enable(servers)

vim.lsp.inlay_hint.enable(false)

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})
