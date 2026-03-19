-- ═══════════════════════════════════════════════
--          BLOX FRUIT HUB - FUNCTIONS
--          Core Logic & Utility Functions
-- ═══════════════════════════════════════════════

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")

local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local CommF_ = ReplicatedStorage.Remotes.CommF_

-- ══════════════ WORLD DETECTION ══════════════
World1, World2, World3 = false, false, false
if game.PlaceId == 2753915549 then World1 = true
elseif game.PlaceId == 4442272183 then World2 = true
elseif game.PlaceId == 7449423635 then World3 = true end

-- ══════════════ GLOBAL STATE ══════════════
_G.Settings = _G.Settings or {}
_G.StopTween = false
PosMon = CFrame.new(0, 35, 0)
MonFarm = ""
Pos = CFrame.new(0, 35, 0)
Skillaimbot = false
AimBotSkillPosition = Vector3.new(0,0,0)
UseSkill = false
UseGunSkill = false
SelectWeaponGun = nil
BringMobDistance = 250
StartFarmTrain = false

-- ══════════════ UTILITY ══════════════
function isnil(v) return v == nil end

local function round(n) return math.floor(tonumber(n) + 0.5) end

function GetDistance(target)
    return math.floor((target.Position - plr.Character.HumanoidRootPart.Position).Magnitude)
end

-- ══════════════ SAVE / LOAD ══════════════
;(getgenv()).Load = function()
    if readfile and writefile and isfile and isfolder then
        if not isfolder("BFHub") then makefolder("BFHub") end
        if not isfolder("BFHub/Data") then makefolder("BFHub/Data") end
        local path = "BFHub/Data/" .. plr.Name .. ".json"
        if not isfile(path) then
            writefile(path, game:GetService("HttpService"):JSONEncode(_G.Settings))
        else
            local ok, decoded = pcall(function()
                return game:GetService("HttpService"):JSONDecode(readfile(path))
            end)
            if ok and decoded then
                for i,v in pairs(decoded) do _G.Settings[i] = v end
            end
        end
    end
end

;(getgenv()).SaveSetting = function()
    if readfile and writefile and isfile and isfolder then
        local path = "BFHub/Data/" .. plr.Name .. ".json"
        if not isfile(path) then (getgenv()).Load() return end
        local arr = {}
        for i,v in pairs(_G.Settings) do arr[i] = v end
        writefile(path, game:GetService("HttpService"):JSONEncode(arr))
    end
end

-- ══════════════ MOVEMENT ══════════════
function InstantTp(cf)
    plr.Character.HumanoidRootPart.CFrame = cf
end

