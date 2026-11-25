local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local OLD_GUI = PlayerGui:FindFirstChild("ElyScriptsPremium")
if OLD_GUI then
    OLD_GUI:Destroy()
end

local Theme = {
    Background = Color3.fromRGB(13, 14, 21),
    Panel = Color3.fromRGB(21, 23, 33),
    Panel2 = Color3.fromRGB(28, 30, 43),
    PanelHover = Color3.fromRGB(38, 34, 52),
    Pink = Color3.fromRGB(255, 91, 170),
    PinkLight = Color3.fromRGB(255, 151, 202),
    Purple = Color3.fromRGB(153, 105, 255),
    Text = Color3.fromRGB(245, 242, 250),
    Muted = Color3.fromRGB(155, 153, 171),
    Green = Color3.fromRGB(91, 220, 159),
    Red = Color3.fromRGB(255, 103, 120),
    Stroke = Color3.fromRGB(57, 48, 72)
}

local function New(className, properties, parent)
    local object = Instance.new(className)
    for property, value in pairs(properties or {}) do
        object[property] = value
    end
    object.Parent = parent
    return object
end

local function Corner(parent, radius)
    return New("UICorner", {CornerRadius = UDim.new(0, radius or 10)}, parent)
end

local function Stroke(parent, color, transparency, thickness)
    return New("UIStroke", {
        Color = color or Theme.Stroke,
        Transparency = transparency or 0,
        Thickness = thickness or 1
    }, parent)
end

local function Tween(object, duration, properties, style)
    local tween = TweenService:Create(
        object,
        TweenInfo.new(duration or 0.2, style or Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        properties
    )
    tween:Play()
    return tween
end

local ScreenGui = New("ScreenGui", {
    Name = "ElyScriptsPremium",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = true
}, PlayerGui)

-- Intro overlay
local Intro = New("Frame", {
    Name = "Intro",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Theme.Background,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 50
}, ScreenGui)

local IntroGlow = New("Frame", {
    Size = UDim2.fromOffset(230, 230),
    Position = UDim2.new(0.5, -115, 0.5, -145),
    BackgroundColor3 = Theme.Pink,
    BackgroundTransparency = 0.88,
    BorderSizePixel = 0,
    ZIndex = 51
}, Intro)
Corner(IntroGlow, 115)

local IntroTitle = New("TextLabel", {
    Size = UDim2.new(1, 0, 0, 54),
    Position = UDim2.new(0, 0, 0.5, -35),
    BackgroundTransparency = 1,
    Text = "ELY SCRIPTS",
    TextColor3 = Theme.Text,
    Font = Enum.Font.GothamBlack,
    TextSize = 31,
    ZIndex = 52
}, Intro)

local IntroSub = New("TextLabel", {
    Size = UDim2.new(1, 0, 0, 25),
    Position = UDim2.new(0, 0, 0.5, 14),
    BackgroundTransparency = 1,
    Text = "PREMIUM SCRIPT HUB",
    TextColor3 = Theme.PinkLight,
    Font = Enum.Font.GothamMedium,
    TextSize = 11,
    ZIndex = 52
}, Intro)

local IntroTrack = New("Frame", {
    Size = UDim2.fromOffset(190, 4),
    Position = UDim2.new(0.5, -95, 0.5, 57),
    BackgroundColor3 = Theme.Panel2,
    BorderSizePixel = 0,
    ZIndex = 52
}, Intro)
Corner(IntroTrack, 4)

local IntroFill = New("Frame", {
    Size = UDim2.fromScale(0, 1),
    BackgroundColor3 = Theme.Pink,
    BorderSizePixel = 0,
    ZIndex = 53
}, IntroTrack)
Corner(IntroFill, 4)

local IntroCountdown = New("TextLabel", {
    Size = UDim2.fromOffset(220, 22),
    Position = UDim2.new(0.5, -110, 0.5, 72),
    BackgroundTransparency = 1,
    Text = "60 seconds remaining",
    TextColor3 = Theme.Muted,
    Font = Enum.Font.Gotham,
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Center,
    ZIndex = 52
}, Intro)

-- Main window
local Main = New("Frame", {
    Name = "Main",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.53),
    Size = UDim2.fromOffset(560, 430),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    Visible = false,
    ClipsDescendants = true,
    ZIndex = 2
}, ScreenGui)
Corner(Main, 16)
Stroke(Main, Theme.Stroke, 0.15, 1.2)

local MainScale = New("UIScale", {Scale = 1}, Main)
local function UpdateScale()
    local camera = workspace.CurrentCamera
    if not camera then return end
    local viewport = camera.ViewportSize
    MainScale.Scale = math.clamp(math.min(viewport.X / 650, viewport.Y / 520), 0.68, 1)
