local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/obeseinsect/roblox/main/Ui%20Libraries/Elerium.lua'))()

-- Lock
local V3 = Vector3.new
local V2 = Vector2.new
local inf = math.huge
getgenv().Settings = {
    ["FearLas"] = {
        ["Enabled"] = false,
        ["DOT"] = true,
        ["AIRSHOT"] = true,
        ["Prediction"] = {
            ["Horizontal"] = 0.185,
            ["Vertical"] = 0.1,
        },
        ["CamPrediction"] = {
            ["Prediction"] = {
                ["Horizontal"] = 0.185,
                ["Vertical"] = 0.1,
            },
        },
        ["NOTIF"] = true,
        ["AUTOPRED"] = true,
        ["AdvancedAutoPred"] = true,
        ["FOV"] = inf,
        ["RESOLVER"] = false,
        ["LOCKTYPE"] = "Namecall",
        ["TargetStats"] = false,
        ["Resolver"] = {
              ["Enabled"] = false,
              ["Type"] = "None",
        },
       ["Camera"] = {
        ["Enabled"] = false,
        ["HoodCustomsBypass"] = false,
     },
        ["OnHit"] = {
             ["Enabled"] = true,
             ["Hitchams"] = {
                  ["Enabled"] = false,
                  ["Color"] = Color3.fromRGB(0,0,139),
                  ["Transparency"] = 0,
                  ["Material"] = "ForceField",
             },
            ["Hitsound"] = {
                  ["Enabled"] = false,
                  ["Sound"] = "hitsounds/sparkle.wav",
                  ["Volume"] = 2,
            },
        }
    },
	["Silent"] = {
		["Enabled"] = false,
		["AimPart"] = "HumanoidRootPart",
		["WallCheck"] = false,
		["Visualize"] = false,
		["Prediction"] = {
		   ["Horizontal"] = 0.15,
		   ["Vertical"] = 0.05,
		},
	    ["AutoPrediction"] = {
	        ["Enabled"] = true,
	        ["Type"] = "Normal", --//Normal, Custom
           ["ping20_30"] = 0.12588,
           ["ping30_40"] = 0.11911,
           ["ping40_50"] = 0.12471,
           ["ping50_60"] = 0.13766,
           ["ping60_70"] = 0.13731,
           ["ping70_80"] = 0.13951,
           ["ping80_90"] = 0.14181,
           ["ping90_100"] = 0.148,
           ["ping100_110"] = 0.156,
           ["ping110_120"] = 0.1567,
           ["ping120_130"] = 0.1601,
           ["ping130_140"] = 0.1637,
           ["ping140_150"] = 0.173,
           ["ping150_160"] = 0.1714,
           ["ping160_170"] = 0.1863,
           ["ping170_180"] = 0.1872,
           ["ping180_190"] = 0.1848,
           ["ping190_200"] = 0.1865,
	    },
		["Mode"] = "Namecall", --index,namecal
	},
	["FOV"] = {
		["Enabled"] = false,
		["Size"] = 23,
		["Filled"] = false,
		["Thickness"] = 0.66,
		["Transparency"] = 0.9,
		["Color"] = Color3.fromRGB(255,255,255),
	},
	["Misc"] = {
	    ["NoDelay"] = true,
	    ["AutoReload"] = true,
	    ["AutoAir"] = {
	        ["Enabled"] = true,
	        ["Interval"] = 0.5,
	    },
	    ["CMDS"] = { 
	        ["Enabled"] = false,
	        ["FOVPrefix"] = "B",
	        ["Prediction"] = "A",
	   },
	},
	["Checks"] = { --entirely not
	    ["UnlovkOnKO"] = false,
	    ["TrashTalkOnKO"] = false,
	},
	["Resolution"] = {
	    ["Value"] = 1,
	   },
	["Resolvers"] = {  --entirely not
	    ["Enabled"] = false,
	    ["AutoDetect"] = false,
	    ["Type"] = "Recalculator",
	},
    ["Visuals"] = {
        ["Ambient"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255),
        },
        ["OutDoor Ambient"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255)
        },
        ["Fog Modifications"] = {
            ["Enabled"] = false,
            ["Color"] = Color3.fromRGB(4, 0, 255),
            ["Start"] = 15,
            ["End"] = 100 
        },
        ["ColorCorrection"] = {
            ["Enabled"] = false,
            ["Brightness"] = 0,
            ["Saturation"] = 5,
            ["Contrast"] = 2,
        },
    },
}
getgenv().DistancesMid = 50
getgenv().DistancesClose = 10
getgenv().AimSpeed = 1
getgenv().CAMPREDICTION = 0.185
getgenv().CAMJUMPPREDICTION = 0.1
getgenv().HorizontalSmoothness = 1
getgenv().VerticallSmoothness = 0.5
getgenv().ShakeX = 0
getgenv().ShakeY = 0
getgenv().ShakeZ = 0
getgenv().PREDICTION = 0.185
getgenv().JUMPPREDICTION = 0.1
getgenv().SelectedPart = "HumanoidRootPart" --// LowerTorso, UpperTorso, Head
getgenv().Prediction = "Normal"
getgenv().AutoPredType = "Normal"
getgenv().Resolver = false
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()


function SendNotification(text)
    Notification:Notify(
        {Title = "PROJECTBLOX", Description = "Lock On"..text},
        {OutlineColor = Color3.fromRGB(41, 0, 64),Time = 3, Type = "image"},
        {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(41, 0, 64)}
    )
