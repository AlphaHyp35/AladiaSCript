--[[ 
  🔐 RineHub Premium Script
  Author: AlphaHyp35
  GitHub: https://github.com/AlphaHyp35/RineHub
  Features: Key System, Rayfield UI, ESP, Aimbot, Silent Aim, Tracer, WallHack, Speed Hack, Auto Kill, Cash Dupe
]]

-- Rayfield UI Loader
loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Custom Key System
local validKey = "ALPHA-VIP-ACCESS"

local function validateKey()
    local userKey = tostring(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("KeyPrompt") or "")
    return userKey == validKey
end

Rayfield:Notify({
    Title = "RineHub Key Check",
    Content = "Enter key to unlock features: ALPHA-VIP-ACCESS",
    Duration = 7,
    Actions = {
        Ignore = {
            Name = "Enter Key",
            Callback = function()
                local userInput = Rayfield:Prompt({
                    Title = "RineHub",
                    Text = "Enter your access key:",
                    PlaceholderText = "e.g. ALPHA-VIP-ACCESS",
                    ConfirmText = "Submit"
                })
                if userInput == validKey then
                    Rayfield:Notify({Title = "Access Granted", Content = "Welcome to RineHub!", Duration = 5})
                    loadFeatures()
                else
                    Rayfield:Notify({Title = "Access Denied", Content = "Invalid key!", Duration = 5})
                end
            end
        }
    }
})

function loadFeatures()
    local Window = Rayfield:CreateWindow({
        Name = "RineHub | Aladia PVP",
        LoadingTitle = "Loading Premium Features...",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "RineHub",
            FileName = "AladiaPVP"
        }
    })

    local MainTab = Window:CreateTab("⚙️ Main Features", 4483362458)

    -- Silent Aim (basic example)
    MainTab:CreateToggle({
        Name = "🎯 Silent Aim",
        CurrentValue = false,
        Callback = function(val)
            getgenv().SilentAimEnabled = val
        end
    })

    -- ESP
    MainTab:CreateToggle({
        Name = "👁️ ESP",
        CurrentValue = false,
        Callback = function(state)
            if state then
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local esp = Instance.new("BillboardGui", player.Character.Head)
                        esp.Size = UDim2.new(0, 100, 0, 40)
                        esp.AlwaysOnTop = true
                        esp.Name = "ESP"
                        local label = Instance.new("TextLabel", esp)
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.Text = player.Name
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(1, 0, 0)
                    end
                end
            else
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character:FindFirstChild("Head"):FindFirstChild("ESP") then
                        player.Character.Head.ESP:Destroy()
                    end
                end
            end
        end
    })

    -- Tracer Lines
    MainTab:CreateToggle({
        Name = "📍 Tracer Lines",
        CurrentValue = false,
        Callback = function(state)
            -- Your tracer drawing logic here
        end
    })

    -- WallHack (basic transparency method)
    MainTab:CreateToggle({
        Name = "🧱 WallHack",
        CurrentValue = false,
        Callback = function(state)
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency < 0.8 then
                    v.LocalTransparencyModifier = state and 0.5 or 0
                end
            end
        end
    })

    -- Auto Kill (teleport to enemy)
    MainTab:CreateToggle({
        Name = "⚔️ Auto Kill",
        CurrentValue = false,
        Callback = function(state)
            while state do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
                        wait(0.5)
                    end
                end
            end
        end
    })

    -- Speed Hack
    MainTab:CreateSlider({
        Name = "🚀 Speed Hack",
        Range = {16, 100},
        Increment = 1,
        CurrentValue = 16,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    })

    -- Cash Duper (game-dependent, placeholder logic)
    MainTab:CreateButton({
        Name = "💸 Cash Dupe (if supported)",
        Callback = function()
            local cash = game.Players.LocalPlayer.leaderstats:FindFirstChild("Cash")
            if cash then
                cash.Value = cash.Value + 999999
            else
                Rayfield:Notify({Title = "Error", Content = "Game not supported or cash system is visual.", Duration = 4})
            end
        end
    })
