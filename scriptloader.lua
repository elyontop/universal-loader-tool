local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingScreen"
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.Position = UDim2.new(0, 0, 0, 0)
LoadingFrame.BackgroundTransparency = 1
LoadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.ZIndex = 10
LoadingFrame.Parent = ScreenGui

local LoadingContainer = Instance.new("Frame")
LoadingContainer.Name = "LoadingContainer"
LoadingContainer.Size = UDim2.new(0, 400, 0, 200)
LoadingContainer.Position = UDim2.new(0.5, -200, 0.5, -100)
LoadingContainer.BackgroundTransparency = 1
LoadingContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadingContainer.BorderSizePixel = 0
LoadingContainer.ZIndex = 11
LoadingContainer.Parent = LoadingFrame

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Name = "LoadingTitle"
LoadingTitle.Size = UDim2.new(1, 0, 0, 40)
LoadingTitle.Position = UDim2.new(0, 0, 0, 20)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Text = "ELYSCRIPTS"
LoadingTitle.TextColor3 = Color3.fromRGB(255, 105, 180)
LoadingTitle.Font = Enum.Font.SourceSansBold
LoadingTitle.TextSize = 28
LoadingTitle.ZIndex = 12
LoadingTitle.Parent = LoadingContainer

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

local CharacterDesc = Instance.new("TextLabel")
CharacterDesc.Name = "CharacterDesc"
CharacterDesc.Size = UDim2.new(0.9, 0, 0, 50)
CharacterDesc.Position = UDim2.new(0.05, 0, 0.3, 0)
CharacterDesc.BackgroundTransparency = 1
CharacterDesc.Text = "Ely - The Guardian of Scripts"
CharacterDesc.TextColor3 = Color3.fromRGB(255, 105, 180)
CharacterDesc.Font = Enum.Font.SourceSansBold
CharacterDesc.TextSize = 16
CharacterDesc.ZIndex = 12
CharacterDesc.Parent = LoadingContainer

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

local tipIndex = 1
local function UpdateTip()
    LoadingTip.Text = Tips[tipIndex]
    tipIndex = tipIndex + 1
    if tipIndex > #Tips then tipIndex = 1 end
end

task.spawn(function()
    while LoadingFrame.Visible do
        task.wait(5)
        UpdateTip()
    end
end)

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 500, 0, 450)
Frame.Position = UDim2.new(0.5, -250, 0.5, -225)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Frame.BackgroundTransparency = 1
Frame.BorderSizePixel = 0
Frame.Visible = false
Frame.ZIndex = 5
Frame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Title.Text = "Script Loader"
Title.TextColor3 = Color3.fromRGB(255, 105, 180)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.ZIndex = 6
Title.Parent = Frame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScriptList"
ScrollingFrame.Size = UDim2.new(1, 0, 1, -75)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 45)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.ZIndex = 6
ScrollingFrame.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = ScrollingFrame

local Scripts = {
    {
        Name = "WAGURI SCRIPT",
        Code = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Waguriiiii/Murder-mystery-2/refs/heads/main/Waguri.lua"))()]]
    },
    {
        Name = "OVERDRIVE H SCRIPT",
        Code = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/elyontop/mm2/refs/heads/main/odh.lua"))()]]
    },
}

