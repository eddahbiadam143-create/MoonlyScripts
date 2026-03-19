if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end

if setfpscap then setfpscap(1000000) end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")

local plr = Players.LocalPlayer
local CommF_ = ReplicatedStorage.Remotes.CommF_

World1 = game.PlaceId == 2753915549
World2 = game.PlaceId == 4442272183
World3 = game.PlaceId == 7449423635

Mon = nil
LevelQuest = 1
NameQuest = nil
NameMon = nil
CFrameQuest = nil
CFrameMon = nil
PosMon = CFrame.new(0,35,0)
MonFarm = ""
Pos = CFrame.new(0,35,0)
Skillaimbot = false
AimBotSkillPosition = Vector3.new(0,0,0)
UseSkill = false
UseGunSkill = false
SelectWeaponGun = nil
BringMobDistance = 250
_G.StopTween = false

_G.S = {
    Main = {
        ["Select Weapon"]="Melee",["Farm Level Method"]="Quest",["Auto Farm"]=false,
        ["Auto Fast Farm"]=false,["Mastery Method"]="Quest",["Auto Farm Fruit Mastery"]=false,
        ["Auto Farm Gun Mastery"]=false,["Selected Mastery Sword"]=nil,["Auto Farm Sword Mastery"]=false,
        ["Auto Summon Tyrant Of The Skies"]=false,["Auto Kill Tyrant Of The Skies"]=false,
        ["Selected Mon"]=nil,["Auto Farm Mon"]=false,["Selected Boss"]=nil,
        ["Auto Farm Boss"]=false,["Auto Farm All Boss"]=false,["Selected Weapon"]=nil,
    },
    Farm = {
        ["Auto Elite Hunter"]=false,["Auto Elite Hunter Hop"]=false,
        ["Selected Bone Farm Method"]="Quest",["Auto Farm Bone"]=false,
        ["Auto Random Surprise"]=false,["Auto Pirate Raid"]=false,
        ["Auto Farm Chest Tween"]=false,["Auto Farm Chest Instant"]=false,
        ["Auto Stop Items"]=false,["Auto Farm Katakuri"]=false,
        ["Auto Spawn Cake Prince"]=false,["Auto Kill Cake Prince"]=false,
        ["Auto Kill Dough King"]=false,["Selected Material"]=nil,["Auto Farm Material"]=false,
    },
    Setting = {
        ["Spin Position"]=false,["Farm Distance"]=35,["Player Tween Speed"]=350,
        ["Bring Mob"]=true,["Bring Mob Mode"]="Normal",["Fast Attack Mode"]="Normal",
        ["Attack Aura"]=false,["Hide Notification"]=false,["Hide Damage Text"]=true,
        ["Black Screen"]=false,["White Screen"]=false,["Mastery Health"]=25,
        ["Fruit Mastery Skill Z"]=true,["Fruit Mastery Skill X"]=true,
        ["Fruit Mastery Skill C"]=true,["Fruit Mastery Skill V"]=false,
        ["Fruit Mastery Skill F"]=false,["Gun Mastery Skill Z"]=true,
        ["Gun Mastery Skill X"]=true,["Auto Set Spawn Point"]=true,
        ["Auto Observation"]=false,["Auto Haki"]=true,["Auto Rejoin"]=true,
    },
    Stats = {
        ["Auto Add Melee Stats"]=false,["Auto Add Defense Stats"]=false,
        ["Auto Add Devil Fruit Stats"]=false,["Auto Add Sword Stats"]=false,
        ["Auto Add Gun Stats"]=false,["Point Stats"]=1,
    },
    Items = {
        ["Auto Second Sea"]=false,["Auto Third Sea"]=false,["Auto Farm Factory"]=false,
        ["Auto Super Human"]=false,["Auto Death Step"]=false,["Auto Fishman Karate"]=false,
        ["Auto Electric Claw"]=false,["Auto Dragon Talon"]=false,["Auto God Human"]=false,
        ["Auto Saber"]=false,["Auto Buddy Sword"]=false,["Auto Soul Guitar"]=false,
        ["Auto Rengoku"]=false,["Auto Hallow Scythe"]=false,["Auto Warden Sword"]=false,
        ["Auto Yama"]=false,["Auto Tushita"]=false,["Auto Greybeard"]=false,
        ["Auto Dragon Trident"]=false,["Auto Pole"]=false,["Auto Shark Saw"]=false,
        ["Auto Dark Dagger"]=false,["Auto Canvander"]=false,["Auto Holy Torch"]=false,
        ["Auto Bartilo Quest"]=false,["Auto Arena Trainer"]=false,["Auto Swan Glasses"]=false,
    },
    Esp = {
        ["ESP Player"]=false,["ESP Chest"]=false,["ESP DevilFruit"]=false,
        ["ESP RealFruit"]=false,["ESP Flower"]=false,["ESP Island"]=false,
        ["ESP Npc"]=false,["ESP Sea Beast"]=false,["ESP Monster"]=false,
        ["ESP Mirage"]=false,["ESP Kitsune"]=false,["ESP Frozen"]=false,
    },
    SeaEvent = {
        ["Selected Boat"]="Guardian",["Selected Zone"]="Zone 5",["Boat Tween Speed"]=300,
        ["Sail Boat"]=false,["Auto Farm Shark"]=true,["Auto Farm Piranha"]=true,
        ["Auto Farm Fish Crew Member"]=true,["Auto Farm Ghost Ship"]=true,
        ["Auto Farm Pirate Brigade"]=true,["Auto Farm Pirate Grand Brigade"]=true,
        ["Auto Farm Terrorshark"]=true,["Auto Farm Seabeasts"]=true,
    },
    SeaStack = {
        ["Tween To Frozen Dimension"]=false,["Summon Frozen Dimension"]=false,
        ["Tween To Kitsune Island"]=false,["Summon Kitsune Island"]=false,
        ["Auto Collect Azure Ember"]=false,["Set Azure Ember"]=20,
        ["Auto Trade Azure Ember"]=false,["Tween To Mirage Island"]=false,
        ["Auto Attack Seabeasts"]=false,["Summon Prehistoric Island"]=false,
        ["Tween To Prehistoric Island"]=false,["Auto Kill Lava Golem"]=false,
    },
    SettingSea = {
        Lightning=false,["Increase Boat Speed"]=false,["No Clip Rock"]=false,
        ["Use Devil Fruit Skill"]=true,["Use Melee Skill"]=true,
        ["Use Sword Skill"]=true,["Use Gun Skill"]=true,
        ["Devil Fruit Z Skill"]=true,["Devil Fruit X Skill"]=true,
        ["Devil Fruit C Skill"]=true,["Devil Fruit V Skill"]=false,
        ["Devil Fruit F Skill"]=false,["Melee Z Skill"]=true,
        ["Melee X Skill"]=true,["Melee C Skill"]=true,["Melee V Skill"]=true,
    },
    Race = {
        ["Selected Place"]=nil,["Auto Buy Gear"]=false,
        ["Tween To Highest Mirage"]=false,["Find Blue Gear"]=false,
        ["Look Moon Ability"]=false,["Auto Train"]=false,
        ["Auto Kill Player After Trial"]=false,["Auto Trial"]=false,
    },
    Combat = {
        ["Auto Kill Player Quest"]=false,["Aimbot Gun"]=false,
        ["Aimbot Skill"]=false,["Enable PvP"]=false,
    },
    Raid = {
        ["Selected Chip"]=nil,["Auto Raid"]=false,["Auto Awaken"]=false,
        ["Price Devil Fruit"]=1000000,["Unstore Devil Fruit"]=false,["Law Raid"]=false,
    },
    Shop = {["Auto Buy Legendary Sword"]=false,["Auto Buy Haki Color"]=false},
    LocalPlayer = {
        ["Active Race V3"]=false,["Active Race V4"]=true,
        ["Walk On Water"]=true,["No Clip"]=false,
    },
    DragonDojo = {["Auto Farm Blaze Ember"]=false},
    Fruit = {
        ["Auto Buy Random Fruit"]=false,["Store Rarity Fruit"]="Common - Mythical",
        ["Auto Store Fruit"]=false,["Fruit Notification"]=false,
        ["Teleport To Fruit"]=false,["Tween To Fruit"]=false,
    },
    Misc = {["Hide Chat"]=false,["Hide Leaderboard"]=false,["Anti AFK"]=false},
}

local function SaveSetting()
    if writefile and isfile and isfolder then
        if not isfolder("BFWandHub") then makefolder("BFWandHub") end
        writefile("BFWandHub/"..plr.Name..".json", HttpService:JSONEncode(_G.S))
    end
end

local function LoadSetting()
    if readfile and isfile and isfolder then
        if not isfolder("BFWandHub") then makefolder("BFWandHub") end
        local path = "BFWandHub/"..plr.Name..".json"
        if isfile(path) then
            local ok, data = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
            if ok and data then
                for k,v in pairs(data) do _G.S[k]=v end
            end
        end
    end
end

LoadSetting()

local function InstantTp(cf)
    plr.Character.HumanoidRootPart.CFrame = cf
end

local function TweenPlayer(pos)
    task.spawn(function()
        pcall(function()
            local ch = plr.Character
            local hrp = ch.HumanoidRootPart
            if plr:DistanceFromCharacter(pos.Position) <= 50 then
                hrp.CFrame = pos
                return
            end
            if not ch:FindFirstChild("Root") then
                local r = Instance.new("Part",ch)
                r.Size = Vector3.new(1,0.5,1)
                r.Name = "Root"
                r.Anchored = true
                r.Transparency = 1
                r.CanCollide = false
                r.CFrame = hrp.CFrame
            end
            local dist = (hrp.Position - pos.Position).Magnitude
            local spd = _G.S.Setting["Player Tween Speed"] or 350
            local tw = TweenService:Create(ch.Root, TweenInfo.new(dist/spd, Enum.EasingStyle.Linear), {CFrame=pos})
            tw:Play()
            tw.Completed:Wait()
            if ch:FindFirstChild("Root") then
                hrp.CFrame = ch.Root.CFrame
                ch.Root:Destroy()
            end
        end)
    end)
end

task.spawn(function()
    while task.wait() do
        pcall(function()
            local ch = plr.Character
            if ch and ch:FindFirstChild("Root") and ch:FindFirstChild("HumanoidRootPart") then
                ch.HumanoidRootPart.CFrame = ch.Root.CFrame
            end
        end)
    end
end)

local function StopTween(state)
    if not state then
        _G.StopTween = true
        TweenPlayer(plr.Character.HumanoidRootPart.CFrame)
        local bc = plr.Character.HumanoidRootPart:FindFirstChild("BodyClip")
        if bc then bc:Destroy() end
        _G.StopTween = false
    end
end

local function EquipWeapon(name)
    if not name then return end
    if not plr.Character:FindFirstChild(name) then
        local tool = plr.Backpack:FindFirstChild(name)
        if tool then plr.Character.Humanoid:EquipTool(tool) end
    end
end

local function UnEquipWeapon(name)
    if not name then return end
    local tool = plr.Character:FindFirstChild(name)
    if tool then tool.Parent = plr.Backpack end
end

local function AutoHaki()
    if not plr.Character:FindFirstChild("HasBuso") then
        pcall(function() CommF_:InvokeServer("Buso") end)
    end
end

local function Attack()
    pcall(function()
        local ch = plr.Character
        local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local enemies = {}
        for _, folder in ipairs({workspace.Enemies, workspace.Characters}) do
            for _, v in ipairs(folder:GetChildren()) do
                local vhrp = v:FindFirstChild("HumanoidRootPart")
                local hum = v:FindFirstChild("Humanoid")
                if v ~= ch and vhrp and hum and hum.Health > 0 and (vhrp.Position - hrp.Position).Magnitude <= 60 then
                    for _, part in ipairs(v:GetChildren()) do
                        if part:IsA("BasePart") then table.insert(enemies,{v,part}) end
                    end
                end
            end
        end
        if #enemies == 0 then return end
        local head = enemies[1][1]:FindFirstChild("Head")
        if not head then return end
        local net = ReplicatedStorage.Modules.Net
        net["RE/RegisterAttack"]:FireServer()
        net["RE/RegisterHit"]:FireServer(head, enemies)
    end)
end

local function RemoveAnimation(mon)
    pcall(function()
        mon.Humanoid:ChangeState(11)
        if mon.Humanoid:FindFirstChild("Animator") then mon.Humanoid.Animator:Destroy() end
    end)
end

local function GetCountMaterials(name)
    local ok, inv = pcall(function() return CommF_:InvokeServer("getInventory") end)
    if not ok then return 0 end
    for _, v in pairs(inv) do if v.Name == name then return v.Count end end
    return 0
end

local function CheckSeaBeast()
    if workspace:FindFirstChild("SeaBeasts") then
        for _, v in pairs(workspace.SeaBeasts:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                return true
            end
        end
    end
    return false
end

local function Hop()
    pcall(function()
        local m = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))()
        m:Teleport(game.PlaceId)
    end)
end

local function UseAllSkill()
    for _, tip in ipairs({"Blox Fruit","Melee","Sword","Gun"}) do
        for _, v in pairs(plr.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == tip then
                plr.Character.Humanoid:EquipTool(v)
                for _, key in ipairs({"Z","X","C","V","F"}) do
                    VirtualInputManager:SendKeyEvent(true,key,false,game)
                    task.wait(0)
                    VirtualInputManager:SendKeyEvent(false,key,false,game)
                end
                break
            end
        end
    end
end

spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg,false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method)=="FireServer" and tostring(args[1])=="RemoteEvent" then
            if tostring(args[2])~="true" and tostring(args[2])~="false" then
                if Skillaimbot then
                    args[2] = AimBotSkillPosition
                    return old(unpack(args))
                end
            end
        end
        return old(...)
    end)
end)

spawn(function()
    local angle = 0
    while wait() do
        if _G.S.Setting["Spin Position"] then
            local r = math.rad(angle)
            local fd = _G.S.Setting["Farm Distance"] or 35
            Pos = CFrame.new(math.cos(r)*20, fd, math.sin(r)*20)
            angle = (angle+30)%360
        else
            Pos = CFrame.new(0, _G.S.Setting["Farm Distance"] or 35, 0)
        end
    end
end)

