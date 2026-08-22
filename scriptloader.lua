-- Script Hub for Roblox (Lua)
-- White theme with rounded edges, smooth intro loading screen, and pink loading bar
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- Create the main interface
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptHub"
ScreenGui.Parent = PlayerGui

-- Create loading screen
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingScreen"
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.Position = UDim2.new(0, 0, 0, 0)
LoadingFrame.BackgroundTransparency = 1
LoadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.ZIndex = 10
LoadingFrame.Parent = ScreenGui

-- Create loading container
local LoadingContainer = Instance.new("Frame")
LoadingContainer.Name = "LoadingContainer"
LoadingContainer.Size = UDim2.new(0, 400, 0, 200)
LoadingContainer.Position = UDim2.new(0.5, -200, 0.5, -100)
LoadingContainer.BackgroundTransparency = 1
LoadingContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadingContainer.BorderSizePixel = 0
LoadingContainer.ZIndex = 11
LoadingContainer.Parent = LoadingFrame

-- Loading title
local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Name = "LoadingTitle"
LoadingTitle.Size = UDim2.new(1, 0, 0, 40)
LoadingTitle.Position = UDim2.new(0, 0, 0, 20)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Text = "ELYSCRIPTS"
LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingTitle.Font = Enum.Font.SourceSansBold
LoadingTitle.TextSize = 28
LoadingTitle.ZIndex = 12
LoadingTitle.Parent = LoadingContainer

-- Loading bar background
local LoadingBarBg = Instance.new("Frame")
LoadingBarBg.Name = "LoadingBarBg"
LoadingBarBg.Size = UDim2.new(0.8, 0, 0, 20)
LoadingBarBg.Position = UDim2.new(0.1, 0, 0.6, 0)
LoadingBarBg.BackgroundTransparency = 0.5
LoadingBarBg.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
LoadingBarBg.BorderSizePixel = 0
LoadingBarBg.ZIndex = 12
LoadingBarBg.Parent = LoadingContainer

local LoadingBarCorner = Instance.new("UICorner")
LoadingBarCorner.CornerRadius = UDim.new(0, 10)
LoadingBarCorner.Parent = LoadingBarBg

-- Loading bar fill
local LoadingBar = Instance.new("Frame")
LoadingBar.Name = "LoadingBar"
LoadingBar.Size = UDim2.new(0, 0, 1, 0)
LoadingBar.Position = UDim2.new(0, 0, 0, 0)
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
LoadingBar.BorderSizePixel = 0
LoadingBar.ZIndex = 13
LoadingBar.Parent = LoadingBarBg

local LoadingBarFillCorner = Instance.new("UICorner")
LoadingBarFillCorner.CornerRadius = UDim.new(0, 10)
LoadingBarFillCorner.Parent = LoadingBar

-- Loading tip text
local LoadingTip = Instance.new("TextLabel")
LoadingTip.Name = "LoadingTip"
LoadingTip.Size = UDim2.new(0.9, 0, 0, 30)
LoadingTip.Position = UDim2.new(0.05, 0, 0.75, 0)
LoadingTip.BackgroundTransparency = 1
LoadingTip.Text = "Fun Fact: Scripts can make games more fun!"
LoadingTip.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingTip.Font = Enum.Font.SourceSans
LoadingTip.TextSize = 14
LoadingTip.ZIndex = 12
LoadingTip.Parent = LoadingContainer

-- Character description label
local CharacterDesc = Instance.new("TextLabel")
CharacterDesc.Name = "CharacterDesc"
CharacterDesc.Size = UDim2.new(0.9, 0, 0, 50)
CharacterDesc.Position = UDim2.new(0.05, 0, 0.3, 0)
CharacterDesc.BackgroundTransparency = 1
CharacterDesc.Text = "Ely - The Guardian of Scripts"
CharacterDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
CharacterDesc.Font = Enum.Font.SourceSansBold
CharacterDesc.TextSize = 16
CharacterDesc.ZIndex = 12
CharacterDesc.Parent = LoadingContainer