end
function calculateVelocity(initialPos, finalPos, timeInterval)
    local displacement = finalPos - initialPos
    local velocity = displacement / timeInterval
    return velocity
    end
    game:GetService('RunService').RenderStepped:connect(function(deltaTime)
    if getgenv().Resolver == true and enabled then 
        local character = Plr.Character[getgenv().SelectedPart]
        local lastPosition = character.Position
            task.wait()
        local currentPosition = character.Position
        local velocity = calculateVelocity(lastPosition, currentPosition, deltaTime)
        character.AssemblyLinearVelocity = velocity
        character.Velocity = velocity
            lastPosition = currentPosition
        end
    end)

--// Change Prediction,  AutoPrediction Must Be Off
    local lplr = game.Players.LocalPlayer
    local AnchorCount = 0
    local MaxAnchor = 50
    local CC = game:GetService"Workspace".CurrentCamera
    local Plr;
    local enabled = false
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = getgenv().Settings.FearLas.DOT
        local a = Instance.new("Frame", e)
        if getgenv().Settings.FearLas.DOT == true then
        a.Size = UDim2.new(1, 1, 1, 1)
        else
        a.Size = UDim2.new(0, 0, 0, 0)
        end
        if getgenv().Settings.FearLas.DOT == true then
        a.Transparency = 0
        a.BackgroundTransparency = 0
        else
        a.Transparency = 1
        a.BackgroundTransparency = 1
        end
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        if getgenv().Settings.FearLas.DOT == false then
        g.CornerRadius = UDim.new(1, 1)
        else
        g.CornerRadius = UDim.new(1, 1) 
        end
        return(e)
    end
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(41, 0, 64), 0.3, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
 
 
        spawn(function()
            while wait() do
                if player.Character then
                end
            end
        end)
    end
 
    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end
 
    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)
 
    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        if getgenv().Settings.FearLas.DOT == true then
        placemarker.Size = V3(0, 0, 0)
        else
        placemarker.Size = V3(0, 0, 0)
        end
        placemarker.Transparency = 0.75
        if getgenv().Settings.FearLas.DOT then
        makemarker(placemarker, placemarker, Color3.fromRGB(41, 0, 64), 1, 0)
        end
    end)
 local Tool = Instance.new("Tool")
Tool.RequiresHandle = false
Tool.Name = "Lock Tool"
Tool.Parent = game.Players.LocalPlayer.Backpack
local player = game.Players.LocalPlayer
local function connectCharacterAdded()
    player.CharacterAdded:Connect(onCharacterAdded)
end
connectCharacterAdded()
player.CharacterRemoving:Connect(function()
Tool.Parent = game.Players.LocalPlayer.Backpack
end)
function hitsound()
    local Hit = Instance.new("Sound")
    Hit.Parent = game.SoundService
    Hit.SoundId = getcustomasset(getgenv().Settings.FearLas.OnHit.Hitsound.Sound)
    Hit.Volume = getgenv().Settings.FearLas.OnHit.Hitsound.Volume
    Hit.Looped = false
    Hit:Play()
    Hit.Ended:Connect(function()                                         Hit:Destroy()
        end)
end

Tool.Activated:Connect(function()
if getgenv().Settings.FearLas.Enabled or getgenv().Settings.FearLas.Camera.Enabled then
            if enabled == true then
                enabled = false
                    Plr = LockToPlayer()
                if getgenv().Settings.FearLas.NOTIF == true then 
 SendNotification("Unlocked")
            end
            else
                Plr = LockToPlayer()
                TargetPlayer = tostring(Plr)
                enabled = true
local oldHealt = game.Players[TargetPlayer].Character.Humanoid.Health
                        if getgenv().Settings.FearLas.OnHit.Hitsound.Enabled and Plr ~= nil then

                             game.Players[TargetPlayer].Character.Humanoid.HealthChanged:Connect(function(neHealth)                            
if neHealth < oldHealt then
hitsound()
elseif neHealth > oldHealt then
print("nil")
elseif game.Players[TargetPlayer].Character.Humanoid.Health < 0 then
print("nil")
end
oldHealt = neHealth
end)
end                                      
              
if getgenv().Settings.FearLas.OnHit.Hitchams.Enabled then
   
        if Plr ~= nil then  game.Players[TargetPlayer].Character.Humanoid.HealthChanged:Connect(function(neHealth)
        local Clone = game.Players[TargetPlayer].Character:Clone()
        if neHealth > oldHealt then
            Clone:Destroy()
        end
        if game.Players[TargetPlayer].Character.Humanoid.Health < 0 then
            Clone:Destroy()
        end
        if neHealth < oldHealt then
            -- Main Hit-Chams --
            game.Players[TargetPlayer].Character.Archivable = true
            for _, Obj in next, Clone:GetDescendants() do
                if Obj.Name == "HumanoidRootPart" or Obj:IsA("Humanoid") or Obj:IsA("LocalScript") or Obj:IsA("Script") or Obj:IsA("Decal") then
                    Obj:Destroy()
                elseif Obj:IsA("BasePart") or Obj:IsA("Meshpart") or Obj:IsA("Part") then
                    if Obj.Transparency == 1 then
                        Obj:Destroy()
                    else
                        Obj.CanCollide = false
                        Obj.Anchored = true
                        Obj.Material = getgenv().Settings.FearLas.OnHit.Hitchams.Material
                        Obj.Color = getgenv().Settings.FearLas.OnHit.Hitchams.Color
                        Obj.Transparency = getgenv().Settings.FearLas.OnHit.Hitchams.Transparency
                        Obj.Size = Obj.Size + V3(0.05, 0.05, 0.05)
                    end
                end
           
            end
            Clone.Parent = game.Workspace
            local start = tick()
            local connection
            connection = game:GetService("RunService").Heartbeat:Connect(function()
                if tick() - start >= 3 then
                    connection:Disconnect()
                    Clone:Destroy()
                end
            end)
        end

            oldHealt = neHealth

    end)
    end
end
                if getgenv().Settings.FearLas.NOTIF == true then
SendNotification("Target: "..Plr.Character.Humanoid.DisplayName)
                end
            end
   else
  SendNotification("Cam/Target not enabled!")
        end
    end)
 