local function CheckQuest()
    local MyLevel = plr.Data.Level.Value
    if World1 then
        if MyLevel<=9 then Mon="Bandit";LevelQuest=1;NameQuest="BanditQuest1";NameMon="Bandit";CFrameQuest=CFrame.new(1059,15,1550);CFrameMon=CFrame.new(1045,27,1560)
        elseif MyLevel<=14 then Mon="Monkey";LevelQuest=1;NameQuest="JungleQuest";NameMon="Monkey";CFrameQuest=CFrame.new(-1598,35,153);CFrameMon=CFrame.new(-1448,67,11)
        elseif MyLevel<=29 then Mon="Gorilla";LevelQuest=2;NameQuest="JungleQuest";NameMon="Gorilla";CFrameQuest=CFrame.new(-1598,35,153);CFrameMon=CFrame.new(-1129,40,-525)
        elseif MyLevel<=39 then Mon="Pirate";LevelQuest=1;NameQuest="BuggyQuest1";NameMon="Pirate";CFrameQuest=CFrame.new(-1141,4,3831);CFrameMon=CFrame.new(-1103,13,3896)
        elseif MyLevel<=59 then Mon="Brute";LevelQuest=2;NameQuest="BuggyQuest1";NameMon="Brute";CFrameQuest=CFrame.new(-1141,4,3831);CFrameMon=CFrame.new(-1140,14,4322)
        elseif MyLevel<=74 then Mon="Desert Bandit";LevelQuest=1;NameQuest="DesertQuest";NameMon="Desert Bandit";CFrameQuest=CFrame.new(894,5,4392);CFrameMon=CFrame.new(924,6,4481)
        elseif MyLevel<=89 then Mon="Desert Officer";LevelQuest=2;NameQuest="DesertQuest";NameMon="Desert Officer";CFrameQuest=CFrame.new(894,5,4392);CFrameMon=CFrame.new(1608,8,4371)
        elseif MyLevel<=99 then Mon="Snow Bandit";LevelQuest=1;NameQuest="SnowQuest";NameMon="Snow Bandit";CFrameQuest=CFrame.new(1389,88,-1298);CFrameMon=CFrame.new(1354,87,-1393)
        elseif MyLevel<=119 then Mon="Snowman";LevelQuest=2;NameQuest="SnowQuest";NameMon="Snowman";CFrameQuest=CFrame.new(1389,88,-1298);CFrameMon=CFrame.new(1201,144,-1550)
        elseif MyLevel<=149 then Mon="Chief Petty Officer";LevelQuest=1;NameQuest="MarineQuest2";NameMon="Chief Petty Officer";CFrameQuest=CFrame.new(-5039,27,4324);CFrameMon=CFrame.new(-4881,22,4273)
        elseif MyLevel<=174 then Mon="Sky Bandit";LevelQuest=1;NameQuest="SkyQuest";NameMon="Sky Bandit";CFrameQuest=CFrame.new(-4839,716,-2619);CFrameMon=CFrame.new(-4953,295,-2899)
        elseif MyLevel<=189 then Mon="Dark Master";LevelQuest=2;NameQuest="SkyQuest";NameMon="Dark Master";CFrameQuest=CFrame.new(-4839,716,-2619);CFrameMon=CFrame.new(-5259,391,-2229)
        elseif MyLevel<=209 then Mon="Prisoner";LevelQuest=1;NameQuest="PrisonerQuest";NameMon="Prisoner";CFrameQuest=CFrame.new(5308,1,475);CFrameMon=CFrame.new(5098,0,474)
        elseif MyLevel<=249 then Mon="Dangerous Prisoner";LevelQuest=2;NameQuest="PrisonerQuest";NameMon="Dangerous Prisoner";CFrameQuest=CFrame.new(5308,1,475);CFrameMon=CFrame.new(5654,15,866)
        elseif MyLevel<=274 then Mon="Toga Warrior";LevelQuest=1;NameQuest="ColosseumQuest";NameMon="Toga Warrior";CFrameQuest=CFrame.new(-1580,6,-2986);CFrameMon=CFrame.new(-1820,51,-2740)
        elseif MyLevel<=299 then Mon="Gladiator";LevelQuest=2;NameQuest="ColosseumQuest";NameMon="Gladiator";CFrameQuest=CFrame.new(-1580,6,-2986);CFrameMon=CFrame.new(-1292,56,-3339)
        elseif MyLevel<=324 then Mon="Military Soldier";LevelQuest=1;NameQuest="MagmaQuest";NameMon="Military Soldier";CFrameQuest=CFrame.new(-5313,10,8515);CFrameMon=CFrame.new(-5411,11,8454)
        elseif MyLevel<=374 then Mon="Military Spy";LevelQuest=2;NameQuest="MagmaQuest";NameMon="Military Spy";CFrameQuest=CFrame.new(-5313,10,8515);CFrameMon=CFrame.new(-5802,86,8828)
        elseif MyLevel<=399 then Mon="Fishman Warrior";LevelQuest=1;NameQuest="FishmanQuest";NameMon="Fishman Warrior";CFrameQuest=CFrame.new(61122,18,1569);CFrameMon=CFrame.new(60878,18,1543)
        elseif MyLevel<=449 then Mon="Fishman Commando";LevelQuest=2;NameQuest="FishmanQuest";NameMon="Fishman Commando";CFrameQuest=CFrame.new(61122,18,1569);CFrameMon=CFrame.new(61922,18,1493)
        elseif MyLevel<=474 then Mon="God's Guard";LevelQuest=1;NameQuest="SkyExp1Quest";NameMon="God's Guard";CFrameQuest=CFrame.new(-4721,843,-1949);CFrameMon=CFrame.new(-4710,845,-1927)
        elseif MyLevel<=524 then Mon="Shanda";LevelQuest=2;NameQuest="SkyExp1Quest";NameMon="Shanda";CFrameQuest=CFrame.new(-7859,5544,-381);CFrameMon=CFrame.new(-7678,5566,-497)
        elseif MyLevel<=549 then Mon="Royal Squad";LevelQuest=1;NameQuest="SkyExp2Quest";NameMon="Royal Squad";CFrameQuest=CFrame.new(-7906,5634,-1411);CFrameMon=CFrame.new(-7624,5658,-1467)
        elseif MyLevel<=624 then Mon="Royal Soldier";LevelQuest=2;NameQuest="SkyExp2Quest";NameMon="Royal Soldier";CFrameQuest=CFrame.new(-7906,5634,-1411);CFrameMon=CFrame.new(-7836,5645,-1790)
        elseif MyLevel<=649 then Mon="Galley Pirate";LevelQuest=1;NameQuest="FountainQuest";NameMon="Galley Pirate";CFrameQuest=CFrame.new(5259,37,4050);CFrameMon=CFrame.new(5551,78,3930)
        else Mon="Galley Captain";LevelQuest=2;NameQuest="FountainQuest";NameMon="Galley Captain";CFrameQuest=CFrame.new(5259,37,4050);CFrameMon=CFrame.new(5441,42,4950) end
    elseif World2 then
        if MyLevel<=724 then Mon="Raider";LevelQuest=1;NameQuest="Area1Quest";NameMon="Raider";CFrameQuest=CFrame.new(-429,71,1836);CFrameMon=CFrame.new(-728,52,2345)
        elseif MyLevel<=774 then Mon="Mercenary";LevelQuest=2;NameQuest="Area1Quest";NameMon="Mercenary";CFrameQuest=CFrame.new(-429,71,1836);CFrameMon=CFrame.new(-1004,80,1424)
        elseif MyLevel<=799 then Mon="Swan Pirate";LevelQuest=1;NameQuest="Area2Quest";NameMon="Swan Pirate";CFrameQuest=CFrame.new(638,71,918);CFrameMon=CFrame.new(1068,137,1322)
        elseif MyLevel<=874 then Mon="Factory Staff";LevelQuest=2;NameQuest="Area2Quest";NameMon="Factory Staff";CFrameQuest=CFrame.new(632,73,918);CFrameMon=CFrame.new(73,81,-27)
        elseif MyLevel<=899 then Mon="Marine Lieutenant";LevelQuest=1;NameQuest="MarineQuest3";NameMon="Marine Lieutenant";CFrameQuest=CFrame.new(-2440,71,-3216);CFrameMon=CFrame.new(-2821,75,-3070)
        elseif MyLevel<=949 then Mon="Marine Captain";LevelQuest=2;NameQuest="MarineQuest3";NameMon="Marine Captain";CFrameQuest=CFrame.new(-2440,71,-3216);CFrameMon=CFrame.new(-1861,80,-3254)
        elseif MyLevel<=974 then Mon="Zombie";LevelQuest=1;NameQuest="ZombieQuest";NameMon="Zombie";CFrameQuest=CFrame.new(-5497,47,-795);CFrameMon=CFrame.new(-5657,78,-928)
        elseif MyLevel<=999 then Mon="Vampire";LevelQuest=2;NameQuest="ZombieQuest";NameMon="Vampire";CFrameQuest=CFrame.new(-5497,47,-795);CFrameMon=CFrame.new(-6037,32,-1340)
        elseif MyLevel<=1049 then Mon="Snow Trooper";LevelQuest=1;NameQuest="SnowMountainQuest";NameMon="Snow Trooper";CFrameQuest=CFrame.new(609,400,-5372);CFrameMon=CFrame.new(549,427,-5563)
        elseif MyLevel<=1099 then Mon="Winter Warrior";LevelQuest=2;NameQuest="SnowMountainQuest";NameMon="Winter Warrior";CFrameQuest=CFrame.new(609,400,-5372);CFrameMon=CFrame.new(1142,475,-5199)
        elseif MyLevel<=1124 then Mon="Lab Subordinate";LevelQuest=1;NameQuest="IceSideQuest";NameMon="Lab Subordinate";CFrameQuest=CFrame.new(-6064,15,-4902);CFrameMon=CFrame.new(-5707,15,-4513)
        elseif MyLevel<=1174 then Mon="Horned Warrior";LevelQuest=2;NameQuest="IceSideQuest";NameMon="Horned Warrior";CFrameQuest=CFrame.new(-6064,15,-4902);CFrameMon=CFrame.new(-6341,15,-5723)
        elseif MyLevel<=1199 then Mon="Magma Ninja";LevelQuest=1;NameQuest="FireSideQuest";NameMon="Magma Ninja";CFrameQuest=CFrame.new(-5428,15,-5299);CFrameMon=CFrame.new(-5449,76,-5808)
        elseif MyLevel<=1249 then Mon="Lava Pirate";LevelQuest=2;NameQuest="FireSideQuest";NameMon="Lava Pirate";CFrameQuest=CFrame.new(-5428,15,-5299);CFrameMon=CFrame.new(-5213,49,-4701)
        elseif MyLevel<=1274 then Mon="Ship Deckhand";LevelQuest=1;NameQuest="ShipQuest1";NameMon="Ship Deckhand";CFrameQuest=CFrame.new(1037,125,32911);CFrameMon=CFrame.new(1212,150,33059)
        elseif MyLevel<=1299 then Mon="Ship Engineer";LevelQuest=2;NameQuest="ShipQuest1";NameMon="Ship Engineer";CFrameQuest=CFrame.new(1037,125,32911);CFrameMon=CFrame.new(919,43,32779)
        elseif MyLevel<=1349 then Mon="Arctic Warrior";LevelQuest=1;NameQuest="FrostQuest";NameMon="Arctic Warrior";CFrameQuest=CFrame.new(5667,26,-6486);CFrameMon=CFrame.new(5966,62,-6179)
        elseif MyLevel<=1424 then Mon="Snow Lurker";LevelQuest=2;NameQuest="FrostQuest";NameMon="Snow Lurker";CFrameQuest=CFrame.new(5667,26,-6486);CFrameMon=CFrame.new(5407,69,-6880)
        elseif MyLevel<=1449 then Mon="Sea Soldier";LevelQuest=1;NameQuest="ForgottenQuest";NameMon="Sea Soldier";CFrameQuest=CFrame.new(-3054,235,-10142);CFrameMon=CFrame.new(-3028,64,-9775)
        else Mon="Water Fighter";LevelQuest=2;NameQuest="ForgottenQuest";NameMon="Water Fighter";CFrameQuest=CFrame.new(-3054,235,-10142);CFrameMon=CFrame.new(-3352,285,-10534) end
    elseif World3 then
        if MyLevel<=1524 then Mon="Pirate Millionaire";LevelQuest=1;NameQuest="PiratePortQuest";NameMon="Pirate Millionaire";CFrameQuest=CFrame.new(-290,42,5581);CFrameMon=CFrame.new(-245,47,5584)
        elseif MyLevel<=1574 then Mon="Pistol Billionaire";LevelQuest=2;NameQuest="PiratePortQuest";NameMon="Pistol Billionaire";CFrameQuest=CFrame.new(-290,42,5581);CFrameMon=CFrame.new(-187,86,6013)
        elseif MyLevel<=1599 then Mon="Dragon Crew Warrior";LevelQuest=1;NameQuest="AmazonQuest";NameMon="Dragon Crew Warrior";CFrameQuest=CFrame.new(5832,51,-1101);CFrameMon=CFrame.new(6141,51,-1340)
        elseif MyLevel<=1624 then Mon="Dragon Crew Archer";LevelQuest=2;NameQuest="AmazonQuest";NameMon="Dragon Crew Archer";CFrameQuest=CFrame.new(5833,51,-1103);CFrameMon=CFrame.new(6616,441,446)
        elseif MyLevel<=1649 then Mon="Female Islander";LevelQuest=1;NameQuest="AmazonQuest2";NameMon="Female Islander";CFrameQuest=CFrame.new(5446,601,749);CFrameMon=CFrame.new(4685,735,815)
        elseif MyLevel<=1699 then Mon="Giant Islander";LevelQuest=2;NameQuest="AmazonQuest2";NameMon="Giant Islander";CFrameQuest=CFrame.new(5446,601,749);CFrameMon=CFrame.new(4729,590,-36)
        elseif MyLevel<=1724 then Mon="Marine Commodore";LevelQuest=1;NameQuest="MarineTreeIsland";NameMon="Marine Commodore";CFrameQuest=CFrame.new(2180,27,-6741);CFrameMon=CFrame.new(2286,73,-7159)
        elseif MyLevel<=1774 then Mon="Marine Rear Admiral";LevelQuest=2;NameQuest="MarineTreeIsland";NameMon="Marine Rear Admiral";CFrameQuest=CFrame.new(2179,28,-6740);CFrameMon=CFrame.new(3656,160,-7001)
        elseif MyLevel<=1799 then Mon="Fishman Raider";LevelQuest=1;NameQuest="DeepForestIsland3";NameMon="Fishman Raider";CFrameQuest=CFrame.new(-10581,330,-8761);CFrameMon=CFrame.new(-10407,331,-8368)
        elseif MyLevel<=1824 then Mon="Fishman Captain";LevelQuest=2;NameQuest="DeepForestIsland3";NameMon="Fishman Captain";CFrameQuest=CFrame.new(-10581,330,-8761);CFrameMon=CFrame.new(-10994,352,-9002)
        elseif MyLevel<=1849 then Mon="Forest Pirate";LevelQuest=1;NameQuest="DeepForestIsland";NameMon="Forest Pirate";CFrameQuest=CFrame.new(-13234,331,-7625);CFrameMon=CFrame.new(-13274,332,-7769)
        elseif MyLevel<=1899 then Mon="Mythological Pirate";LevelQuest=2;NameQuest="DeepForestIsland";NameMon="Mythological Pirate";CFrameQuest=CFrame.new(-13234,331,-7625);CFrameMon=CFrame.new(-13680,501,-6991)
        elseif MyLevel<=1924 then Mon="Jungle Pirate";LevelQuest=1;NameQuest="DeepForestIsland2";NameMon="Jungle Pirate";CFrameQuest=CFrame.new(-12680,389,-9902);CFrameMon=CFrame.new(-12256,331,-10485)
        elseif MyLevel<=1974 then Mon="Musketeer Pirate";LevelQuest=2;NameQuest="DeepForestIsland2";NameMon="Musketeer Pirate";CFrameQuest=CFrame.new(-12680,389,-9902);CFrameMon=CFrame.new(-13457,391,-9859)
        elseif MyLevel<=1999 then Mon="Reborn Skeleton";LevelQuest=1;NameQuest="HauntedQuest1";NameMon="Reborn Skeleton";CFrameQuest=CFrame.new(-9479,141,5566);CFrameMon=CFrame.new(-8763,165,6159)
        elseif MyLevel<=2024 then Mon="Living Zombie";LevelQuest=2;NameQuest="HauntedQuest1";NameMon="Living Zombie";CFrameQuest=CFrame.new(-9479,141,5566);CFrameMon=CFrame.new(-10144,138,5838)
        elseif MyLevel<=2049 then Mon="Demonic Soul";LevelQuest=1;NameQuest="HauntedQuest2";NameMon="Demonic Soul";CFrameQuest=CFrame.new(-9516,172,6078);CFrameMon=CFrame.new(-9505,172,6158)
        elseif MyLevel<=2074 then Mon="Posessed Mummy";LevelQuest=2;NameQuest="HauntedQuest2";NameMon="Posessed Mummy";CFrameQuest=CFrame.new(-9516,172,6078);CFrameMon=CFrame.new(-9582,6,6205)
        elseif MyLevel<=2099 then Mon="Peanut Scout";LevelQuest=1;NameQuest="NutsIslandQuest";NameMon="Peanut Scout";CFrameQuest=CFrame.new(-2104,38,-10194);CFrameMon=CFrame.new(-2143,47,-10029)
        elseif MyLevel<=2124 then Mon="Peanut President";LevelQuest=2;NameQuest="NutsIslandQuest";NameMon="Peanut President";CFrameQuest=CFrame.new(-2104,38,-10194);CFrameMon=CFrame.new(-1859,38,-10422)
        elseif MyLevel<=2149 then Mon="Ice Cream Chef";LevelQuest=1;NameQuest="IceCreamIslandQuest";NameMon="Ice Cream Chef";CFrameQuest=CFrame.new(-820,65,-10965);CFrameMon=CFrame.new(-872,65,-10919)
        elseif MyLevel<=2199 then Mon="Ice Cream Commander";LevelQuest=2;NameQuest="IceCreamIslandQuest";NameMon="Ice Cream Commander";CFrameQuest=CFrame.new(-820,65,-10965);CFrameMon=CFrame.new(-558,112,-11290)
        elseif MyLevel<=2224 then Mon="Cookie Crafter";LevelQuest=1;NameQuest="CakeQuest1";NameMon="Cookie Crafter";CFrameQuest=CFrame.new(-2021,37,-12028);CFrameMon=CFrame.new(-2374,37,-12125)
        elseif MyLevel<=2249 then Mon="Cake Guard";LevelQuest=2;NameQuest="CakeQuest1";NameMon="Cake Guard";CFrameQuest=CFrame.new(-2021,37,-12028);CFrameMon=CFrame.new(-1598,43,-12244)
        elseif MyLevel<=2274 then Mon="Baking Staff";LevelQuest=1;NameQuest="CakeQuest2";NameMon="Baking Staff";CFrameQuest=CFrame.new(-1927,37,-12842);CFrameMon=CFrame.new(-1887,77,-12998)
        elseif MyLevel<=2299 then Mon="Head Baker";LevelQuest=2;NameQuest="CakeQuest2";NameMon="Head Baker";CFrameQuest=CFrame.new(-1927,37,-12842);CFrameMon=CFrame.new(-2216,82,-12869)
        elseif MyLevel<=2324 then Mon="Cocoa Warrior";LevelQuest=1;NameQuest="ChocQuest1";NameMon="Cocoa Warrior";CFrameQuest=CFrame.new(233,29,-12201);CFrameMon=CFrame.new(-21,80,-12352)
        elseif MyLevel<=2349 then Mon="Chocolate Bar Battler";LevelQuest=2;NameQuest="ChocQuest1";NameMon="Chocolate Bar Battler";CFrameQuest=CFrame.new(233,29,-12201);CFrameMon=CFrame.new(582,77,-12463)
        elseif MyLevel<=2374 then Mon="Sweet Thief";LevelQuest=1;NameQuest="ChocQuest2";NameMon="Sweet Thief";CFrameQuest=CFrame.new(150,30,-12774);CFrameMon=CFrame.new(165,76,-12600)
        elseif MyLevel<=2399 then Mon="Candy Rebel";LevelQuest=2;NameQuest="ChocQuest2";NameMon="Candy Rebel";CFrameQuest=CFrame.new(150,30,-12774);CFrameMon=CFrame.new(134,77,-12876)
        elseif MyLevel<=2424 then Mon="Candy Pirate";LevelQuest=1;NameQuest="CandyQuest1";NameMon="Candy Pirate";CFrameQuest=CFrame.new(-1150,20,-14446);CFrameMon=CFrame.new(-1310,26,-14562)
        elseif MyLevel<=2449 then Mon="Snow Demon";LevelQuest=2;NameQuest="CandyQuest1";NameMon="Snow Demon";CFrameQuest=CFrame.new(-1150,20,-14446);CFrameMon=CFrame.new(-880,71,-14538)
        elseif MyLevel<=2474 then Mon="Isle Outlaw";LevelQuest=1;NameQuest="TikiQuest1";NameMon="Isle Outlaw";CFrameQuest=CFrame.new(-16547,61,-173);CFrameMon=CFrame.new(-16442,116,-264)
        elseif MyLevel<=2524 then Mon="Island Boy";LevelQuest=2;NameQuest="TikiQuest1";NameMon="Island Boy";CFrameQuest=CFrame.new(-16547,61,-173);CFrameMon=CFrame.new(-16901,84,-192)
        elseif MyLevel<=2549 then Mon="Isle Champion";LevelQuest=2;NameQuest="TikiQuest2";NameMon="Isle Champion";CFrameQuest=CFrame.new(-16539,55,1051);CFrameMon=CFrame.new(-16641,235,1031)
        elseif MyLevel<=2574 then Mon="Serpent Hunter";LevelQuest=1;NameQuest="TikiQuest3";NameMon="Serpent Hunter";CFrameQuest=CFrame.new(-16661,105,1576);CFrameMon=CFrame.new(-16587,154,1533)
        else Mon="Skull Slayer";LevelQuest=2;NameQuest="TikiQuest3";NameMon="Skull Slayer";CFrameQuest=CFrame.new(-16661,105,1576);CFrameMon=CFrame.new(-16885,114,1627) end
    end
