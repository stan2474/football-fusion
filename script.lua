local CoreGui = game:GetService("CoreGui")
local tbl = {}

for i,v in pairs(CoreGui.GetDescendants(CoreGui)) do
     if v.IsA(v, "ImageLabel") and v.Image:find('rbxasset://') then
            table.insert(tbl, v.Image)
        end
end

local wallyisani;
wallyisani = hookfunction(game:GetService("ContentProvider").PreloadAsync, function(self, ...)
        local Args = {...}
        if table.find(Args[1], CoreGui) and not checkcaller() and type(Args[1]) == "table" and table.find(Args[1], CoreGui) then
            Args[1] = tbl
            return wallyisani(self, unpack(Args))
        end
    return wallyisani(self, ...)
end)
local __namecall;

__namecall = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = {...}
    local NamecallMethod = getnamecallmethod()
    if not checkcaller() and type(Args[1]) == "table" and table.find(Args[1], CoreGui) and Self == game.GetService(game, "ContentProvider") and string.lower(NamecallMethod) == "preloadasync" then
        Args[1] = tbl
        return __namecall(Self, unpack(Args))
    end
    return __namecall(Self, ...)
end)
