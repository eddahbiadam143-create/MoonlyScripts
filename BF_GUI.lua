-- ═══════════════════════════════════════════════════════════
--               BLOX FRUIT HUB - GUI SCRIPT
--         Built with WindUI | All Features Combined
-- ═══════════════════════════════════════════════════════════

-- Wait for game
if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end

-- FPS Cap
if setfpscap then setfpscap(1000000) end

-- Load WindUI
local WindUI = (loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua")))()

-- ═══════════════ DEFAULT SETTINGS ═══════════════
_G.Settings = {
    Main = {
        ["Select Weapon"] = "Melee",
        ["Farm Level Method"] = "Quest",
        ["Auto Farm"] = false,
        ["Auto Fast Farm"] = false,
        ["Mastery Method"] = "Quest",
        ["Auto Farm Fruit Mastery"] = false,
        ["Auto Farm Gun Mastery"] = false,
        ["Selected Mastery Sword"] = nil,
        ["Auto Farm Sword Mastery"] = false,
        ["Auto Summon Tyrant Of The Skies"] = false,
        ["Auto Kill Tyrant Of The Skies"] = false,
        ["Selected Mon"] = nil,
        ["Auto Farm Mon"] = false,
        ["Selected Boss"] = nil,
        ["Auto Farm Boss"] = false,
        ["Auto Farm All Boss"] = false,
        ["Selected Weapon"] = nil,
    },
    Farm = {
        ["Auto Elite Hunter"] = false,
        ["Auto Elite Hunter Hop"] = false,
        ["Selected Bone Farm Method"] = "Quest",
        ["Auto Farm Bone"] = false,
        ["Auto Random Surprise"] = false,
        ["Auto Pirate Raid"] = false,
        ["Auto Farm Chest Tween"] = false,
        ["Auto Farm Chest Instant"] = false,
        ["Auto Stop Items"] = false,
        ["Auto Farm Katakuri"] = false,
        ["Auto Spawn Cake Prince"] = false,
        ["Auto Kill Cake Prince"] = false,
        ["Auto Kill Dough King"] = false,
        ["Selected Material"] = nil,
        ["Auto Farm Material"] = false,
    },
    Setting = {
        ["Spin Position"] = false,
        ["Farm Distance"] = 35,
        ["Player Tween Speed"] = 350,
        ["Bring Mob"] = true,
        ["Bring Mob Mode"] = "Normal",
        ["Fast Attack Mode"] = "Normal",
        ["Attack Aura"] = true,
        ["Hide Notification"] = false,
        ["Hide Damage Text"] = true,
        ["Black Screen"] = false,
        ["White Screen"] = false,
        ["Mastery Health"] = 25,
        ["Fruit Mastery Skill Z"] = true,
        ["Fruit Mastery Skill X"] = true,
        ["Fruit Mastery Skill C"] = true,
        ["Fruit Mastery Skill V"] = false,
        ["Fruit Mastery Skill F"] = false,
        ["Gun Mastery Skill Z"] = true,
        ["Gun Mastery Skill X"] = true,
        ["Auto Set Spawn Point"] = true,
        ["Auto Observation"] = false,
        ["Auto Haki"] = true,
        ["Auto Rejoin"] = true,
    },
    Stats = {
        ["Auto Add Melee Stats"] = false,
        ["Auto Add Defense Stats"] = false,
        ["Auto Add Devil Fruit Stats"] = false,
        ["Auto Add Sword Stats"] = false,
        ["Auto Add Gun Stats"] = false,
        ["Point Stats"] = 1,
    },
    Items = {
        ["Auto Second Sea"] = false,
        ["Auto Third Sea"] = false,
        ["Auto Farm Factory"] = false,
        ["Auto Super Human"] = false,
        ["Auto Death Step"] = false,
        ["Auto Fishman Karate"] = false,
        ["Auto Electric Claw"] = false,
        ["Auto Dragon Talon"] = false,
        ["Auto God Human"] = false,
        ["Auto Saber"] = false,
        ["Auto Buddy Sword"] = false,
        ["Auto Soul Guitar"] = false,
        ["Auto Rengoku"] = false,
        ["Auto Hallow Scythe"] = false,
        ["Auto Warden Sword"] = false,
        ["Auto Cursed Dual Katana"] = false,
        ["Auto Yama"] = false,
        ["Auto Tushita"] = false,
        ["Auto Greybeard"] = false,
        ["Auto Dragon Trident"] = false,
        ["Auto Pole"] = false,
        ["Auto Shark Saw"] = false,
        ["Attack Aura"] = false,
        ["Auto Press Haki Button"] = false,
        ["Auto Rainbow Haki"] = false,
        ["Auto Holy Torch"] = false,
        ["Auto Bartilo Quest"] = false,
        ["Auto Dark Dagger"] = false,
        ["Auto Arena Trainer"] = false,
        ["Auto Swan Glasses"] = false,
        ["Auto Canvander"] = false,
    },
    Esp = {
        ["ESP Player"] = false,
        ["ESP Chest"] = false,
        ["ESP DevilFruit"] = false,
        ["ESP RealFruit"] = false,
        ["ESP Flower"] = false,
        ["ESP Island"] = false,
        ["ESP Npc"] = false,
        ["ESP Sea Beast"] = false,
        ["ESP Monster"] = false,
        ["ESP Mirage"] = false,
        ["ESP Kitsune"] = false,
        ["ESP Frozen"] = false,
    },
    SeaEvent = {
        ["Selected Boat"] = "Guardian",
        ["Selected Zone"] = "Zone 5",
        ["Boat Tween Speed"] = 300,
        ["Sail Boat"] = false,
        ["Auto Farm Shark"] = true,
        ["Auto Farm Piranha"] = true,
        ["Auto Farm Fish Crew Member"] = true,
        ["Auto Farm Ghost Ship"] = true,
        ["Auto Farm Pirate Brigade"] = true,
        ["Auto Farm Pirate Grand Brigade"] = true,
        ["Auto Farm Terrorshark"] = true,
        ["Auto Farm Seabeasts"] = true,
    },
    SeaStack = {
        ["Tween To Frozen Dimension"] = false,
        ["Summon Frozen Dimension"] = false,
        ["Tween To Kitsune Island"] = false,
        ["Summon Kitsune Island"] = false,
        ["Auto Collect Azure Ember"] = false,
        ["Set Azure Ember"] = 20,
        ["Auto Trade Azure Ember"] = false,
        ["Tween To Mirage Island"] = false,
        ["Auto Attack Seabeasts"] = false,
        ["Summon Prehistoric Island"] = false,
        ["Tween To Prehistoric Island"] = false,
        ["Auto Kill Lava Golem"] = false,
    },
    SettingSea = {
        Lightning = false,
        ["Increase Boat Speed"] = false,
        ["No Clip Rock"] = false,
        ["Use Devil Fruit Skill"] = true,
        ["Use Melee Skill"] = true,
        ["Use Sword Skill"] = true,
        ["Use Gun Skill"] = true,
        ["Devil Fruit Z Skill"] = true,
        ["Devil Fruit X Skill"] = true,
        ["Devil Fruit C Skill"] = true,
        ["Devil Fruit V Skill"] = false,
        ["Devil Fruit F Skill"] = false,
        ["Melee Z Skill"] = true,
        ["Melee X Skill"] = true,
        ["Melee C Skill"] = true,
        ["Melee V Skill"] = true,
    },
    Race = {
        ["Auto Race V2"] = false,
        ["Auto Race V3"] = false,
        ["Selected Place"] = nil,
        ["Auto Buy Gear"] = false,
        ["Tween To Highest Mirage"] = false,
        ["Find Blue Gear"] = false,
        ["Look Moon Ability"] = false,
        ["Auto Train"] = false,
        ["Auto Kill Player After Trial"] = false,
        ["Auto Trial"] = false,
    },
    Combat = {
        ["Auto Kill Player Quest"] = false,
        ["Aimbot Gun"] = false,
        ["Aimbot Skill"] = false,
        ["Enable PvP"] = false,
    },
    Raid = {
        ["Selected Chip"] = nil,
        ["Auto Raid"] = false,
        ["Auto Awaken"] = false,
        ["Price Devil Fruit"] = 1000000,
        ["Unstore Devil Fruit"] = false,
        ["Law Raid"] = false,
    },
    Shop = {
        ["Auto Buy Legendary Sword"] = false,
        ["Auto Buy Haki Color"] = false,
    },
    LocalPlayer = {
        ["Infinite Energy"] = false,
        ["Infinite Geppo"] = false,
        ["Active Race V3"] = false,
        ["Active Race V4"] = true,
        ["Walk On Water"] = true,
        ["No Clip"] = false,
    },
    DragonDojo = {
        ["Auto Farm Blaze Ember"] = false,
    },
    Fruit = {
        ["Auto Buy Random Fruit"] = false,
        ["Store Rarity Fruit"] = "Common - Mythical",
        ["Auto Store Fruit"] = false,
        ["Fruit Notification"] = false,
        ["Teleport To Fruit"] = false,
        ["Tween To Fruit"] = false,
    },
    Misc = {
        ["Hide Chat"] = false,
        ["Hide Leaderboard"] = false,
    }
}

;(getgenv()).Load()

-- Detect world
World1, World2, World3 = false, false, false
if game.PlaceId == 2753915549 then World1 = true
elseif game.PlaceId == 4442272183 then World2 = true
elseif game.PlaceId == 7449423635 then World3 = true end

local plr = game.Players.LocalPlayer
local CommF_ = game.ReplicatedStorage.Remotes.CommF_

-- ═══════════════ CREATE WINDOW ═══════════════
local Window = WindUI:CreateWindow({
    Title = "Blox Fruit Hub",
    Icon = "sword",
    Author = "Community Hub | Blox Fruit",
    Folder = "BFHub",
    Size = UDim2.fromOffset(580, 340),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = true,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {Enabled = true, Anonymous = false},
})

Window:EditOpenButton({
    Title = "BF Hub",
    Icon = "sword",
    CornerRadius = UDim.new(0, 8),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(20,20,20), Color3.fromRGB(200,100,255)),
    Draggable = true,
})