end

local tableBoss = World1 and {"The Gorilla King","Bobby","Yeti","Mob Leader","Vice Admiral","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Saber Expert"}
    or World2 and {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"}
    or World3 and {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}
    or {}

local tableMon = World1 and {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
    or World2 and {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
    or World3 and {"Pirate Millionaire","Pistol Billionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion","Serpent Hunter","Skull Slayer"}
    or {}

local MaterialList = World1 and {"Magma Ore","Angel Wings","Leather","Scrap Metal"}
    or World2 and {"Radioactive","Mystic Droplet","Magma Ore","Leather","Ectoplasm","Scrap Metal"}
    or World3 and {"Leather","Scrap Metal","Conjured Cocoa","Dragon Scale","Gunpowder","Fish Tail","Mini Tusk"}
    or {}

local IslandList = World1 and {"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City","Shank Room","Mob Island"}
    or World2 and {"The Cafe","First Spot","Dark Area","Flamingo Mansion","Green Zone","Factory","Colosseum","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island"}
    or World3 and {"Port Town","Great Tree","Castle On The Sea","MiniSky","Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Tiki Outpost","Dragon Dojo","Mansion"}
    or {}

local IslandCFrames = {
    WindMill=CFrame.new(979,16,1429),Marine=CFrame.new(-2566,6,2045),["Middle Town"]=CFrame.new(-690,15,1582),
    Jungle=CFrame.new(-1612,36,149),["Pirate Village"]=CFrame.new(-1181,4,3803),Desert=CFrame.new(944,20,4373),
    ["Snow Island"]=CFrame.new(1347,104,-1319),MarineFord=CFrame.new(-4914,50,4281),Colosseum=CFrame.new(-1427,7,-2792),
    ["Sky Island 1"]=CFrame.new(-4869,733,-2667),Prison=CFrame.new(4875,5,734),["Magma Village"]=CFrame.new(-5247,12,8504),
    ["Under Water Island"]=CFrame.new(61163,11,1819),["Fountain City"]=CFrame.new(5127,59,4105),
    ["Shank Room"]=CFrame.new(-1442,29,-28),["Mob Island"]=CFrame.new(-2850,7,5354),
    ["The Cafe"]=CFrame.new(-380,77,255),["First Spot"]=CFrame.new(-11,29,2771),["Dark Area"]=CFrame.new(3780,22,-3498),
    ["Flamingo Mansion"]=CFrame.new(-483,332,595),["Green Zone"]=CFrame.new(-2448,73,-3210),
    Factory=CFrame.new(424,211,-427),["Zombie Island"]=CFrame.new(-5622,492,-781),
    ["Two Snow Mountain"]=CFrame.new(753,408,-5274),["Punk Hazard"]=CFrame.new(-6127,15,-5040),
    ["Cursed Ship"]=CFrame.new(923,125,32885),["Ice Castle"]=CFrame.new(6148,294,-6741),
    ["Forgotten Island"]=CFrame.new(-3032,317,-10075),["Ussop Island"]=CFrame.new(4816,8,2863),
    ["Mini Sky Island"]=CFrame.new(-288,49326,-35248),["Port Town"]=CFrame.new(-290,6,5343),
    ["Great Tree"]=CFrame.new(2681,1682,-7190),["Castle On The Sea"]=CFrame.new(-5083,314,-3175),
    MiniSky=CFrame.new(-260,49325,-35253),["Hydra Island"]=CFrame.new(5291,1005,393),
    ["Floating Turtle"]=CFrame.new(-13274,531,-7579),Mansion=CFrame.new(-12471,374,-7551),
    ["Haunted Castle"]=CFrame.new(-9515,164,5786),["Ice Cream Island"]=CFrame.new(-902,79,-10988),
    ["Peanut Island"]=CFrame.new(-2062,50,-10232),["Cake Island"]=CFrame.new(-1884,19,-11666),
    ["Cocoa Island"]=CFrame.new(87,73,-12319),["Candy Island"]=CFrame.new(-1014,149,-14555),
    ["Tiki Outpost"]=CFrame.new(-16218,9,445),["Dragon Dojo"]=CFrame.new(5743,1206,936),
}

local Window = Library:MakeWindow({
    Title = "Blox Fruit Hub  |  " .. (World1 and "Sea 1" or World2 and "Sea 2" or World3 and "Sea 3" or "Unknown"),
    SubTitle = "The Ultimate Blox Fruit Script",
    ScriptFolder = "BFWandHub"
})

local Minimizer = Window:NewMinimizer({KeyCode = Enum.KeyCode.RightControl})
Minimizer:CreateMobileMinimizer({BackgroundColor3 = Color3.fromRGB(10,10,10)})

local InfoTab = Window:MakeTab({Title="Info", Icon="Home"})
local FarmTab = Window:MakeTab({Title="Farming", Icon="Star"})
local BossTab = Window:MakeTab({Title="Boss & Mon", Icon="Shield"})
local MasteryTab = Window:MakeTab({Title="Mastery", Icon="Award"})
local ItemsTab = Window:MakeTab({Title="Items", Icon="Box"})
local OthersTab = Window:MakeTab({Title="Others", Icon="Grid"})
local StatsTab = Window:MakeTab({Title="Stats", Icon="BarChart2"})
local PlayerTab = Window:MakeTab({Title="Player", Icon="User"})
local CombatTab = Window:MakeTab({Title="Combat", Icon="Crosshair"})
local RaidTab = Window:MakeTab({Title="Raid", Icon="Lock"})
local RaceTab = Window:MakeTab({Title="Race V4", Icon="Zap"})
local DragonDojoTab = Window:MakeTab({Title="Dragon Dojo", Icon="Flame"})
local SeaEventTab = Window:MakeTab({Title="Sea Event", Icon="Anchor"})
local SeaStackTab = Window:MakeTab({Title="Sea Stack", Icon="Layers"})
local SeaSettingsTab = Window:MakeTab({Title="Sea Settings", Icon="Settings"})
local EspTab = Window:MakeTab({Title="ESP", Icon="Eye"})
local TeleportTab = Window:MakeTab({Title="Teleport", Icon="Map"})
local FruitTab = Window:MakeTab({Title="Fruit", Icon="Circle"})
local ShopTab = Window:MakeTab({Title="Shop", Icon="ShoppingCart"})
local MiscTab = Window:MakeTab({Title="Misc", Icon="Sliders"})
local ServerTab = Window:MakeTab({Title="Server", Icon="Wifi"})
local SettingsTab = Window:MakeTab({Title="Settings", Icon="Tool"})

Window:SelectTab(InfoTab)

InfoTab:AddSection("Player Info")
local GameTimePara = InfoTab:AddParagraph("Game Time", "0h 0m 0s")
local LevelPara = InfoTab:AddParagraph("Level", "0")
local FpsPara = InfoTab:AddParagraph("FPS", "0")
local PingPara = InfoTab:AddParagraph("Ping", "0ms")
local WorldPara = InfoTab:AddParagraph("Current World", World1 and "Sea 1 (First Sea)" or World2 and "Sea 2 (Second Sea)" or World3 and "Sea 3 (Third Sea)" or "Unknown")
local BossPara = InfoTab:AddParagraph("Boss Status", "Checking...")
local ElitePara = InfoTab:AddParagraph("Elite Hunter Status", "Checking...")
local MiragePara = InfoTab:AddParagraph("Mirage Island", "Checking...")
local KitsunePara = InfoTab:AddParagraph("Kitsune Island", "Checking...")
local FrozenPara = InfoTab:AddParagraph("Frozen Dimension", "Checking...")
local MoonPara = InfoTab:AddParagraph("Moon Phase", "Checking...")
InfoTab:AddSection("Credits")
InfoTab:AddParagraph("Blox Fruit Hub", "Built with WandUI (Redz Library V5 Remake)\nAll features combined from multiple sources")
InfoTab:AddButton({Name="Copy Script Hop", Callback=function()
    pcall(function() setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..',"'..game.JobId..'",game.Players.LocalPlayer)') end)
end})

spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local gt = math.floor(workspace.DistributedGameTime+0.5)
            GameTimePara:SetDescription(math.floor(gt/3600)%24 .."h "..math.floor(gt/60)%60 .."m "..gt%60 .."s")
            LevelPara:SetDescription(tostring(plr.Data.Level.Value))
            FpsPara:SetDescription(tostring(math.floor(workspace:GetRealPhysicsFPS())))
            PingPara:SetDescription(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString().."ms")
            local boss = _G.S.Main["Selected Boss"]
            if boss then
                BossPara:SetDescription(workspace.Enemies:FindFirstChild(boss) and "✅ "..boss.." Spawned" or "❌ "..boss.." Not Spawned")
            end
            if World3 then
                local ep = workspace.Enemies:FindFirstChild("Diablo") or workspace.Enemies:FindFirstChild("Deandre") or workspace.Enemies:FindFirstChild("Urban")
                ElitePara:SetDescription(ep and "✅ Elite Spawned" or "❌ Not Spawned")
            end
            local locs = workspace._WorldOrigin.Locations
            MiragePara:SetDescription(locs:FindFirstChild("Mirage Island") and "✅ Spawned" or "❌ Not Spawned")
            KitsunePara:SetDescription(locs:FindFirstChild("Kitsune Island") and "✅ Spawned" or "❌ Not Spawned")
            FrozenPara:SetDescription(locs:FindFirstChild("Frozen Dimension") and "✅ Spawned" or "❌ Not Spawned")
            local moonId = Lighting.Sky.MoonTextureId
            MoonPara:SetDescription(moonId:find("9709149431") and "🌕 Full Moon 100%" or moonId:find("9709149052") and "🌕 75%" or moonId:find("9709143733") and "🌔 50%" or moonId:find("9709150401") and "🌓 25%" or "🌑 No Full Moon")
        end)
    end
end)

FarmTab:AddSection("Level Farming")
FarmTab:AddDropdown({Name="Select Weapon",Options={"Melee","Sword","Fruit"},Default=_G.S.Main["Select Weapon"],Callback=function(v) _G.S.Main["Select Weapon"]=v; SaveSetting() end})
FarmTab:AddDropdown({Name="Farm Level Method",Options={"Quest","No Quest","Nearest"},Default=_G.S.Main["Farm Level Method"],Callback=function(v) _G.S.Main["Farm Level Method"]=v; SaveSetting() end})
FarmTab:AddToggle({Name="Auto Farm Level",Default=_G.S.Main["Auto Farm"],Callback=function(v) _G.S.Main["Auto Farm"]=v; StopTween(v); SaveSetting() end})
FarmTab:AddToggle({Name="Auto Fast Farm (Sea 1)",Default=_G.S.Main["Auto Fast Farm"],Callback=function(v) _G.S.Main["Auto Fast Farm"]=v; SaveSetting() end})

