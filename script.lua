local CoreGui = game:GetService("CoreGui")
local tbl = {}

for i,v in pairs(CoreGui.GetDescendants(CoreGui)) do
     if v.IsA(v, "ImageLabel") and v.Image:find('rbxasset://') then
            table.insert(tbl, v.Image)
        end
end

local hello;
hello = hookfunction(game:GetService("ContentProvider").PreloadAsync, function(self, ...)
        local Args = {...}
        if not checkcaller() and type(Args[1]) == "table" and table.find(Args[1], CoreGui) then
            Args[1] = tbl
            return hello(self, unpack(Args))
        end
    return hello(self, ...)
end)

local function football(ncm)
     if ncm == "PreloadAsync" or ncm == "preloadAsync" then
          return true
     end
     return false
end

local __namecall;

__namecall = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = {...}
    local NamecallMethod = getnamecallmethod()
    if not checkcaller() and type(Args[1]) == "table" and table.find(Args[1], CoreGui) and Self == game.GetService(game, "ContentProvider") and football(NamecallMethod) then
        Args[1] = tbl
        return __namecall(Self, unpack(Args))
    end
    return __namecall(Self, ...)
end)