end--[[ 
  🔐 RineHub Premium Script
  Author: AlphaHyp35
  GitHub: https://github.com/AlphaHyp35/RineHub
  Features: Key System, Rayfield UI, ESP, Aimbot, Silent Aim, Tracer, WallHack, Speed Hack, Auto Kill, Cash Dupe
]]

-- Rayfield UI Loader
loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Custom Key System
local validKey = "ALPHA-VIP-ACCESS"

local function validateKey()
    local userKey = tostring(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("KeyPrompt") or "")
    return userKey == validKey
end

Rayfield:Notify({
    Title = "RineHub Key Check",
    Content = "Enter key to unlock features: ALPHA-VIP-ACCESS",
    Duration = 7,
    Actions = {
        Ignore = {
            Name = "Enter Key",
            Callback = function()
                local userInput = Rayfield:Prompt({
                    Title = "RineHub",
                    Text = "Enter your access key:",
                    PlaceholderText = "e.g. ALPHA-VIP-ACCESS",
                    ConfirmText = "Submit"
                })
                if userInput == validKey then
                    Rayfield:Notify({Title = "Access Granted", Content = "Welcome to RineHub!", Duration = 5})
                    loadFeatures()
                else
                    Rayfield:Notify({Title = "Access Denied", Content = "Invalid key!", Duration = 5})
                end
            end
        }
    }
})

function loadFeatures()
    local Window = Rayfield:CreateWindow({
        Name = "RineHub | Aladia PVP",
        LoadingTitle = "Loading Premium Features...",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "RineHub",
            FileName = "AladiaPVP"
        }
    })

    local MainTab = Window:CreateTab("⚙️ Main Features", 4483362458)

    -- Silent Aim (basic example)
    MainTab:CreateToggle({
        Name = "🎯 Silent Aim",
        CurrentValue = false,
        Callback = function(val)
            getgenv().SilentAimEnabled = val
        end
    })

    -- ESP
    MainTab:CreateToggle({
        Name = "👁️ ESP",
        CurrentValue = false,
        Callback = function(state)
            if state then
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local esp = Instance.new("BillboardGui", player.Character.Head)
                        esp.Size = UDim2.new(0, 100, 0, 40)
                        esp.AlwaysOnTop = true
                        esp.Name = "ESP"
                        local label = Instance.new("TextLabel", esp)
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.Text = player.Name
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(1, 0, 0)
                    end
                end
            else
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character:FindFirstChild("Head"):FindFirstChild("ESP") then
                        player.Character.Head.ESP:Destroy()
                    end
                end
            end
        end
    })

    -- Tracer Lines
    MainTab:CreateToggle({
        Name = "📍 Tracer Lines",
        CurrentValue = false,
        Callback = function(state)
            -- Your tracer drawing logic here
        end
    })

    -- WallHack (basic transparency method)
    MainTab:CreateToggle({
        Name = "🧱 WallHack",
        CurrentValue = false,
        Callback = function(state)
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency < 0.8 then
                    v.LocalTransparencyModifier = state and 0.5 or 0
                end
            end
        end
    })

    -- Auto Kill (teleport to enemy)
    MainTab:CreateToggle({
        Name = "⚔️ Auto Kill",
        CurrentValue = false,
        Callback = function(state)
            while state do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
                        wait(0.5)
                    end
                end
            end
        end
    })

    -- Speed Hack
    MainTab:CreateSlider({
        Name = "🚀 Speed Hack",
        Range = {16, 100},
        Increment = 1,
        CurrentValue = 16,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    })

    -- Cash Duper (game-dependent, placeholder logic)
    MainTab:CreateButton({
        Name = "💸 Cash Dupe (if supported)",
        Callback = function()
            local cash = game.Players.LocalPlayer.leaderstats:FindFirstChild("Cash")
            if cash then
                cash.Value = cash.Value + 999999
            else
                Rayfield:Notify({Title = "Error", Content = "Game not supported or cash system is visual.", Duration = 4})
            end
        end
    })