function TweenPlayer(pos)
    task.spawn(function()
        pcall(function()
            local char = plr.Character
            local hrp = char.HumanoidRootPart
            if plr:DistanceFromCharacter(pos.Position) <= 50 then
                hrp.CFrame = pos
                return
            end
            if not char:FindFirstChild("Root") then
                local root = Instance.new("Part", char)
                root.Size = Vector3.new(1, 0.5, 1)
                root.Name = "Root"
                root.Anchored = true
                root.Transparency = 1
                root.CanCollide = false
                root.CFrame = hrp.CFrame
            end
            local dist = (hrp.Position - pos.Position).Magnitude
            local speed = (_G.Settings.Setting and _G.Settings.Setting["Player Tween Speed"]) or 350
            local info = TweenInfo.new(dist / speed, Enum.EasingStyle.Linear)
            local tween = TweenService:Create(char.Root, info, {CFrame = pos})
            tween:Play()
            tween.Completed:Wait()
            if char:FindFirstChild("Root") then
                hrp.CFrame = char.Root.CFrame
                char.Root:Destroy()
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

function BTP(value)
    pcall(function()
        local hrp = plr.Character.HumanoidRootPart
        if (value.Position - hrp.Position).Magnitude >= 2000 and plr.Character.Humanoid.Health > 0 then
            repeat
                wait()
                hrp.CFrame = value
                CommF_:InvokeServer("SetSpawnPoint")
                wait()
                plr.Character.Head:Destroy()
                hrp.CFrame = value
            until (value.Position - hrp.Position).Magnitude <= 2000 and plr.Character.Humanoid.Health > 0
        end
    end)
end

function StopTween(state)
    if not state then
        _G.StopTween = true
        TweenPlayer(plr.Character.HumanoidRootPart.CFrame)
        local bc = plr.Character.HumanoidRootPart:FindFirstChild("BodyClip")
        if bc then bc:Destroy() end
        _G.StopTween = false
    end
end

-- ══════════════ WEAPONS ══════════════
function EquipWeapon(name)
    if not plr.Character:FindFirstChild(name) then
        local tool = plr.Backpack:FindFirstChild(name)
        if tool then plr.Character.Humanoid:EquipTool(tool) end
    end
end

function UnEquipWeapon(name)
    local tool = plr.Character:FindFirstChild(name)
    if tool then tool.Parent = plr.Backpack end
end

function EquipWeaponSword()
    pcall(function()
        for _, v in pairs(plr.Backpack:GetChildren()) do
            if v.ToolTip == "Sword" and v:IsA("Tool") then
                plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(v.Name))
            end
        end
    end)
end

-- ══════════════ COMBAT ══════════════
function AutoHaki()
    if not plr.Character:FindFirstChild("HasBuso") then
        pcall(function() CommF_:InvokeServer("Buso") end)
    end
end

function NormalAttack()
    pcall(function()
        local net = ReplicatedStorage.Modules.Net
        net["RE/RegisterAttack"]:FireServer()
    end)
end

function Attack()
    pcall(function()
        local char = plr.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local enemies = {}
        for _, folder in ipairs({workspace.Enemies, workspace.Characters}) do
            for _, v in ipairs(folder:GetChildren()) do
                local vhrp = v:FindFirstChild("HumanoidRootPart")
                local hum = v:FindFirstChild("Humanoid")
                if v ~= char and vhrp and hum and hum.Health > 0 and
                   (vhrp.Position - hrp.Position).Magnitude <= 60 then
                    for _, part in ipairs(v:GetChildren()) do
                        if part:IsA("BasePart") then
                            table.insert(enemies, {v, part})
                        end
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

function RemoveAnimation(mon)
    pcall(function()
        mon.Humanoid:ChangeState(11)
        if mon.Humanoid:FindFirstChild("Animator") then
            mon.Humanoid.Animator:Destroy()
        end
    end)
end

-- ══════════════ SKILLS ══════════════
function SendKey(key, down)
    if down then
        VirtualInputManager:SendKeyEvent(true, key, false, game)
    else
        VirtualInputManager:SendKeyEvent(false, key, false, game)
    end
end

function UseAllSkill()
    local types = {"Blox Fruit", "Melee", "Sword", "Gun"}
    for _, tip in ipairs(types) do
        for _, v in pairs(plr.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == tip then
                plr.Character.Humanoid:EquipTool(v)
                for _, key in ipairs({"Z","X","C","V","F"}) do
                    SendKey(key, true) wait(0) SendKey(key, false)
                end
                break
            end
        end
    end
end

-- Aimbot hook
spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if Skillaimbot then
                        args[2] = AimBotSkillPosition
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)

-- ══════════════ SPIN POSITION LOOP ══════════════
spawn(function()
    local angle = 0
    while wait() do
        if _G.Settings.Setting and _G.Settings.Setting["Spin Position"] then
            local r = math.rad(angle)
            local farmDist = (_G.Settings.Setting["Farm Distance"] or 35)
            Pos = CFrame.new(math.cos(r)*20, farmDist, math.sin(r)*20)
            angle = (angle + 30) % 360
        else
            Pos = CFrame.new(0, (_G.Settings.Setting and _G.Settings.Setting["Farm Distance"]) or 35, 0)
        end
    end
end)

-- ══════════════ NOCLIP ══════════════
spawn(function()
    RunService.Stepped:Connect(function()
        pcall(function()
            local s = _G.Settings
            if not s then return end
            local needNoclip = (s.Main and (s.Main["Auto Farm"] or s.Main["Auto Farm Fruit Mastery"] or s.Main["Auto Farm Gun Mastery"] or s.Main["Auto Farm Sword Mastery"])) or
                               (s.Farm and s.Farm["Auto Farm Chest Tween"])
            if needNoclip then
                local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp and not hrp:FindFirstChild("BodyClip") then
                    local nc = Instance.new("BodyVelocity")
                    nc.Name = "BodyClip"
                    nc.Parent = hrp
                    nc.MaxForce = Vector3.new(1e5,1e5,1e5)
                    nc.Velocity = Vector3.new(0,0,0)
                end
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
        end)
    end)
end)

-- ══════════════ AUTO HAKI LOOP ══════════════
spawn(function()
    while wait(0.2) do
        if _G.Settings.Setting and _G.Settings.Setting["Auto Haki"] then
            AutoHaki()
        end
    end
end)

-- ══════════════ AUTO SET SPAWN ══════════════
spawn(function()
    while wait() do
        if _G.Settings.Setting and _G.Settings.Setting["Auto Set Spawn Point"] then
            pcall(function() CommF_:InvokeServer("SetSpawnPoint") end)
        end
    end
end)

-- ══════════════ SIMULATION RADIUS ══════════════
spawn(function()
    RunService.RenderStepped:Connect(function()
        pcall(function()
            if setscriptable then setscriptable(plr, "SimulationRadius", true) end
            if sethiddenproperty then sethiddenproperty(plr, "SimulationRadius", math.huge) end
        end)
    end)
end)

-- ══════════════ QUEST HELPER ══════════════
Mon, LevelQuest, NameQuest, NameMon = nil, 1, nil, nil
CFrameQuest, CFrameMon = nil, nil

function CheckQuest()
    local MyLevel = plr.Data.Level.Value
    if World1 then
        if MyLevel <= 9 then Mon="Bandit";LevelQuest=1;NameQuest="BanditQuest1";NameMon="Bandit";CFrameQuest=CFrame.new(1059,15,1550);CFrameMon=CFrame.new(1045,27,1560)
        elseif MyLevel <= 14 then Mon="Monkey";LevelQuest=1;NameQuest="JungleQuest";NameMon="Monkey";CFrameQuest=CFrame.new(-1598,35,153);CFrameMon=CFrame.new(-1448,67,11)
        elseif MyLevel <= 29 then Mon="Gorilla";LevelQuest=2;NameQuest="JungleQuest";NameMon="Gorilla";CFrameQuest=CFrame.new(-1598,35,153);CFrameMon=CFrame.new(-1129,40,-525)
        elseif MyLevel <= 39 then Mon="Pirate";LevelQuest=1;NameQuest="BuggyQuest1";NameMon="Pirate";CFrameQuest=CFrame.new(-1141,4,3831);CFrameMon=CFrame.new(-1103,13,3896)
        elseif MyLevel <= 59 then Mon="Brute";LevelQuest=2;NameQuest="BuggyQuest1";NameMon="Brute";CFrameQuest=CFrame.new(-1141,4,3831);CFrameMon=CFrame.new(-1140,14,4322)
        elseif MyLevel <= 74 then Mon="Desert Bandit";LevelQuest=1;NameQuest="DesertQuest";NameMon="Desert Bandit";CFrameQuest=CFrame.new(894,5,4392);CFrameMon=CFrame.new(924,6,4481)
        elseif MyLevel <= 89 then Mon="Desert Officer";LevelQuest=2;NameQuest="DesertQuest";NameMon="Desert Officer";CFrameQuest=CFrame.new(894,5,4392);CFrameMon=CFrame.new(1608,8,4371)
        elseif MyLevel <= 99 then Mon="Snow Bandit";LevelQuest=1;NameQuest="SnowQuest";NameMon="Snow Bandit";CFrameQuest=CFrame.new(1389,88,-1298);CFrameMon=CFrame.new(1354,87,-1393)
        elseif MyLevel <= 119 then Mon="Snowman";LevelQuest=2;NameQuest="SnowQuest";NameMon="Snowman";CFrameQuest=CFrame.new(1389,88,-1298);CFrameMon=CFrame.new(1201,144,-1550)
        elseif MyLevel <= 149 then Mon="Chief Petty Officer";LevelQuest=1;NameQuest="MarineQuest2";NameMon="Chief Petty Officer";CFrameQuest=CFrame.new(-5039,27,4324);CFrameMon=CFrame.new(-4881,22,4273)
        elseif MyLevel <= 174 then Mon="Sky Bandit";LevelQuest=1;NameQuest="SkyQuest";NameMon="Sky Bandit";CFrameQuest=CFrame.new(-4839,716,-2619);CFrameMon=CFrame.new(-4953,295,-2899)
        elseif MyLevel <= 189 then Mon="Dark Master";LevelQuest=2;NameQuest="SkyQuest";NameMon="Dark Master";CFrameQuest=CFrame.new(-4839,716,-2619);CFrameMon=CFrame.new(-5259,391,-2229)
        elseif MyLevel <= 209 then Mon="Prisoner";LevelQuest=1;NameQuest="PrisonerQuest";NameMon="Prisoner";CFrameQuest=CFrame.new(5308,1,475);CFrameMon=CFrame.new(5098,0,474)
        elseif MyLevel <= 249 then Mon="Dangerous Prisoner";LevelQuest=2;NameQuest="PrisonerQuest";NameMon="Dangerous Prisoner";CFrameQuest=CFrame.new(5308,1,475);CFrameMon=CFrame.new(5654,15,866)
        elseif MyLevel <= 274 then Mon="Toga Warrior";LevelQuest=1;NameQuest="ColosseumQuest";NameMon="Toga Warrior";CFrameQuest=CFrame.new(-1580,6,-2986);CFrameMon=CFrame.new(-1820,51,-2740)
        elseif MyLevel <= 299 then Mon="Gladiator";LevelQuest=2;NameQuest="ColosseumQuest";NameMon="Gladiator";CFrameQuest=CFrame.new(-1580,6,-2986);CFrameMon=CFrame.new(-1292,56,-3339)
        elseif MyLevel <= 324 then Mon="Military Soldier";LevelQuest=1;NameQuest="MagmaQuest";NameMon="Military Soldier";CFrameQuest=CFrame.new(-5313,10,8515);CFrameMon=CFrame.new(-5411,11,8454)
        elseif MyLevel <= 374 then Mon="Military Spy";LevelQuest=2;NameQuest="MagmaQuest";NameMon="Military Spy";CFrameQuest=CFrame.new(-5313,10,8515);CFrameMon=CFrame.new(-5802,86,8828)
        elseif MyLevel <= 399 then Mon="Fishman Warrior";LevelQuest=1;NameQuest="FishmanQuest";NameMon="Fishman Warrior";CFrameQuest=CFrame.new(61122,18,1569);CFrameMon=CFrame.new(60878,18,1543)
        elseif MyLevel <= 449 then Mon="Fishman Commando";LevelQuest=2;NameQuest="FishmanQuest";NameMon="Fishman Commando";CFrameQuest=CFrame.new(61122,18,1569);CFrameMon=CFrame.new(61922,18,1493)
        elseif MyLevel <= 474 then Mon="God's Guard";LevelQuest=1;NameQuest="SkyExp1Quest";NameMon="God's Guard";CFrameQuest=CFrame.new(-4721,843,-1949);CFrameMon=CFrame.new(-4710,845,-1927)
        elseif MyLevel <= 524 then Mon="Shanda";LevelQuest=2;NameQuest="SkyExp1Quest";NameMon="Shanda";CFrameQuest=CFrame.new(-7859,5544,-381);CFrameMon=CFrame.new(-7678,5566,-497)
        elseif MyLevel <= 549 then Mon="Royal Squad";LevelQuest=1;NameQuest="SkyExp2Quest";NameMon="Royal Squad";CFrameQuest=CFrame.new(-7906,5634,-1411);CFrameMon=CFrame.new(-7624,5658,-1467)
        elseif MyLevel <= 624 then Mon="Royal Soldier";LevelQuest=2;NameQuest="SkyExp2Quest";NameMon="Royal Soldier";CFrameQuest=CFrame.new(-7906,5634,-1411);CFrameMon=CFrame.new(-7836,5645,-1790)
        elseif MyLevel <= 649 then Mon="Galley Pirate";LevelQuest=1;NameQuest="FountainQuest";NameMon="Galley Pirate";CFrameQuest=CFrame.new(5259,37,4050);CFrameMon=CFrame.new(5551,78,3930)
        else Mon="Galley Captain";LevelQuest=2;NameQuest="FountainQuest";NameMon="Galley Captain";CFrameQuest=CFrame.new(5259,37,4050);CFrameMon=CFrame.new(5441,42,4950) end
    elseif World2 then
        if MyLevel <= 724 then Mon="Raider";LevelQuest=1;NameQuest="Area1Quest";NameMon="Raider";CFrameQuest=CFrame.new(-429,71,1836);CFrameMon=CFrame.new(-728,52,2345)
        elseif MyLevel <= 774 then Mon="Mercenary";LevelQuest=2;NameQuest="Area1Quest";NameMon="Mercenary";CFrameQuest=CFrame.new(-429,71,1836);CFrameMon=CFrame.new(-1004,80,1424)
        elseif MyLevel <= 799 then Mon="Swan Pirate";LevelQuest=1;NameQuest="Area2Quest";NameMon="Swan Pirate";CFrameQuest=CFrame.new(638,71,918);CFrameMon=CFrame.new(1068,137,1322)
        elseif MyLevel <= 874 then Mon="Factory Staff";LevelQuest=2;NameQuest="Area2Quest";NameMon="Factory Staff";CFrameQuest=CFrame.new(632,73,918);CFrameMon=CFrame.new(73,81,-27)
        elseif MyLevel <= 899 then Mon="Marine Lieutenant";LevelQuest=1;NameQuest="MarineQuest3";NameMon="Marine Lieutenant";CFrameQuest=CFrame.new(-2440,71,-3216);CFrameMon=CFrame.new(-2821,75,-3070)
        elseif MyLevel <= 949 then Mon="Marine Captain";LevelQuest=2;NameQuest="MarineQuest3";NameMon="Marine Captain";CFrameQuest=CFrame.new(-2440,71,-3216);CFrameMon=CFrame.new(-1861,80,-3254)
        elseif MyLevel <= 974 then Mon="Zombie";LevelQuest=1;NameQuest="ZombieQuest";NameMon="Zombie";CFrameQuest=CFrame.new(-5497,47,-795);CFrameMon=CFrame.new(-5657,78,-928)
        elseif MyLevel <= 999 then Mon="Vampire";LevelQuest=2;NameQuest="ZombieQuest";NameMon="Vampire";CFrameQuest=CFrame.new(-5497,47,-795);CFrameMon=CFrame.new(-6037,32,-1340)
        elseif MyLevel <= 1049 then Mon="Snow Trooper";LevelQuest=1;NameQuest="SnowMountainQuest";NameMon="Snow Trooper";CFrameQuest=CFrame.new(609,400,-5372);CFrameMon=CFrame.new(549,427,-5563)
        elseif MyLevel <= 1099 then Mon="Winter Warrior";LevelQuest=2;NameQuest="SnowMountainQuest";NameMon="Winter Warrior";CFrameQuest=CFrame.new(609,400,-5372);CFrameMon=CFrame.new(1142,475,-5199)
        elseif MyLevel <= 1124 then Mon="Lab Subordinate";LevelQuest=1;NameQuest="IceSideQuest";NameMon="Lab Subordinate";CFrameQuest=CFrame.new(-6064,15,-4902);CFrameMon=CFrame.new(-5707,15,-4513)
        elseif MyLevel <= 1174 then Mon="Horned Warrior";LevelQuest=2;NameQuest="IceSideQuest";NameMon="Horned Warrior";CFrameQuest=CFrame.new(-6064,15,-4902);CFrameMon=CFrame.new(-6341,15,-5723)
        elseif MyLevel <= 1199 then Mon="Magma Ninja";LevelQuest=1;NameQuest="FireSideQuest";NameMon="Magma Ninja";CFrameQuest=CFrame.new(-5428,15,-5299);CFrameMon=CFrame.new(-5449,76,-5808)
        elseif MyLevel <= 1249 then Mon="Lava Pirate";LevelQuest=2;NameQuest="FireSideQuest";NameMon="Lava Pirate";CFrameQuest=CFrame.new(-5428,15,-5299);CFrameMon=CFrame.new(-5213,49,-4701)
        elseif MyLevel <= 1274 then Mon="Ship Deckhand";LevelQuest=1;NameQuest="ShipQuest1";NameMon="Ship Deckhand";CFrameQuest=CFrame.new(1037,125,32911);CFrameMon=CFrame.new(1212,150,33059)
        elseif MyLevel <= 1299 then Mon="Ship Engineer";LevelQuest=2;NameQuest="ShipQuest1";NameMon="Ship Engineer";CFrameQuest=CFrame.new(1037,125,32911);CFrameMon=CFrame.new(919,43,32779)
        elseif MyLevel <= 1349 then Mon="Arctic Warrior";LevelQuest=1;NameQuest="FrostQuest";NameMon="Arctic Warrior";CFrameQuest=CFrame.new(5667,26,-6486);CFrameMon=CFrame.new(5966,62,-6179)
        elseif MyLevel <= 1424 then Mon="Snow Lurker";LevelQuest=2;NameQuest="FrostQuest";NameMon="Snow Lurker";CFrameQuest=CFrame.new(5667,26,-6486);CFrameMon=CFrame.new(5407,69,-6880)
        elseif MyLevel <= 1449 then Mon="Sea Soldier";LevelQuest=1;NameQuest="ForgottenQuest";NameMon="Sea Soldier";CFrameQuest=CFrame.new(-3054,235,-10142);CFrameMon=CFrame.new(-3028,64,-9775)
        else Mon="Water Fighter";LevelQuest=2;NameQuest="ForgottenQuest";NameMon="Water Fighter";CFrameQuest=CFrame.new(-3054,235,-10142);CFrameMon=CFrame.new(-3352,285,-10534) end
    elseif World3 then
        if MyLevel <= 1524 then Mon="Pirate Millionaire";LevelQuest=1;NameQuest="PiratePortQuest";NameMon="Pirate Millionaire";CFrameQuest=CFrame.new(-290,42,5581);CFrameMon=CFrame.new(-245,47,5584)
        elseif MyLevel <= 1574 then Mon="Pistol Billionaire";LevelQuest=2;NameQuest="PiratePortQuest";NameMon="Pistol Billionaire";CFrameQuest=CFrame.new(-290,42,5581);CFrameMon=CFrame.new(-187,86,6013)
        elseif MyLevel <= 1599 then Mon="Dragon Crew Warrior";LevelQuest=1;NameQuest="AmazonQuest";NameMon="Dragon Crew Warrior";CFrameQuest=CFrame.new(5832,51,-1101);CFrameMon=CFrame.new(6141,51,-1340)
        elseif MyLevel <= 1624 then Mon="Dragon Crew Archer";LevelQuest=2;NameQuest="AmazonQuest";NameMon="Dragon Crew Archer";CFrameQuest=CFrame.new(5833,51,-1103);CFrameMon=CFrame.new(6616,441,446)
        elseif MyLevel <= 1649 then Mon="Female Islander";LevelQuest=1;NameQuest="AmazonQuest2";NameMon="Female Islander";CFrameQuest=CFrame.new(5446,601,749);CFrameMon=CFrame.new(4685,735,815)
        elseif MyLevel <= 1699 then Mon="Giant Islander";LevelQuest=2;NameQuest="AmazonQuest2";NameMon="Giant Islander";CFrameQuest=CFrame.new(5446,601,749);CFrameMon=CFrame.new(4729,590,-36)
        elseif MyLevel <= 1724 then Mon="Marine Commodore";LevelQuest=1;NameQuest="MarineTreeIsland";NameMon="Marine Commodore";CFrameQuest=CFrame.new(2180,27,-6741);CFrameMon=CFrame.new(2286,73,-7159)
        elseif MyLevel <= 1774 then Mon="Marine Rear Admiral";LevelQuest=2;NameQuest="MarineTreeIsland";NameMon="Marine Rear Admiral";CFrameQuest=CFrame.new(2179,28,-6740);CFrameMon=CFrame.new(3656,160,-7001)
        elseif MyLevel <= 1799 then Mon="Fishman Raider";LevelQuest=1;NameQuest="DeepForestIsland3";NameMon="Fishman Raider";CFrameQuest=CFrame.new(-10581,330,-8761);CFrameMon=CFrame.new(-10407,331,-8368)
        elseif MyLevel <= 1824 then Mon="Fishman Captain";LevelQuest=2;NameQuest="DeepForestIsland3";NameMon="Fishman Captain";CFrameQuest=CFrame.new(-10581,330,-8761);CFrameMon=CFrame.new(-10994,352,-9002)
        elseif MyLevel <= 1849 then Mon="Forest Pirate";LevelQuest=1;NameQuest="DeepForestIsland";NameMon="Forest Pirate";CFrameQuest=CFrame.new(-13234,331,-7625);CFrameMon=CFrame.new(-13274,332,-7769)
        elseif MyLevel <= 1899 then Mon="Mythological Pirate";LevelQuest=2;NameQuest="DeepForestIsland";NameMon="Mythological Pirate";CFrameQuest=CFrame.new(-13234,331,-7625);CFrameMon=CFrame.new(-13680,501,-6991)
        elseif MyLevel <= 1924 then Mon="Jungle Pirate";LevelQuest=1;NameQuest="DeepForestIsland2";NameMon="Jungle Pirate";CFrameQuest=CFrame.new(-12680,389,-9902);CFrameMon=CFrame.new(-12256,331,-10485)
        elseif MyLevel <= 1974 then Mon="Musketeer Pirate";LevelQuest=2;NameQuest="DeepForestIsland2";NameMon="Musketeer Pirate";CFrameQuest=CFrame.new(-12680,389,-9902);CFrameMon=CFrame.new(-13457,391,-9859)
        elseif MyLevel <= 1999 then Mon="Reborn Skeleton";LevelQuest=1;NameQuest="HauntedQuest1";NameMon="Reborn Skeleton";CFrameQuest=CFrame.new(-9479,141,5566);CFrameMon=CFrame.new(-8763,165,6159)
        elseif MyLevel <= 2024 then Mon="Living Zombie";LevelQuest=2;NameQuest="HauntedQuest1";NameMon="Living Zombie";CFrameQuest=CFrame.new(-9479,141,5566);CFrameMon=CFrame.new(-10144,138,5838)
        elseif MyLevel <= 2049 then Mon="Demonic Soul";LevelQuest=1;NameQuest="HauntedQuest2";NameMon="Demonic Soul";CFrameQuest=CFrame.new(-9516,172,6078);CFrameMon=CFrame.new(-9505,172,6158)
        elseif MyLevel <= 2074 then Mon="Posessed Mummy";LevelQuest=2;NameQuest="HauntedQuest2";NameMon="Posessed Mummy";CFrameQuest=CFrame.new(-9516,172,6078);CFrameMon=CFrame.new(-9582,6,6205)
        elseif MyLevel <= 2099 then Mon="Peanut Scout";LevelQuest=1;NameQuest="NutsIslandQuest";NameMon="Peanut Scout";CFrameQuest=CFrame.new(-2104,38,-10194);CFrameMon=CFrame.new(-2143,47,-10029)
        elseif MyLevel <= 2124 then Mon="Peanut President";LevelQuest=2;NameQuest="NutsIslandQuest";NameMon="Peanut President";CFrameQuest=CFrame.new(-2104,38,-10194);CFrameMon=CFrame.new(-1859,38,-10422)
        elseif MyLevel <= 2149 then Mon="Ice Cream Chef";LevelQuest=1;NameQuest="IceCreamIslandQuest";NameMon="Ice Cream Chef";CFrameQuest=CFrame.new(-820,65,-10965);CFrameMon=CFrame.new(-872,65,-10919)
        elseif MyLevel <= 2199 then Mon="Ice Cream Commander";LevelQuest=2;NameQuest="IceCreamIslandQuest";NameMon="Ice Cream Commander";CFrameQuest=CFrame.new(-820,65,-10965);CFrameMon=CFrame.new(-558,112,-11290)
        elseif MyLevel <= 2224 then Mon="Cookie Crafter";LevelQuest=1;NameQuest="CakeQuest1";NameMon="Cookie Crafter";CFrameQuest=CFrame.new(-2021,37,-12028);CFrameMon=CFrame.new(-2374,37,-12125)
        elseif MyLevel <= 2249 then Mon="Cake Guard";LevelQuest=2;NameQuest="CakeQuest1";NameMon="Cake Guard";CFrameQuest=CFrame.new(-2021,37,-12028);CFrameMon=CFrame.new(-1598,43,-12244)
        elseif MyLevel <= 2274 then Mon="Baking Staff";LevelQuest=1;NameQuest="CakeQuest2";NameMon="Baking Staff";CFrameQuest=CFrame.new(-1927,37,-12842);CFrameMon=CFrame.new(-1887,77,-12998)
        elseif MyLevel <= 2299 then Mon="Head Baker";LevelQuest=2;NameQuest="CakeQuest2";NameMon="Head Baker";CFrameQuest=CFrame.new(-1927,37,-12842);CFrameMon=CFrame.new(-2216,82,-12869)
        elseif MyLevel <= 2324 then Mon="Cocoa Warrior";LevelQuest=1;NameQuest="ChocQuest1";NameMon="Cocoa Warrior";CFrameQuest=CFrame.new(233,29,-12201);CFrameMon=CFrame.new(-21,80,-12352)
        elseif MyLevel <= 2349 then Mon="Chocolate Bar Battler";LevelQuest=2;NameQuest="ChocQuest1";NameMon="Chocolate Bar Battler";CFrameQuest=CFrame.new(233,29,-12201);CFrameMon=CFrame.new(582,77,-12463)
        elseif MyLevel <= 2374 then Mon="Sweet Thief";LevelQuest=1;NameQuest="ChocQuest2";NameMon="Sweet Thief";CFrameQuest=CFrame.new(150,30,-12774);CFrameMon=CFrame.new(165,76,-12600)
        elseif MyLevel <= 2399 then Mon="Candy Rebel";LevelQuest=2;NameQuest="ChocQuest2";NameMon="Candy Rebel";CFrameQuest=CFrame.new(150,30,-12774);CFrameMon=CFrame.new(134,77,-12876)
        elseif MyLevel <= 2424 then Mon="Candy Pirate";LevelQuest=1;NameQuest="CandyQuest1";NameMon="Candy Pirate";CFrameQuest=CFrame.new(-1150,20,-14446);CFrameMon=CFrame.new(-1310,26,-14562)
        elseif MyLevel <= 2449 then Mon="Snow Demon";LevelQuest=2;NameQuest="CandyQuest1";NameMon="Snow Demon";CFrameQuest=CFrame.new(-1150,20,-14446);CFrameMon=CFrame.new(-880,71,-14538)
        elseif MyLevel <= 2474 then Mon="Isle Outlaw";LevelQuest=1;NameQuest="TikiQuest1";NameMon="Isle Outlaw";CFrameQuest=CFrame.new(-16547,61,-173);CFrameMon=CFrame.new(-16442,116,-264)
        elseif MyLevel <= 2524 then Mon="Island Boy";LevelQuest=2;NameQuest="TikiQuest1";NameMon="Island Boy";CFrameQuest=CFrame.new(-16547,61,-173);CFrameMon=CFrame.new(-16901,84,-192)
        elseif MyLevel <= 2549 then Mon="Isle Champion";LevelQuest=2;NameQuest="TikiQuest2";NameMon="Isle Champion";CFrameQuest=CFrame.new(-16539,55,1051);CFrameMon=CFrame.new(-16641,235,1031)
        elseif MyLevel <= 2574 then Mon="Serpent Hunter";LevelQuest=1;NameQuest="TikiQuest3";NameMon="Serpent Hunter";CFrameQuest=CFrame.new(-16661,105,1576);CFrameMon=CFrame.new(-16587,154,1533)
        else Mon="Skull Slayer";LevelQuest=2;NameQuest="TikiQuest3";NameMon="Skull Slayer";CFrameQuest=CFrame.new(-16661,105,1576);CFrameMon=CFrame.new(-16885,114,1627) end
    end
end

-- ══════════════ SERVER HOP ══════════════
function Hop()
    pcall(function()
        local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))()
        module:Teleport(game.PlaceId)
    end)
