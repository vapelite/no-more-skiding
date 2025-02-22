local function downloadFile(path, func)
    if not isfile(path) then
        local suc, res = pcall(function()
            return game:HttpGet('https://raw.githubusercontent.com/vapelite/no-more-skiding/'..readfile('newvape/profiles/commit.txt')..'/'..select(1, path:gsub('newvape/', '')), true)
        end)
        if not suc or res == '404: Not Found' then
            error(res)
        end
        writefile(path, res)
    end
    return readfile(path)
end

if not shared.VapeDeveloper then
    local _, subbed = pcall(function() 
        return game:HttpGet('https://github.com/vapelite/no-more-skiding')
    end)
    local commit = subbed:find('currentOid')
    commit = commit and subbed:sub(commit + 13, commit + 52) or nil
    if not isfolder('newvape') then
        makefolder('newvape')
    end
    if not isfolder('newvape/profiles') then
        makefolder('newvape/profiles')
    end
    writefile('newvape/profiles/commit.txt', commit)
end

return loadstring(downloadFile('newvape/main.lua'), 'main')()