-- ═══════════════ TABS ═══════════════
local Tabs = {
    InfoTab = Window:Tab({Title="Info", Icon="info", Desc="Hub Info"}),
    D1 = Window:Divider(),
    MainTab = Window:Tab({Title="Farming", Icon="rocket", Desc="Auto Farm"}),
    OthersTab = Window:Tab({Title="Others", Icon="crown", Desc="Extra Farm"}),
    ItemsTab = Window:Tab({Title="Items", Icon="box", Desc="Items"}),
    SettingsTab = Window:Tab({Title="Settings", Icon="settings", Desc="Settings"}),
    D2 = Window:Divider(),
    LocalPlayerTab = Window:Tab({Title="Player", Icon="user", Desc="Player"}),
    StatsTab = Window:Tab({Title="Stats", Icon="sliders-horizontal", Desc="Stats"}),
    D3 = Window:Divider(),
    SeaEventTab = Window:Tab({Title="Sea Event", Icon="anchor", Desc="Sea Event"}),
    SeaStackTab = Window:Tab({Title="Sea Stack", Icon="waves", Desc="Sea Stack"}),
    SeaSettingsTab = Window:Tab({Title="Sea Settings", Icon="cog", Desc="Sea Settings"}),
    D4 = Window:Divider(),
    DragonDojoTab = Window:Tab({Title="Dragon Dojo", Icon="shield", Desc="Dragon Dojo"}),
    RaceTab = Window:Tab({Title="Race V4", Icon="bot", Desc="Race"}),
    D5 = Window:Divider(),
    CombatTab = Window:Tab({Title="Combat", Icon="sword", Desc="Combat"}),
    RaidTab = Window:Tab({Title="Raid", Icon="door-open", Desc="Raid"}),
    EspTab = Window:Tab({Title="ESP", Icon="eye", Desc="ESP"}),
    TeleportTab = Window:Tab({Title="Teleport", Icon="map-pinned", Desc="Teleport"}),
    ShopTab = Window:Tab({Title="Shop", Icon="shopping-cart", Desc="Shop"}),
    FruitTab = Window:Tab({Title="Fruit", Icon="apple", Desc="Fruit"}),
    D6 = Window:Divider(),
    MiscTab = Window:Tab({Title="Misc", Icon="layout-grid", Desc="Misc"}),
    ServerTab = Window:Tab({Title="Server", Icon="server", Desc="Server"}),
}

Window:SelectTab(1)

-- ═══════════════════════════════════════
--              INFO TAB
-- ═══════════════════════════════════════
Tabs.InfoTab:Paragraph({Title="Blox Fruit Hub", Desc="All-in-one script combining the best features for Blox Fruits.", Image="info"})

local GameTimeParagraph = Tabs.InfoTab:Paragraph({Title="Game Time", Desc="0", Image="timer"})
local FpsParagraph = Tabs.InfoTab:Paragraph({Title="FPS", Desc="0", Image="monitor"})
local PingParagraph = Tabs.InfoTab:Paragraph({Title="Ping", Desc="0", Image="signal"})
local LevelParagraph = Tabs.InfoTab:Paragraph({Title="Level", Desc="0", Image="user"})
local WorldParagraph = Tabs.InfoTab:Paragraph({Title="World", Desc=World1 and "Sea 1" or World2 and "Sea 2" or World3 and "Sea 3" or "Unknown"})

spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local gt = math.floor(workspace.DistributedGameTime + 0.5)
            GameTimeParagraph:SetDesc(math.floor(gt/3600)%24 .."h ".. math.floor(gt/60)%60 .."m ".. gt%60 .."s")
            FpsParagraph:SetDesc(math.floor(workspace:GetRealPhysicsFPS()))
            PingParagraph:SetDesc(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString())
            LevelParagraph:SetDesc(tostring(plr.Data.Level.Value))
        end)
    end
end)

-- ═══════════════════════════════════════
--              FARMING TAB
-- ═══════════════════════════════════════
Tabs.MainTab:Section({Title="Level Farming", TextXAlignment="Left"})

local WeaponList = {"Melee","Sword","Fruit"}
Tabs.MainTab:Dropdown({
    Title="Select Weapon", Values=WeaponList, Value=_G.Settings.Main["Select Weapon"],
    Callback=function(v) _G.Settings.Main["Select Weapon"]=v; (getgenv()).SaveSetting() end
})

local FarmMethodList = {"Quest","No Quest","Nearest"}
Tabs.MainTab:Dropdown({
    Title="Farm Level Method", Values=FarmMethodList, Value=_G.Settings.Main["Farm Level Method"],
    Callback=function(v) _G.Settings.Main["Farm Level Method"]=v; (getgenv()).SaveSetting() end
})