end

-- ══════════════ MATERIAL COUNTER ══════════════
function GetCountMaterials(name)
    local inv = CommF_:InvokeServer("getInventory")
    for _, v in pairs(inv) do
        if v.Name == name then return v.Count end
    end
    return 0
end

function CheckItemCount(name, count)
    for _, v in pairs(CommF_:InvokeServer("getInventory")) do
        if v.Name == name and v.Count >= count then return true end
    end
    return false
end

-- ══════════════ ESP HELPER ══════════════
function CreateBillboard(parent, name, color, text)
    if parent:FindFirstChild(name) then return end
    local bill = Instance.new("BillboardGui", parent)
    bill.Name = name
    bill.AlwaysOnTop = true
    bill.Size = UDim2.new(0, 200, 0, 50)
    bill.StudsOffset = Vector3.new(0, 2.5, 0)
    local label = Instance.new("TextLabel", bill)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = color
    label.TextSize = 14
    label.TextWrapped = true
    label.Text = text or ""
end

-- ══════════════ BOAT ══════════════
function TweenBoat(pos)
    local TweenService = game:GetService("TweenService")
    local boatName = _G.Settings.SeaEvent and _G.Settings.SeaEvent["Selected Boat"] or "Guardian"
    local Boat = workspace.Boats[boatName]
    if not Boat or not Boat:FindFirstChild("VehicleSeat") then
        return {Stop = function() end}
    end
    local dist = (Boat.VehicleSeat.Position - pos.Position).Magnitude
    local speed = (_G.Settings.SeaEvent and _G.Settings.SeaEvent["Boat Tween Speed"]) or 300
    local duration = dist / speed
    local info = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(Boat.VehicleSeat, info, {CFrame = pos})
    if dist > 25 then tween:Play() end
    return {Stop = function() if tween.PlaybackState == Enum.PlaybackState.Playing then tween:Cancel() end end}
end

function CheckSeaBeast()
    if workspace:FindFirstChild("SeaBeasts") then
        for _, v in pairs(workspace.SeaBeasts:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                return true
            end
        end
    end
    return false
end

print("[BF Hub] Functions loaded successfully!")