local TargetStats = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Picture = Instance.new("ImageLabel")
local Top = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UIGradient_2 = Instance.new("UIGradient")
local HealthBarBackground = Instance.new("Frame")
local UIGradient_3 = Instance.new("UIGradient")
local HealthBar = Instance.new("Frame")
local UIGradient_4 = Instance.new("UIGradient")
local NameOfTarget = Instance.new("TextLabel")

spawn(function()
TargetStats.Name = "TargetStats"
TargetStats.Parent = game.CoreGui
TargetStats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = TargetStats
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.388957828, 0, 0.700122297, 0)
Background.Size = UDim2.new(0, 358, 0, 71)
Background.Visible = false

Picture.Name = "Picture"
Picture.Parent = Background
Picture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Picture.BorderSizePixel = 0
Picture.Position = UDim2.new(0.0279329624, 0, 0.0704225376, 0)
Picture.Size = UDim2.new(0, 59, 0, 59)
Picture.Transparency = 1
Picture.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Top.Name = "Top"
Top.Parent = Background
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(0, 0, -0.101449274, 0)
Top.Size = UDim2.new(0, 358, 0, 7)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(115,0,0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(155,40,0))}
UIGradient.Rotation = 90
UIGradient.Parent = Top

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(52, 52, 52)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient_2.Rotation = 90
UIGradient_2.Parent = Background

HealthBarBackground.Name = "HealthBarBackground"
HealthBarBackground.Parent = Background
HealthBarBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthBarBackground.BorderSizePixel = 0
HealthBarBackground.Position = UDim2.new(0.215083793, 0, 0.348234326, 0)
HealthBarBackground.Size = UDim2.new(0, 270, 0, 19)
HealthBarBackground.Transparency = 1

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))}
UIGradient_3.Rotation = 90
UIGradient_3.Parent = HealthBarBackground

HealthBar.Name = "HealthBar"
HealthBar.Parent = HealthBarBackground
HealthBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthBar.BorderSizePixel = 0
HealthBar.Position = UDim2.new(-0.00336122862, 0, 0.164894029, 0)
HealthBar.Size = UDim2.new(0, 130, 0, 19)

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(184, 159, 227)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 88, 156))}
UIGradient_4.Rotation = 90
UIGradient_4.Parent = HealthBar

NameOfTarget.Name = "NameOfTarget"
NameOfTarget.Parent = Background
NameOfTarget.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NameOfTarget.BackgroundTransparency = 1.000
NameOfTarget.Position = UDim2.new(0.220670387, 0, 0.0704225376, 0)
NameOfTarget.Size = UDim2.new(0, 268, 0, 19)
NameOfTarget.Font = Enum.Font.Code
NameOfTarget.TextColor3 = Color3.fromRGB(255, 255, 255)
NameOfTarget.TextScaled = true
NameOfTarget.TextSize = 14.000
NameOfTarget.TextStrokeTransparency = 0.000
NameOfTarget.TextWrapped = true
end)

local IsAlive = function(GetPlayer)
    return GetPlayer and GetPlayer.Character and GetPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and GetPlayer.Character:FindFirstChild("Humanoid") ~= nil and GetPlayer.Character:FindFirstChild("Head") ~= nil and true or false
end