end
UpdateScale()
if workspace.CurrentCamera then
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)
end

-- Header
local Header = New("Frame", {
    Size = UDim2.new(1, 0, 0, 66),
    BackgroundColor3 = Theme.Panel,
    BorderSizePixel = 0,
    ZIndex = 3
}, Main)

local HeaderAccent = New("Frame", {
    Size = UDim2.new(1, 0, 0, 2),
    BackgroundColor3 = Theme.Pink,
    BorderSizePixel = 0,
    ZIndex = 4
}, Header)
New("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Pink),
        ColorSequenceKeypoint.new(1, Theme.Purple)
    })
}, HeaderAccent)

local BrandMark = New("Frame", {
    Size = UDim2.fromOffset(38, 38),
    Position = UDim2.fromOffset(17, 14),
    BackgroundColor3 = Theme.Pink,
    BorderSizePixel = 0,
    ZIndex = 4
}, Header)
Corner(BrandMark, 11)
New("UIGradient", {
    Color = ColorSequence.new(Theme.Pink, Theme.Purple),
    Rotation = 35
}, BrandMark)

New("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "E",
    TextColor3 = Color3.new(1, 1, 1),
    Font = Enum.Font.GothamBlack,
    TextSize = 23,
    ZIndex = 5
}, BrandMark)

New("TextLabel", {
    Size = UDim2.new(0, 250, 0, 25),
    Position = UDim2.fromOffset(66, 12),
    BackgroundTransparency = 1,
    Text = "ELY SCRIPTS",
    TextColor3 = Theme.Text,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBold,
    TextSize = 17,
    ZIndex = 4
}, Header)

New("TextLabel", {
    Size = UDim2.new(0, 250, 0, 18),
    Position = UDim2.fromOffset(66, 35),
    BackgroundTransparency = 1,
    Text = "YOUR PERSONAL SCRIPT CENTER",
    TextColor3 = Theme.Muted,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamMedium,
    TextSize = 9,
    ZIndex = 4
}, Header)

local Minimize = New("TextButton", {
    Size = UDim2.fromOffset(30, 30),
    Position = UDim2.new(1, -76, 0, 17),
    BackgroundColor3 = Theme.Panel2,
    Text = "—",
    TextColor3 = Theme.Muted,
    Font = Enum.Font.GothamBold,
    TextSize = 15,
    AutoButtonColor = false,
    ZIndex = 5
}, Header)
Corner(Minimize, 8)

local Close = New("TextButton", {
    Size = UDim2.fromOffset(30, 30),
    Position = UDim2.new(1, -39, 0, 17),
    BackgroundColor3 = Color3.fromRGB(66, 34, 49),
    Text = "×",
    TextColor3 = Theme.PinkLight,
    Font = Enum.Font.GothamBold,
    TextSize = 19,
    AutoButtonColor = false,
    ZIndex = 5
}, Header)
Corner(Close, 8)

-- Content heading
New("TextLabel", {
    Size = UDim2.new(1, -40, 0, 27),
    Position = UDim2.fromOffset(20, 82),
    BackgroundTransparency = 1,
    Text = "Available scripts",
    TextColor3 = Theme.Text,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBold,
    TextSize = 17,
    ZIndex = 3
}, Main)

New("TextLabel", {
    Size = UDim2.new(1, -40, 0, 18),
    Position = UDim2.fromOffset(20, 108),
    BackgroundTransparency = 1,
    Text = "Choose a hub to launch. Use search to filter the list.",
    TextColor3 = Theme.Muted,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.Gotham,
    TextSize = 10,
    ZIndex = 3
}, Main)

-- Search field
local SearchWrap = New("Frame", {
    Size = UDim2.new(1, -40, 0, 38),
    Position = UDim2.fromOffset(20, 139),
    BackgroundColor3 = Theme.Panel,
    BorderSizePixel = 0,
    ZIndex = 3
}, Main)
Corner(SearchWrap, 9)
Stroke(SearchWrap, Theme.Stroke, 0.35, 1)

New("TextLabel", {
    Size = UDim2.fromOffset(30, 38),
    Position = UDim2.fromOffset(8, 0),
    BackgroundTransparency = 1,
    Text = "⌕",
    TextColor3 = Theme.PinkLight,
    Font = Enum.Font.GothamBold,
    TextSize = 22,
    ZIndex = 4
}, SearchWrap)

local Search = New("TextBox", {
    Size = UDim2.new(1, -48, 1, 0),
    Position = UDim2.fromOffset(40, 0),
    BackgroundTransparency = 1,
    Text = "",
    PlaceholderText = "Search scripts...",
    PlaceholderColor3 = Theme.Muted,
    TextColor3 = Theme.Text,
    TextXAlignment = Enum.TextXAlignment.Left,
    ClearTextOnFocus = false,
    Font = Enum.Font.Gotham,
    TextSize = 12,
    ZIndex = 4
}, SearchWrap)