for _, scriptData in ipairs(Scripts) do
    local ScriptButton = Instance.new("TextButton")
    ScriptButton.Name = scriptData.Name .. "Button"
    ScriptButton.Size = UDim2.new(1, -20, 0, 45)
    ScriptButton.Position = UDim2.new(0, 10, 0, 0)
    ScriptButton.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    ScriptButton.BorderColor3 = Color3.fromRGB(255, 105, 180)
    ScriptButton.BorderSizePixel = 1
    ScriptButton.Text = scriptData.Name .. "  [Insert]"
    ScriptButton.TextColor3 = Color3.fromRGB(255, 200, 220)
    ScriptButton.Font = Enum.Font.SourceSans
    ScriptButton.TextSize = 16
    ScriptButton.TextXAlignment = Enum.TextXAlignment.Center
    ScriptButton.ZIndex = 7
    ScriptButton.Parent = ScrollingFrame
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = ScriptButton
    
    ScriptButton.MouseEnter:Connect(function()
        TweenService:Create(ScriptButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 30, 40)}):Play()
    end)
    ScriptButton.MouseLeave:Connect(function()
        TweenService:Create(ScriptButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 50)}):Play()
    end)
    
    ScriptButton.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(scriptData.Code)()
        end)
        if not success then
            warn("Execution error: " .. tostring(err))
        end
        local vanishTween = TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
        vanishTween:Play()
        vanishTween.Completed:Connect(function()
            Frame.Visible = false
        end)
    end)
end

local Footer = Instance.new("TextLabel")
Footer.Name = "Footer"
Footer.Size = UDim2.new(1, 0, 0, 30)
Footer.Position = UDim2.new(0, 0, 1, -30)
Footer.BackgroundTransparency = 1
Footer.Text = "Developed by Jopio0819"
Footer.TextColor3 = Color3.fromRGB(255, 105, 180)
Footer.Font = Enum.Font.SourceSans
Footer.TextSize = 14
Footer.TextXAlignment = Enum.TextXAlignment.Center
Footer.ZIndex = 6
Footer.Parent = Frame

local function MakeDraggable(frame, handle)
    local dragData = { dragging = false, dragStart = nil, startPos = nil }
    
    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragData.dragging = true
            dragData.dragStart = input.Position
            dragData.startPos = frame.Position
        end
    end
    
    local function onInputChanged(input)
        if dragData.dragging then
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                local delta = input.Position - dragData.dragStart
                frame.Position = UDim2.new(
                    dragData.startPos.X.Scale, 
                    dragData.startPos.X.Offset + delta.X,
                    dragData.startPos.Y.Scale, 
                    dragData.startPos.Y.Offset + delta.Y
                )
            end
        end
    end
    
    local function onInputEnded(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragData.dragging = false
        end
    end
    
    handle.InputBegan:Connect(onInputBegan)
    handle.InputChanged:Connect(onInputChanged)
    handle.InputEnded:Connect(onInputEnded)
    
    local touchBegan = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.Touch then
            local pos = input.Position
            local abs = handle.AbsolutePosition
            local size = handle.AbsoluteSize
            if pos.X >= abs.X and pos.X <= abs.X + size.X and pos.Y >= abs.Y and pos.Y <= abs.Y + size.Y then
                dragData.dragging = true
                dragData.dragStart = input.Position
                dragData.startPos = frame.Position
            end
        end
    end)
    
    local touchMove = UserInputService.InputChanged:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if dragData.dragging and input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragData.dragStart
            frame.Position = UDim2.new(
                dragData.startPos.X.Scale, 
                dragData.startPos.X.Offset + delta.X,
                dragData.startPos.Y.Scale, 
                dragData.startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    local touchEnd = UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.Touch then
            dragData.dragging = false
        end
    end)
    
    frame.AncestryChanged:Connect(function()
        if not frame.Parent then
            touchBegan:Disconnect()
            touchMove:Disconnect()
            touchEnd:Disconnect()
        end
    end)
end

MakeDraggable(LoadingContainer, LoadingTitle)
MakeDraggable(Frame, Title)

local loadingTween = TweenService:Create(LoadingBar, TweenInfo.new(120, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
loadingTween:Play()

loadingTween.Completed:Connect(function()
    local fadeTween = TweenService:Create(LoadingFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Transparency = 1})
    fadeTween:Play()
    fadeTween.Completed:Connect(function()
        LoadingFrame.Visible = false
    end)
    Frame.Visible = true
    local showTween = TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {Transparency = 0})
    showTween:Play()
end)