-- Tips and trivia array (fun facts only)
local Tips = {
    "Fun Fact: Lua is used in many games besides Roblox!",
    "Fun Fact: Scripting can automate boring tasks!",
    "Fun Fact: Roblox scripting uses a modified version of Lua!",
    "Fun Fact: Scripts can create amazing visual effects!",
    "Fun Fact: Learning to script is like learning a superpower!",
    "Fun Fact: Many game developers started with Roblox scripting!",
    "Fun Fact: Scripts can make characters fly and teleport!",
    "Fun Fact: The Roblox community shares millions of scripts!",
    "Fun Fact: Scripting helps you understand how games work!",
    "Fun Fact: You can create your own games with scripting!",
    "Fun Fact: Scripts can change the color of objects instantly!",
    "Fun Fact: Lua means 'moon' in Portuguese!",
    "Fun Fact: Roblox has over 200 million monthly players!",
    "Fun Fact: Scripting is a valuable skill for future careers!",
    "Fun Fact: Many popular games use Lua scripting!",
    "Fun Fact: Scripts can make games more challenging!",
    "Fun Fact: You can learn scripting at any age!",
    "Fun Fact: Scripting communities are very helpful!",
    "Fun Fact: Roblox Studio is free to use!",
    "Fun Fact: Scripts can create entire worlds!"
}

-- Cycle through tips
local tipIndex = 1

local function UpdateTip()
    LoadingTip.Text = Tips[tipIndex]
    tipIndex = tipIndex + 1
    if tipIndex > #Tips then
        tipIndex = 1
    end
end

-- Update tip every 5 seconds
task.spawn(function()
    while LoadingFrame.Visible do
        task.wait(5)
        UpdateTip()
    end
end)

-- Create main hub frame (hidden initially)
local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 600, 0, 450)
Frame.Position = UDim2.new(0.5, -300, 0.5, -225)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1
Frame.BorderSizePixel = 0
Frame.Visible = false
Frame.ZIndex = 5
Frame.Parent = ScreenGui

-- Rounded corners for main frame
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "ElyScripts Hub"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.ZIndex = 6
Title.Parent = Frame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = Title

-- Create a scrolling frame for script buttons
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScriptList"
ScrollingFrame.Size = UDim2.new(1, 0, 1, -40)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.ZIndex = 6
ScrollingFrame.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ScrollingFrame

-- Script database
local Scripts = {
    {
        Name = "WAGURI SCRIPT",
        Code = [[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/elyontop/mm2/refs/heads/main/waguriiii"))()
        ]]
    },
    {
        Name = "OVERDRIVE H SCRIPT",
        Code = [[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/elyontop/mm2/refs/heads/main/odh.lua"))()
        ]]
    },
}

-- Create square buttons for each script
for _, scriptData in ipairs(Scripts) do
    local ScriptButton = Instance.new("TextButton")
    ScriptButton.Name = scriptData.Name .. "Button"
    ScriptButton.Size = UDim2.new(1, -20, 0, 100)
    ScriptButton.Position = UDim2.new(0, 10, 0, 0)
    ScriptButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScriptButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScriptButton.BorderSizePixel = 2
    ScriptButton.Text = scriptData.Name .. "\n\n[ CLICK TO EXECUTE ]"
    ScriptButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    ScriptButton.Font = Enum.Font.SourceSansBold
    ScriptButton.TextSize = 16
    ScriptButton.ZIndex = 7
    ScriptButton.Parent = ScrollingFrame
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = ScriptButton
    
    -- Hover effect
    ScriptButton.MouseEnter:Connect(function()
        TweenService:Create(ScriptButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 200, 220)}):Play()
    end)
    
    ScriptButton.MouseLeave:Connect(function()
        TweenService:Create(ScriptButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)
    
    -- Execute script when button is clicked
    ScriptButton.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(scriptData.Code)()
        end)
        if not success then
            warn("Execution error: " .. tostring(err))
        end
        
        -- Smoothly vanish the hub
        local vanishTween = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
        vanishTween:Play()
        vanishTween.Completed:Connect(function()
            Frame.Visible = false
        end)
    end)
end

-- Window dragging functionality
local dragging = false
local dragStart = nil
local startPos = nil

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

Title.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

Title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Animate loading bar over 2 minutes (120 seconds)
local loadingTween = TweenService:Create(LoadingBar, TweenInfo.new(120, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
loadingTween:Play()

-- Show main frame after loading completes
loadingTween.Completed:Connect(function()
    -- Fade out loading screen
    local fadeTween = TweenService:Create(LoadingFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
    fadeTween:Play()
    fadeTween.Completed:Connect(function()
        LoadingFrame.Visible = false
    end)
    
    -- Show and fade in main frame
    Frame.Visible = true
    local showTween = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0})
    showTween:Play()
end)