-- Script list
local List = New("ScrollingFrame", {
    Name = "ScriptList",
    Size = UDim2.new(1, -40, 0, 174),
    Position = UDim2.fromOffset(20, 190),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = Theme.Pink,
    CanvasSize = UDim2.fromOffset(0, 0),
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ZIndex = 3
}, Main)

New("UIListLayout", {
    Padding = UDim.new(0, 10),
    SortOrder = Enum.SortOrder.LayoutOrder
}, List)

local Scripts = {
    {
        Name = "OVERDRIVE",
        Description = "Overdrive hub loader",
        Tag = "HUB",
        Code = [[loadstring(game:HttpGet("https://cdn.project-reverse.org/odh_3_5_crack.luau"))()]]
    },
    {
        Name = "ONYX",
        Description = "Onyx no-key hub loader",
        Tag = "NO KEY",
        Code = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/robloxscripts2026/onyx/refs/heads/main/nokey/hub.lua"))()]]
    }
}

local StatusText = New("TextLabel", {
    Size = UDim2.new(1, -40, 0, 20),
    Position = UDim2.new(0, 20, 1, -47),
    BackgroundTransparency = 1,
    Text = "●  READY  |  2 SCRIPTS AVAILABLE",
    TextColor3 = Theme.Green,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBold,
    TextSize = 9,
    ZIndex = 4
}, Main)

local FooterLine = New("Frame", {
    Size = UDim2.new(1, -40, 0, 1),
    Position = UDim2.new(0, 20, 1, -57),
    BackgroundColor3 = Theme.Stroke,
    BackgroundTransparency = 0.25,
    BorderSizePixel = 0,
    ZIndex = 3
}, Main)

New("TextLabel", {
    Size = UDim2.new(1, -40, 0, 15),
    Position = UDim2.new(0, 20, 1, -25),
    BackgroundTransparency = 1,
    Text = "ELYSCRIPTS  •  MADE FOR THE COMMUNITY",
    TextColor3 = Theme.Muted,
    TextXAlignment = Enum.TextXAlignment.Center,
    Font = Enum.Font.GothamMedium,
    TextSize = 8,
    ZIndex = 3
}, Main)

local function SetStatus(message, color)
    StatusText.Text = "●  " .. string.upper(message)
    StatusText.TextColor3 = color or Theme.Green
end

local function MakeScriptCard(scriptData, order)
    local Card = New("Frame", {
        Name = scriptData.Name .. "Card",
        Size = UDim2.new(1, -5, 0, 70),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        LayoutOrder = order,
        ZIndex = 4
    }, List)
    Corner(Card, 11)
    local outline = Stroke(Card, Theme.Stroke, 0.4, 1)

    local Icon = New("Frame", {
        Size = UDim2.fromOffset(42, 42),
        Position = UDim2.fromOffset(13, 14),
        BackgroundColor3 = Theme.Panel2,
        BorderSizePixel = 0,
        ZIndex = 5
    }, Card)
    Corner(Icon, 10)

    New("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = string.sub(scriptData.Name, 1, 1),
        TextColor3 = Theme.PinkLight,
        Font = Enum.Font.GothamBlack,
        TextSize = 20,
        ZIndex = 6
    }, Icon)

    New("TextLabel", {
        Size = UDim2.new(1, -190, 0, 22),
        Position = UDim2.fromOffset(66, 12),
        BackgroundTransparency = 1,
        Text = scriptData.Name,
        TextColor3 = Theme.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        ZIndex = 5
    }, Card)

    New("TextLabel", {
        Size = UDim2.new(1, -190, 0, 18),
        Position = UDim2.fromOffset(66, 34),
        BackgroundTransparency = 1,
        Text = scriptData.Description,
        TextColor3 = Theme.Muted,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        TextSize = 9,
        ZIndex = 5
    }, Card)

    local Tag = New("TextLabel", {
        Size = UDim2.fromOffset(52, 17),
        Position = UDim2.new(1, -153, 0, 26),
        BackgroundColor3 = Color3.fromRGB(57, 38, 70),
        Text = scriptData.Tag,
        TextColor3 = Theme.PinkLight,
        Font = Enum.Font.GothamBold,
        TextSize = 8,
        ZIndex = 5
    }, Card)
    Corner(Tag, 5)

    local Launch = New("TextButton", {
        Size = UDim2.fromOffset(82, 34),
        Position = UDim2.new(1, -92, 0, 18),
        BackgroundColor3 = Theme.Pink,
        Text = "LAUNCH",
        TextColor3 = Color3.new(1, 1, 1),
        Font = Enum.Font.GothamBold,
        TextSize = 9,
        AutoButtonColor = false,
        ZIndex = 5
    }, Card)
    Corner(Launch, 8)
    New("UIGradient", {
        Color = ColorSequence.new(Theme.Pink, Theme.Purple),
        Rotation = 0
    }, Launch)

    Card:SetAttribute("SearchName", string.lower(scriptData.Name .. " " .. scriptData.Description .. " " .. scriptData.Tag))

    Card.MouseEnter:Connect(function()
        Tween(Card, 0.18, {BackgroundColor3 = Theme.PanelHover})
        outline.Transparency = 0.05
    end)
    Card.MouseLeave:Connect(function()
        Tween(Card, 0.18, {BackgroundColor3 = Theme.Panel})
        outline.Transparency = 0.4
    end)

    Launch.MouseEnter:Connect(function()
        Tween(Launch, 0.15, {BackgroundColor3 = Theme.PinkLight})
    end)
    Launch.MouseLeave:Connect(function()
        Tween(Launch, 0.15, {BackgroundColor3 = Theme.Pink})
    end)

    local busy = false
    Launch.MouseButton1Click:Connect(function()
        if busy then return end
        busy = true
        Launch.Text = "LOADING..."
        Launch.Active = false
        SetStatus("Launching " .. scriptData.Name, Theme.PinkLight)

        task.spawn(function()
            local ok, err = pcall(function()
                local loader = loadstring(game:HttpGet(scriptData.Code:match('"(https?://.-)"')))
                assert(loader, "Unable to compile the remote loader")
                loader()
            end)

            if ok then
                SetStatus(scriptData.Name .. " loader executed", Theme.Green)
            else
                warn("[ELY SCRIPTS] " .. tostring(err))
                SetStatus("Launch failed - check executor output", Theme.Red)
            end

            Launch.Text = "LAUNCH"
            Launch.Active = true
            busy = false
        end)
    end)

    return Card