spawn(function()
    while wait(0.2) do
        if _G.S.Main["Auto Farm"] then
            pcall(function()
                CheckQuest()
                local method = _G.S.Main["Farm Level Method"]
                if method == "Quest" then
                    local QT = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if NameMon and not string.find(QT, NameMon) then CommF_:InvokeServer("AbandonQuest") end
                    if not plr.PlayerGui.Main.Quest.Visible then
                        TweenPlayer(CFrameQuest)
                        if CFrameQuest and (CFrameQuest.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                            CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    else
                        if Mon and workspace.Enemies:FindFirstChild(Mon) then
                            for _, v in pairs(workspace.Enemies:GetChildren()) do
                                if v.Name==Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                                    repeat
                                        RunService.Heartbeat:Wait()
                                        EquipWeapon(_G.S.Main["Selected Weapon"])
                                        AutoHaki()
                                        TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                        v.Humanoid.WalkSpeed=0
                                        v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                        PosMon=v.HumanoidRootPart.CFrame
                                        MonFarm=v.Name
                                        Attack()
                                    until not _G.S.Main["Auto Farm"] or v.Humanoid.Health<=0 or not v.Parent or not plr.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else TweenPlayer(CFrameMon) end
                    end
                else
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            if (method=="No Quest" and v.Name==Mon) or method=="Nearest" then
                                if (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude<=5000 then
                                    repeat
                                        RunService.Heartbeat:Wait()
                                        EquipWeapon(_G.S.Main["Selected Weapon"])
                                        AutoHaki()
                                        TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                        v.Humanoid.WalkSpeed=0
                                        v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                        PosMon=v.HumanoidRootPart.CFrame
                                        MonFarm=v.Name
                                        Attack()
                                    until not _G.S.Main["Auto Farm"] or not v.Parent or v.Humanoid.Health<=0
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait(0.2) do
        pcall(function()
            local tipMap = {Melee="Melee",Sword="Sword",Fruit="Blox Fruit",Gun="Gun"}
            local tip = tipMap[_G.S.Main["Select Weapon"]]
            if tip then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip==tip then _G.S.Main["Selected Weapon"]=v.Name end
                end
            end
        end)
    end
end)

BossTab:AddSection("Boss Farming")
BossTab:AddDropdown({Name="Select Boss",Options=tableBoss,Default=_G.S.Main["Selected Boss"],Callback=function(v) _G.S.Main["Selected Boss"]=v; SaveSetting() end})
BossTab:AddToggle({Name="Auto Farm Boss",Default=_G.S.Main["Auto Farm Boss"],Callback=function(v) _G.S.Main["Auto Farm Boss"]=v; StopTween(v); SaveSetting() end})
BossTab:AddToggle({Name="Auto Farm All Bosses",Default=_G.S.Main["Auto Farm All Boss"],Callback=function(v) _G.S.Main["Auto Farm All Boss"]=v; StopTween(v); SaveSetting() end})

spawn(function()
    while wait(0.2) do
        if _G.S.Main["Auto Farm Boss"] or _G.S.Main["Auto Farm All Boss"] then
            pcall(function()
                local bossList = _G.S.Main["Auto Farm All Boss"] and tableBoss or {_G.S.Main["Selected Boss"]}
                for _, boss in ipairs(bossList) do
                    if boss and workspace.Enemies:FindFirstChild(boss) then
                        for _, v in pairs(workspace.Enemies:GetChildren()) do
                            if v.Name==boss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                                repeat
                                    RunService.Heartbeat:Wait()
                                    AutoHaki()
                                    EquipWeapon(_G.S.Main["Selected Weapon"])
                                    v.Humanoid.WalkSpeed=0
                                    v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                    TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                    Attack()
                                until (not _G.S.Main["Auto Farm Boss"] and not _G.S.Main["Auto Farm All Boss"]) or not v.Parent or v.Humanoid.Health<=0
                            end
                        end
                    elseif boss and game.ReplicatedStorage:FindFirstChild(boss) then
                        TweenPlayer(game.ReplicatedStorage:FindFirstChild(boss).HumanoidRootPart.CFrame*CFrame.new(5,10,2))
                    end
                end
            end)
        end
    end
end)

BossTab:AddSection("Tyrant Of The Skies (Sea 3)")
BossTab:AddToggle({Name="Auto Summon Tyrant Of The Skies",Default=_G.S.Main["Auto Summon Tyrant Of The Skies"],Callback=function(v) _G.S.Main["Auto Summon Tyrant Of The Skies"]=v; StopTween(v) end})
BossTab:AddToggle({Name="Auto Kill Tyrant Of The Skies",Default=_G.S.Main["Auto Kill Tyrant Of The Skies"],Callback=function(v) _G.S.Main["Auto Kill Tyrant Of The Skies"]=v; StopTween(v) end})

spawn(function()
    while wait(0.2) do
        if _G.S.Main["Auto Kill Tyrant Of The Skies"] then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name=="Tyrant of the Skies" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                        repeat
                            wait()
                            EquipWeapon(_G.S.Main["Selected Weapon"])
                            TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                            Attack()
                            AutoHaki()
                        until not v.Parent or not workspace.Enemies:FindFirstChild("Tyrant of the Skies") or not _G.S.Main["Auto Kill Tyrant Of The Skies"]
                    end
                end
            end)
        end
    end
end)

BossTab:AddSection("Monster Farm")
BossTab:AddDropdown({Name="Select Monster",Options=tableMon,Default=_G.S.Main["Selected Mon"],Callback=function(v) _G.S.Main["Selected Mon"]=v; SaveSetting() end})
BossTab:AddToggle({Name="Auto Farm Monster",Default=_G.S.Main["Auto Farm Mon"],Callback=function(v) _G.S.Main["Auto Farm Mon"]=v; StopTween(v); SaveSetting() end})

spawn(function()
    while wait(0.2) do
        if _G.S.Main["Auto Farm Mon"] then
            pcall(function()
                local mon = _G.S.Main["Selected Mon"]
                if not mon then return end
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name==mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                        repeat
                            RunService.Heartbeat:Wait()
                            AutoHaki()
                            EquipWeapon(_G.S.Main["Selected Weapon"])
                            v.Humanoid.WalkSpeed=0
                            PosMon=v.HumanoidRootPart.CFrame
                            MonFarm=v.Name
                            v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                            TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                            Attack()
                        until not _G.S.Main["Auto Farm Mon"] or not v.Parent or v.Humanoid.Health<=0
                    end
                end
            end)
        end
    end
end)

MasteryTab:AddSection("Mastery Settings")
local mastMethodList = World3 and {"Quest","No Quest","Nearest","Cakeprince","Bones"} or {"Quest","No Quest","Nearest"}
MasteryTab:AddDropdown({Name="Mastery Method",Options=mastMethodList,Default=_G.S.Main["Mastery Method"],Callback=function(v) _G.S.Main["Mastery Method"]=v; SaveSetting() end})
MasteryTab:AddSlider({Name="Mastery Health %",Min=1,Max=100,Increment=1,Default=_G.S.Setting["Mastery Health"],Callback=function(v) _G.S.Setting["Mastery Health"]=v end})
local SwordList = {}
pcall(function()
    for _, v in pairs(CommF_:InvokeServer("getInventory")) do
        if v.Type=="Sword" then table.insert(SwordList, v.Name) end
    end
end)
MasteryTab:AddDropdown({Name="Sword for Mastery",Options=SwordList,Default=_G.S.Main["Selected Mastery Sword"],Callback=function(v) _G.S.Main["Selected Mastery Sword"]=v; SaveSetting() end})
MasteryTab:AddSection("Mastery Toggles")
MasteryTab:AddToggle({Name="Auto Fruit Mastery",Default=_G.S.Main["Auto Farm Fruit Mastery"],Callback=function(v) _G.S.Main["Auto Farm Fruit Mastery"]=v; StopTween(v); SaveSetting() end})
MasteryTab:AddToggle({Name="Auto Sword Mastery",Default=_G.S.Main["Auto Farm Sword Mastery"],Callback=function(v) _G.S.Main["Auto Farm Sword Mastery"]=v; StopTween(v); SaveSetting() end})
MasteryTab:AddToggle({Name="Auto Gun Mastery",Default=_G.S.Main["Auto Farm Gun Mastery"],Callback=function(v) _G.S.Main["Auto Farm Gun Mastery"]=v; StopTween(v); SaveSetting() end})
MasteryTab:AddSection("Fruit Mastery Skills")
for _, key in ipairs({"Z","X","C","V","F"}) do
    local sk = "Fruit Mastery Skill "..key
    MasteryTab:AddToggle({Name="Fruit Skill "..key,Default=_G.S.Setting[sk],Callback=function(v) _G.S.Setting[sk]=v; SaveSetting() end})
end
MasteryTab:AddSection("Gun Mastery Skills")
for _, key in ipairs({"Z","X"}) do
    local sk = "Gun Mastery Skill "..key
    MasteryTab:AddToggle({Name="Gun Skill "..key,Default=_G.S.Setting[sk],Callback=function(v) _G.S.Setting[sk]=v; SaveSetting() end})
end

spawn(function()
    while wait(0.2) do
        if _G.S.Main["Auto Farm Sword Mastery"] then
            pcall(function()
                CheckQuest()
                local sword = _G.S.Main["Selected Mastery Sword"]
                if not sword then return end
                if not plr.Character:FindFirstChild(sword) and not plr.Backpack:FindFirstChild(sword) then
                    CommF_:InvokeServer("LoadItem", sword)
                end
                if workspace.Enemies:FindFirstChild(Mon) then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name==Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                            repeat
                                RunService.Heartbeat:Wait()
                                EquipWeapon(sword)
                                Attack()
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                AutoHaki()
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                v.Humanoid.WalkSpeed=0
                                PosMon=v.HumanoidRootPart.CFrame
                                MonFarm=v.Name
                            until not _G.S.Main["Auto Farm Sword Mastery"] or not v.Parent or v.Humanoid.Health<=0 or not plr.PlayerGui.Main.Quest.Visible
                        end
                    end
                else TweenPlayer(CFrameMon) end
            end)
        end
    end
end)

ItemsTab:AddSection("Fighting Styles")
local fightItems = {
    {"Auto Super Human","Auto Super Human"},{"Auto Death Step","Auto Death Step"},
    {"Auto Sharkman Karate","Auto Fishman Karate"},{"Auto Electric Claw","Auto Electric Claw"},
    {"Auto Dragon Talon","Auto Dragon Talon"},{"Auto God Human","Auto God Human"},
}
for _, t in ipairs(fightItems) do
    ItemsTab:AddToggle({Name=t[1],Default=_G.S.Items[t[2]],Callback=function(v) _G.S.Items[t[2]]=v; StopTween(v); SaveSetting() end})
end
ItemsTab:AddSection("Swords")
local swordItems = {
    {"Auto Get Saber (Sea 1)","Auto Saber"},{"Auto Buddy Sword (Sea 3)","Auto Buddy Sword"},
    {"Auto Soul Guitar (Sea 3)","Auto Soul Guitar"},{"Auto Rengoku (Sea 2)","Auto Rengoku"},
    {"Auto Hallow Scythe (Sea 3)","Auto Hallow Scythe"},{"Auto Warden Sword (Sea 1)","Auto Warden Sword"},
    {"Auto Yama (Sea 3)","Auto Yama"},{"Auto Tushita (Sea 3)","Auto Tushita"},
    {"Auto Dark Dagger (Sea 3)","Auto Dark Dagger"},{"Auto Dragon Trident (Sea 2)","Auto Dragon Trident"},
    {"Auto Greybeard (Sea 1)","Auto Greybeard"},{"Auto Shark Saw (Sea 1)","Auto Shark Saw"},
    {"Auto Pole (Sea 1)","Auto Pole"},{"Auto Holy Torch (Sea 3)","Auto Holy Torch"},
    {"Auto Canvander (Sea 3)","Auto Canvander"},
}
for _, t in ipairs(swordItems) do
    ItemsTab:AddToggle({Name=t[1],Default=_G.S.Items[t[2]],Callback=function(v) _G.S.Items[t[2]]=v; StopTween(v); SaveSetting() end})
end
ItemsTab:AddSection("World Progression")
ItemsTab:AddToggle({Name="Auto Second Sea (Sea 1)",Default=_G.S.Items["Auto Second Sea"],Callback=function(v) _G.S.Items["Auto Second Sea"]=v; StopTween(v); SaveSetting() end})
ItemsTab:AddToggle({Name="Auto Third Sea (Sea 2)",Default=_G.S.Items["Auto Third Sea"],Callback=function(v) _G.S.Items["Auto Third Sea"]=v; StopTween(v); SaveSetting() end})

spawn(function()
    while wait(0.2) do
        if _G.S.Items["Auto Greybeard"] and World1 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Greybeard") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="Greybeard" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.Items["Auto Greybeard"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                else TweenPlayer(CFrame.new(-5023,28,4332)) end
            end)
        end
        if _G.S.Items["Auto Pole"] and World1 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Thunder God") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="Thunder God" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.Items["Auto Pole"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                else TweenPlayer(CFrame.new(-7748,5606,-2305)) end
            end)
        end
        if _G.S.Items["Auto Shark Saw"] and World1 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("The Saw") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="The Saw" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.Items["Auto Shark Saw"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                else TweenPlayer(CFrame.new(-690,15,1582)) end
            end)
        end
        if _G.S.Items["Auto Warden Sword"] and World1 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Chief Warden") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="Chief Warden" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.Items["Auto Warden Sword"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                else TweenPlayer(CFrame.new(5186,24,832)) end
            end)
        end
        if _G.S.Items["Auto Hallow Scythe"] then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Soul Reaper") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if string.find(v.Name,"Soul Reaper") then
                            repeat
                                RunService.Heartbeat:Wait()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                AutoHaki()
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until v.Humanoid.Health<=0 or not _G.S.Items["Auto Hallow Scythe"]
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild("Soul Reaper") then
                    TweenPlayer(game.ReplicatedStorage:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame*CFrame.new(2,20,2))
                end
            end)
        end
        if _G.S.Items["Auto Dark Dagger"] and World3 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("rip_indra True Form") or workspace.Enemies:FindFirstChild("rip_indra") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if (v.Name=="rip_indra True Form" or v.Name=="rip_indra") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.Items["Auto Dark Dagger"] or v.Humanoid.Health<=0
                        end
                    end
                else TweenPlayer(CFrame.new(-5344,423,-2725)) end
            end)
        end
        if _G.S.Items["Auto Buddy Sword"] and World3 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Cake Queen") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="Cake Queen" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.Items["Auto Buddy Sword"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                else TweenPlayer(CFrame.new(-731,381,-11198)) end
            end)
        end
        if _G.S.Items["Auto Dragon Trident"] and World2 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Tide Keeper") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="Tide Keeper" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.Items["Auto Dragon Trident"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                else TweenPlayer(CFrame.new(-3914,123,-11516)) end
            end)
        end
    end
end)

OthersTab:AddSection("Elite Hunter (Sea 3)")
local EliteProgressPara = OthersTab:AddParagraph("Elite Hunter Progress", "Sea 3 Only")
OthersTab:AddToggle({Name="Auto Elite Hunter",Default=_G.S.Farm["Auto Elite Hunter"],Callback=function(v) _G.S.Farm["Auto Elite Hunter"]=v; StopTween(v); SaveSetting() end})
OthersTab:AddToggle({Name="Auto Elite Hunter Hop",Default=_G.S.Farm["Auto Elite Hunter Hop"],Callback=function(v) _G.S.Farm["Auto Elite Hunter Hop"]=v; SaveSetting() end})
spawn(function()
    while wait(1) do
        pcall(function()
            if World3 then EliteProgressPara:SetDescription(tostring(CommF_:InvokeServer("EliteHunter","Progress")).."/30") end
        end)
    end
end)
spawn(function()
    while wait(0.2) do
        if _G.S.Farm["Auto Elite Hunter"] and World3 then
            pcall(function()
                local QT = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if workspace.Enemies:FindFirstChild("Diablo") or workspace.Enemies:FindFirstChild("Deandre") or workspace.Enemies:FindFirstChild("Urban") then
                    if not plr.PlayerGui.Main.Quest.Visible then
                        TweenPlayer(CFrame.new(-5418,313,-2826))
                        if (Vector3.new(-5418,313,-2826)-plr.Character.HumanoidRootPart.Position).Magnitude<=3 then
                            CommF_:InvokeServer("EliteHunter")
                        end
                    elseif string.find(QT,"Diablo") or string.find(QT,"Deandre") or string.find(QT,"Urban") then
                        for _, v in pairs(workspace.Enemies:GetChildren()) do
                            if (v.Name=="Diablo" or v.Name=="Deandre" or v.Name=="Urban") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                                repeat
                                    RunService.Heartbeat:Wait()
                                    AutoHaki()
                                    EquipWeapon(_G.S.Main["Selected Weapon"])
                                    v.Humanoid.WalkSpeed=0
                                    v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                    TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                    Attack()
                                until not _G.S.Farm["Auto Elite Hunter"] or v.Humanoid.Health<=0 or not v.Parent
                            end
                        end
                    end
                end
            end)
        end
        if _G.S.Farm["Auto Elite Hunter Hop"] and World3 and _G.S.Farm["Auto Elite Hunter"] then
            pcall(function()
                if not workspace.Enemies:FindFirstChild("Diablo") and not workspace.Enemies:FindFirstChild("Deandre") and not workspace.Enemies:FindFirstChild("Urban") then
                    Hop()
                end
            end)
        end
    end
end)

