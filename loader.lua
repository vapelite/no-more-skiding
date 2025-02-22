local function downloadFile(path, func)
	if not isfile(path) then
		local suc, res = pcall(function()
			-- Try fetching from the first repository
			local res1 = game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/'..readfile('newvape/profiles/commit.txt')..'/'..select(1, path:gsub('newvape/', '')), true)

			-- If the first repository fails, try the second repository
			if res1 == '404: Not Found' then
				return game:HttpGet('https://raw.githubusercontent.com/vapelite/no-more-skiding/'..readfile('newvape/profiles/commit.txt')..'/'..select(1, path:gsub('newvape/', '')), true)
			end

			return res1
		end)
		if not suc or res == '404: Not Found' then
			error(res)
		end
		if path:find('.lua') then
			res = '--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.\n'..res
		end
		writefile(path, res)
	end
	return (func or readfile)(path)
end