end

local Cards = {}
for index, scriptData in ipairs(Scripts) do
    Cards[index] = MakeScriptCard(scriptData, index)
end

local function FilterScripts()
    local query = string.lower(Search.Text)
    for _, card in ipairs(Cards) do
        local searchable = card:GetAttribute("SearchName") or ""
        card.Visible = query == "" or string.find(searchable, query, 1, true) ~= nil
    end
end
Search:GetPropertyChangedSignal("Text"):Connect(FilterScripts)

-- Drag the window using its header.
local dragging = false
local dragInput
local dragStart
local startPosition

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPosition.X.Scale, startPosition.X.Offset + delta.X,
            startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
        )
    end
end)

local minimized = false
Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Tween(Main, 0.22, {Size = UDim2.fromOffset(560, 66)})
        Minimize.Text = "+"
    else
        Tween(Main, 0.22, {Size = UDim2.fromOffset(560, 430)})
        Minimize.Text = "—"
    end
end)

Close.MouseButton1Click:Connect(function()
    Tween(Main, 0.2, {
        Position = UDim2.new(0.5, 0, 0.53, 18),
        BackgroundTransparency = 1
    })
    task.wait(0.2)
    ScreenGui:Destroy()
end)

-- 60-second centered loading screen, then reveal the hub.
-- The intro overlay is transparent; the existing UI stays hidden until loading ends.
local LoadingDuration = 60
local LoadingStarted = os.clock()

while true do
    local elapsed = os.clock() - LoadingStarted
    local progress = math.clamp(elapsed / LoadingDuration, 0, 1)
    local remaining = math.max(0, math.ceil(LoadingDuration - elapsed))

    IntroCountdown.Text = tostring(remaining) .. " seconds remaining"
    IntroFill.Size = UDim2.fromScale(progress, 1)

    if remaining <= 0 then
        break
    end

    task.wait(0.1)
end

Main.Visible = true
Main.BackgroundTransparency = 1
Main.Position = UDim2.fromScale(0.5, 0.56)
Tween(Main, 0.45, {
    BackgroundTransparency = 0,
    Position = UDim2.fromScale(0.5, 0.5)
}, Enum.EasingStyle.Back)

Tween(IntroTitle, 0.3, {TextTransparency = 1})
Tween(IntroSub, 0.3, {TextTransparency = 1})
Tween(IntroCountdown, 0.3, {TextTransparency = 1})
Tween(IntroTrack, 0.3, {BackgroundTransparency = 1})
Tween(IntroFill, 0.3, {BackgroundTransparency = 1})
Tween(IntroGlow, 0.3, {BackgroundTransparency = 1})
task.wait(0.35)
Intro:Destroy()