OthersTab:AddSection("Bone Farm (Sea 3)")
local BoneCountPara = OthersTab:AddParagraph("Bones Owned", "0")
OthersTab:AddDropdown({Name="Bone Farm Method",Options={"Quest","No Quest"},Default=_G.S.Farm["Selected Bone Farm Method"],Callback=function(v) _G.S.Farm["Selected Bone Farm Method"]=v; SaveSetting() end})
OthersTab:AddToggle({Name="Auto Farm Bone",Default=_G.S.Farm["Auto Farm Bone"],Callback=function(v) _G.S.Farm["Auto Farm Bone"]=v; StopTween(v); SaveSetting() end})
OthersTab:AddToggle({Name="Auto Random Surprise",Default=_G.S.Farm["Auto Random Surprise"],Callback=function(v) _G.S.Farm["Auto Random Surprise"]=v; SaveSetting() end})
spawn(function() while wait(2) do pcall(function() BoneCountPara:SetDescription(tostring(GetCountMaterials("Bones"))) end) end end)
spawn(function()
    while wait(0.2) do
        if _G.S.Farm["Auto Random Surprise"] then pcall(function() CommF_:InvokeServer("Bones","Buy",1,1) end) end
        if _G.S.Farm["Auto Farm Bone"] and World3 then
            pcall(function()
                local skeletonNames = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
                local found = false
                for _, name in ipairs(skeletonNames) do
                    if workspace.Enemies:FindFirstChild(name) then found=true end
                end
                if found then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        local isSkel = false
                        for _, n in ipairs(skeletonNames) do if v.Name==n then isSkel=true end end
                        if isSkel and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                PosMon=v.HumanoidRootPart.CFrame
                                MonFarm=v.Name
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.Farm["Auto Farm Bone"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                else TweenPlayer(CFrame.new(-9506,172,6117)) end
            end)
        end
    end
end)

OthersTab:AddSection("Chest Farm")
OthersTab:AddToggle({Name="Auto Farm Chest (Tween)",Default=_G.S.Farm["Auto Farm Chest Tween"],Callback=function(v) _G.S.Farm["Auto Farm Chest Tween"]=v; StopTween(v); SaveSetting() end})
OthersTab:AddToggle({Name="Auto Farm Chest (Instant)",Default=_G.S.Farm["Auto Farm Chest Instant"],Callback=function(v) _G.S.Farm["Auto Farm Chest Instant"]=v; StopTween(v); SaveSetting() end})
OthersTab:AddToggle({Name="Auto Stop on God's Chalice / FoD",Default=_G.S.Farm["Auto Stop Items"],Callback=function(v) _G.S.Farm["Auto Stop Items"]=v; SaveSetting() end})
spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.S.Farm["Auto Farm Chest Tween"] then
                for _, v in pairs(workspace.ChestModels:GetChildren()) do
                    if v.Name:find("Chest") then repeat wait() TweenPlayer(v.RootPart.CFrame) until not _G.S.Farm["Auto Farm Chest Tween"] or not v.Parent end
                end
            end
            if _G.S.Farm["Auto Farm Chest Instant"] then
                for _, v in pairs(workspace.ChestModels:GetChildren()) do
                    if v.Name:find("Chest") then repeat wait() InstantTp(v.RootPart.CFrame) until not _G.S.Farm["Auto Farm Chest Instant"] or not v.Parent end
                end
            end
            if _G.S.Farm["Auto Stop Items"] then
                if plr.Backpack:FindFirstChild("God's Chalice") or plr.Character:FindFirstChild("God's Chalice") or plr.Backpack:FindFirstChild("Fist of Darkness") or plr.Character:FindFirstChild("Fist of Darkness") then
                    _G.S.Farm["Auto Farm Chest Tween"]=false
                    _G.S.Farm["Auto Farm Chest Instant"]=false
                end
            end
        end)
    end
end)

OthersTab:AddSection("Cake Prince (Sea 3)")
OthersTab:AddToggle({Name="Auto Spawn Cake Prince",Default=_G.S.Farm["Auto Spawn Cake Prince"],Callback=function(v) _G.S.Farm["Auto Spawn Cake Prince"]=v; SaveSetting() end})
OthersTab:AddToggle({Name="Auto Kill Cake Prince",Default=_G.S.Farm["Auto Kill Cake Prince"],Callback=function(v) _G.S.Farm["Auto Kill Cake Prince"]=v; StopTween(v); SaveSetting() end})
OthersTab:AddToggle({Name="Auto Kill Dough King",Default=_G.S.Farm["Auto Kill Dough King"],Callback=function(v) _G.S.Farm["Auto Kill Dough King"]=v; StopTween(v); SaveSetting() end})
OthersTab:AddToggle({Name="Auto Pirate Raid",Default=_G.S.Farm["Auto Pirate Raid"],Callback=function(v) _G.S.Farm["Auto Pirate Raid"]=v; StopTween(v); SaveSetting() end})
spawn(function()
    while wait(0.2) do
        if _G.S.Farm["Auto Spawn Cake Prince"] and World3 then
            pcall(function() wait(2) CommF_:InvokeServer("CakePrinceSpawner",true) end)
        end
        if _G.S.Farm["Auto Kill Cake Prince"] and World3 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Cake Prince") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="Cake Prince" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                RemoveAnimation(v)
                                Attack()
                            until not _G.S.Farm["Auto Kill Cake Prince"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                end
            end)
        end
        if _G.S.Farm["Auto Kill Dough King"] and World3 then
            pcall(function()
                if workspace.Enemies:FindFirstChild("Dough King") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="Dough King" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                RemoveAnimation(v)
                                Attack()
                            until not _G.S.Farm["Auto Kill Dough King"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                end
            end)
        end
    end
end)

OthersTab:AddSection("Materials Farm")
OthersTab:AddDropdown({Name="Select Material",Options=MaterialList,Default=_G.S.Farm["Selected Material"],Callback=function(v) _G.S.Farm["Selected Material"]=v end})
OthersTab:AddToggle({Name="Auto Farm Material",Default=_G.S.Farm["Auto Farm Material"],Callback=function(v) _G.S.Farm["Auto Farm Material"]=v; StopTween(v); SaveSetting() end})

local MaterialConfig = {
    ["Magma Ore"]={World1,{"Military Spy"},CFrame.new(-5850,77,8848)},
    ["Angel Wings"]={World1,{"Royal Soldier"},CFrame.new(-7827,5606,-1705)},
    ["Leather"]={World1,{"Pirate"},CFrame.new(-1211,4,3916)},
    ["Scrap Metal"]={World1,{"Brute"},CFrame.new(-1132,14,4293)},
    ["Ectoplasm"]={World2,{"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer"},CFrame.new(911,125,33159)},
    ["Conjured Cocoa"]={World3,{"Chocolate Bar Battler"},CFrame.new(744,24,-12637)},
    ["Dragon Scale"]={World3,{"Dragon Crew Warrior"},CFrame.new(5824,51,-1106)},
    ["Gunpowder"]={World3,{"Pistol Billionaire"},CFrame.new(-379,73,5928)},
    ["Fish Tail"]={World3,{"Fishman Captain"},CFrame.new(-10961,331,-8914)},
    ["Mini Tusk"]={World3,{"Mythological Pirate"},CFrame.new(-13516,469,-6899)},
}

spawn(function()
    while wait(0.2) do
        if _G.S.Farm["Auto Farm Material"] then
            pcall(function()
                local mat = _G.S.Farm["Selected Material"]
                if not mat or not MaterialConfig[mat] then return end
                local cfg = MaterialConfig[mat]
                local mons = cfg[2]
                local matPos = cfg[3]
                local found = false
                for _, mn in ipairs(mons) do
                    if workspace.Enemies:FindFirstChild(mn) then found=true end
                end
                if found then
                    for _, mn in ipairs(mons) do
                        for _, v in pairs(workspace.Enemies:GetChildren()) do
                            if v.Name==mn and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                                repeat
                                    RunService.Heartbeat:Wait()
                                    AutoHaki()
                                    EquipWeapon(_G.S.Main["Selected Weapon"])
                                    PosMon=v.HumanoidRootPart.CFrame
                                    MonFarm=v.Name
                                    TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                    Attack()
                                until not _G.S.Farm["Auto Farm Material"] or not v.Parent or v.Humanoid.Health<=0
                            end
                        end
                    end
                else TweenPlayer(matPos) end
            end)
        end
    end
end)

StatsTab:AddSection("Auto Add Stats")
local StatsPointPara = StatsTab:AddParagraph("Available Points", "0")
spawn(function() while wait(0.5) do pcall(function() StatsPointPara:SetDescription(tostring(plr.Data.Points.Value)) end) end end)
local PointStats = 1
StatsTab:AddSlider({Name="Points Per Add",Min=1,Max=100,Increment=1,Default=1,Callback=function(v) PointStats=v end})
local statTypes = {
    {"Auto Add Melee","Auto Add Melee Stats","Melee"},
    {"Auto Add Defense","Auto Add Defense Stats","Defense"},
    {"Auto Add Sword","Auto Add Sword Stats","Sword"},
    {"Auto Add Gun","Auto Add Gun Stats","Gun"},
    {"Auto Add Devil Fruit","Auto Add Devil Fruit Stats","Demon Fruit"},
}
for _, t in ipairs(statTypes) do
    StatsTab:AddToggle({Name=t[1],Default=_G.S.Stats[t[2]],Callback=function(v) _G.S.Stats[t[2]]=v end})
end
spawn(function()
    while wait(0.3) do
        pcall(function()
            if plr.Data.Points.Value>=PointStats then
                for _, t in ipairs(statTypes) do
                    if _G.S.Stats[t[2]] then CommF_:InvokeServer("AddPoint",t[3],PointStats) end
                end
            end
        end)
    end
end)

PlayerTab:AddSection("Player Abilities")
PlayerTab:AddToggle({Name="Active Race V3",Default=_G.S.LocalPlayer["Active Race V3"],Callback=function(v) _G.S.LocalPlayer["Active Race V3"]=v; SaveSetting() end})
PlayerTab:AddToggle({Name="Active Race V4",Default=_G.S.LocalPlayer["Active Race V4"],Callback=function(v) _G.S.LocalPlayer["Active Race V4"]=v; SaveSetting() end})
PlayerTab:AddToggle({Name="Walk On Water",Default=_G.S.LocalPlayer["Walk On Water"],Callback=function(v)
    _G.S.LocalPlayer["Walk On Water"]=v
    pcall(function() workspace.Map["WaterBase-Plane"].Size=v and Vector3.new(1000,112,1000) or Vector3.new(1000,80,1000) end)
    SaveSetting()
end})
PlayerTab:AddToggle({Name="No Clip",Default=_G.S.LocalPlayer["No Clip"],Callback=function(v) _G.S.LocalPlayer["No Clip"]=v; SaveSetting() end})
PlayerTab:AddSection("Infinite Abilities")
PlayerTab:AddToggle({Name="Infinite Energy",Default=false,Callback=function(v) _G.InfiniteEnergy=v end})
PlayerTab:AddToggle({Name="Infinite Geppo",Default=false,Callback=function(v) _G.InfiniteGeppo=v end})
PlayerTab:AddToggle({Name="Dodge No Cooldown",Default=false,Callback=function(v) _G.DodgeNoCD=v end})
spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.S.LocalPlayer["Active Race V4"] then
                if tonumber(plr.Character:WaitForChild("RaceEnergy").Value)==1 and not plr.Character.RaceTransformed.Value then
                    VirtualInputManager:SendKeyEvent(true,"Y",false,game)
                    wait(0.1)
                    VirtualInputManager:SendKeyEvent(false,"Y",false,game)
                end
            end
            if _G.S.LocalPlayer["Active Race V3"] then
                pcall(function() ReplicatedStorage.Remotes.CommE:FireServer("ActivateAbility") end)
            end
        end)
    end
end)
spawn(function()
    RunService.Stepped:Connect(function()
        if _G.S.LocalPlayer["No Clip"] then
            pcall(function()
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide=false end
                end
            end)
        end
    end)
end)

CombatTab:AddSection("PvP & Combat")
local PlayerList2 = {}
for _, v in pairs(Players:GetChildren()) do table.insert(PlayerList2,v.Name) end
local PDropdown = CombatTab:AddDropdown({Name="Select Player",Options=PlayerList2,Default=PlayerList2[1] or "None",Callback=function(v) _G.SelectedPlayer=v end})
CombatTab:AddButton({Name="Refresh Player List",Callback=function()
    PlayerList2={}
    for _, v in pairs(Players:GetChildren()) do table.insert(PlayerList2,v.Name) end
    PDropdown:NewOptions(PlayerList2)
end})
CombatTab:AddToggle({Name="Teleport To Player",Default=false,Callback=function(v)
    _G.TeleportToPlayer=v
    if v then
        spawn(function()
            repeat
                pcall(function()
                    if _G.SelectedPlayer and Players:FindFirstChild(_G.SelectedPlayer) then
                        TweenPlayer(Players[_G.SelectedPlayer].Character.HumanoidRootPart.CFrame)
                    end
                end)
                wait(0.1)
            until not _G.TeleportToPlayer
            StopTween(false)
        end)
    end
end})
CombatTab:AddToggle({Name="Enable PvP Mode",Default=false,Callback=function(v) _G.S.Combat["Enable PvP"]=v end})
CombatTab:AddToggle({Name="Aimbot Skill",Default=false,Callback=function(v) _G.S.Combat["Aimbot Skill"]=v; Skillaimbot=v end})
CombatTab:AddSection("Auto Kill")
CombatTab:AddToggle({Name="Auto Kill Player Quest",Default=false,Callback=function(v) _G.S.Combat["Auto Kill Player Quest"]=v end})
spawn(function()
    while wait(0.2) do
        if _G.S.Combat["Auto Kill Player Quest"] then
            pcall(function()
                for _, v in pairs(Players:GetPlayers()) do
                    if v~=plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health>0 then
                        if (v.Character.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude<=500 then
                            repeat
                                RunService.Heartbeat:Wait()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                AutoHaki()
                                TweenPlayer(v.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,40))
                                Attack()
                            until not _G.S.Combat["Auto Kill Player Quest"] or not v.Character or v.Character.Humanoid.Health<=0
                        end
                    end
                end
            end)
        end
    end
end)

