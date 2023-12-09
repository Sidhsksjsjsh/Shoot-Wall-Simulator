local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})
local speaker = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

local function getScript(player)
        local char = player.Character
        local weapon = char and char:FindFirstChildWhichIsA("Tool")
    
        if weapon ~= nil then
            return weapon.Name
        else
            return "Nothing"
        end
end


local T1 = Window:MakeTab({
  Name = "Main",
  Icon = "rbxassetid://",
  PremiumOnly = false
})

local T2 = Window:MakeTab({
  Name = "Egg",
  Icon = "rbxassetid://",
  PremiumOnly = false
})

local args = {
    [1] = speaker.Character:FindFirstChild("Green SMG"),
    [2] = {
        ["p"] = Vector3.new(0,0,0),
        ["pid"] = 1,
        ["part"] = workspace["Walls"]["Zone11"]["StoneBrick1"],
        ["d"] = 0,
        ["maxDist"] = 0,
        ["m"] = Enum.Material.Plastic,
        ["n"] = Vector3.new(0,0,0),
        ["t"] = 0,
        ["sid"] = 0
    }
}
local wall = {}
local Egg = {}
local wallHandler = {}

OrionLib:AddTable(workspace["Walls"],wall)
OrionLib:AddTable(workspace.Eggs,Egg)

for array = 1,#workspace["Walls"]:GetChildren() do
  OrionLib:AddTable(workspace["Walls"]["Zone" .. array],wallHandler)
end

T1:AddDropdown({
  Name = "Select zone",
  Default = wall[1],
  Options = wall,
  Callback = function(Value)
     _G.system = Value
  end    
})

T1:AddDropdown({
  Name = "Select wall",
  Default = wallHandler[1],
  Options = wallHandler,
  Callback = function(Value)
     _G.systemwlll = Value
  end    
})

T1:AddToggle({
  Name = "Auto Shoot",
  Default = false,
  Callback = function(Value)
      _G.Shoot = Value
      while wait() do
        if _G.Shoot == false then break end
        game:GetService("ReplicatedStorage")["WeaponSystem"]["Remotes"]["WeaponHit"]:FireServer(speaker.Character:FindFirstChild(getScript(speaker)),{Vector3.new(0,0,0),1,workspace["Walls"][_G.system][_G.systemwlll],0,0,Enum.Material.Plastic,Vector3.new(0,0,0),0,0})
      end
  end    
})

T1:AddToggle({
  Name = "Auto rebirth",
  Default = false,
  Callback = function(Value)
      _G.reb = Value
      while wait() do
        if _G.reb == false then break end
        game:GetService("ReplicatedStorage")["RebirthSystem"]["Remotes"]["Rebirth"]:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Gifts",
  Default = false,
  Callback = function(Value)
      _G.cg = Value
      while wait() do
        if _G.cg == false then break end
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(1)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(2)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(3)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(4)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(5)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(6)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(7)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(8)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(9)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(10)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(11)
        game:GetService("ReplicatedStorage")["GiftSystem"]["Remotes"]["Claim"]:FireServer(12)
      end
  end    
})

T2:AddDropdown({
  Name = "Select wall",
  Default = Egg[1],
  Options = Egg,
  Callback = function(Value)
     _G.systemegg = Value
  end    
})

T2:AddToggle({
  Name = "Hatch",
  Default = false,
  Callback = function(Value)
      _G.eggbypass = Value
      while wait() do
        if _G.eggbypass == false then break end
        game:GetService("ReplicatedStorage")["PetSystem"]["Remotes"]["HatchPet"]:FireServer(_G.systemegg,{})
      end
  end    
})