end--[[ 
  🔐 RineHub Premium Script
  Author: AlphaHyp35
  GitHub: https://github.com/AlphaHyp35/RineHub
  Features: Key System, Rayfield UI, ESP, Aimbot, Silent Aim, Tracer, WallHack, Speed Hack, Auto Kill, Cash Dupe
]]

-- Rayfield UI Loader
loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Custom Key System
local validKey = "ALPHA-VIP-ACCESS"

local function validateKey()
    local userKey = tostring(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("KeyPrompt") or "")
    return userKey == validKey
end

Rayfield:Notify({
    Title = "RineHub Key Check",
    Content = "Enter key to unlock features: ALPHA-VIP-ACCESS",
    Duration = 7,
    Actions = {
        Ignore = {
            Name = "Enter Key",
            Callback = function()
                local userInput = Rayfield:Prompt({
                    Title = "RineHub",
                    Text = "Enter your access key:",
                    PlaceholderText = "e.g. ALPHA-VIP-ACCESS",
                    ConfirmText = "Submit"
                })
                if userInput == validKey then
                    Rayfield:Notify({Title = "Access Granted", Content = "Welcome to RineHub!", Duration = 5})
                    loadFeatures()
                else
                    Rayfield:Notify({Title = "Access Denied", Content = "Invalid key!", Duration = 5})
                end
            end
        }
    }
})

function loadFeatures()
    local Window = Rayfield:CreateWindow({
        Name = "RineHub | Aladia PVP",
        LoadingTitle = "Loading Premium Features...",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "RineHub",
            FileName = "AladiaPVP"
        }
    })

    local MainTab = Window:CreateTab("⚙️ Main Features", 4483362458)

    -- Silent Aim (basic example)
    MainTab:CreateToggle({
        Name = "🎯 Silent Aim",
        CurrentValue = false,
        Callback = function(val)
            getgenv().SilentAimEnabled = val
        end
    })

    -- ESP
    MainTab:CreateToggle({
        Name = "👁️ ESP",
        CurrentValue = false,
        Callback = function(state)
            if state then
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local esp = Instance.new("BillboardGui", player.Character.Head)
                        esp.Size = UDim2.new(0, 100, 0, 40)
                        esp.AlwaysOnTop = true
                        esp.Name = "ESP"
                        local label = Instance.new("TextLabel", esp)
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.Text = player.Name
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(1, 0, 0)
                    end
                end
            else
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character:FindFirstChild("Head"):FindFirstChild("ESP") then
                        player.Character.Head.ESP:Destroy()
                    end
                end
            end
        end
    })

    -- Tracer Lines
    MainTab:CreateToggle({
        Name = "📍 Tracer Lines",
        CurrentValue = false,
        Callback = function(state)
            -- Your tracer drawing logic here
        end
    })

    -- WallHack (basic transparency method)
    MainTab:CreateToggle({
        Name = "🧱 WallHack",
        CurrentValue = false,
        Callback = function(state)
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency < 0.8 then
                    v.LocalTransparencyModifier = state and 0.5 or 0
                end
            end
        end
    })

    -- Auto Kill (teleport to enemy)
    MainTab:CreateToggle({
        Name = "⚔️ Auto Kill",
        CurrentValue = false,
        Callback = function(state)
            while state do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
                        wait(0.5)
                    end
                end
            end
        end
    })

    -- Speed Hack
    MainTab:CreateSlider({
        Name = "🚀 Speed Hack",
        Range = {16, 100},
        Increment = 1,
        CurrentValue = 16,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    })

    -- Cash Duper (game-dependent, placeholder logic)
    MainTab:CreateButton({
        Name = "💸 Cash Dupe (if supported)",
        Callback = function()
            local cash = game.Players.LocalPlayer.leaderstats:FindFirstChild("Cash")
            if cash then
                cash.Value = cash.Value + 999999
            else
                Rayfield:Notify({Title = "Error", Content = "Game not supported or cash system is visual.", Duration = 4})
            end
        end
    })