RaidTab:AddSection("Raid Info")
local TimeRaidPara = RaidTab:AddParagraph("Raid Timer", "N/A")
local IslandRaidPara = RaidTab:AddParagraph("Current Island", "N/A")
spawn(function()
    while wait(0.5) do
        pcall(function()
            local timer = plr.PlayerGui.Main.TopHUDList.RaidTimer
            TimeRaidPara:SetDescription(timer.Visible and timer.Text or "Waiting...")
            local rm = workspace.Map.RaidMap
            IslandRaidPara:SetDescription(rm:FindFirstChild("RaidIsland5") and "Island 5" or rm:FindFirstChild("RaidIsland4") and "Island 4" or rm:FindFirstChild("RaidIsland3") and "Island 3" or rm:FindFirstChild("RaidIsland2") and "Island 2" or rm:FindFirstChild("RaidIsland1") and "Island 1" or "No Raid Active")
        end)
    end
end)
RaidTab:AddSection("Raid Settings")
local RaidsList = {}
pcall(function()
    local rm = require(game.ReplicatedStorage.Raids)
    for _, v in pairs(rm.raids) do table.insert(RaidsList,v) end
    for _, v in pairs(rm.advancedRaids) do table.insert(RaidsList,v) end
end)
RaidTab:AddDropdown({Name="Select Raid Chip",Options=RaidsList,Default=_G.S.Raid["Selected Chip"],Callback=function(v) _G.S.Raid["Selected Chip"]=v end})
RaidTab:AddToggle({Name="Auto Raid (Sea 2 & 3)",Default=_G.S.Raid["Auto Raid"],Callback=function(v) _G.S.Raid["Auto Raid"]=v; StopTween(v); SaveSetting() end})
RaidTab:AddToggle({Name="Auto Awaken",Default=_G.S.Raid["Auto Awaken"],Callback=function(v)
    _G.S.Raid["Auto Awaken"]=v
    if v then spawn(function() while _G.S.Raid["Auto Awaken"] do pcall(function() CommF_:InvokeServer("Awakener","Awaken") end) wait(0.2) end end) end
    SaveSetting()
end})
RaidTab:AddToggle({Name="Auto Law Raid",Default=_G.S.Raid["Law Raid"],Callback=function(v) _G.S.Raid["Law Raid"]=v; StopTween(v); SaveSetting() end})
RaidTab:AddSlider({Name="Min Fruit Price to Unstore",Min=1,Max=10000000,Increment=100000,Default=_G.S.Raid["Price Devil Fruit"],Callback=function(v) _G.S.Raid["Price Devil Fruit"]=v; SaveSetting() end})
RaidTab:AddToggle({Name="Auto Unstore Devil Fruit",Default=_G.S.Raid["Unstore Devil Fruit"],Callback=function(v) _G.S.Raid["Unstore Devil Fruit"]=v; SaveSetting() end})
RaidTab:AddButton({Name="Teleport to Raid Lab",Callback=function()
    if World2 then TweenPlayer(CFrame.new(-6438,250,-4501))
    elseif World3 then TweenPlayer(CFrame.new(-5017,314,-2823)) end
end})
spawn(function()
    while wait(0.2) do
        if _G.S.Raid["Auto Raid"] and (World2 or World3) then
            pcall(function()
                if plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            if (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude<=500 then
                                repeat
                                    wait()
                                    Attack()
                                    EquipWeapon(_G.S.Main["Selected Weapon"])
                                    TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                    AutoHaki()
                                    v.Humanoid.WalkSpeed=0
                                    v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                until not _G.S.Raid["Auto Raid"] or not v.Parent or v.Humanoid.Health<=0
                            end
                        end
                    end
                end
            end)
        end
        if _G.S.Raid["Unstore Devil Fruit"] then
            pcall(function()
                local fruit = CommF_:InvokeServer("getInventoryFruits")
                for _, v in pairs(fruit) do
                    if v.Price < _G.S.Raid["Price Devil Fruit"] then
                        local hasFruit = false
                        for _, item in pairs(plr.Backpack:GetChildren()) do if item.Name:find("Fruit") then hasFruit=true end end
                        for _, item in pairs(plr.Character:GetChildren()) do if item.Name:find("Fruit") then hasFruit=true end end
                        if not hasFruit then CommF_:InvokeServer("LoadFruit",v.Name) end
                    end
                end
            end)
        end
    end
end)

RaceTab:AddSection("Race V4 Setup")
RaceTab:AddDropdown({Name="Teleport To Place",Options={"Top Of GreatTree","Temple Of Time","Lever Pull","Ancient One"},Default=nil,Callback=function(v) _G.S.Race["Selected Place"]=v end})
RaceTab:AddToggle({Name="Teleport To Race Place",Default=false,Callback=function(v) _G.TeleportRacePlace=v end})
RaceTab:AddToggle({Name="Auto Buy Gear",Default=_G.S.Race["Auto Buy Gear"],Callback=function(v)
    _G.S.Race["Auto Buy Gear"]=v
    if v then spawn(function() while _G.S.Race["Auto Buy Gear"] do pcall(function() CommF_:InvokeServer("UpgradeRace","Buy") end) wait(0.2) end end) end
    SaveSetting()
end})
RaceTab:AddToggle({Name="Find Blue Gear (Mirage)",Default=_G.S.Race["Find Blue Gear"],Callback=function(v) _G.S.Race["Find Blue Gear"]=v; SaveSetting() end})
RaceTab:AddToggle({Name="Look At Moon + Use Ability",Default=_G.S.Race["Look Moon Ability"],Callback=function(v) _G.S.Race["Look Moon Ability"]=v; SaveSetting() end})
RaceTab:AddToggle({Name="Auto Train",Default=_G.S.Race["Auto Train"],Callback=function(v) _G.S.Race["Auto Train"]=v; StopTween(v); SaveSetting() end})
RaceTab:AddToggle({Name="Auto Trial",Default=_G.S.Race["Auto Trial"],Callback=function(v) _G.S.Race["Auto Trial"]=v; StopTween(v); SaveSetting() end})
RaceTab:AddToggle({Name="Auto Kill Player After Trial",Default=_G.S.Race["Auto Kill Player After Trial"],Callback=function(v) _G.S.Race["Auto Kill Player After Trial"]=v; SaveSetting() end})
RaceTab:AddButton({Name="Teleport To Race Door",Callback=function()
    pcall(function()
        plr.Character.HumanoidRootPart.CFrame=CFrame.new(28286,14895,102)
        wait(0.5)
        local race = plr.Data.Race.Value
        local rp = {Human=CFrame.new(29221,14890,-205),Skypiea=CFrame.new(28960,14919,235),Fishman=CFrame.new(28231,14890,-211),Cyborg=CFrame.new(28502,14895,-423),Ghoul=CFrame.new(28674,14890,445),Mink=CFrame.new(29012,14890,-380)}
        if rp[race] then TweenPlayer(rp[race]) end
    end)
end})
RaceTab:AddButton({Name="Buy Ancient Quest",Callback=function() pcall(function() CommF_:InvokeServer("UpgradeRace","Buy") end) end})
spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.S.Race["Find Blue Gear"] and workspace.Map:FindFirstChild("MysticIsland") then
                for _, v in pairs(workspace.Map.MysticIsland:GetChildren()) do
                    if v:IsA("MeshPart") and v.Material==Enum.Material.Neon then TweenPlayer(v.CFrame) end
                end
            end
            if _G.S.Race["Look Moon Ability"] then
                local moonDir = Lighting:GetMoonDirection()
                local lookAt = workspace.CurrentCamera.CFrame.p + moonDir*100
                workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.p, lookAt)
            end
            if _G.TeleportRacePlace and _G.S.Race["Selected Place"] then
                local places = {
                    ["Top Of GreatTree"]=CFrame.new(2947,2281,-7213),
                    ["Temple Of Time"]=CFrame.new(28286,14895,102),
                    ["Lever Pull"]=CFrame.new(28575,14936,72),
                    ["Ancient One"]=CFrame.new(28981,14888,-120),
                }
                if places[_G.S.Race["Selected Place"]] then TweenPlayer(places[_G.S.Race["Selected Place"]]) end
            end
        end)
    end
end)