spawn(function()
    while wait() do
        if getgenv().Settings.FearLas.TargetStats and getgenv().Settings.FearLas.Enabled and enabled then
            if Plr and IsAlive(Plr) then
                Background.Visible = true
                NameOfTarget.Text = tostring(Plr.Character.Humanoid.DisplayName).." ["..tostring(Plr.Name).."]"
                Picture.Image  = "rbxthumb://type=AvatarHeadShot&id=" ..Plr.UserId.. "&w=420&h=420"
                HealthBar:TweenSize(UDim2.new(Plr.Character.Humanoid.Health / Plr.Character.Humanoid.MaxHealth, 0, 1, 0), "In", "Linear", 0.25)
                spawn(function()
                    if getgenv().Settings.FearLas.TargetStats == false then
                        Background.Visible = false
                    end
                end)
            end
        else
            Background.Visible = false
        end
    end
end)
    function LockToPlayer()
        local closestPlayer
        local shortestDistance = getgenv().Settings.FearLas.FOV
 
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (V2(pos.X, pos.Y) - V2(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end
 
local Stats = game:GetService("Stats")

local Piiing = Stats:WaitForChild("Network"):WaitForChild("ServerStatsItem"):WaitForChild("Data Ping")
local function Predict(Velocity)
    return V3(Velocity.X,math.clamp(Velocity.Y*0.5,-5,10),Velocity.Z)
end

local function GetLockPrediction(Part)
    return Part.CFrame + (Predict(Part.Velocity) * getgenv().PREDICTION)
end
local function GetCamPrediction(Part)
    return Part.CFrame + Predict(Part.Velocity) * (getgenv().CAMPREDICTION)
end

    local pingvalue = nil;
    local split = nil;
    local ping = nil;
local LocalHL = Instance.new("Highlight") 
    game:GetService"RunService".Stepped:connect(function()
        if enabled and getgenv(). Settings.FearLas.Enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") or enabled and getgenv(). Settings.FearLas.Camera.Enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
if getgenv().Prediction == "Normal" then
            placemarker.CFrame = CFrame.new(GetLockPrediction(Plr.Character[getgenv().SelectedPart]).Position)         
elseif getgenv().Prediction == "Yun" then
            placemarker.CFrame = CFrame.new(Plr.Character[getgenv().SelectedPart].Position+V3(Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.X*getgenv().PREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Y*getgenv().JUMPPREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Z*getgenv().PREDICTION/10))
end

LocalHL.Parent = Plr.Character
LocalHL.FillTransparency = 0.2
LocalHL.FillColor = Color3.fromRGB(115,0,0)
LocalHL.OutlineColor = Color3.fromRGB(255,255,255)

        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
    
          LocalHL.Parent = nil
        
        end
pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
split = string.split(pingvalue,'(')
ping = tonumber(split[1])

if getgenv().Settings.FearLas.AdvancedAutoPred == true and enabled then
if ping == 5 then
    getgenv().CAMPREDICTION = 0.1030773
elseif ping == 10 then
    getgenv().CAMPREDICTION = 0.1061546
elseif ping == 15 then
    getgenv().CAMPREDICTION = 0.1092319
elseif ping == 20 then
    getgenv().CAMPREDICTION = 0.1123092
elseif ping == 25 then
    getgenv().CAMPREDICTION = 0.1153865
elseif ping == 30 then
    getgenv().CAMPREDICTION = 0.1184638
elseif ping == 35 then
    getgenv().CAMPREDICTION = 0.1215411
elseif ping == 40 then
    getgenv().CAMPREDICTION = 0.1246184
elseif ping == 45 then
    getgenv().CAMPREDICTION = 0.1276957
elseif ping == 50 then
    getgenv().CAMPREDICTION = 0.130773
elseif ping == 55 then
    getgenv().CAMPREDICTION = 0.1338503
elseif ping == 60 then
    getgenv().CAMPREDICTION = 0.1369276
elseif ping == 65 then
    getgenv().CAMPREDICTION = 0.1400049
elseif ping == 70 then
    getgenv().CAMPREDICTION = 0.1430822
elseif ping == 75 then
    getgenv().CAMPREDICTION = 0.1461595
elseif ping == 80 then
    getgenv().CAMPREDICTION = 0.1492368
elseif ping == 85 then
    getgenv().CAMPREDICTION = 0.1523141
elseif ping == 90 then
    getgenv().CAMPREDICTION = 0.1553914
elseif ping == 95 then
    getgenv().CAMPREDICTION = 0.1584687
elseif ping == 100 then
    getgenv().CAMPREDICTION = 0.161546
elseif ping == 105 then
    getgenv().CAMPREDICTION = 0.1646233
elseif ping == 110 then
    getgenv().CAMPREDICTION = 0.1677006
elseif ping == 115 then
    getgenv().CAMPREDICTION = 0.1707779
elseif ping == 120 then
    getgenv().CAMPREDICTION = 0.1738552
elseif ping == 125 then
    getgenv().CAMPREDICTION = 0.1769325
elseif ping == 130 then
    getgenv().CAMPREDICTION = 0.1800098
elseif ping == 135 then
    getgenv().CAMPREDICTION = 0.1830871
elseif ping == 140 then
    getgenv().CAMPREDICTION = 0.1861644
elseif ping == 145 then
    getgenv().CAMPREDICTION = 0.1892417
elseif ping == 150 then
    getgenv().CAMPREDICTION = 0.192319
elseif ping == 155 then
    getgenv().CAMPREDICTION = 0.1953963
elseif ping == 160 then
    getgenv().CAMPREDICTION = 0.1984736
elseif ping == 165 then
    getgenv().CAMPREDICTION = 0.2015509
elseif ping == 170 then
    getgenv().CAMPREDICTION = 0.2046282
elseif ping == 175 then
    getgenv().CAMPREDICTION = 0.2077055
elseif ping == 180 then
    getgenv().CAMPREDICTION = 0.2107828
elseif ping == 185 then
    getgenv().CAMPREDICTION = 0.2138601
elseif ping == 190 then
    getgenv().CAMPREDICTION = 0.2169374
elseif ping == 195 then
    getgenv().CAMPREDICTION = 0.2200147
elseif ping == 200 then
    getgenv().CAMPREDICTION = 0.223092
elseif ping == 205 then
    getgenv().CAMPREDICTION = 0.2261693
elseif ping == 210 then
    getgenv().CAMPREDICTION = 0.2292466
elseif ping == 215 then
    getgenv().CAMPREDICTION = 0.2323239
elseif ping == 220 then
    getgenv().CAMPREDICTION = 0.2354012
elseif ping == 225 then
    getgenv().CAMPREDICTION = 0.2384785
elseif ping == 230 then
    getgenv().CAMPREDICTION = 0.2415558
elseif ping == 235 then
    getgenv().CAMPREDICTION = 0.2446331
elseif ping == 240 then
    getgenv().CAMPREDICTION = 0.2477104
elseif ping == 245 then
    getgenv().CAMPREDICTION = 0.2507877
elseif ping == 250 then
    getgenv().CAMPREDICTION = 0.253865
elseif ping == 255 then
    getgenv().CAMPREDICTION = 0.2569423
elseif ping == 260 then
    getgenv().CAMPREDICTION = 0.2600196
elseif ping == 265 then
    getgenv().CAMPREDICTION = 0.2630969
elseif ping == 270 then
    getgenv().CAMPREDICTION = 0.2661742
elseif ping == 275 then
    getgenv().CAMPREDICTION = 0.2692515
elseif ping == 280 then
    getgenv().CAMPREDICTION = 0.2723288
elseif ping == 285 then
    getgenv().CAMPREDICTION = 0.2754061
elseif ping == 290 then
    getgenv().CAMPREDICTION = 0.2784834
elseif ping == 295 then
    getgenv().CAMPREDICTION = 0.2815607
elseif ping == 300 then
    getgenv().CAMPREDICTION = 0.284638
elseif ping == 305 then
    getgenv().CAMPREDICTION = 0.2877153
elseif ping == 310 then
    getgenv().CAMPREDICTION = 0.2907926
elseif ping == 315 then
    getgenv().CAMPREDICTION = 0.2938699
elseif ping == 320 then
    getgenv().CAMPREDICTION = 0.2969472
elseif ping == 325 then
    getgenv().CAMPREDICTION = 0.3000245
elseif ping == 330 then
    getgenv().CAMPREDICTION = 0.3031018
elseif ping == 335 then
    getgenv().CAMPREDICTION = 0.3061791
elseif ping == 340 then
    getgenv().CAMPREDICTION = 0.3092564
elseif ping == 345 then
    getgenv().CAMPREDICTION = 0.3123337
elseif ping == 350 then
    getgenv().CAMPREDICTION = 0.315411
elseif ping == 355 then
    getgenv().CAMPREDICTION = 0.3184883
elseif ping == 360 then
    getgenv().CAMPREDICTION = 0.3215656
elseif ping == 365 then
    getgenv().CAMPREDICTION = 0.3246429
elseif ping == 370 then
    getgenv().CAMPREDICTION = 0.3277202
elseif ping == 375 then
    getgenv().CAMPREDICTION = 0.3307975
elseif ping == 380 then
    getgenv().CAMPREDICTION = 0.3338748
elseif ping == 385 then
    getgenv().CAMPREDICTION = 0.3369521
elseif ping == 390 then
    getgenv().CAMPREDICTION = 0.3400294
elseif ping == 395 then
    getgenv().CAMPREDICTION = 0.3431067
elseif ping == 400 then
    getgenv().CAMPREDICTION = 0.346184
elseif ping == 405 then
    getgenv().CAMPREDICTION = 0.3492613
elseif ping == 410 then
    getgenv().CAMPREDICTION = 0.3523386
elseif ping == 415 then
    getgenv().CAMPREDICTION = 0.3554159
elseif ping == 420 then
    getgenv().CAMPREDICTION = 0.3584932
elseif ping == 425 then
    getgenv().CAMPREDICTION = 0.3615705
elseif ping == 430 then
    getgenv().CAMPREDICTION = 0.3646478
elseif ping == 435 then
    getgenv().CAMPREDICTION = 0.3677251
elseif ping == 440 then
    getgenv().CAMPREDICTION = 0.3708024
elseif ping == 445 then
    getgenv().CAMPREDICTION = 0.3738797
elseif ping == 450 then
    getgenv().CAMPREDICTION = 0.376957
elseif ping == 455 then
    getgenv().CAMPREDICTION = 0.3800343
elseif ping == 460 then
    getgenv().CAMPREDICTION = 0.3831116
elseif ping == 465 then
    getgenv().CAMPREDICTION = 0.3861889
elseif ping == 470 then
    getgenv().CAMPREDICTION = 0.3892662
elseif ping == 475 then
    getgenv().CAMPREDICTION = 0.3923435
elseif ping == 480 then
    getgenv().CAMPREDICTION = 0.3954208
elseif ping == 485 then
    getgenv().CAMPREDICTION = 0.3984981
elseif ping == 490 then
    getgenv().CAMPREDICTION = 0.4015754
elseif ping == 495 then
    getgenv().CAMPREDICTION = 0.4046527
elseif ping == 500 then
    getgenv().CAMPREDICTION = 0.40773
end
if getgenv().Settings.FearLas.AUTOPRED == true then
if getgenv().AutoPredType == "Normal" then
if getgenv().Prediction == "Normal" then
getgenv().JUMPPREDICTION = tostring(ping/1500)
if ping <200 then
        getgenv().PREDICTION = 0.2198343243234332
    elseif ping < 170 then
        getgenv().PREDICTION = 0.2165713
    elseif ping < 160 then
        getgenv().PREDICTION = 0.16242
    elseif ping < 150 then
        getgenv().PREDICTION = 0.158041
    elseif ping < 140 then
        getgenv().PREDICTION = 0.155313
    elseif ping < 130 then
        getgenv().PREDICTION = 0.152692
    elseif ping < 120 then
        getgenv().PREDICTION = 0.153017
    elseif ping < 110 then
        getgenv().PREDICTION = 0.15165
    elseif ping < 100 then
  getgenv().PREDICTION = 0.1483987
 elseif ping < 80 then
  getgenv().PREDICTION = 0.1451340
 elseif ping < 70 then
  getgenv().PREDICTION = 0.143633
 elseif ping < 65 then
  getgenv().PREDICTION = 0.1374236
 elseif ping < 50 then
  getgenv().PREDICTION = 0.13644
 elseif ping < 30 then
  getgenv().PREDICTION = 0.12452476
end
end
elseif getgenv().AutoPredType == "Beta AutoPred" then
    if getgenv().Prediction == "Normal" then
    getgenv().JUMPPREDICTION = tostring(ping/1500)
    if ping <200 then
        getgenv().PREDICTION = 0.1973432432343325
    elseif ping < 150 then
        getgenv().PREDICTION = 0.1922
    elseif ping < 90 then
        getgenv().PREDICTION = 0.176
    elseif ping < 80 then
        getgenv().PREDICTION = 0.169
    elseif ping < 70 then
        getgenv().PREDICTION = 0.1355
    elseif ping < 50 then
        getgenv().PREDICTION = 0.125
    elseif ping < 40 then
        getgenv().PREDICTION = 0.12
    elseif ping < 30 then
        getgenv().PREDICTION = 0.12
    end
end
elseif getgenv().AutoPredType == "Old Azure" then
if getgenv().Prediction == "Normal" then
 getgenv().JUMPPREDICTION = tostring(ping/1500)
   if ping < 360 then
  getgenv().PREDICTION = 0.16537
  elseif ping < 270 then
     getgenv().PREDICTION = 0.195566
     elseif ping < 260 then
         getgenv().PREDICTION = 0.175566
      elseif ping < 250 then
         getgenv().PREDICTION = 0.1651
              elseif ping < 240 then
           getgenv().PREDICTION = 0.16780
                elseif ping < 230 then
                    getgenv().PREDICTION = 0.15692
                elseif ping < 220 then
                    getgenv().PREDICTION = 0.165566
                elseif ping < 210 then
                    getgenv().PREDICTION = 0.16780
                elseif ping < 200 then
                    getgenv().PREDICTION = 0.165566
                elseif ping < 190 then
                    getgenv().PREDICTION = 0.166547
                elseif ping < 180 then
                    getgenv().PREDICTION = 0.19284
                elseif ping < 170 then
                    getgenv().PREDICTION = 0.1923111 
                elseif ping < 160 then
                    getgenv().PREDICTION = 0.16
                elseif ping < 150 then
                    getgenv().PREDICTION = 0.15
                elseif ping < 140 then
                    getgenv().PREDICTION = 0.1223333
                elseif ping < 130 then
                    getgenv().PREDICTION = 0.156692
                elseif ping < 120 then
                    getgenv().PREDICTION = 0.143765
                elseif ping < 110 then
                    getgenv().PREDICTION = 0.1455
                elseif ping < 100 then
                    getgenv().PREDICTION = 0.130340
                elseif ping < 90 then
                    getgenv().PREDICTION = 0.136
                elseif ping < 80 then
                    getgenv().PREDICTION = 0.1347
                elseif ping < 70 then
                    getgenv().PREDICTION = 0.119
                elseif ping < 60 then
                    getgenv().PREDICTION = 0.12731
                elseif ping < 50 then
                    getgenv().PREDICTION = 0.127668
                elseif ping < 40 then
                    getgenv().PREDICTION = 0.125
                elseif ping < 30 then
                    getgenv().PREDICTION = 0.11
                elseif ping < 20 then
                    getgenv().PREDICTION = 0.12588
                elseif ping < 10 then
                    getgenv().PREDICTION = 0.09
                end
end
elseif getgenv().AutoPredType == "Fake Celex" then
    if getgenv().Prediction == "Normal" then
        getgenv().JUMPPREDICTION = tostring(ping/1500)
                if ping > 190 then
                    getgenv().PREDICTION = 0.206547
                elseif ping > 180 then
                    getgenv().PREDICTION = 0.19284
                elseif ping > 170 then
                    getgenv().PREDICTION = 0.1923111
                elseif ping > 160 then
                    getgenv().PREDICTION = 0.1823111
                elseif ping > 150 then
                    getgenv().PREDICTION = 0.171
                elseif ping > 140 then
                    getgenv().PREDICTION = 0.165773
                elseif ping > 130 then
                    getgenv().PREDICTION = 0.14333322
                elseif ping > 120 then
                    getgenv().PREDICTION = 0.143765
                elseif ping > 110 then
                    getgenv().PREDICTION = 0.1455
                elseif ping > 100 then
                    getgenv().PREDICTION = 0.143987
                elseif ping > 90 then
                    getgenv().PREDICTION = 0.14215
                elseif ping > 80 then
                    getgenv().PREDICTION = 0.141340
                elseif ping > 70 then
                    getgenv().PREDICTION = 0.13633
                elseif ping > 60 then
                    getgenv().PREDICTION = 0.12731
                elseif ping > 50 then
                    getgenv().PREDICTION = 0.127668
                elseif ping > 40 then
                    getgenv().PREDICTION = 0.125
                elseif ping > 30 then
                    getgenv().PREDICTION = 0.1261
                elseif ping > 20 then
                    getgenv().PREDICTION = 0.12588
                elseif ping > 10 then
                    getgenv().PREDICTION = 0.09
                end
    end

end
end

if getgenv().Settings.FearLas.Resolver.Enabled then
if getgenv().Settings.FearLas.Resolver.Type == "Delta Time" then
print("wsg")
end
if getgenv().Settings.FearLas.Resolver.Type == "Recalculator" then
print("wsg")
end
if getgenv().Settings.FearLas.Resolver.Type == "No Y Velocity" then
print("wsg")
end
end
    end)


game:GetService"RunService".Stepped:connect(function()
    if enabled and getgenv().Settings.FearLas.Camera.Enabled then
        if Plr ~= nil then
            local shakeOffset = V3(
                math.random(-getgenv().ShakeX, getgenv().ShakeX),
                math.random(-getgenv().ShakeY, getgenv().ShakeY),
                math.random(-getgenv().ShakeZ, getgenv().ShakeZ)
            ) * 0.1
local HorizontalLookPosition = CFrame.new(CC.CFrame.p, GetCamPrediction(Plr.Character[getgenv().SelectedPart]).Position+shakeOffset)
      CC.CFrame = CC.CFrame:Lerp(HorizontalLookPosition, getgenv().HorizontalSmoothness)
    end
end
end)

    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(...)
        local args = {...}
        local vap = {"UpdateMousePos", "GetMousePos", "MousePos", "MOUSE", "MousePosUpdate"}
        if enabled and getnamecallmethod() == "FireServer" and table.find(vap, args[2]) and getgenv().Settings.FearLas.Enabled and Plr.Character ~= nil and getgenv().Settings.FearLas.LOCKTYPE == "Namecall" then
            if getgenv().Prediction == "Normal" then
            args[3] = GetLockPrediction(Plr.Character[getgenv().SelectedPart]).Position
            elseif getgenv().Prediction == "Yun" then
            args[3] = Plr.Character[getgenv().SelectedPart].Position+V3(Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.X*getgenv().PREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Y*getgenv().JUMPPREDICTION/10,Plr.Character.HumanoidRootPart.AssemblyLinearVelocity.Z*getgenv().PREDICTION/10)
            else
 
            args[3] = Plr.Character[SelectedPart].Position
 
            end
 
            return old(unpack(args))
        end
        return old(...)
    end)

local Hooks = {}
local Client = game.Players.LocalPlayer

Hooks[1] = hookmetamethod(Client:GetMouse(), "__index", newcclosure(function(self, index)
    if index == "Hit" and getgenv().Settings.FearLas.LOCKTYPE == "Index" and enabled and Plr.Character ~= nil and getgenv().Settings.FearLas.Enabled then
            local position = CFrame.new(GetLockPrediction(Plr.Character[getgenv().SelectedPart]).Position)
            return position
        
    end
    return Hooks[1](self, index)
end))

getgenv().CFrameDesync = {
           Enabled = false,
           AnglesEnabled = false,
           Type = "Random",
           Visualize = false,
           VisualizeColor = Color3.fromRGB(255,255,255),
           Random = {
               X = 5,
               Y = 5,
               Z = 5,
               AnglesX = 5,
               AnglesY = 5,
               AnglesZ = 5,
               },
           Custom = {
               X = 5,
               Y = 5,
               Z = 5,
               AnglesX = 5,
               AnglesY = 5,
               AnglesZ = 5,
               },
     TargetStrafe = {
               Speed = 10,
               Height = 10,
               Distance = 7,
               },
}

local straight = {
         Visuals = {},
         Desync = {},
         Hooks = {},
         Connections = {}
}



local RunService = game:GetService("RunService")


task.spawn(function()
straight.Visuals["R6Dummy"] = game:GetObjects("rbxassetid://9474737816")[1]; straight.Visuals["R6Dummy"].Head.Face:Destroy(); for i, v in pairs(straight.Visuals["R6Dummy"]:GetChildren()) do v.Transparency = v.Name == "HumanoidRootPart" and 1 or 0.70; v.Material = "Neon"; v.Color = Color3.fromRGB(255, 255, 255); v.CanCollide = false; v.Anchored = false end
end)

local Utility = {}

do --// Utility Functions
    function Utility:Connection(connectionType, connectionCallback)
        local connection = connectionType:Connect(connectionCallback)
        straight.Connections[#straight.Connections + 1] = connection
        return connection
    end
end

Utility:Connection(RunService.PostSimulation, function()
if getgenv().CFrameDesync.AnglesEnabled or getgenv().CFrameDesync.Enabled then
        straight.Desync[1] = lplr.Character.HumanoidRootPart.CFrame
        local cframe = lplr.Character.HumanoidRootPart.CFrame
        if getgenv().CFrameDesync.Enabled then
            if getgenv().CFrameDesync.Type == "Random" then
                cframe = cframe * CFrame.new(math.random(-getgenv().CFrameDesync.Random.X, getgenv().CFrameDesync.Random.X), math.random(-getgenv().CFrameDesync.Random.Y, getgenv().CFrameDesync.Random.Y), math.random(-getgenv().CFrameDesync.Random.Z, getgenv().CFrameDesync.Random.Z))
            elseif getgenv().CFrameDesync.Type == "Custom" then
                cframe = cframe * CFrame.new(getgenv().CFrameDesync.Custom.X, getgenv().CFrameDesync.Custom.Y, getgenv().CFrameDesync.Custom.Z)
            elseif getgenv().CFrameDesync.Type == "Mouse" then
                cframe = CFrame.new(lplr:GetMouse().Hit.Position)
            elseif getgenv().CFrameDesync.Type == "Target Strafe" then
            if enabled and Plr ~= nil then
                local currentTime = tick() 
                cframe = CFrame.new(Plr.Character[getgenv().SelectedPart].Position) * CFrame.Angles(0, 2 * math.pi * currentTime * getgenv().CFrameDesync.TargetStrafe.Speed % (2 * math.pi), 0) * CFrame.new(0, getgenv().CFrameDesync.TargetStrafe.Height, getgenv().CFrameDesync.TargetStrafe.Distance)
            elseif getgenv.CFrameDesync.Type == "Local Strafe" then
                local currentTime = tick() 
                cframe = CFrame.new(lplr.Character.HumanoidRootPart.Position) * CFrame.Angles(0, 2 * math.pi * currentTime * getgenv.CFrameDesync.TargetStrafe.Speed % (2 * math.pi), 0) * CFrame.new(0, getgenv.CFrameDesync.TargetStrafe.Height, getgenv().CFrameDesync.TargetStrafe.Distance)
                end
        end

        if getgenv().CFrameDesync.Visualize then
            straight.Visuals["R6Dummy"].Parent = workspace
            straight.Visuals["R6Dummy"].HumanoidRootPart.Velocity = Vector3.new()
            straight.Visuals["R6Dummy"]:SetPrimaryPartCFrame(cframe)
            for i, v in pairs(straight.Visuals["R6Dummy"]:GetChildren()) do v.Transparency = v.Name == "HumanoidRootPart" and 1 or 0.70; v.Material = "Neon"; v.Color = getgenv().CFrameDesync.VisualizeColor; v.CanCollide = false; v.Anchored = false end
        else
            straight.Visuals["R6Dummy"].Parent = nil
        end

        if getgenv().CFrameDesync.AnglesEnabled then
            if getgenv().CFrameDesync.Type == "Random" then
                cframe = cframe * CFrame.Angles(math.rad(math.random(getgenv().CFrameDesync.Random.AnglesX)), math.rad(math.random(getgenv().CFrameDesync.Random.AnglesY)), math.rad(math.random(getgenv().CFrameDesync.Random.AnglesZ)))
            elseif getgenv().CFrameDesync.Type == "Custom" then
                cframe = cframe * CFrame.Angles(math.rad(getgenv().CFrameDesync.Custom.AnglesX), math.rad(getgenv().CFrameDesync.Custom.AnglesY), math.rad(getgenv().CFrameDesync.Custom.AnglesZ))
            end
        end
        lplr.Character.HumanoidRootPart.CFrame = cframe
        RunService.RenderStepped:Wait()
        lplr.Character.HumanoidRootPart.CFrame = straight.Desync[1]
    else
        if straight.Visuals["R6Dummy"].Parent ~= nil then
            straight.Visuals["R6Dummy"].Parent = nil
        end
    end
end
end)

--// Hooks
local MainHookingFunctionsTick = tick()
--
straight.Hooks[1] = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if not checkcaller() then
        if key == "CFrame" and straight.Desync[1] and (getgenv().CFrameDesync.AnglesEnabled or getgenv().CFrameDesync.Enabled) and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Humanoid") and lplr.Character:FindFirstChild("Humanoid").Health > 0 then
            if self == lplr.Character.HumanoidRootPart then
                return straight.Desync[1] or CFrame.new()
            elseif self == lplr.Character.Head then
                return straight.Desync[1] and straight.Desync[1] + Vector3.new(0, lplr.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
            end
        end
    end
    return straight.Hooks[1](self, key)
end))

 for _, key in next, getgc(true) do 
        local function updateKey(instanceType)
            if pcall(function() return rawget(key, instanceType) end) and typeof(rawget(key, instanceType)) == 'table' and (rawget(key, instanceType))[1] == 'kick' then
                key.tvk = {
                    'kick',
                    function() 
                        return game.Workspace:WaitForChild('')
                    end
                }
            end
        end
        updateKey('indexInstance')
        updateKey('namecallInstance')
    end
do
local window = library:AddWindow("project|gg./XPyxkFnV|blox", {
    main_color = Color3.fromRGB(41, 0, 64), -- Color
    min_size = Vector2.new(450, 400), -- Size of the gui
    can_resize = true, -- true or false
})
local misc = window:AddTab("Main") -- Name of tab
misc:Show() -- shows the tab

local switch = misc:AddSwitch("Camlock", function(bool)
    getgenv().Settings.FearLas.Camera.Enabled = bool
end)
Lenabled:Set(false)

misc:AddTextBox("Prediction", function(text)
    getgenv().CAMPREDICTION = text
end, 
{
    ["clear"] = false, -- Default: true (options are optional)
})

local switch = misc:AddSwitch("Auto Prediction", function(bool)
    getgenv().Settings.FearLas.AdvancedAutoPred = bool
end)
thingsetup:Set(false)

local Dropdown = misc:AddDropdown("Aim Bone", function(text)
    if text == "HumanoidRootPart" then
        getgenv().SelectedPart = "HumanoidRootPart"
    elseif text == "UpperTorso" then
        getgenv().SelectedPart = "UpperTorso"
    elseif text == "LowerTorso" then
        getgenv().SelectedPart = "LowerTorso"
    elseif text == "Head" then
        getgenv().SelectedPart = "Head"
    end
end)

Dropdown:Add("HumanoidRootPart")
Dropdown:Add("UpperTorso")
Dropdown:Add("LowerTorso")
Dropdown:Add("Head")


misc:AddButton("copy dsc link",function()
    setclipboard("gg./XPyxkFnV")
end)