end--[[ 
  🔐 RineHub Premium Script
  Author: AlphaHyp35
  GitHub: https://github.com/AlphaHyp35/RineHub
  Features: Key System, Rayfield UI, ESP, Aimbot, Silent Aim, Tracer, WallHack, Speed Hack, Auto Kill, Cash Dupe
]]

-- Rayfield UI Loader
loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Custom Key System
local validKey = "ALPHA-VIP-ACCESS"

local function validateKey()
    local userKey = tostring(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("KeyPrompt") or "")
    return userKey == validKey
end

Rayfield:Notify({
    Title = "RineHub Key Check",
    Content = "Enter key to unlock features: ALPHA-VIP-ACCESS",
    Duration = 7,
    Actions = {
        Ignore = {
            Name = "Enter Key",
            Callback = function()
                local userInput = Rayfield:Prompt({
                    Title = "RineHub",
                    Text = "Enter your access key:",
                    PlaceholderText = "e.g. ALPHA-VIP-ACCESS",
                    ConfirmText = "Submit"
                })
                if userInput == validKey then
                    Rayfield:Notify({Title = "Access Granted", Content = "Welcome to RineHub!", Duration = 5})
                    loadFeatures()
                else
                    Rayfield:Notify({Title = "Access Denied", Content = "Invalid key!", Duration = 5})
                end
            end
        }
    }
})

function loadFeatures()
    local Window = Rayfield:CreateWindow({
        Name = "RineHub | Aladia PVP",
        LoadingTitle = "Loading Premium Features...",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "RineHub",
            FileName = "AladiaPVP"
        }
    })

    local MainTab = Window:CreateTab("⚙️ Main Features", 4483362458)

    -- Silent Aim (basic example)
    MainTab:CreateToggle({
        Name = "🎯 Silent Aim",
        CurrentValue = false,
        Callback = function(val)
            getgenv().SilentAimEnabled = val
        end
    })

    -- ESP
    MainTab:CreateToggle({
        Name = "👁️ ESP",
        CurrentValue = false,
        Callback = function(state)
            if state then
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        local esp = Instance.new("BillboardGui", player.Character.Head)
                        esp.Size = UDim2.new(0, 100, 0, 40)
                        esp.AlwaysOnTop = true
                        esp.Name = "ESP"
                        local label = Instance.new("TextLabel", esp)
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.Text = player.Name
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.new(1, 0, 0)
                    end
                end
            else
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character:FindFirstChild("Head"):FindFirstChild("ESP") then
                        player.Character.Head.ESP:Destroy()
                    end
                end
            end
        end
    })

    -- Tracer Lines
    MainTab:CreateToggle({
        Name = "📍 Tracer Lines",
        CurrentValue = false,
        Callback = function(state)
            -- Your tracer drawing logic here
        end
    })

    -- WallHack (basic transparency method)
    MainTab:CreateToggle({
        Name = "🧱 WallHack",
        CurrentValue = false,
        Callback = function(state)
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency < 0.8 then
                    v.LocalTransparencyModifier = state and 0.5 or 0
                end
            end
        end
    })

    -- Auto Kill (teleport to enemy)
    MainTab:CreateToggle({
        Name = "⚔️ Auto Kill",
        CurrentValue = false,
        Callback = function(state)
            while state do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
                        wait(0.5)
                    end
                end
            end
        end
    })

    -- Speed Hack
    MainTab:CreateSlider({
        Name = "🚀 Speed Hack",
        Range = {16, 100},
        Increment = 1,
        CurrentValue = 16,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    })

    -- Cash Duper (game-dependent, placeholder logic)
    MainTab:CreateButton({
        Name = "💸 Cash Dupe (if supported)",
        Callback = function()
            local cash = game.Players.LocalPlayer.leaderstats:FindFirstChild("Cash")
            if cash then
                cash.Value = cash.Value + 999999
            else
                Rayfield:Notify({Title = "Error", Content = "Game not supported or cash system is visual.", Duration = 4})
            end
        end
    })
end