DragonDojoTab:AddSection("Dragon Dojo (Sea 3)")
DragonDojoTab:AddToggle({Name="Auto Farm Blaze Ember",Default=_G.S.DragonDojo["Auto Farm Blaze Ember"],Callback=function(v) _G.S.DragonDojo["Auto Farm Blaze Ember"]=v; StopTween(v); SaveSetting() end})
DragonDojoTab:AddButton({Name="Craft Volcanic Magnet",Callback=function()
    pcall(function() CommF_:InvokeServer("CraftItem","Craft","Volcanic Magnet") end)
end})
spawn(function()
    while wait(0.2) do
        if _G.S.DragonDojo["Auto Farm Blaze Ember"] and World3 then
            pcall(function()
                local dragonHunterPos = CFrame.new(5864,1209,812)
                local questInfo = ((ReplicatedStorage.Modules.Net:FindFirstChild("RF/DragonHunter"))):InvokeServer({Context="Check"})
                if not questInfo then
                    TweenPlayer(dragonHunterPos)
                    if (dragonHunterPos.Position-plr.Character.HumanoidRootPart.Position).Magnitude<=10 then
                        ReplicatedStorage.Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer({Context="RequestQuest"})
                    end
                end
                if workspace:FindFirstChild("EmberTemplate") then
                    local part = workspace.EmberTemplate:FindFirstChild("Part")
                    if part then InstantTp(part.CFrame) end
                end
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if (v.Name=="Venomous Assailant" or v.Name=="Hydra Enforcer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                        repeat
                            RunService.Heartbeat:Wait()
                            AutoHaki()
                            EquipWeapon(_G.S.Main["Selected Weapon"])
                            v.Humanoid.WalkSpeed=0
                            v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                            PosMon=v.HumanoidRootPart.CFrame
                            MonFarm=v.Name
                            TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                            Attack()
                        until not v.Parent or v.Humanoid.Health<=0 or not _G.S.DragonDojo["Auto Farm Blaze Ember"]
                    end
                end
            end)
        end
    end
end)

SeaEventTab:AddSection("Boat & Sailing")
SeaEventTab:AddDropdown({Name="Select Boat",Options={"Guardian","Beast Hunter","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade","PirateSloop","MarineSloop"},Default=_G.S.SeaEvent["Selected Boat"],Callback=function(v) _G.S.SeaEvent["Selected Boat"]=v; SaveSetting() end})
SeaEventTab:AddDropdown({Name="Select Zone",Options={"Zone 1","Zone 2","Zone 3","Zone 4","Zone 5","Zone 6","Infinite"},Default=_G.S.SeaEvent["Selected Zone"],Callback=function(v) _G.S.SeaEvent["Selected Zone"]=v; SaveSetting() end})
SeaEventTab:AddSlider({Name="Boat Tween Speed",Min=50,Max=500,Increment=10,Default=_G.S.SeaEvent["Boat Tween Speed"],Callback=function(v) _G.S.SeaEvent["Boat Tween Speed"]=v end})
SeaEventTab:AddToggle({Name="Sail Boat + Auto Kill",Default=_G.S.SeaEvent["Sail Boat"],Callback=function(v) _G.S.SeaEvent["Sail Boat"]=v; StopTween(v); SaveSetting() end})
SeaEventTab:AddSection("Sea Enemies")
local seaToggleList = {
    {"Auto Farm Shark","Auto Farm Shark"},{"Auto Farm Piranha","Auto Farm Piranha"},
    {"Auto Farm Fish Crew Member","Auto Farm Fish Crew Member"},
    {"Auto Farm Ghost Ship","Auto Farm Ghost Ship"},
    {"Auto Farm Pirate Brigade","Auto Farm Pirate Brigade"},
    {"Auto Farm Pirate Grand Brigade","Auto Farm Pirate Grand Brigade"},
    {"Auto Farm Terrorshark","Auto Farm Terrorshark"},
    {"Auto Farm Sea Beasts","Auto Farm Seabeasts"},
}
for _, t in ipairs(seaToggleList) do
    SeaEventTab:AddToggle({Name=t[1],Default=_G.S.SeaEvent[t[2]],Callback=function(v) _G.S.SeaEvent[t[2]]=v; SaveSetting() end})
end

SeaStackTab:AddSection("Island Status")
local MirageSea = SeaStackTab:AddParagraph("Mirage Island","Checking...")
local KitsuneSea = SeaStackTab:AddParagraph("Kitsune Island","Checking...")
local FrozenSea = SeaStackTab:AddParagraph("Frozen Dimension","Checking...")
local PrehistoricSea = SeaStackTab:AddParagraph("Prehistoric Island","Checking...")
spawn(function()
    while wait(1) do
        pcall(function()
            local locs = workspace._WorldOrigin.Locations
            MirageSea:SetDescription(locs:FindFirstChild("Mirage Island") and "✅ Spawned" or "❌ Not Spawned")
            KitsuneSea:SetDescription(locs:FindFirstChild("Kitsune Island") and "✅ Spawned" or "❌ Not Spawned")
            FrozenSea:SetDescription(locs:FindFirstChild("Frozen Dimension") and "✅ Spawned" or "❌ Not Spawned")
            PrehistoricSea:SetDescription(locs:FindFirstChild("Prehistoric Island") and "✅ Spawned" or "❌ Not Spawned")
        end)
    end
end)
SeaStackTab:AddSection("Tween to Islands")
SeaStackTab:AddToggle({Name="Tween to Mirage Island",Default=_G.S.SeaStack["Tween To Mirage Island"],Callback=function(v) _G.S.SeaStack["Tween To Mirage Island"]=v; StopTween(v); SaveSetting() end})
SeaStackTab:AddToggle({Name="Tween to Kitsune Island",Default=_G.S.SeaStack["Tween To Kitsune Island"],Callback=function(v) _G.S.SeaStack["Tween To Kitsune Island"]=v; StopTween(v); SaveSetting() end})
SeaStackTab:AddToggle({Name="Tween to Frozen Dimension",Default=_G.S.SeaStack["Tween To Frozen Dimension"],Callback=function(v) _G.S.SeaStack["Tween To Frozen Dimension"]=v; StopTween(v); SaveSetting() end})
SeaStackTab:AddToggle({Name="Tween to Prehistoric Island",Default=_G.S.SeaStack["Tween To Prehistoric Island"],Callback=function(v) _G.S.SeaStack["Tween To Prehistoric Island"]=v; StopTween(v); SaveSetting() end})
SeaStackTab:AddToggle({Name="Auto Attack Sea Beasts",Default=_G.S.SeaStack["Auto Attack Seabeasts"],Callback=function(v) _G.S.SeaStack["Auto Attack Seabeasts"]=v; StopTween(v); SaveSetting() end})
SeaStackTab:AddSection("Azure Ember")
SeaStackTab:AddToggle({Name="Auto Collect Azure Ember",Default=_G.S.SeaStack["Auto Collect Azure Ember"],Callback=function(v) _G.S.SeaStack["Auto Collect Azure Ember"]=v; SaveSetting() end})
SeaStackTab:AddSlider({Name="Azure Ember Amount to Trade",Min=1,Max=25,Increment=1,Default=_G.S.SeaStack["Set Azure Ember"],Callback=function(v) _G.S.SeaStack["Set Azure Ember"]=v; SaveSetting() end})
SeaStackTab:AddToggle({Name="Auto Trade Azure Ember",Default=_G.S.SeaStack["Auto Trade Azure Ember"],Callback=function(v) _G.S.SeaStack["Auto Trade Azure Ember"]=v; SaveSetting() end})
SeaStackTab:AddToggle({Name="Auto Kill Lava Golem",Default=_G.S.SeaStack["Auto Kill Lava Golem"],Callback=function(v) _G.S.SeaStack["Auto Kill Lava Golem"]=v; StopTween(v); SaveSetting() end})
spawn(function()
    while wait(0.2) do
        pcall(function()
            local locs = workspace._WorldOrigin.Locations
            if _G.S.SeaStack["Tween To Mirage Island"] and locs:FindFirstChild("Mirage Island") then TweenPlayer(locs["Mirage Island"].CFrame) end
            if _G.S.SeaStack["Tween To Kitsune Island"] and workspace.Map:FindFirstChild("KitsuneIsland") then TweenPlayer(workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame*CFrame.new(0,0,10)) end
            if _G.S.SeaStack["Tween To Frozen Dimension"] and locs:FindFirstChild("Frozen Dimension") then TweenPlayer(locs["Frozen Dimension"].CFrame) end
            if _G.S.SeaStack["Tween To Prehistoric Island"] and locs:FindFirstChild("Prehistoric Island") then TweenPlayer(locs["Prehistoric Island"].CFrame) end
            if _G.S.SeaStack["Auto Collect Azure Ember"] and World3 then
                if workspace:FindFirstChild("AttachedAzureEmber") then
                    local part = workspace.EmberTemplate and workspace.EmberTemplate:FindFirstChild("Part")
                    if part then TweenPlayer(part.CFrame) end
                end
            end
            if _G.S.SeaStack["Auto Trade Azure Ember"] and World3 then
                local count = GetCountMaterials("Azure Ember")
                if count >= _G.S.SeaStack["Set Azure Ember"] then
                    pcall(function() ReplicatedStorage.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer() end)
                end
            end
            if _G.S.SeaStack["Auto Kill Lava Golem"] and World3 then
                if workspace.Enemies:FindFirstChild("Lava Golem") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name=="Lava Golem" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.S.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed=0
                                v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                                PosMon=v.HumanoidRootPart.CFrame
                                MonFarm=v.Name
                                TweenPlayer(v.HumanoidRootPart.CFrame*Pos)
                                Attack()
                            until not _G.S.SeaStack["Auto Kill Lava Golem"] or not v.Parent or v.Humanoid.Health<=0
                        end
                    end
                end
            end
            if _G.S.SeaStack["Auto Attack Seabeasts"] and (World2 or World3) then
                if workspace:FindFirstChild("SeaBeasts") then
                    for _, v in pairs(workspace.SeaBeasts:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                local cf = v.HumanoidRootPart.CFrame*CFrame.new(0,200,0)
                                Skillaimbot=true
                                AimBotSkillPosition=v.HumanoidRootPart.CFrame.Position
                                AutoHaki()
                                TweenPlayer(cf)
                            until not _G.S.SeaStack["Auto Attack Seabeasts"] or not v.Parent or v.Humanoid.Health<=0 or not v:FindFirstChild("Humanoid")
                            Skillaimbot=false
                        end
                    end
                end
            end
        end)
    end
end)

SeaSettingsTab:AddSection("Sea Combat Settings")
SeaSettingsTab:AddToggle({Name="Lightning (Force Daytime)",Default=_G.S.SettingSea["Lightning"],Callback=function(v) _G.S.SettingSea["Lightning"]=v end})
SeaSettingsTab:AddToggle({Name="Increase Boat Speed",Default=_G.S.SettingSea["Increase Boat Speed"],Callback=function(v) _G.S.SettingSea["Increase Boat Speed"]=v end})
SeaSettingsTab:AddToggle({Name="No Clip Rock",Default=_G.S.SettingSea["No Clip Rock"],Callback=function(v) _G.S.SettingSea["No Clip Rock"]=v end})
SeaSettingsTab:AddSection("Skills to Use in Sea")
for _, t in ipairs({{"Use Devil Fruit Skill","Use Devil Fruit Skill"},{"Use Melee Skill","Use Melee Skill"},{"Use Sword Skill","Use Sword Skill"},{"Use Gun Skill","Use Gun Skill"}}) do
    SeaSettingsTab:AddToggle({Name=t[1],Default=_G.S.SettingSea[t[2]],Callback=function(v) _G.S.SettingSea[t[2]]=v; SaveSetting() end})
end
SeaSettingsTab:AddSection("Devil Fruit Skills")
for _, k in ipairs({"Z","X","C","V","F"}) do
    local sk = "Devil Fruit "..k.." Skill"
    SeaSettingsTab:AddToggle({Name="DF Skill "..k,Default=_G.S.SettingSea[sk],Callback=function(v) _G.S.SettingSea[sk]=v; SaveSetting() end})
end
SeaSettingsTab:AddSection("Melee Skills")
for _, k in ipairs({"Z","X","C","V"}) do
    local sk = "Melee "..k.." Skill"
    SeaSettingsTab:AddToggle({Name="Melee Skill "..k,Default=_G.S.SettingSea[sk],Callback=function(v) _G.S.SettingSea[sk]=v; SaveSetting() end})
end
spawn(function()
    RunService.Heartbeat:Connect(function()
        if _G.S.SettingSea["Lightning"] then Lighting.ClockTime=12 end
    end)
end)
spawn(function()
    while wait(0.5) do
        pcall(function()
            for _, v in pairs(workspace.Boats:GetDescendants()) do
                if v:IsA("VehicleSeat") then v.MaxSpeed=_G.S.SettingSea["Increase Boat Speed"] and 350 or 150 end
                if v:IsA("BasePart") then v.CanCollide=not (_G.S.SettingSea["No Clip Rock"] or _G.S.SeaEvent["Sail Boat"]) end
            end
        end)
    end
end)

EspTab:AddSection("ESP Toggles")
local espList = {
    {"ESP Player","ESP Player"},{"ESP Chest","ESP Chest"},{"ESP Devil Fruit","ESP DevilFruit"},
    {"ESP Real Fruit","ESP RealFruit"},{"ESP Flower","ESP Flower"},{"ESP Island","ESP Island"},
    {"ESP NPC","ESP Npc"},{"ESP Sea Beast","ESP Sea Beast"},{"ESP Monster","ESP Monster"},
    {"ESP Mirage Island","ESP Mirage"},{"ESP Kitsune Island","ESP Kitsune"},
    {"ESP Frozen Dimension","ESP Frozen"},
}
for _, t in ipairs(espList) do
    EspTab:AddToggle({Name=t[1],Default=_G.S.Esp[t[2]],Callback=function(v) _G.S.Esp[t[2]]=v end})
end
local espNum = math.random(1,999999)
spawn(function()
    while wait(1) do
        for _, v in pairs(Players:GetChildren()) do
            pcall(function()
                if not v.Character then return end
                local head = v.Character:FindFirstChild("Head")
                if not head then return end
                local en = "EspPlayer"..espNum
                if _G.S.Esp["ESP Player"] then
                    if not head:FindFirstChild(en) then
                        local b=Instance.new("BillboardGui",head) b.Name=en b.AlwaysOnTop=true b.Size=UDim2.new(1,200,1,30) b.StudsOffset=Vector3.new(0,2.5,0)
                        local l=Instance.new("TextLabel",b) l.BackgroundTransparency=1 l.Size=UDim2.new(1,0,1,0) l.Font=Enum.Font.GothamBold l.TextSize=14 l.TextWrapped=true l.TextStrokeTransparency=0.5
                        l.TextColor3=v.Team==plr.Team and Color3.fromRGB(50,200,50) or Color3.fromRGB(200,50,50)
                    else
                        local hrp=v.Character:FindFirstChild("HumanoidRootPart")
                        local hum=v.Character:FindFirstChild("Humanoid")
                        if hrp and hum then
                            head[en].TextLabel.Text=v.Name.." | "..math.floor((plr.Character.Head.Position-head.Position).Magnitude/3).."m | "..math.floor(hum.Health/hum.MaxHealth*100).."%"
                        end
                    end
                elseif head:FindFirstChild(en) then head:FindFirstChild(en):Destroy() end
            end)
        end
        for _, v in pairs(workspace.Enemies:GetChildren()) do
            pcall(function()
                if not v:FindFirstChild("HumanoidRootPart") then return end
                if _G.S.Esp["ESP Monster"] then
                    if not v:FindFirstChild("EspMon") then
                        local b=Instance.new("BillboardGui",v) b.Name="EspMon" b.AlwaysOnTop=true b.Size=UDim2.new(0,200,0,50) b.StudsOffset=Vector3.new(0,2.5,0)
                        local l=Instance.new("TextLabel",b) l.BackgroundTransparency=1 l.Size=UDim2.new(0,200,0,50) l.Font=Enum.Font.GothamBold l.TextColor3=Color3.fromRGB(120,130,230) l.TextSize=14
                    else v.EspMon.TextLabel.Text=v.Name.." | "..math.floor((plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude).."m" end
                elseif v:FindFirstChild("EspMon") then v.EspMon:Destroy() end
            end)
        end
        if workspace:FindFirstChild("SeaBeasts") then
            for _, v in pairs(workspace.SeaBeasts:GetChildren()) do
                pcall(function()
                    if not v:FindFirstChild("HumanoidRootPart") then return end
                    if _G.S.Esp["ESP Sea Beast"] then
                        if not v:FindFirstChild("EspSB") then
                            local b=Instance.new("BillboardGui",v) b.Name="EspSB" b.AlwaysOnTop=true b.Size=UDim2.new(0,200,0,50) b.StudsOffset=Vector3.new(0,2.5,0)
                            local l=Instance.new("TextLabel",b) l.BackgroundTransparency=1 l.Size=UDim2.new(0,200,0,50) l.Font=Enum.Font.GothamBold l.TextColor3=Color3.fromRGB(60,240,120) l.TextSize=14
                        else v.EspSB.TextLabel.Text=v.Name.." | "..math.floor((plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude).."m" end
                    elseif v:FindFirstChild("EspSB") then v.EspSB:Destroy() end
                end)
            end
        end
        for _, v in pairs(workspace.ChestModels:GetChildren()) do
            pcall(function()
                if not v.Name:find("Chest") then return end
                if _G.S.Esp["ESP Chest"] then
                    if not v:FindFirstChild("EspChest") then
                        local b=Instance.new("BillboardGui",v) b.Name="EspChest" b.AlwaysOnTop=true b.Size=UDim2.new(1,200,1,30)
                        local l=Instance.new("TextLabel",b) l.BackgroundTransparency=1 l.Size=UDim2.new(1,0,1,0) l.Font=Enum.Font.GothamBold
                        l.TextColor3=v.Name=="DiamondChest" and Color3.fromRGB(20,200,200) or v.Name=="GoldChest" and Color3.fromRGB(255,200,0) or Color3.fromRGB(150,150,150)
                        l.TextSize=14
                    else v.EspChest.TextLabel.Text=v.Name.." | "..math.floor((plr.Character.HumanoidRootPart.Position-v.RootPart.Position).Magnitude).."m" end
                elseif v:FindFirstChild("EspChest") then v.EspChest:Destroy() end
            end)
        end
        for _, v in pairs(workspace:GetChildren()) do
            pcall(function()
                if _G.S.Esp["ESP DevilFruit"] and v.Name:find("Fruit") and v:FindFirstChild("Handle") then
                    if not v.Handle:FindFirstChild("EspDF") then
                        local b=Instance.new("BillboardGui",v.Handle) b.Name="EspDF" b.AlwaysOnTop=true b.Size=UDim2.new(1,200,1,30)
                        local l=Instance.new("TextLabel",b) l.BackgroundTransparency=1 l.Size=UDim2.new(1,0,1,0) l.Font=Enum.Font.GothamBold l.TextColor3=Color3.fromRGB(255,255,0) l.TextSize=14
                    else v.Handle.EspDF.TextLabel.Text=v.Name.." | "..math.floor((plr.Character.HumanoidRootPart.Position-v.Handle.Position).Magnitude).."m" end
                elseif not _G.S.Esp["ESP DevilFruit"] and v:FindFirstChild("Handle") and v.Handle:FindFirstChild("EspDF") then v.Handle.EspDF:Destroy() end
            end)
        end
    end
end)

TeleportTab:AddSection("Sea Travel")
TeleportTab:AddButton({Name="Go to Sea 1",Callback=function() pcall(function() CommF_:InvokeServer("TravelMain") end) end})
TeleportTab:AddButton({Name="Go to Sea 2",Callback=function() pcall(function() CommF_:InvokeServer("TravelDressrosa") end) end})
TeleportTab:AddButton({Name="Go to Sea 3",Callback=function() pcall(function() CommF_:InvokeServer("TravelZou") end) end})
TeleportTab:AddSection("Island Teleport")
local IDropdown = TeleportTab:AddDropdown({Name="Select Island",Options=IslandList,Default=IslandList[1],Callback=function(v) _G.SelectIsland=v end})
TeleportTab:AddToggle({Name="Teleport to Island",Default=false,Callback=function(v)
    _G.TeleportIsland=v
    if v then
        spawn(function()
            repeat
                pcall(function()
                    if _G.SelectIsland and IslandCFrames[_G.SelectIsland] then TweenPlayer(IslandCFrames[_G.SelectIsland]) end
                end)
                wait(0.1)
            until not _G.TeleportIsland
            StopTween(false)
        end)
    end
end})
TeleportTab:AddSection("NPC Teleport")
local NpcList = World1 and {"Random Devil Fruit","Blox Fruits Dealer","Remove Devil Fruit","Ability Teacher","Dark Step","Electro","Fishman Karate"}
    or World2 and {"Blox Fruits Dealer","Trevor","Enhancement Editor","Pirate Recruiter","Marines Recruiter","Chemist","Cyborg","Ghoul Mark","Guashiem","El Admin","Arowe"}
    or World3 and {"Blox Fruits Dealer","Remove Devil Fruit","Horned Man","Hungry Man","Previous Hero","Butler","Lunoven","Elite Hunter","Player Hunter","Uzoth"}
    or {}
local NpcCFrames = {
    ["Random Devil Fruit"]=CFrame.new(-1436,61,4),["Blox Fruits Dealer"]=CFrame.new(-923,7,1608),
    ["Remove Devil Fruit"]=CFrame.new(5664,64,867),["Ability Teacher"]=CFrame.new(-1057,9,1799),
    ["Dark Step"]=CFrame.new(-987,13,3989),Electro=CFrame.new(-5389,13,-2149),
    ["Fishman Karate"]=CFrame.new(61581,18,987),Trevor=CFrame.new(-341,331,643),
    ["Enhancement Editor"]=CFrame.new(-346,72,1194),["Pirate Recruiter"]=CFrame.new(-428,72,1445),
    ["Marines Recruiter"]=CFrame.new(-1349,72,-1045),Chemist=CFrame.new(-2777,72,-3572),
    Cyborg=CFrame.new(629,312,-531),["Ghoul Mark"]=CFrame.new(635,125,33219),
    Guashiem=CFrame.new(937,181,33277),["El Admin"]=CFrame.new(1322,126,33135),
    Arowe=CFrame.new(-1994,125,-72),["Horned Man"]=CFrame.new(-11890,931,-8760),
    ["Hungry Man"]=CFrame.new(-10919,624,-10268),["Previous Hero"]=CFrame.new(-10368,332,-10128),
    Butler=CFrame.new(-5125,316,-3130),Lunoven=CFrame.new(-5117,316,-3093),
    ["Elite Hunter"]=CFrame.new(-5420,314,-2828),["Player Hunter"]=CFrame.new(-5559,314,-2840),
    Uzoth=CFrame.new(-9785,852,6667),
}
local NDropdown = TeleportTab:AddDropdown({Name="Select NPC",Options=NpcList,Default=NpcList[1],Callback=function(v) _G.SelectNPC=v end})
TeleportTab:AddToggle({Name="Teleport to NPC",Default=false,Callback=function(v)
    _G.TeleportNPC=v
    if v then
        spawn(function()
            repeat
                pcall(function()
                    if _G.SelectNPC and NpcCFrames[_G.SelectNPC] then TweenPlayer(NpcCFrames[_G.SelectNPC]) end
                end)
                wait(0.1)
            until not _G.TeleportNPC
            StopTween(false)
        end)
    end
end})

FruitTab:AddSection("Fruit Options")
FruitTab:AddToggle({Name="Auto Buy Random Fruit",Default=_G.S.Fruit["Auto Buy Random Fruit"],Callback=function(v)
    _G.S.Fruit["Auto Buy Random Fruit"]=v
    if v then spawn(function() while _G.S.Fruit["Auto Buy Random Fruit"] do pcall(function() CommF_:InvokeServer("Cousin","Buy") end) wait(0.3) end end) end
end})
FruitTab:AddDropdown({Name="Store Rarity",Options={"Common - Mythical","Uncommon - Mythical","Rare - Mythical","Legendary - Mythical","Mythical"},Default=_G.S.Fruit["Store Rarity Fruit"],Callback=function(v) _G.S.Fruit["Store Rarity Fruit"]=v; SaveSetting() end})
FruitTab:AddToggle({Name="Auto Store Fruit",Default=_G.S.Fruit["Auto Store Fruit"],Callback=function(v) _G.S.Fruit["Auto Store Fruit"]=v; SaveSetting() end})
FruitTab:AddToggle({Name="Fruit Notification",Default=_G.S.Fruit["Fruit Notification"],Callback=function(v) _G.S.Fruit["Fruit Notification"]=v; SaveSetting() end})
FruitTab:AddToggle({Name="Teleport To Fruit",Default=_G.S.Fruit["Teleport To Fruit"],Callback=function(v) _G.S.Fruit["Teleport To Fruit"]=v; SaveSetting() end})
FruitTab:AddToggle({Name="Tween To Fruit",Default=_G.S.Fruit["Tween To Fruit"],Callback=function(v) _G.S.Fruit["Tween To Fruit"]=v; SaveSetting() end})
FruitTab:AddButton({Name="Grab All Fruits",Callback=function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Tool") then pcall(function() v.Handle.CFrame=plr.Character.HumanoidRootPart.CFrame end) end
    end
end})
local RarityFruits = {
    Common={"Rocket Fruit","Spin Fruit","Blade Fruit","Spring Fruit","Bomb Fruit","Smoke Fruit","Spike Fruit"},
    Uncommon={"Flame Fruit","Falcon Fruit","Ice Fruit","Sand Fruit","Diamond Fruit","Dark Fruit"},
    Rare={"Light Fruit","Rubber Fruit","Barrier Fruit","Ghost Fruit","Magma Fruit"},
    Legendary={"Quake Fruit","Buddha Fruit","Love Fruit","Spider Fruit","Sound Fruit","Phoenix Fruit","Portal Fruit","Rumble Fruit","Pain Fruit","Blizzard Fruit"},
    Mythical={"Gravity Fruit","Mammoth Fruit","T-Rex Fruit","Dough Fruit","Shadow Fruit","Venom Fruit","Control Fruit","Gas Fruit","Spirit Fruit","Leopard Fruit","Yeti Fruit","Kitsune Fruit","Dragon Fruit"}
}
spawn(function()
    while wait(0.5) do
        pcall(function()
            if _G.S.Fruit["Fruit Notification"] then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name:find("Fruit") then Window:Notify({Title="Fruit Found!",Content=v.Name,Duration=3}) end
                end
            end
            if _G.S.Fruit["Teleport To Fruit"] then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name:find("Fruit") and v:FindFirstChild("Handle") then plr.Character.HumanoidRootPart.CFrame=v.Handle.CFrame end
                end
            end
            if _G.S.Fruit["Tween To Fruit"] then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name:find("Fruit") and v:FindFirstChild("Handle") then TweenPlayer(v.Handle.CFrame) end
                end
            end
            if _G.S.Fruit["Auto Store Fruit"] then
                local storeRarity = _G.S.Fruit["Store Rarity Fruit"]
                local rarityOrder = {"Common","Uncommon","Rare","Legendary","Mythical"}
                local startIdx = 1
                for i, r in ipairs(rarityOrder) do if storeRarity:find(r) then startIdx=i; break end end
                local validFruits = {}
                for i=startIdx, #rarityOrder do
                    for _, fn in ipairs(RarityFruits[rarityOrder[i]]) do table.insert(validFruits,fn) end
                end
                for _, item in pairs(plr.Backpack:GetChildren()) do
                    if item.Name:find("Fruit") then
                        for _, fn in ipairs(validFruits) do
                            if item.Name==fn then
                                local fname = item.Name:gsub(" Fruit","")
                                CommF_:InvokeServer("StoreFruit",fname.."-"..fname,item)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

ShopTab:AddSection("Auto Buy")
ShopTab:AddToggle({Name="Auto Buy Legendary Sword",Default=_G.S.Shop["Auto Buy Legendary Sword"],Callback=function(v)
    _G.S.Shop["Auto Buy Legendary Sword"]=v
    if v then spawn(function() while _G.S.Shop["Auto Buy Legendary Sword"] do pcall(function() CommF_:InvokeServer("LegendarySwordDealer","1") CommF_:InvokeServer("LegendarySwordDealer","2") CommF_:InvokeServer("LegendarySwordDealer","3") end) wait(0.3) end end) end
    SaveSetting()
end})
ShopTab:AddToggle({Name="Auto Buy Haki Color",Default=_G.S.Shop["Auto Buy Haki Color"],Callback=function(v)
    _G.S.Shop["Auto Buy Haki Color"]=v
    if v then spawn(function() while _G.S.Shop["Auto Buy Haki Color"] do pcall(function() CommF_:InvokeServer("ColorsDealer","2") end) wait(0.3) end end) end
    SaveSetting()
end})
ShopTab:AddSection("Abilities")
local abilityBtns = {
    {"Buy Geppo ($10k)","BuyHaki","Geppo"},{"Buy Buso Haki ($25k)","BuyHaki","Buso"},
    {"Buy Soru ($25k)","BuyHaki","Soru"},{"Buy Observation Haki ($750k)","KenTalk","Buy"},
    {"Buy Black Leg ($150k)","BuyBlackLeg",nil},{"Buy Electro ($550k)","BuyElectro",nil},
    {"Buy Fishman Karate ($750k)","BuyFishmanKarate",nil},{"Buy Superhuman ($3M)","BuySuperhuman",nil},
    {"Buy Death Step (F5k $5M)","BuyDeathStep",nil},{"Buy Electric Claw","BuyElectricClaw",nil},
    {"Buy Dragon Talon","BuyDragonTalon",nil},{"Buy God Human","BuyGodhuman",nil},
}
for _, t in ipairs(abilityBtns) do
    ShopTab:AddButton({Name=t[1],Callback=function()
        pcall(function() if t[3] then CommF_:InvokeServer(t[2],t[3]) else CommF_:InvokeServer(t[2]) end end)
    end})
end
ShopTab:AddSection("Swords Shop")
local swordBtns = {
    {"Buy Cutlass ($1k)","BuyItem","Cutlass"},{"Buy Katana ($1k)","BuyItem","Katana"},
    {"Buy Iron Mace ($25k)","BuyItem","Iron Mace"},{"Buy Dual Katana ($12k)","BuyItem","Dual Katana"},
    {"Buy Triple Katana ($60k)","BuyItem","Triple Katana"},{"Buy Pipe ($100k)","BuyItem","Pipe"},
    {"Buy Bisento ($1.2M)","BuyItem","Bisento"},{"Buy Soul Cane","BuyItem","Soul Cane"},
}
for _, t in ipairs(swordBtns) do
    ShopTab:AddButton({Name=t[1],Callback=function() pcall(function() CommF_:InvokeServer(t[2],t[3]) end) end})
end
ShopTab:AddSection("Gun Shop")
local gunBtns = {
    {"Buy Slingshot ($5k)","BuyItem","Slingshot"},{"Buy Musket ($8k)","BuyItem","Musket"},
    {"Buy Flintlock ($10.5k)","BuyItem","Flintlock"},{"Buy Cannon ($100k)","BuyItem","Cannon"},
}
for _, t in ipairs(gunBtns) do
    ShopTab:AddButton({Name=t[1],Callback=function() pcall(function() CommF_:InvokeServer(t[2],t[3]) end) end})
end
ShopTab:AddSection("Codes")
ShopTab:AddButton({Name="Redeem All Codes",Callback=function()
    local codes={"ZIOLES","NOOB2ADMIN","KITT_RESET","Sub2CaptainMaui","SUB2GAMERROBOT_RESET1","kittgaming","Sub2Fer999","Enyu_is_Pro","Magicbus","JCWK","Starcodeheo","Bluxxy","fudd10_v2","FUDD10","BIGNEWS","THEGREATACE","SUB2GAMERROBOT_EXP1","Sub2OfficialNoobie","StrawHatMaine","SUB2NOOBMASTER123","Sub2UncleKizaru","Sub2Daigrock","Axiore","TantaiGaming"}
    for _, c in ipairs(codes) do pcall(function() game.ReplicatedStorage.Remotes.Redeem:InvokeServer(c) end) end
    Window:Notify({Title="Codes",Content="All codes redeemed!",Duration=3})
end})
ShopTab:AddButton({Name="Reset Stats (F2.5k)",Callback=function()
    pcall(function() CommF_:InvokeServer("BlackbeardReward","Refund","1") CommF_:InvokeServer("BlackbeardReward","Refund","2") end)
end})
ShopTab:AddButton({Name="Random Race (F3k)",Callback=function()
    pcall(function() CommF_:InvokeServer("BlackbeardReward","Reroll","1") CommF_:InvokeServer("BlackbeardReward","Reroll","2") end)
end})

MiscTab:AddSection("Team")
MiscTab:AddButton({Name="Join Pirates",Callback=function() pcall(function() CommF_:InvokeServer("SetTeam","Pirates") end) end})
MiscTab:AddButton({Name="Join Marines",Callback=function() pcall(function() CommF_:InvokeServer("SetTeam","Marines") end) end})
MiscTab:AddSection("Graphics & Performance")
MiscTab:AddButton({Name="FPS Boost",Callback=function()
    settings().Rendering.QualityLevel="Level01"
    for _, v in pairs(game:GetDescendants()) do
        pcall(function()
            if v:IsA("Part") or v:IsA("Union") then v.Material="Plastic" v.Reflectance=0
            elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency=1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Lifetime=NumberRange.new(0)
            elseif v:IsA("Fire") or v:IsA("Smoke") or v:IsA("SpotLight") then v.Enabled=false end
        end)
    end
    Window:Notify({Title="FPS Boost",Content="Applied!",Duration=3})
end})
MiscTab:AddButton({Name="Remove Fog",Callback=function()
    pcall(function() Lighting.FogEnd=9e9 Lighting.LightingLayers:Destroy() end)
end})
MiscTab:AddButton({Name="Remove Lava",Callback=function()
    for _, v in pairs(game:GetDescendants()) do if v.Name=="Lava" then pcall(function() v:Destroy() end) end end
end})
MiscTab:AddSection("UI Toggles")
MiscTab:AddToggle({Name="Hide Chat",Default=false,Callback=function(v)
    pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat,not v) end)
end})
MiscTab:AddToggle({Name="Hide Leaderboard",Default=false,Callback=function(v)
    pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,not v) end)
end})
MiscTab:AddToggle({Name="Anti AFK",Default=false,Callback=function(v)
    _G.S.Misc["Anti AFK"]=v
    if v then
        spawn(function()
            while _G.S.Misc["Anti AFK"] do
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
                wait(20)
            end
        end)
    end
end})
MiscTab:AddSection("Highlight")
MiscTab:AddToggle({Name="Self Highlight",Default=false,Callback=function(v)
    if v then
        local h=Instance.new("Highlight",game.CoreGui)
        h.Name="SelfHighlight"
        h.FillColor=Color3.fromRGB(255,255,255)
        h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
        h.FillTransparency=0.7
        h.OutlineColor=Color3.fromRGB(255,255,255)
        if plr.Character then h.Adornee=plr.Character end
        plr.CharacterAdded:Connect(function(c) h.Adornee=c end)
    else
        local h=game.CoreGui:FindFirstChild("SelfHighlight")
        if h then h:Destroy() end
    end
end})

ServerTab:AddSection("Server Info")
local JobIdPara = ServerTab:AddParagraph("Job ID", game.JobId)
local PlaceIdPara = ServerTab:AddParagraph("Place ID", tostring(game.PlaceId))
local PlayersCountPara = ServerTab:AddParagraph("Players", "0/12")
spawn(function() while wait(1) do pcall(function() PlayersCountPara:SetDescription(#Players:GetPlayers().."/12") end) end end)
ServerTab:AddSection("Server Actions")
ServerTab:AddButton({Name="Copy Job ID",Callback=function() pcall(function() setclipboard(game.JobId) end) end})
ServerTab:AddButton({Name="Rejoin Server",Callback=function() TeleportService:Teleport(game.PlaceId) end})
ServerTab:AddButton({Name="Server Hop",Callback=function()
    local ok, m = pcall(function() return (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))() end)
    if ok then m:Teleport(game.PlaceId) else Window:Notify({Title="Error",Content="Server hop failed",Duration=3}) end
end})
local JobIdInput = ""
ServerTab:AddTextBox({Name="Enter Job ID",Placeholder="paste job id here...",ClearOnFocus=true,Callback=function(v) JobIdInput=v end})
ServerTab:AddButton({Name="Join by Job ID",Callback=function()
    if JobIdInput~="" then TeleportService:TeleportToPlaceInstance(game.PlaceId,JobIdInput) end
end})

SettingsTab:AddSection("Farm Settings")
SettingsTab:AddToggle({Name="Spin Position",Default=_G.S.Setting["Spin Position"],Callback=function(v) _G.S.Setting["Spin Position"]=v; SaveSetting() end})
SettingsTab:AddSlider({Name="Farm Distance",Min=10,Max=60,Increment=1,Default=_G.S.Setting["Farm Distance"],Callback=function(v) _G.S.Setting["Farm Distance"]=v end})
SettingsTab:AddSlider({Name="Player Tween Speed",Min=50,Max=500,Increment=10,Default=_G.S.Setting["Player Tween Speed"],Callback=function(v) _G.S.Setting["Player Tween Speed"]=v end})
SettingsTab:AddToggle({Name="Bring Mob",Default=_G.S.Setting["Bring Mob"],Callback=function(v) _G.S.Setting["Bring Mob"]=v; SaveSetting() end})
SettingsTab:AddDropdown({Name="Bring Mob Mode",Options={"Low","Normal","High"},Default=_G.S.Setting["Bring Mob Mode"],Callback=function(v)
    _G.S.Setting["Bring Mob Mode"]=v
    BringMobDistance=v=="Low" and 150 or v=="Normal" and 250 or 800
end})
SettingsTab:AddDropdown({Name="Fast Attack Mode",Options={"Slow","Normal","Fast","Super Fast"},Default=_G.S.Setting["Fast Attack Mode"],Callback=function(v) _G.S.Setting["Fast Attack Mode"]=v end})
SettingsTab:AddSection("Auto Settings")
SettingsTab:AddToggle({Name="Auto Haki",Default=_G.S.Setting["Auto Haki"],Callback=function(v) _G.S.Setting["Auto Haki"]=v; SaveSetting() end})
SettingsTab:AddToggle({Name="Auto Set Spawn Point",Default=_G.S.Setting["Auto Set Spawn Point"],Callback=function(v) _G.S.Setting["Auto Set Spawn Point"]=v; SaveSetting() end})
SettingsTab:AddToggle({Name="Auto Observation",Default=_G.S.Setting["Auto Observation"],Callback=function(v) _G.S.Setting["Auto Observation"]=v; SaveSetting() end})
SettingsTab:AddToggle({Name="Auto Rejoin on Disconnect",Default=_G.S.Setting["Auto Rejoin"],Callback=function(v)
    _G.S.Setting["Auto Rejoin"]=v
    if v then
        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(c)
            if c.Name=="ErrorPrompt" then TeleportService:Teleport(game.PlaceId) end
        end)
    end
    SaveSetting()
end})
SettingsTab:AddSection("Visual Settings")
SettingsTab:AddToggle({Name="Hide Notifications",Default=_G.S.Setting["Hide Notification"],Callback=function(v)
    _G.S.Setting["Hide Notification"]=v
    pcall(function() plr.PlayerGui.Notifications.Enabled=not v end)
    SaveSetting()
end})
SettingsTab:AddToggle({Name="Hide Damage Text",Default=_G.S.Setting["Hide Damage Text"],Callback=function(v)
    _G.S.Setting["Hide Damage Text"]=v
    pcall(function() game.ReplicatedStorage.Assets.GUI.DamageCounter.Enabled=not v end)
    SaveSetting()
end})
SettingsTab:AddToggle({Name="Black Screen",Default=_G.S.Setting["Black Screen"],Callback=function(v)
    _G.S.Setting["Black Screen"]=v
    pcall(function() plr.PlayerGui.Main.Blackscreen.Size=v and UDim2.new(500,0,500,500) or UDim2.new(1,0,500,500) end)
    SaveSetting()
end})
SettingsTab:AddToggle({Name="White Screen (Disable 3D)",Default=_G.S.Setting["White Screen"],Callback=function(v)
    _G.S.Setting["White Screen"]=v
    RunService:Set3dRenderingEnabled(not v)
    SaveSetting()
end})
SettingsTab:AddButton({Name="Save All Settings",Callback=function() SaveSetting() Window:Notify({Title="Saved",Content="Settings saved successfully!",Duration=3}) end})
SettingsTab:AddButton({Name="Reset All Settings",Callback=function()
    Window:Dialog({
        Title="Reset Settings",
        Content="Are you sure you want to reset all settings?",
        Options={
            {Name="Cancel"},
            {Name="Yes, Reset",Callback=function()
                if isfolder and isfolder("BFWandHub") then
                    local path="BFWandHub/"..plr.Name..".json"
                    if isfile and isfile(path) then pcall(function() delfile(path) end) end
                end
                Window:Notify({Title="Reset",Content="Settings reset. Rejoin to apply.",Duration=4})
            end}
        }
    })
end})

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.S.Setting["Bring Mob"] then
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name==MonFarm and v:FindFirstChild("HumanoidRootPart") then
                        if (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude<=BringMobDistance then
                            v.HumanoidRootPart.CFrame=PosMon
                            v.HumanoidRootPart.Size=Vector3.new(1,1,1)
                        end
                    end
                end
            end
            if _G.S.Setting["Auto Haki"] then AutoHaki() end
            if _G.S.Setting["Auto Set Spawn Point"] then pcall(function() CommF_:InvokeServer("SetSpawnPoint") end) end
        end)
    end
end)

spawn(function()
    RunService.Stepped:Connect(function()
        pcall(function()
            if setscriptable then setscriptable(plr,"SimulationRadius",true) end
            if sethiddenproperty then sethiddenproperty(plr,"SimulationRadius",math.huge) end
            local needNoclip = _G.S.Main["Auto Farm"] or _G.S.Main["Auto Farm Fruit Mastery"] or _G.S.Main["Auto Farm Gun Mastery"] or _G.S.Main["Auto Farm Sword Mastery"] or _G.S.Farm["Auto Farm Chest Tween"] or _G.S.Farm["Auto Elite Hunter"] or _G.S.Farm["Auto Farm Material"]
            if needNoclip then
                local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp and not hrp:FindFirstChild("BodyClip") then
                    local nc=Instance.new("BodyVelocity") nc.Name="BodyClip" nc.Parent=hrp nc.MaxForce=Vector3.new(1e5,1e5,1e5) nc.Velocity=Vector3.new(0,0,0)
                end
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide=false end
                end
            end
            if _G.S.LocalPlayer["No Clip"] then
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide=false end
                end
            end
        end)
    end)
end)

spawn(function()
    RunService.RenderStepped:Connect(function()
        pcall(function()
            if setscriptable then setscriptable(plr,"SimulationRadius",true) end
            if sethiddenproperty then sethiddenproperty(plr,"SimulationRadius",math.huge) end
        end)
    end)
end)

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.S.Setting["Auto Observation"] then
                if not plr.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):SetKeyDown("0x65")
                    wait()
                    game:GetService("VirtualUser"):SetKeyUp("0x65")
                end
            end
            if _G.S.LocalPlayer["Walk On Water"] then
                pcall(function() workspace.Map["WaterBase-Plane"].Size=Vector3.new(1000,112,1000) end)
            end
        end)
    end
end)

Window:Notify({
    Title="Blox Fruit Hub Loaded!",
    Content="Welcome! Running on "..(World1 and "Sea 1" or World2 and "Sea 2" or World3 and "Sea 3" or "Unknown Sea").." | Level "..plr.Data.Level.Value,
    Duration=6,
})
