-- Project Hub | Aladia PVP

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Aladia PVP",
   LoadingTitle = "Loading..",
   LoadingSubtitle = "by Project Hub",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AladiaPVP",
      FileName = "ProjectHub"
   }
})

local player = game.Players.LocalPlayer
local hum = player.Character:WaitForChild("Humanoid")
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

--// Main Tab
local MainTab = Window:CreateTab("Main", 4483362458) 

-- Speed Hack (Bypassed)
local speedEnabled = false
local speedValue = 16

MainTab:CreateSlider({
   Name = "Speed Value",
   Range = {16,120},
   Increment = 1,
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
       speedValue = Value
   end,
})

MainTab:CreateToggle({
   Name = "Enable Speed Hack",
   CurrentValue = false,
   Flag = "SpeedHack",
   Callback = function(Value)
       speedEnabled = Value
   end,
})

RunService.Heartbeat:Connect(function()
    if speedEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local HRP = player.Character.HumanoidRootPart
        local moveDir = hum.MoveDirection
        if moveDir.Magnitude > 0 then
            HRP.CFrame = HRP.CFrame + (moveDir * (speedValue/50))
        end
    end
end)

-- Infinite Jump
local InfiniteJumpEnabled = false
MainTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value)
       InfiniteJumpEnabled = Value
   end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
   if InfiniteJumpEnabled then
       player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
   end
end)

--// Aim & Visuals Tab
local AimTab = Window:CreateTab("Aim / Visuals", 4483362458)

-- ESP
local espEnabled = false
local function createESP(character)
    if character:FindFirstChild("HumanoidRootPart") and not character:FindFirstChild("ESP") then
        local Billboard = Instance.new("BillboardGui", character)
        Billboard.Name = "ESP"
        Billboard.Size = UDim2.new(0,200,0,50)
        Billboard.AlwaysOnTop = true
        Billboard.Adornee = character.HumanoidRootPart

        local Name = Instance.new("TextLabel", Billboard)
        Name.Size = UDim2.new(1,0,1,0)
        Name.Text = character.Name
        Name.TextColor3 = Color3.fromRGB(255,0,0)
        Name.BackgroundTransparency = 1
    end
end

AimTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "ESP",
    Callback = function(Value)
        espEnabled = Value
        if espEnabled then
            for _,plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    createESP(plr.Character)
                end
            end
            game.Players.PlayerAdded:Connect(function(plr)
                plr.CharacterAdded:Connect(function(char)
                    wait(1)
                    if espEnabled then
                        createESP(char)
                    end
                end)
            end)
        else
            for _,v in pairs(workspace:GetDescendants()) do
                if v.Name == "ESP" then v:Destroy() end
            end
        end
    end
})

-- Tracers
local Lines = {}
local tracerEnabled = false

local function DrawTracer(plr)
    local Line = Drawing.new("Line")
    Line.Color = Color3.fromRGB(0,255,0)
    Line.Thickness = 1
    Line.Transparency = 1
    Lines[plr] = Line
end

AimTab:CreateToggle({
    Name = "Tracer Lines",
    CurrentValue = false,
    Flag = "Tracer",
    Callback = function(Value)
        tracerEnabled = Value
        if not tracerEnabled then
            for _,line in pairs(Lines) do
                line:Remove()
            end
            Lines = {}
        else
            for _,plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player then
                    DrawTracer(plr)
                end
            end
        end
    end
})

RunService.RenderStepped:Connect(function()
    if tracerEnabled then
        for plr,line in pairs(Lines) do
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local Vector, OnScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if OnScreen then
                    line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                    line.To = Vector2.new(Vector.X, Vector.Y)
                    line.Visible = true
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end
        end
    end
end)

-- Aimlock (closest to crosshair)
local aimlockEnabled = false

AimTab:CreateToggle({
    Name = "Aimlock",
    CurrentValue = false,
    Flag = "Aimlock",
    Callback = function(Value)
        aimlockEnabled = Value
    end
})

RunService.RenderStepped:Connect(function()
    if aimlockEnabled then
        local closestPlayer = nil
        local shortestDist = math.huge
        local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

        for _,plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
                local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        closestPlayer = plr
                    end
                end
            end
        end

        if closestPlayer then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestPlayer.Character.Head.Position)
        end
    end
end)