Tabs.MainTab:Toggle({
    Title="Auto Farm Level", Desc="Automatically farms mobs for level",
    Value=_G.Settings.Main["Auto Farm"],
    Callback=function(s) _G.Settings.Main["Auto Farm"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.MainTab:Toggle({
    Title="Auto Fast Farm", Desc="Sea 1 only",
    Value=_G.Settings.Main["Auto Fast Farm"],
    Callback=function(s) _G.Settings.Main["Auto Fast Farm"]=s; (getgenv()).SaveSetting() end
})

-- Auto Farm logic
spawn(function()
    while wait(0.2) do
        if _G.Settings.Main["Auto Farm"] then
            pcall(function()
                CheckQuest()
                local method = _G.Settings.Main["Farm Level Method"]
                if method == "Quest" then
                    local QuestTitle = plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon or "") then
                        CommF_:InvokeServer("AbandonQuest")
                    end
                    if not plr.PlayerGui.Main.Quest.Visible then
                        TweenPlayer(CFrameQuest)
                        if CFrameQuest and (CFrameQuest.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                            CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        end
                    else
                        if workspace.Enemies:FindFirstChild(Mon) then
                            for _, v in pairs(workspace.Enemies:GetChildren()) do
                                if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat
                                        RunService.Heartbeat:Wait()
                                        EquipWeapon(_G.Settings.Main["Selected Weapon"])
                                        AutoHaki()
                                        TweenPlayer(v.HumanoidRootPart.CFrame * Pos)
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        Attack()
                                    until not _G.Settings.Main["Auto Farm"] or v.Humanoid.Health <= 0 or not v.Parent or not plr.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            TweenPlayer(CFrameMon)
                        end
                    end
                elseif method == "No Quest" or method == "Nearest" then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            if method == "No Quest" and v.Name == Mon or method == "Nearest" then
                                if (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 5000 then
                                    repeat
                                        RunService.Heartbeat:Wait()
                                        EquipWeapon(_G.Settings.Main["Selected Weapon"])
                                        AutoHaki()
                                        TweenPlayer(v.HumanoidRootPart.CFrame * Pos)
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                                        PosMon = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name
                                        Attack()
                                    until not _G.Settings.Main["Auto Farm"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- Auto weapon detection
spawn(function()
    while wait(0.2) do
        pcall(function()
            local wtype = _G.Settings.Main["Select Weapon"]
            local tipMap = {Melee="Melee", Sword="Sword", Fruit="Blox Fruit", Gun="Gun"}
            local tip = tipMap[wtype]
            if tip then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == tip then
                        _G.Settings.Main["Selected Weapon"] = v.Name
                    end
                end
            end
        end)
    end
end)

-- Mastery
Tabs.MainTab:Section({Title="Mastery Farming", TextXAlignment="Left"})

local MasteryMethodList = World3 and {"Quest","No Quest","Nearest","Cakeprince","Bones"} or {"Quest","No Quest","Nearest"}
Tabs.MainTab:Dropdown({
    Title="Mastery Method", Values=MasteryMethodList, Value=_G.Settings.Main["Mastery Method"],
    Callback=function(v) _G.Settings.Main["Mastery Method"]=v; (getgenv()).SaveSetting() end
})

Tabs.MainTab:Toggle({
    Title="Auto Fruit Mastery", Value=_G.Settings.Main["Auto Farm Fruit Mastery"],
    Callback=function(s) _G.Settings.Main["Auto Farm Fruit Mastery"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.MainTab:Toggle({
    Title="Auto Gun Mastery", Value=_G.Settings.Main["Auto Farm Gun Mastery"],
    Callback=function(s) _G.Settings.Main["Auto Farm Gun Mastery"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

local SwordList = {}
pcall(function()
    local Inventory = CommF_:InvokeServer("getInventory")
    for _, v in pairs(Inventory) do
        if v.Type == "Sword" then table.insert(SwordList, v.Name) end
    end
end)

Tabs.MainTab:Dropdown({
    Title="Choose Sword for Mastery", Values=SwordList, Value=_G.Settings.Main["Selected Mastery Sword"],
    Callback=function(v) _G.Settings.Main["Selected Mastery Sword"]=v; (getgenv()).SaveSetting() end
})

Tabs.MainTab:Toggle({
    Title="Auto Sword Mastery", Value=_G.Settings.Main["Auto Farm Sword Mastery"],
    Callback=function(s) _G.Settings.Main["Auto Farm Sword Mastery"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

-- Boss
Tabs.MainTab:Section({Title="Boss Farming", TextXAlignment="Left"})
local BossStatusParagraph = Tabs.MainTab:Paragraph({Title="Boss Status", Desc="N/A"})

local tableBoss = World1 and {"The Gorilla King","Bobby","Yeti","Mob Leader","Vice Admiral","Warden","Chief Warden","Swan","Magma Admiral","Fishman Lord","Wysper","Thunder God","Cyborg","Saber Expert"}
    or World2 and {"Diamond","Jeremy","Fajita","Don Swan","Smoke Admiral","Cursed Captain","Darkbeard","Order","Awakened Ice Admiral","Tide Keeper"}
    or World3 and {"Stone","Island Empress","Kilo Admiral","Captain Elephant","Beautiful Pirate","rip_indra True Form","Longma","Soul Reaper","Cake Queen"}
    or {}

Tabs.MainTab:Dropdown({
    Title="Select Boss", Values=tableBoss, Value=_G.Settings.Main["Selected Boss"],
    Callback=function(v) _G.Settings.Main["Selected Boss"]=v; (getgenv()).SaveSetting() end
})

Tabs.MainTab:Toggle({
    Title="Auto Farm Boss", Desc="Kills boss when it spawns",
    Value=_G.Settings.Main["Auto Farm Boss"],
    Callback=function(s) _G.Settings.Main["Auto Farm Boss"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.MainTab:Toggle({
    Title="Auto Farm All Bosses", Value=_G.Settings.Main["Auto Farm All Boss"],
    Callback=function(s) _G.Settings.Main["Auto Farm All Boss"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

spawn(function()
    while wait(0.2) do
        pcall(function()
            local boss = _G.Settings.Main["Selected Boss"]
            if not boss then return end
            if workspace.Enemies:FindFirstChild(boss) or game.ReplicatedStorage:FindFirstChild(boss) then
                BossStatusParagraph:SetDesc("✅ Spawned!")
            else
                BossStatusParagraph:SetDesc("❌ Not Spawned")
            end
        end)
    end
end)

spawn(function()
    while wait(0.2) do
        if _G.Settings.Main["Auto Farm Boss"] then
            pcall(function()
                local boss = _G.Settings.Main["Selected Boss"]
                if not boss then return end
                if workspace.Enemies:FindFirstChild(boss) then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v.Name == boss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat
                                RunService.Heartbeat:Wait()
                                AutoHaki()
                                EquipWeapon(_G.Settings.Main["Selected Weapon"])
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                                TweenPlayer(v.HumanoidRootPart.CFrame * Pos)
                                Attack()
                            until not _G.Settings.Main["Auto Farm Boss"] or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild(boss) then
                    TweenPlayer(game.ReplicatedStorage:FindFirstChild(boss).HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                end
            end)
        end
    end
end)

-- Mon Farm
Tabs.MainTab:Section({Title="Monster Farm", TextXAlignment="Left"})

local tableMon = World1 and {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
    or World2 and {"Raider","Mercenary","Swan Pirate","Factory Staff","Marine Lieutenant","Marine Captain","Zombie","Vampire","Snow Trooper","Winter Warrior","Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate","Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer","Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"}
    or World3 and {"Pirate Millionaire","Dragon Crew Warrior","Dragon Crew Archer","Female Islander","Giant Islander","Marine Commodore","Marine Rear Admiral","Fishman Raider","Fishman Captain","Forest Pirate","Mythological Pirate","Jungle Pirate","Musketeer Pirate","Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy","Peanut Scout","Peanut President","Ice Cream Chef","Ice Cream Commander","Cookie Crafter","Cake Guard","Baking Staff","Head Baker","Cocoa Warrior","Chocolate Bar Battler","Sweet Thief","Candy Rebel","Candy Pirate","Snow Demon","Isle Outlaw","Island Boy","Sun-kissed Warrior","Isle Champion"}
    or {}

Tabs.MainTab:Dropdown({
    Title="Choose Monster", Values=tableMon, Value=_G.Settings.Main["Selected Mon"],
    Callback=function(v) _G.Settings.Main["Selected Mon"]=v; (getgenv()).SaveSetting() end
})

Tabs.MainTab:Toggle({
    Title="Auto Farm Monster", Desc="Farm selected monster",
    Value=_G.Settings.Main["Auto Farm Mon"],
    Callback=function(s) _G.Settings.Main["Auto Farm Mon"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

spawn(function()
    while wait(0.2) do
        if _G.Settings.Main["Auto Farm Mon"] then
            pcall(function()
                local mon = _G.Settings.Main["Selected Mon"]
                if not mon then return end
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat
                            RunService.Heartbeat:Wait()
                            AutoHaki()
                            EquipWeapon(_G.Settings.Main["Selected Weapon"])
                            v.Humanoid.WalkSpeed = 0
                            PosMon = v.HumanoidRootPart.CFrame
                            MonFarm = v.Name
                            v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                            TweenPlayer(v.HumanoidRootPart.CFrame * Pos)
                            Attack()
                        until not _G.Settings.Main["Auto Farm Mon"] or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════
--              OTHERS TAB
-- ═══════════════════════════════════════
Tabs.OthersTab:Section({Title="Elite Hunter", TextXAlignment="Left"})
local EliteHunterParagraph = Tabs.OthersTab:Paragraph({Title="Elite Hunter Status", Desc="N/A"})
local EliteProgressParagraph = Tabs.OthersTab:Paragraph({Title="Elite Hunter Progress", Desc="N/A"})

Tabs.OthersTab:Toggle({
    Title="Auto Elite Hunter", Desc="Sea 3 Only",
    Value=_G.Settings.Farm["Auto Elite Hunter"],
    Callback=function(s) _G.Settings.Farm["Auto Elite Hunter"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.OthersTab:Toggle({
    Title="Auto Elite Hunter Hop", Desc="Hop if not spawned",
    Value=_G.Settings.Farm["Auto Elite Hunter Hop"],
    Callback=function(s) _G.Settings.Farm["Auto Elite Hunter Hop"]=s; (getgenv()).SaveSetting() end
})

spawn(function()
    while wait(0.5) do
        pcall(function()
            if workspace.Enemies:FindFirstChild("Diablo") or workspace.Enemies:FindFirstChild("Deandre") or workspace.Enemies:FindFirstChild("Urban") then
                EliteHunterParagraph:SetDesc("✅ Spawned!")
            else
                EliteHunterParagraph:SetDesc("❌ Not Spawned")
            end
            if World3 then
                EliteProgressParagraph:SetDesc(tostring(CommF_:InvokeServer("EliteHunter","Progress")) .. " / 30")
            else
                EliteProgressParagraph:SetDesc("Sea 3 Only")
            end
        end)
    end
end)

Tabs.OthersTab:Section({Title="Bone Farm", TextXAlignment="Left"})
local BoneCountParagraph = Tabs.OthersTab:Paragraph({Title="Bones Owned", Desc="0"})

Tabs.OthersTab:Dropdown({
    Title="Bone Farm Method", Values={"Quest","No Quest"}, Value=_G.Settings.Farm["Selected Bone Farm Method"],
    Callback=function(v) _G.Settings.Farm["Selected Bone Farm Method"]=v; (getgenv()).SaveSetting() end
})

Tabs.OthersTab:Toggle({
    Title="Auto Farm Bone", Desc="Sea 3 Only",
    Value=_G.Settings.Farm["Auto Farm Bone"],
    Callback=function(s) _G.Settings.Farm["Auto Farm Bone"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

spawn(function()
    while wait(2) do
        pcall(function() BoneCountParagraph:SetDesc(tostring(GetCountMaterials("Bones"))) end)
    end
end)

Tabs.OthersTab:Section({Title="Chest Farm", TextXAlignment="Left"})

Tabs.OthersTab:Toggle({
    Title="Auto Farm Chest (Tween)", Value=_G.Settings.Farm["Auto Farm Chest Tween"],
    Callback=function(s) _G.Settings.Farm["Auto Farm Chest Tween"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.OthersTab:Toggle({
    Title="Auto Farm Chest (Instant)", Value=_G.Settings.Farm["Auto Farm Chest Instant"],
    Callback=function(s) _G.Settings.Farm["Auto Farm Chest Instant"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.OthersTab:Toggle({
    Title="Auto Stop on God's Chalice / FoD", Value=_G.Settings.Farm["Auto Stop Items"],
    Callback=function(s) _G.Settings.Farm["Auto Stop Items"]=s; (getgenv()).SaveSetting() end
})

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.Settings.Farm["Auto Farm Chest Tween"] then
                for _, v in pairs(workspace.ChestModels:GetChildren()) do
                    if v.Name:find("Chest") then
                        repeat wait() TweenPlayer(v.RootPart.CFrame) until not _G.Settings.Farm["Auto Farm Chest Tween"] or not v.Parent
                    end
                end
            end
            if _G.Settings.Farm["Auto Farm Chest Instant"] then
                for _, v in pairs(workspace.ChestModels:GetChildren()) do
                    if v.Name:find("Chest") then
                        repeat wait() InstantTp(v.RootPart.CFrame) until not _G.Settings.Farm["Auto Farm Chest Instant"] or not v.Parent
                    end
                end
            end
        end)
    end
end)

Tabs.OthersTab:Section({Title="Cake Prince", TextXAlignment="Left"})

Tabs.OthersTab:Toggle({
    Title="Auto Kill Cake Prince", Desc="Sea 3 Only",
    Value=_G.Settings.Farm["Auto Kill Cake Prince"],
    Callback=function(s) _G.Settings.Farm["Auto Kill Cake Prince"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.OthersTab:Toggle({
    Title="Auto Kill Dough King", Desc="Sea 3 Only",
    Value=_G.Settings.Farm["Auto Kill Dough King"],
    Callback=function(s) _G.Settings.Farm["Auto Kill Dough King"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.OthersTab:Toggle({
    Title="Auto Pirate Raid", Desc="Sea 3 Only",
    Value=_G.Settings.Farm["Auto Pirate Raid"],
    Callback=function(s) _G.Settings.Farm["Auto Pirate Raid"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.OthersTab:Toggle({
    Title="Auto Random Surprise", Desc="Sea 3 Only",
    Value=_G.Settings.Farm["Auto Random Surprise"],
    Callback=function(s) _G.Settings.Farm["Auto Random Surprise"]=s; (getgenv()).SaveSetting() end
})

spawn(function()
    while wait(0.2) do
        pcall(function()
            if _G.Settings.Farm["Auto Random Surprise"] then
                CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end)
    end
end)

-- ═══════════════════════════════════════
--              ITEMS TAB
-- ═══════════════════════════════════════
Tabs.ItemsTab:Section({Title="Fighting Styles", TextXAlignment="Left"})

local fightingToggles = {
    {"Auto Super Human", "Auto Super Human"},
    {"Auto Death Step", "Auto Death Step"},
    {"Auto Sharkman Karate", "Auto Fishman Karate"},
    {"Auto Electric Claw", "Auto Electric Claw"},
    {"Auto Dragon Talon", "Auto Dragon Talon"},
    {"Auto God Human", "Auto God Human"},
}

for _, t in ipairs(fightingToggles) do
    local label, key = t[1], t[2]
    Tabs.ItemsTab:Toggle({
        Title=label, Value=_G.Settings.Items[key],
        Callback=function(s) _G.Settings.Items[key]=s; StopTween(s); (getgenv()).SaveSetting() end
    })
end

Tabs.ItemsTab:Section({Title="Swords & Guns", TextXAlignment="Left"})

local swordToggles = {
    {"Auto Get Saber", "Auto Saber", "Sea 1 Only"},
    {"Auto Buddy Sword", "Auto Buddy Sword", "Sea 3 Only"},
    {"Auto Soul Guitar", "Auto Soul Guitar", "Sea 3 Only"},
    {"Auto Rengoku", "Auto Rengoku", "Sea 2 Only"},
    {"Auto Hallow Scythe", "Auto Hallow Scythe", "Sea 3 Only"},
    {"Auto Warden Sword", "Auto Warden Sword", "Sea 1 Only"},
    {"Auto Get Yama", "Auto Yama", "Need 30 Elite Hunter, Sea 3"},
    {"Auto Get Tushita", "Auto Tushita", "Sea 3 Only"},
    {"Auto Dark Dagger", "Auto Dark Dagger", "Sea 3 Only"},
    {"Auto Dragon Trident", "Auto Dragon Trident", "Sea 2 Only"},
    {"Auto Greybeard", "Auto Greybeard", "Sea 1 Only"},
    {"Auto Shark Saw", "Auto Shark Saw", "Sea 1 Only"},
    {"Auto Pole", "Auto Pole", "Sea 1 Only"},
}

for _, t in ipairs(swordToggles) do
    local label, key, desc = t[1], t[2], t[3]
    Tabs.ItemsTab:Toggle({
        Title=label, Desc=desc, Value=_G.Settings.Items[key],
        Callback=function(s) _G.Settings.Items[key]=s; StopTween(s); (getgenv()).SaveSetting() end
    })
end

Tabs.ItemsTab:Section({Title="World Progression", TextXAlignment="Left"})

Tabs.ItemsTab:Toggle({
    Title="Auto Second Sea", Desc="Sea 1 Only",
    Value=_G.Settings.Items["Auto Second Sea"],
    Callback=function(s) _G.Settings.Items["Auto Second Sea"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.ItemsTab:Toggle({
    Title="Auto Third Sea", Desc="Sea 2 Only",
    Value=_G.Settings.Items["Auto Third Sea"],
    Callback=function(s) _G.Settings.Items["Auto Third Sea"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

-- ═══════════════════════════════════════
--              SETTINGS TAB
-- ═══════════════════════════════════════
Tabs.SettingsTab:Section({Title="Farm Settings", TextXAlignment="Left"})

Tabs.SettingsTab:Toggle({
    Title="Spin Position", Value=_G.Settings.Setting["Spin Position"],
    Callback=function(s) _G.Settings.Setting["Spin Position"]=s; (getgenv()).SaveSetting() end
})

Tabs.SettingsTab:Slider({
    Title="Farm Distance", Step=1,
    Value={Min=10, Max=50, Default=_G.Settings.Setting["Farm Distance"]},
    Callback=function(v) _G.Settings.Setting["Farm Distance"]=v end
})

Tabs.SettingsTab:Slider({
    Title="Player Tween Speed", Step=10,
    Value={Min=50, Max=500, Default=_G.Settings.Setting["Player Tween Speed"]},
    Callback=function(v) _G.Settings.Setting["Player Tween Speed"]=v end
})

Tabs.SettingsTab:Toggle({
    Title="Bring Mob", Value=_G.Settings.Setting["Bring Mob"],
    Callback=function(s) _G.Settings.Setting["Bring Mob"]=s; (getgenv()).SaveSetting() end
})

Tabs.SettingsTab:Dropdown({
    Title="Bring Mob Mode", Values={"Low","Normal","High"}, Value=_G.Settings.Setting["Bring Mob Mode"],
    Callback=function(v)
        _G.Settings.Setting["Bring Mob Mode"]=v
        BringMobDistance = v=="Low" and 150 or v=="Normal" and 250 or 800
    end
})

Tabs.SettingsTab:Dropdown({
    Title="Fast Attack Mode", Values={"Slow","Normal","Fast","Super Fast"}, Value=_G.Settings.Setting["Fast Attack Mode"],
    Callback=function(v) _G.Settings.Setting["Fast Attack Mode"]=v end
})

Tabs.SettingsTab:Section({Title="Visual Settings", TextXAlignment="Left"})

Tabs.SettingsTab:Toggle({
    Title="Hide Notifications", Value=_G.Settings.Setting["Hide Notification"],
    Callback=function(s)
        _G.Settings.Setting["Hide Notification"]=s
        plr.PlayerGui.Notifications.Enabled = not s
        ;(getgenv()).SaveSetting()
    end
})

Tabs.SettingsTab:Toggle({
    Title="Hide Damage Text", Value=_G.Settings.Setting["Hide Damage Text"],
    Callback=function(s)
        _G.Settings.Setting["Hide Damage Text"]=s
        pcall(function() game.ReplicatedStorage.Assets.GUI.DamageCounter.Enabled = not s end)
        ;(getgenv()).SaveSetting()
    end
})

Tabs.SettingsTab:Toggle({
    Title="Black Screen", Value=_G.Settings.Setting["Black Screen"],
    Callback=function(s)
        _G.Settings.Setting["Black Screen"]=s
        pcall(function()
            plr.PlayerGui.Main.Blackscreen.Size = s and UDim2.new(500,0,500,500) or UDim2.new(1,0,500,500)
        end)
        ;(getgenv()).SaveSetting()
    end
})

Tabs.SettingsTab:Toggle({
    Title="White Screen (No 3D)", Value=_G.Settings.Setting["White Screen"],
    Callback=function(s)
        _G.Settings.Setting["White Screen"]=s
        game:GetService("RunService"):Set3dRenderingEnabled(not s)
        ;(getgenv()).SaveSetting()
    end
})

Tabs.SettingsTab:Section({Title="Auto Toggles", TextXAlignment="Left"})

Tabs.SettingsTab:Toggle({
    Title="Auto Haki", Value=_G.Settings.Setting["Auto Haki"],
    Callback=function(s) _G.Settings.Setting["Auto Haki"]=s; (getgenv()).SaveSetting() end
})

Tabs.SettingsTab:Toggle({
    Title="Auto Set Spawn Point", Value=_G.Settings.Setting["Auto Set Spawn Point"],
    Callback=function(s) _G.Settings.Setting["Auto Set Spawn Point"]=s; (getgenv()).SaveSetting() end
})

Tabs.SettingsTab:Toggle({
    Title="Auto Rejoin on Disconnect", Value=_G.Settings.Setting["Auto Rejoin"],
    Callback=function(s)
        _G.Settings.Setting["Auto Rejoin"]=s
        if s then
            game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v)
                if v.Name == "ErrorPrompt" then game:GetService("TeleportService"):Teleport(game.PlaceId) end
            end)
        end
        ;(getgenv()).SaveSetting()
    end
})

Tabs.SettingsTab:Section({Title="Mastery Settings", TextXAlignment="Left"})

Tabs.SettingsTab:Slider({
    Title="Mastery Health %", Step=1,
    Value={Min=1, Max=100, Default=_G.Settings.Setting["Mastery Health"]},
    Callback=function(v) _G.Settings.Setting["Mastery Health"]=v end
})

Tabs.SettingsTab:Paragraph({Title="Fruit Mastery Skills"})
for _, key in ipairs({"Z","X","C","V","F"}) do
    local skey = "Fruit Mastery Skill "..key
    Tabs.SettingsTab:Toggle({
        Title="Skill "..key, Value=_G.Settings.Setting[skey],
        Callback=function(s) _G.Settings.Setting[skey]=s; (getgenv()).SaveSetting() end
    })
end

Tabs.SettingsTab:Paragraph({Title="Gun Mastery Skills"})
for _, key in ipairs({"Z","X"}) do
    local skey = "Gun Mastery Skill "..key
    Tabs.SettingsTab:Toggle({
        Title="Gun Skill "..key, Value=_G.Settings.Setting[skey],
        Callback=function(s) _G.Settings.Setting[skey]=s; (getgenv()).SaveSetting() end
    })
end

-- ═══════════════════════════════════════
--              LOCAL PLAYER TAB
-- ═══════════════════════════════════════
Tabs.LocalPlayerTab:Section({Title="Abilities", TextXAlignment="Left"})

Tabs.LocalPlayerTab:Toggle({
    Title="Active Race V3", Value=_G.Settings.LocalPlayer["Active Race V3"],
    Callback=function(s) _G.Settings.LocalPlayer["Active Race V3"]=s; (getgenv()).SaveSetting() end
})

Tabs.LocalPlayerTab:Toggle({
    Title="Active Race V4", Value=_G.Settings.LocalPlayer["Active Race V4"],
    Callback=function(s) _G.Settings.LocalPlayer["Active Race V4"]=s; (getgenv()).SaveSetting() end
})

spawn(function()
    while wait(0.2) do
        if _G.Settings.LocalPlayer["Active Race V4"] then
            pcall(function()
                if tonumber(plr.Character:WaitForChild("RaceEnergy").Value) == 1 and not plr.Character.RaceTransformed.Value then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
                end
            end)
        end
    end
end)

Tabs.LocalPlayerTab:Toggle({
    Title="Walk On Water", Value=_G.Settings.LocalPlayer["Walk On Water"],
    Callback=function(s)
        _G.Settings.LocalPlayer["Walk On Water"]=s
        pcall(function()
            workspace.Map["WaterBase-Plane"].Size = s and Vector3.new(1000,112,1000) or Vector3.new(1000,80,1000)
        end)
        ;(getgenv()).SaveSetting()
    end
})

Tabs.LocalPlayerTab:Toggle({
    Title="No Clip", Value=_G.Settings.LocalPlayer["No Clip"],
    Callback=function(s) _G.Settings.LocalPlayer["No Clip"]=s; (getgenv()).SaveSetting() end
})

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Settings.LocalPlayer["No Clip"] then
            pcall(function()
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end)
        end
    end)
end)

-- ═══════════════════════════════════════
--              STATS TAB
-- ═══════════════════════════════════════
Tabs.StatsTab:Section({Title="Auto Stats", TextXAlignment="Left"})
local StatsPointParagraph = Tabs.StatsTab:Paragraph({Title="Available Points", Desc="0"})

spawn(function()
    while wait(0.5) do
        pcall(function() StatsPointParagraph:SetDesc(tostring(plr.Data.Points.Value)) end)
    end
end)

local statTypes = {
    {"Melee Stats", "Auto Add Melee Stats", "Melee"},
    {"Defense Stats", "Auto Add Defense Stats", "Defense"},
    {"Sword Stats", "Auto Add Sword Stats", "Sword"},
    {"Gun Stats", "Auto Add Gun Stats", "Gun"},
    {"Devil Fruit Stats", "Auto Add Devil Fruit Stats", "Demon Fruit"},
}

for _, t in ipairs(statTypes) do
    local label, key, statKey = t[1], t[2], t[3]
    Tabs.StatsTab:Toggle({
        Title="Auto Add "..label, Value=_G.Settings.Stats[key],
        Callback=function(s) _G.Settings.Stats[key]=s end
    })
end

local PointStats = 1
Tabs.StatsTab:Slider({
    Title="Points Per Add", Step=1,
    Value={Min=1, Max=100, Default=1},
    Callback=function(v) PointStats=v end
})

spawn(function()
    while wait(0.3) do
        pcall(function()
            if plr.Data.Points.Value >= PointStats then
                for _, t in ipairs(statTypes) do
                    if _G.Settings.Stats[t[2]] then
                        CommF_:InvokeServer("AddPoint", t[3], PointStats)
                    end
                end
            end
        end)
    end
end)

-- ═══════════════════════════════════════
--              SEA EVENT TAB
-- ═══════════════════════════════════════
Tabs.SeaEventTab:Section({Title="Boat & Sailing", TextXAlignment="Left"})

local BoatList = {"Guardian","Beast Hunter","PirateGrandBrigade","MarineGrandBrigade","PirateBrigade","MarineBrigade","PirateSloop","MarineSloop"}
local ZoneList = {"Zone 1","Zone 2","Zone 3","Zone 4","Zone 5","Zone 6","Infinite"}

Tabs.SeaEventTab:Dropdown({
    Title="Select Boat", Values=BoatList, Value=_G.Settings.SeaEvent["Selected Boat"],
    Callback=function(v) _G.Settings.SeaEvent["Selected Boat"]=v; (getgenv()).SaveSetting() end
})

Tabs.SeaEventTab:Dropdown({
    Title="Select Zone", Values=ZoneList, Value=_G.Settings.SeaEvent["Selected Zone"],
    Callback=function(v) _G.Settings.SeaEvent["Selected Zone"]=v; (getgenv()).SaveSetting() end
})

Tabs.SeaEventTab:Slider({
    Title="Boat Tween Speed", Step=10,
    Value={Min=50, Max=500, Default=_G.Settings.SeaEvent["Boat Tween Speed"]},
    Callback=function(v) _G.Settings.SeaEvent["Boat Tween Speed"]=v end
})

Tabs.SeaEventTab:Toggle({
    Title="Sail Boat + Auto Kill", Desc="Sails and kills sea enemies",
    Value=_G.Settings.SeaEvent["Sail Boat"],
    Callback=function(s) _G.Settings.SeaEvent["Sail Boat"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.SeaEventTab:Section({Title="Sea Enemies", TextXAlignment="Left"})

local seaEnemyToggles = {
    {"Auto Farm Shark","Auto Farm Shark"},
    {"Auto Farm Piranha","Auto Farm Piranha"},
    {"Auto Farm Fish Crew Member","Auto Farm Fish Crew Member"},
    {"Auto Farm Ghost Ship","Auto Farm Ghost Ship"},
    {"Auto Farm Pirate Brigade","Auto Farm Pirate Brigade"},
    {"Auto Farm Pirate Grand Brigade","Auto Farm Pirate Grand Brigade"},
    {"Auto Farm Terrorshark","Auto Farm Terrorshark"},
    {"Auto Farm Sea Beasts","Auto Farm Seabeasts"},
}

for _, t in ipairs(seaEnemyToggles) do
    local label, key = t[1], t[2]
    Tabs.SeaEventTab:Toggle({
        Title=label, Value=_G.Settings.SeaEvent[key],
        Callback=function(s) _G.Settings.SeaEvent[key]=s; (getgenv()).SaveSetting() end
    })
end

-- ═══════════════════════════════════════
--              SEA STACK TAB
-- ═══════════════════════════════════════
Tabs.SeaStackTab:Section({Title="Island Status", TextXAlignment="Left"})
local MiragePara = Tabs.SeaStackTab:Paragraph({Title="Mirage Island", Desc="Checking..."})
local KitsunePara = Tabs.SeaStackTab:Paragraph({Title="Kitsune Island", Desc="Checking..."})
local FrozenPara = Tabs.SeaStackTab:Paragraph({Title="Frozen Dimension", Desc="Checking..."})
local PrehistoricPara = Tabs.SeaStackTab:Paragraph({Title="Prehistoric Island", Desc="Checking..."})

spawn(function()
    while wait(1) do
        pcall(function()
            local locs = workspace._WorldOrigin.Locations
            MiragePara:SetDesc(locs:FindFirstChild("Mirage Island") and "✅ Spawned" or "❌ Not Spawned")
            KitsunePara:SetDesc(locs:FindFirstChild("Kitsune Island") and "✅ Spawned" or "❌ Not Spawned")
            FrozenPara:SetDesc(locs:FindFirstChild("Frozen Dimension") and "✅ Spawned" or "❌ Not Spawned")
            PrehistoricPara:SetDesc(locs:FindFirstChild("Prehistoric Island") and "✅ Spawned" or "❌ Not Spawned")
        end)
    end
end)

Tabs.SeaStackTab:Section({Title="Teleport to Islands", TextXAlignment="Left"})

Tabs.SeaStackTab:Toggle({
    Title="Tween to Mirage Island", Value=_G.Settings.SeaStack["Tween To Mirage Island"],
    Callback=function(s) _G.Settings.SeaStack["Tween To Mirage Island"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.SeaStackTab:Toggle({
    Title="Tween to Kitsune Island", Value=_G.Settings.SeaStack["Tween To Kitsune Island"],
    Callback=function(s) _G.Settings.SeaStack["Tween To Kitsune Island"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.SeaStackTab:Toggle({
    Title="Tween to Frozen Dimension", Value=_G.Settings.SeaStack["Tween To Frozen Dimension"],
    Callback=function(s) _G.Settings.SeaStack["Tween To Frozen Dimension"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.SeaStackTab:Toggle({
    Title="Tween to Prehistoric Island", Value=_G.Settings.SeaStack["Tween To Prehistoric Island"],
    Callback=function(s) _G.Settings.SeaStack["Tween To Prehistoric Island"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

spawn(function()
    while wait(0.2) do
        pcall(function()
            local locs = workspace._WorldOrigin.Locations
            if _G.Settings.SeaStack["Tween To Mirage Island"] and locs:FindFirstChild("Mirage Island") then
                TweenPlayer(locs["Mirage Island"].CFrame)
            end
            if _G.Settings.SeaStack["Tween To Kitsune Island"] and workspace.Map:FindFirstChild("KitsuneIsland") then
                TweenPlayer(workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0,0,10))
            end
            if _G.Settings.SeaStack["Tween To Frozen Dimension"] and locs:FindFirstChild("Frozen Dimension") then
                TweenPlayer(locs["Frozen Dimension"].CFrame)
            end
            if _G.Settings.SeaStack["Tween To Prehistoric Island"] and locs:FindFirstChild("Prehistoric Island") then
                TweenPlayer(locs["Prehistoric Island"].CFrame)
            end
        end)
    end
end)

Tabs.SeaStackTab:Section({Title="Azure Ember", TextXAlignment="Left"})

Tabs.SeaStackTab:Toggle({
    Title="Auto Collect Azure Ember", Value=_G.Settings.SeaStack["Auto Collect Azure Ember"],
    Callback=function(s) _G.Settings.SeaStack["Auto Collect Azure Ember"]=s; (getgenv()).SaveSetting() end
})

Tabs.SeaStackTab:Slider({
    Title="Azure Ember Amount to Trade", Step=1,
    Value={Min=1, Max=25, Default=_G.Settings.SeaStack["Set Azure Ember"]},
    Callback=function(v) _G.Settings.SeaStack["Set Azure Ember"]=v; (getgenv()).SaveSetting() end
})

Tabs.SeaStackTab:Toggle({
    Title="Auto Trade Azure Ember", Value=_G.Settings.SeaStack["Auto Trade Azure Ember"],
    Callback=function(s) _G.Settings.SeaStack["Auto Trade Azure Ember"]=s; (getgenv()).SaveSetting() end
})

Tabs.SeaStackTab:Toggle({
    Title="Auto Attack Sea Beasts", Value=_G.Settings.SeaStack["Auto Attack Seabeasts"],
    Callback=function(s) _G.Settings.SeaStack["Auto Attack Seabeasts"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

-- ═══════════════════════════════════════
--              SEA SETTINGS TAB
-- ═══════════════════════════════════════
Tabs.SeaSettingsTab:Section({Title="Sea Settings", TextXAlignment="Left"})

Tabs.SeaSettingsTab:Toggle({
    Title="Lightning (Always Daytime)", Value=_G.Settings.SettingSea["Lightning"],
    Callback=function(s) _G.Settings.SettingSea["Lightning"]=s end
})

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.Settings.SettingSea["Lightning"] then
            game:GetService("Lighting").ClockTime = 12
        end
    end)
end)

Tabs.SeaSettingsTab:Toggle({
    Title="Increase Boat Speed", Value=_G.Settings.SettingSea["Increase Boat Speed"],
    Callback=function(s) _G.Settings.SettingSea["Increase Boat Speed"]=s end
})

Tabs.SeaSettingsTab:Toggle({
    Title="No Clip Rock", Value=_G.Settings.SettingSea["No Clip Rock"],
    Callback=function(s) _G.Settings.SettingSea["No Clip Rock"]=s end
})

Tabs.SeaSettingsTab:Section({Title="Skills to Use", TextXAlignment="Left"})
for _, t in ipairs({{"Use Devil Fruit Skill","Use Devil Fruit Skill"},{"Use Melee Skill","Use Melee Skill"},{"Use Sword Skill","Use Sword Skill"},{"Use Gun Skill","Use Gun Skill"}}) do
    Tabs.SeaSettingsTab:Toggle({
        Title=t[1], Value=_G.Settings.SettingSea[t[2]],
        Callback=function(s) _G.Settings.SettingSea[t[2]]=s; (getgenv()).SaveSetting() end
    })
end

-- ═══════════════════════════════════════
--              DRAGON DOJO TAB
-- ═══════════════════════════════════════
Tabs.DragonDojoTab:Section({Title="Dragon Dojo - Sea 3", TextXAlignment="Left"})

Tabs.DragonDojoTab:Toggle({
    Title="Auto Farm Blaze Ember", Desc="Auto quest + collect ember",
    Value=_G.Settings.DragonDojo["Auto Farm Blaze Ember"],
    Callback=function(s) _G.Settings.DragonDojo["Auto Farm Blaze Ember"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.DragonDojoTab:Button({
    Title="Craft Volcanic Magnet",
    Callback=function()
        pcall(function()
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CraftItem","Craft","Volcanic Magnet")
        end)
    end
})

-- ═══════════════════════════════════════
--              RACE TAB
-- ═══════════════════════════════════════
Tabs.RaceTab:Section({Title="Race V4", TextXAlignment="Left"})

Tabs.RaceTab:Dropdown({
    Title="Teleport Place", Values={"Top Of GreatTree","Temple Of Time","Lever Pull","Ancient One"}, Value=nil,
    Callback=function(v) _G.Settings.Race["Selected Place"]=v end
})

Tabs.RaceTab:Toggle({
    Title="Teleport To Race Place", Value=false,
    Callback=function(s) _G.Settings.Race["Teleport To Place"]=s end
})

Tabs.RaceTab:Toggle({
    Title="Auto Buy Gear", Value=_G.Settings.Race["Auto Buy Gear"],
    Callback=function(s)
        _G.Settings.Race["Auto Buy Gear"]=s
        if s then
            spawn(function()
                while _G.Settings.Race["Auto Buy Gear"] do
                    pcall(function() CommF_:InvokeServer("UpgradeRace","Buy") end)
                    wait(0.2)
                end
            end)
        end
        ;(getgenv()).SaveSetting()
    end
})

Tabs.RaceTab:Toggle({
    Title="Find Blue Gear (Mirage)", Value=_G.Settings.Race["Find Blue Gear"],
    Callback=function(s) _G.Settings.Race["Find Blue Gear"]=s; (getgenv()).SaveSetting() end
})

Tabs.RaceTab:Toggle({
    Title="Look At Moon + Use Ability", Value=_G.Settings.Race["Look Moon Ability"],
    Callback=function(s) _G.Settings.Race["Look Moon Ability"]=s; (getgenv()).SaveSetting() end
})

Tabs.RaceTab:Toggle({
    Title="Auto Train", Value=_G.Settings.Race["Auto Train"],
    Callback=function(s) _G.Settings.Race["Auto Train"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.RaceTab:Toggle({
    Title="Auto Trial", Value=_G.Settings.Race["Auto Trial"],
    Callback=function(s) _G.Settings.Race["Auto Trial"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.RaceTab:Toggle({
    Title="Auto Kill Player After Trial", Value=_G.Settings.Race["Auto Kill Player After Trial"],
    Callback=function(s) _G.Settings.Race["Auto Kill Player After Trial"]=s; (getgenv()).SaveSetting() end
})

Tabs.RaceTab:Button({
    Title="Teleport To Race Door",
    Callback=function()
        pcall(function()
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35,14895.3,102.62)
            wait(0.5)
            local race = plr.Data.Race.Value
            local racePos = {
                Human=CFrame.new(29221.82,14890.97,-205.99),
                Skypiea=CFrame.new(28960.15,14919.62,235.03),
                Fishman=CFrame.new(28231.17,14890.97,-211.64),
                Cyborg=CFrame.new(28502.68,14895.97,-423.72),
                Ghoul=CFrame.new(28674.24,14890.67,445.43),
                Mink=CFrame.new(29012.34,14890.97,-380.14),
            }
            if racePos[race] then TweenPlayer(racePos[race]) end
        end)
    end
})

Tabs.RaceTab:Button({
    Title="Buy Ancient Quest",
    Callback=function()
        pcall(function() CommF_:InvokeServer("UpgradeRace","Buy") end)
    end
})

-- ═══════════════════════════════════════
--              COMBAT TAB
-- ═══════════════════════════════════════
Tabs.CombatTab:Section({Title="Combat", TextXAlignment="Left"})
local PlayerInServerParagraph = Tabs.CombatTab:Paragraph({Title="Players In Server", Desc="0/12"})

spawn(function()
    while wait(1) do
        pcall(function()
            PlayerInServerParagraph:SetDesc(#game.Players:GetPlayers() .. " / 12")
        end)
    end
end)

local PlayerList = {}
for _, v in pairs(game.Players:GetChildren()) do table.insert(PlayerList, v.Name) end

local SelectedPlayerDropdown = Tabs.CombatTab:Dropdown({
    Title="Select Player", Values=PlayerList, Value=tostring(PlayerList[1]),
    Callback=function(v) _G.SelectedPlayer=v end
})

Tabs.CombatTab:Button({
    Title="Refresh Player List",
    Callback=function()
        PlayerList = {}
        for _, v in pairs(game.Players:GetChildren()) do table.insert(PlayerList, v.Name) end
        SelectedPlayerDropdown:Refresh(PlayerList)
    end
})

Tabs.CombatTab:Toggle({
    Title="Teleport To Player", Value=false,
    Callback=function(s)
        _G.TeleportToPlayer=s
        if s then
            spawn(function()
                repeat
                    pcall(function()
                        if _G.SelectedPlayer and game.Players:FindFirstChild(_G.SelectedPlayer) then
                            TweenPlayer(game.Players[_G.SelectedPlayer].Character.HumanoidRootPart.CFrame)
                        end
                    end)
                    wait(0.1)
                until not _G.TeleportToPlayer
                StopTween(false)
            end)
        end
    end
})

-- ═══════════════════════════════════════
--              RAID TAB
-- ═══════════════════════════════════════
Tabs.RaidTab:Section({Title="Raid", TextXAlignment="Left"})
local TimeRaidParagraph = Tabs.RaidTab:Paragraph({Title="Raid Timer", Desc="N/A"})
local IslandRaidParagraph = Tabs.RaidTab:Paragraph({Title="Current Island", Desc="N/A"})

spawn(function()
    while wait(0.5) do
        pcall(function()
            local timer = plr.PlayerGui.Main.TopHUDList.RaidTimer
            TimeRaidParagraph:SetDesc(timer.Visible and timer.Text or "Waiting for Raid")
            local rm = workspace.Map.RaidMap
            IslandRaidParagraph:SetDesc(
                rm:FindFirstChild("RaidIsland5") and "🏝️ Island 5" or
                rm:FindFirstChild("RaidIsland4") and "🏝️ Island 4" or
                rm:FindFirstChild("RaidIsland3") and "🏝️ Island 3" or
                rm:FindFirstChild("RaidIsland2") and "🏝️ Island 2" or
                rm:FindFirstChild("RaidIsland1") and "🏝️ Island 1" or "No Active Raid"
            )
        end)
    end
end)

local RaidsList = {}
pcall(function()
    local rm = require(game.ReplicatedStorage.Raids)
    for _, v in pairs(rm.raids) do table.insert(RaidsList, v) end
    for _, v in pairs(rm.advancedRaids) do table.insert(RaidsList, v) end
end)

Tabs.RaidTab:Dropdown({
    Title="Select Raid Chip", Values=RaidsList, Value=_G.Settings.Raid["Selected Chip"],
    Callback=function(v) _G.Settings.Raid["Selected Chip"]=v end
})

Tabs.RaidTab:Toggle({
    Title="Auto Raid", Desc="Sea 2 & 3 Only",
    Value=_G.Settings.Raid["Auto Raid"],
    Callback=function(s) _G.Settings.Raid["Auto Raid"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.RaidTab:Toggle({
    Title="Auto Awaken", Value=_G.Settings.Raid["Auto Awaken"],
    Callback=function(s)
        _G.Settings.Raid["Auto Awaken"]=s
        if s then
            spawn(function()
                while _G.Settings.Raid["Auto Awaken"] do
                    pcall(function() CommF_:InvokeServer("Awakener","Awaken") end)
                    wait(0.2)
                end
            end)
        end
        ;(getgenv()).SaveSetting()
    end
})

Tabs.RaidTab:Toggle({
    Title="Auto Law Raid", Value=_G.Settings.Raid["Law Raid"],
    Callback=function(s) _G.Settings.Raid["Law Raid"]=s; StopTween(s); (getgenv()).SaveSetting() end
})

Tabs.RaidTab:Button({
    Title="Teleport to Raid Lab",
    Callback=function()
        if World2 then TweenPlayer(CFrame.new(-6438,250,-4501))
        elseif World3 then TweenPlayer(CFrame.new(-5017,314,-2823)) end
    end
})

-- ═══════════════════════════════════════
--              ESP TAB
-- ═══════════════════════════════════════
Tabs.EspTab:Section({Title="ESP", TextXAlignment="Left"})

local espToggles = {
    {"ESP Player","ESP Player"}, {"ESP Chest","ESP Chest"}, {"ESP Devil Fruit","ESP DevilFruit"},
    {"ESP Real Fruit","ESP RealFruit"}, {"ESP Flower","ESP Flower"}, {"ESP Island","ESP Island"},
    {"ESP NPC","ESP Npc"}, {"ESP Sea Beast","ESP Sea Beast"}, {"ESP Monster","ESP Monster"},
    {"ESP Mirage Island","ESP Mirage"}, {"ESP Kitsune Island","ESP Kitsune"}, {"ESP Frozen Dimension","ESP Frozen"},
}

for _, t in ipairs(espToggles) do
    local label, key = t[1], t[2]
    Tabs.EspTab:Toggle({
        Title=label, Value=_G.Settings.Esp[key],
        Callback=function(s) _G.Settings.Esp[key]=s end
    })
end

-- ESP Loops
local espNum = math.random(1,1000000)
spawn(function()
    while wait(1) do
        -- Player ESP
        for _, v in pairs(game.Players:GetChildren()) do
            pcall(function()
                if not v.Character then return end
                local head = v.Character:FindFirstChild("Head")
                if not head then return end
                local espName = "EspPlayer"..espNum
                if _G.Settings.Esp["ESP Player"] then
                    if not head:FindFirstChild(espName) then
                        local b = Instance.new("BillboardGui",head)
                        b.Name = espName b.AlwaysOnTop=true b.Size=UDim2.new(1,200,1,30) b.StudsOffset=Vector3.new(0,2.5,0)
                        local l = Instance.new("TextLabel",b) l.BackgroundTransparency=1 l.Size=UDim2.new(1,0,1,0)
                        l.Font=Enum.Font.GothamSemibold l.TextSize=14 l.TextWrapped=true l.TextStrokeTransparency=0.5
                        l.TextColor3 = v.Team==plr.Team and Color3.fromRGB(50,200,50) or Color3.fromRGB(200,50,50)
                    else
                        local hrp = v.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            head[espName].TextLabel.Text = v.Name.." | "..math.floor((plr.Character.Head.Position-head.Position).Magnitude/3).."m | "..math.floor(v.Character.Humanoid.Health*100/v.Character.Humanoid.MaxHealth).."%"
                        end
                    end
                elseif head:FindFirstChild(espName) then
                    head:FindFirstChild(espName):Destroy()
                end
            end)
        end
        -- Monster ESP
        for _, v in pairs(workspace.Enemies:GetChildren()) do
            pcall(function()
                if not v:FindFirstChild("HumanoidRootPart") then return end
                if _G.Settings.Esp["ESP Monster"] then
                    if not v:FindFirstChild("EspMonster") then
                        local b = Instance.new("BillboardGui",v) b.Name="EspMonster" b.AlwaysOnTop=true b.Size=UDim2.new(0,200,0,50) b.StudsOffset=Vector3.new(0,2.5,0)
                        local l = Instance.new("TextLabel",b) l.BackgroundTransparency=1 l.Size=UDim2.new(0,200,0,50) l.Font=Enum.Font.GothamBold l.TextColor3=Color3.fromRGB(120,130,230) l.TextSize=14
                    else
                        v.EspMonster.TextLabel.Text = v.Name.." - "..math.floor((plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude).."m"
                    end
                elseif v:FindFirstChild("EspMonster") then v.EspMonster:Destroy() end
            end)
        end
    end
end)

-- ═══════════════════════════════════════
--              TELEPORT TAB
-- ═══════════════════════════════════════
Tabs.TeleportTab:Section({Title="Sea Travel", TextXAlignment="Left"})

Tabs.TeleportTab:Button({Title="Go to Sea 1", Callback=function() pcall(function() CommF_:InvokeServer("TravelMain") end) end})
Tabs.TeleportTab:Button({Title="Go to Sea 2", Callback=function() pcall(function() CommF_:InvokeServer("TravelDressrosa") end) end})
Tabs.TeleportTab:Button({Title="Go to Sea 3", Callback=function() pcall(function() CommF_:InvokeServer("TravelZou") end) end})

Tabs.TeleportTab:Section({Title="Islands", TextXAlignment="Left"})

local IslandList = World1 and {"WindMill","Marine","Middle Town","Jungle","Pirate Village","Desert","Snow Island","MarineFord","Colosseum","Sky Island 1","Sky Island 2","Sky Island 3","Prison","Magma Village","Under Water Island","Fountain City","Shank Room","Mob Island"}
    or World2 and {"The Cafe","First Spot","Dark Area","Flamingo Mansion","Flamingo Room","Green Zone","Factory","Colosseum","Zombie Island","Two Snow Mountain","Punk Hazard","Cursed Ship","Ice Castle","Forgotten Island","Ussop Island","Mini Sky Island"}
    or World3 and {"Port Town","Great Tree","Castle On The Sea","MiniSky","Hydra Island","Floating Turtle","Haunted Castle","Ice Cream Island","Peanut Island","Cake Island","Cocoa Island","Candy Island","Tiki Outpost","Dragon Dojo","Mansion"}
    or {}

local IslandCFrames = {
    WindMill=CFrame.new(979,16,1429), Marine=CFrame.new(-2566,6,2045), ["Middle Town"]=CFrame.new(-690,15,1582),
    Jungle=CFrame.new(-1612,36,149), ["Pirate Village"]=CFrame.new(-1181,4,3803), Desert=CFrame.new(944,20,4373),
    ["Snow Island"]=CFrame.new(1347,104,-1319), MarineFord=CFrame.new(-4914,50,4281), Colosseum=CFrame.new(-1427,7,-2792),
    ["Sky Island 1"]=CFrame.new(-4869,733,-2667), Prison=CFrame.new(4875,5,734), ["Magma Village"]=CFrame.new(-5247,12,8504),
    ["Fountain City"]=CFrame.new(5127,59,4105), ["Shank Room"]=CFrame.new(-1442,29,-28), ["Mob Island"]=CFrame.new(-2850,7,5354),
    ["The Cafe"]=CFrame.new(-380,77,255), ["First Spot"]=CFrame.new(-11,29,2771), ["Dark Area"]=CFrame.new(3780,22,-3498),
    ["Flamingo Mansion"]=CFrame.new(-483,332,595), ["Green Zone"]=CFrame.new(-2448,73,-3210), Factory=CFrame.new(424,211,-427),
    ["Zombie Island"]=CFrame.new(-5622,492,-781), ["Two Snow Mountain"]=CFrame.new(753,408,-5274),
    ["Punk Hazard"]=CFrame.new(-6127,15,-5040), ["Cursed Ship"]=CFrame.new(923,125,32885),
    ["Ice Castle"]=CFrame.new(6148,294,-6741), ["Forgotten Island"]=CFrame.new(-3032,317,-10075),
    ["Ussop Island"]=CFrame.new(4816,8,2863), ["Port Town"]=CFrame.new(-290,6,5343),
    ["Great Tree"]=CFrame.new(2681,1682,-7190), ["Hydra Island"]=CFrame.new(5291,1005,393),
    ["Floating Turtle"]=CFrame.new(-13274,531,-7579), ["Haunted Castle"]=CFrame.new(-9515,164,5786),
    ["Ice Cream Island"]=CFrame.new(-902,79,-10988), ["Peanut Island"]=CFrame.new(-2062,50,-10232),
    ["Cake Island"]=CFrame.new(-1884,19,-11666), ["Cocoa Island"]=CFrame.new(87,73,-12319),
    ["Candy Island"]=CFrame.new(-1014,149,-14555), ["Tiki Outpost"]=CFrame.new(-16218,9,445),
    ["Dragon Dojo"]=CFrame.new(5743,1206,936),
}

local SelectedIslandDropdown = Tabs.TeleportTab:Dropdown({
    Title="Select Island", Values=IslandList, Value=IslandList[1],
    Callback=function(v) _G.SelectIsland=v end
})

Tabs.TeleportTab:Toggle({
    Title="Teleport to Island", Value=false,
    Callback=function(s)
        _G.TeleportIsland=s
        if s then
            spawn(function()
                repeat
                    pcall(function()
                        if _G.SelectIsland and IslandCFrames[_G.SelectIsland] then
                            TweenPlayer(IslandCFrames[_G.SelectIsland])
                        end
                    end)
                    wait(0.1)
                until not _G.TeleportIsland
                StopTween(false)
            end)
        end
    end
})

-- ═══════════════════════════════════════
--              SHOP TAB
-- ═══════════════════════════════════════
Tabs.ShopTab:Section({Title="Auto Buy", TextXAlignment="Left"})

Tabs.ShopTab:Toggle({
    Title="Auto Buy Legendary Sword", Value=_G.Settings.Shop["Auto Buy Legendary Sword"],
    Callback=function(s)
        _G.Settings.Shop["Auto Buy Legendary Sword"]=s
        if s then
            spawn(function()
                while _G.Settings.Shop["Auto Buy Legendary Sword"] do
                    pcall(function()
                        CommF_:InvokeServer("LegendarySwordDealer","1")
                        CommF_:InvokeServer("LegendarySwordDealer","2")
                        CommF_:InvokeServer("LegendarySwordDealer","3")
                    end)
                    wait(0.3)
                end
            end)
        end
        ;(getgenv()).SaveSetting()
    end
})

Tabs.ShopTab:Toggle({
    Title="Auto Buy Haki Color", Value=_G.Settings.Shop["Auto Buy Haki Color"],
    Callback=function(s)
        _G.Settings.Shop["Auto Buy Haki Color"]=s
        if s then
            spawn(function()
                while _G.Settings.Shop["Auto Buy Haki Color"] do
                    pcall(function() CommF_:InvokeServer("ColorsDealer","2") end)
                    wait(0.3)
                end
            end)
        end
        ;(getgenv()).SaveSetting()
    end
})

Tabs.ShopTab:Section({Title="Abilities Shop", TextXAlignment="Left"})

local shopButtons = {
    {"Buy Geppo ($10k)", "BuyHaki", "Geppo"},
    {"Buy Buso Haki ($25k)", "BuyHaki", "Buso"},
    {"Buy Soru ($25k)", "BuyHaki", "Soru"},
    {"Buy Observation Haki ($750k)", "KenTalk", "Buy"},
    {"Buy Black Leg ($150k)", "BuyBlackLeg", nil},
    {"Buy Electro ($550k)", "BuyElectro", nil},
    {"Buy Fishman Karate ($750k)", "BuyFishmanKarate", nil},
    {"Buy Superhuman ($3M)", "BuySuperhuman", nil},
    {"Buy Death Step (F5k $5M)", "BuyDeathStep", nil},
    {"Buy Electric Claw (F5k $3M)", "BuyElectricClaw", nil},
    {"Buy Dragon Talon (F5k $3M)", "BuyDragonTalon", nil},
    {"Buy God Human (F5k $5M)", "BuyGodhuman", nil},
}

for _, t in ipairs(shopButtons) do
    local label, remote, arg = t[1], t[2], t[3]
    Tabs.ShopTab:Button({
        Title=label,
        Callback=function()
            pcall(function()
                if arg then CommF_:InvokeServer(remote, arg)
                else CommF_:InvokeServer(remote) end
            end)
        end
    })
end

Tabs.ShopTab:Section({Title="Codes", TextXAlignment="Left"})

Tabs.ShopTab:Button({
    Title="Redeem All Codes",
    Callback=function()
        local codes = {"ZIOLES","NOOB2ADMIN","KITT_RESET","Sub2CaptainMaui","SUB2GAMERROBOT_RESET1","kittgaming","Sub2Fer999","Enyu_is_Pro","Magicbus","JCWK","Starcodeheo","Bluxxy","fudd10_v2","FUDD10","BIGNEWS","THEGREATACE","SUB2GAMERROBOT_EXP1","Sub2OfficialNoobie","StrawHatMaine","SUB2NOOBMASTER123","Sub2UncleKizaru","Sub2Daigrock","Axiore","TantaiGaming"}
        for _, code in ipairs(codes) do
            pcall(function() game.ReplicatedStorage.Remotes.Redeem:InvokeServer(code) end)
        end
        WindUI:Notify({Title="Codes",Content="All codes redeemed!",Icon="check",Duration=3})
    end
})

-- ═══════════════════════════════════════
--              FRUIT TAB
-- ═══════════════════════════════════════
Tabs.FruitTab:Section({Title="Fruit", TextXAlignment="Left"})

Tabs.FruitTab:Toggle({
    Title="Auto Buy Random Fruit", Value=_G.Settings.Fruit["Auto Buy Random Fruit"],
    Callback=function(s)
        _G.Settings.Fruit["Auto Buy Random Fruit"]=s
        if s then
            spawn(function()
                while _G.Settings.Fruit["Auto Buy Random Fruit"] do
                    pcall(function() CommF_:InvokeServer("Cousin","Buy") end)
                    wait(0.3)
                end
            end)
        end
    end
})

Tabs.FruitTab:Dropdown({
    Title="Store Rarity", Values={"Common - Mythical","Uncommon - Mythical","Rare - Mythical","Legendary - Mythical","Mythical"},
    Value=_G.Settings.Fruit["Store Rarity Fruit"],
    Callback=function(v) _G.Settings.Fruit["Store Rarity Fruit"]=v; (getgenv()).SaveSetting() end
})

Tabs.FruitTab:Toggle({
    Title="Auto Store Fruit", Value=_G.Settings.Fruit["Auto Store Fruit"],
    Callback=function(s) _G.Settings.Fruit["Auto Store Fruit"]=s; (getgenv()).SaveSetting() end
})

Tabs.FruitTab:Toggle({
    Title="Fruit Notification", Value=_G.Settings.Fruit["Fruit Notification"],
    Callback=function(s) _G.Settings.Fruit["Fruit Notification"]=s; (getgenv()).SaveSetting() end
})

Tabs.FruitTab:Toggle({
    Title="Teleport To Fruit", Value=_G.Settings.Fruit["Teleport To Fruit"],
    Callback=function(s) _G.Settings.Fruit["Teleport To Fruit"]=s; (getgenv()).SaveSetting() end
})

Tabs.FruitTab:Toggle({
    Title="Tween To Fruit", Value=_G.Settings.Fruit["Tween To Fruit"],
    Callback=function(s) _G.Settings.Fruit["Tween To Fruit"]=s; (getgenv()).SaveSetting() end
})

Tabs.FruitTab:Button({
    Title="Grab All Fruits",
    Callback=function()
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Tool") then
                pcall(function() v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame end)
            end
        end
    end
})

spawn(function()
    while wait(0.5) do
        pcall(function()
            if _G.Settings.Fruit["Fruit Notification"] then
                for _, v in pairs(workspace:GetChildren()) do
                    if string.find(v.Name,"Fruit") then
                        WindUI:Notify({Title="Fruit Found!",Content=v.Name,Icon="apple",Duration=3})
                    end
                end
            end
            if _G.Settings.Fruit["Teleport To Fruit"] then
                for _, v in pairs(workspace:GetChildren()) do
                    if string.find(v.Name,"Fruit") then
                        plr.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                    end
                end
            end
            if _G.Settings.Fruit["Tween To Fruit"] then
                for _, v in pairs(workspace:GetChildren()) do
                    if string.find(v.Name,"Fruit") then TweenPlayer(v.Handle.CFrame) end
                end
            end
        end)
    end
end)

-- ═══════════════════════════════════════
--              MISC TAB
-- ═══════════════════════════════════════
Tabs.MiscTab:Section({Title="Team", TextXAlignment="Left"})

Tabs.MiscTab:Button({Title="Join Pirates", Callback=function() pcall(function() CommF_:InvokeServer("SetTeam","Pirates") end) end})
Tabs.MiscTab:Button({Title="Join Marines", Callback=function() pcall(function() CommF_:InvokeServer("SetTeam","Marines") end) end})

Tabs.MiscTab:Section({Title="Graphics", TextXAlignment="Left"})

Tabs.MiscTab:Button({
    Title="FPS Boost",
    Callback=function()
        settings().Rendering.QualityLevel = "Level01"
        for _, v in pairs(game:GetDescendants()) do
            pcall(function()
                if v:IsA("Part") or v:IsA("Union") then v.Material="Plastic" v.Reflectance=0
                elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency=1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Lifetime=NumberRange.new(0)
                elseif v:IsA("Fire") or v:IsA("Smoke") or v:IsA("SpotLight") then v.Enabled=false end
            end)
        end
        WindUI:Notify({Title="FPS Boost",Content="Applied! Restart for full effect.",Icon="zap",Duration=3})
    end
})

Tabs.MiscTab:Button({
    Title="Remove Fog",
    Callback=function()
        pcall(function()
            game.Lighting.FogEnd = 9e9
            game.Lighting.LightingLayers:Destroy()
        end)
    end
})

Tabs.MiscTab:Button({
    Title="Remove Lava",
    Callback=function()
        for _, v in pairs(game:GetDescendants()) do
            if v.Name == "Lava" then pcall(function() v:Destroy() end) end
        end
    end
})

Tabs.MiscTab:Toggle({
    Title="Hide Chat", Value=_G.Settings.Misc["Hide Chat"],
    Callback=function(s)
        _G.Settings.Misc["Hide Chat"]=s
        pcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, not s) end)
    end
})

Tabs.MiscTab:Toggle({
    Title="Hide Leaderboard", Value=_G.Settings.Misc["Hide Leaderboard"],
    Callback=function(s)
        _G.Settings.Misc["Hide Leaderboard"]=s
        pcall(function() game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, not s) end)
    end
})

-- ═══════════════════════════════════════
--              SERVER TAB
-- ═══════════════════════════════════════
Tabs.ServerTab:Section({Title="Server Info", TextXAlignment="Left"})

local MoonParagraph = Tabs.ServerTab:Paragraph({Title="Moon Phase", Desc="Checking..."})
local KitsuneServerParagraph = Tabs.ServerTab:Paragraph({Title="Kitsune Island", Desc="Checking..."})
local FrozenServerParagraph = Tabs.ServerTab:Paragraph({Title="Frozen Dimension", Desc="Checking..."})
local MirageServerParagraph = Tabs.ServerTab:Paragraph({Title="Mirage Island", Desc="Checking..."})

spawn(function()
    while wait(2) do
        pcall(function()
            local moonId = game.Lighting.Sky.MoonTextureId
            local moonPhase = moonId:find("9709149431") and "🌕 Full Moon 100%" or
                              moonId:find("9709149052") and "🌕 Full Moon 75%" or
                              moonId:find("9709143733") and "🌔 Full Moon 50%" or
                              moonId:find("9709150401") and "🌓 Full Moon 25%" or
                              moonId:find("9709149680") and "🌒 Full Moon 15%" or "🌑 No Moon"
            MoonParagraph:SetDesc(moonPhase)

            local locs = workspace._WorldOrigin.Locations
            KitsuneServerParagraph:SetDesc(locs:FindFirstChild("Kitsune Island") and "✅ Spawned" or "❌ Not Spawned")
            FrozenServerParagraph:SetDesc(locs:FindFirstChild("Frozen Dimension") and "✅ Spawned" or "❌ Not Spawned")
            MirageServerParagraph:SetDesc(locs:FindFirstChild("Mirage Island") and "✅ Spawned" or "❌ Not Spawned")
        end)
    end
end)

Tabs.ServerTab:Paragraph({
    Title="Job ID", Desc=game.JobId,
    Buttons={{Title="Copy", Callback=function() setclipboard(game.JobId) end}}
})

Tabs.ServerTab:Section({Title="Server Actions", TextXAlignment="Left"})

Tabs.ServerTab:Button({
    Title="Rejoin Server",
    Callback=function() game:GetService("TeleportService"):Teleport(game.PlaceId) end
})

Tabs.ServerTab:Button({
    Title="Server Hop",
    Callback=function()
        local ok, module = pcall(function()
            return (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))()
        end)
        if ok then module:Teleport(game.PlaceId)
        else WindUI:Notify({Title="Error",Content="Server hop failed",Icon="x",Duration=3}) end
    end
})

local JobIdInput = ""
Tabs.ServerTab:Input({
    Title="Enter Job ID to Join",
    Callback=function(v) JobIdInput=v end
})

Tabs.ServerTab:Button({
    Title="Join by Job ID",
    Callback=function()
        if JobIdInput ~= "" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, JobIdInput)
        end
    end
})

-- ═══════════════════════════════════════════════
--              BRING MOB LOOP
-- ═══════════════════════════════════════════════
spawn(function()
    while task.wait() do
        if _G.Settings.Setting["Bring Mob"] then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v.Name == MonFarm and v:FindFirstChild("HumanoidRootPart") then
                        if (v.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= BringMobDistance then
                            v.HumanoidRootPart.CFrame = PosMon
                            v.HumanoidRootPart.Size = Vector3.new(1,1,1)
                        end
                    end
                end
            end)
        end
    end
end)

-- ═══════════════════════════════════════════════
--              BOAT SPEED LOOP
-- ═══════════════════════════════════════════════
spawn(function()
    while wait(0.5) do
        pcall(function()
            for _, v in pairs(workspace.Boats:GetDescendants()) do
                if v:IsA("VehicleSeat") then
                    v.MaxSpeed = _G.Settings.SettingSea["Increase Boat Speed"] and 350 or 150
                end
            end
            for _, v in pairs(workspace.Boats:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = not (_G.Settings.SettingSea["No Clip Rock"] or _G.Settings.SeaEvent["Sail Boat"])
                end
            end
        end)
    end
end)

-- ═══════════════════════════════════════════════
--              STARTUP NOTIFICATION
-- ═══════════════════════════════════════════════
WindUI:Notify({
    Title = "Blox Fruit Hub",
    Content = "Loaded successfully! " .. (World1 and "Sea 1" or World2 and "Sea 2" or World3 and "Sea 3" or "Unknown Sea"),
    Icon = "check",
    Duration = 5
})

print("[BF Hub] GUI loaded successfully!")
