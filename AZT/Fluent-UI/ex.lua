local AZTUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/aztvn/UI-Library-Roblox/refs/heads/main/AZT/Fluent-UI/main.lua"))()
------------------------------------------------------------------------
-- 1. Create Main Window
------------------------------------------------------------------------
local Window = AZTUI:CreateWindow({
    Title = "AZT HUB",
    SubTitle = "v1.0.0 by",
    Size = UDim2.fromOffset(620, 450),
    Theme = "Dark",
    Acrylic = true,
    VideoBackground = true,
    LiveBackground = "https://jumpshare.com/s/uD28ptkcOf1QVlK6RmRs",
    MinimizeKey = Enum.KeyCode.LeftControl
})

------------------------------------------------------------------------
-- 2. Create Top Navigation Tabs ([ Tab 1 , Tab 2 , Tab 3 , ... ])
------------------------------------------------------------------------
local DashboardTab = Window:AddTab({ Title = "Dashboard", Icon = "home" })
local VisualsTab   = Window:AddTab({ Title = "Visuals",   Icon = "eye" })
local SettingsTab  = Window:AddTab({ Title = "Settings",  Icon = "settings" })

------------------------------------------------------------------------
-- 3. Tab 1: Dashboard (Left & Right Sections)
------------------------------------------------------------------------
-- Left Section
local CombatSection = DashboardTab:AddLeftSection("Combat Features")

CombatSection:AddToggle("AimbotEnabled", {
    Title = "Enable Aimbot",
    Description = "Automatically locks camera onto target player",
    Default = false,
    Callback = function(Value)
        print("Aimbot status:", Value)
    end
})

CombatSection:AddSlider("AimbotFov", {
    Title = "Aimbot FOV",
    Description = "Field of view targeting radius",
    Default = 90,
    Min = 20,
    Max = 360,
    Rounding = 0,
    Callback = function(Value)
        print("FOV set to:", Value)
    end
})

CombatSection:AddDropdown("TargetBone", {
    Title = "Target Hitbox",
    Description = "Body part to lock onto",
    Values = { "Head", "UpperTorso", "HumanoidRootPart" },
    Default = "Head",
    Multi = false,
    Callback = function(Value)
        print("Target bone:", Value)
    end
})

CombatSection:AddKeybind("AimbotKey", {
    Title = "Aimbot Activation Key",
    Description = "Hold or press to activate aimbot",
    Default = "MouseRight",
    Mode = "Hold", -- "Hold", "Toggle", "Always"
    Callback = function(State)
        print("Aimbot key active:", State)
    end
})

-- Right Section
local MovementSection = DashboardTab:AddRightSection("Movement & Character")

MovementSection:AddToggle("SpeedHack", {
    Title = "Speed Multiplier",
    Description = "Boost walkspeed dynamically",
    Default = false,
    Callback = function(Value)
        print("Speed toggle:", Value)
    end
})

MovementSection:AddSlider("WalkSpeed", {
    Title = "Speed Value",
    Description = "Target walk speed",
    Default = 32,
    Min = 16,
    Max = 250,
    Rounding = 0,
    Callback = function(Value)
        print("WalkSpeed:", Value)
    end
})

MovementSection:AddInput("CoordsInput", {
    Title = "Custom Teleport Pos",
    Description = "Format: X, Y, Z",
    Default = "0, 50, 0",
    Placeholder = "Enter vector3 coordinates...",
    Finished = true,
    Callback = function(Text)
        print("Teleport destination set to:", Text)
    end
})

MovementSection:AddButton({
    Title = "Teleport Now",
    Description = "Instantly move character to specified coordinates",
    Callback = function()
        AZTUI:Notify({
            Title = "Movement",
            Content = "Teleported successfully!",
            Duration = 3
        })
    end
})

------------------------------------------------------------------------
-- 4. Tab 2: Visuals (Left & Right Sections)
------------------------------------------------------------------------
local ESPSection = VisualsTab:AddSection("ESP Toggles", "Left")

ESPSection:AddToggle("BoxESP", {
    Title = "2D Bounding Box",
    Description = "Draw bounding boxes around targets",
    Default = true,
    Callback = function(Value)
        print("Box ESP:", Value)
    end
})

ESPSection:AddToggle("TracerESP", {
    Title = "Tracer Lines",
    Description = "Draw snap lines from screen to enemy",
    Default = false,
    Callback = function(Value)
        print("Tracers:", Value)
    end
})

ESPSection:AddDropdown("ESPTracerOrigin", {
    Title = "Tracer Origin",
    Values = { "Bottom", "Center", "Mouse" },
    Default = "Bottom",
    Callback = function(Value)
        print("Tracer origin:", Value)
    end
})

local ColorSection = VisualsTab:AddSection("Color Palette", "Right")

ColorSection:AddColorpicker("BoxColor", {
    Title = "Box ESP Color",
    Description = "Custom color with alpha transparency",
    Default = Color3.fromRGB(0, 175, 255),
    Transparency = 0.15,
    Callback = function(Color)
        print("ESP Color changed:", Color)
    end
})

ColorSection:AddColorpicker("TracerColor", {
    Title = "Tracer Line Color",
    Description = "Color for screen tracer rays",
    Default = Color3.fromRGB(255, 80, 80),
    Transparency = 0,
    Callback = function(Color)
        print("Tracer Color changed:", Color)
    end
})

------------------------------------------------------------------------
-- 5. Tab 3: Settings (Left & Right Sections)
------------------------------------------------------------------------
local UISettings = SettingsTab:AddLeftSection("UI Preferences")

UISettings:AddDropdown("ThemePicker", {
    Title = "Interface Theme",
    Description = "Select a built-in color theme",
    Values = AZTUI.Themes,
    Default = "Dark",
    Callback = function(ThemeName)
        AZTUI:SetTheme(ThemeName)
    end
})

UISettings:AddToggle("AcrylicToggle", {
    Title = "Acrylic Blur Effect",
    Description = "Real-time background glassmorphism blur",
    Default = true,
    Callback = function(Value)
        AZTUI:ToggleAcrylic(Value)
    end
})

UISettings:AddKeybind("ToggleMenuKey", {
    Title = "Minimize / Toggle Menu",
    Description = "Keybind to show or hide the entire UI",
    Default = "LeftControl",
    Mode = "Toggle"
})

UISettings:AddButton({
    Title = "Open Confirmation Dialog",
    Description = "Test interactive modal popup",
    Callback = function()
        Window:Dialog({
            Title = "Confirmation Dialog",
            Content = "This is a full modal dialog test in the new AZT UI layout. Do you wish to continue?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        AZTUI:Notify({
                            Title = "Dialog Response",
                            Content = "User clicked Confirm!",
                            Duration = 4
                        })
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("User cancelled dialog.")
                    end
                }
            }
        })
    end
})

local AboutSection = SettingsTab:AddRightSection("About AZT UI")

AboutSection:AddParagraph({
    Title = "AZT UI Architecture",
    Content = "Engineered with a sleek Top Navigation Tab bar and dual-column (Left & Right) sections while retaining 100% Fluent API parity and spring micro-animations."
})

AboutSection:AddToggle("VideoBackgroundToggle", {
    Title = "Video / Image Background",
    Description = "Enable live background behind the window (requires Custom theme for best effect)",
    Default = false,
    Callback = function(Value)
        Window:ToggleVideoBackground(Value)
    end
})

AboutSection:AddInput("LiveBackgroundURL", {
    Title = "Background URL",
    Description = "URL to image/video asset for live background",
    Default = "https://jumpshare.com/s/uD28ptkcOf1QVlK6RmRs",
    Placeholder = "Enter image/video URL...",
    Finished = true,
    Callback = function(Text)
        Window:SetLiveBackground(Text)
    end
})

AboutSection:AddButton({
    Title = "Unload Interface",
    Description = "Safely destroys all GUI instances and disconnects signals",
    Callback = function()
        AZTUI:Destroy()
    end
})

------------------------------------------------------------------------
-- 6. Select Default Tab & Send Welcome Notification
------------------------------------------------------------------------
Window:SelectTab(1)

AZTUI:Notify({
    Title = "AZT UI Ready",
    Content = "UI loaded with Top Navigation Tabs & Dual-Column Sections!",
    SubContent = "Press LeftControl to toggle menu.",
    Duration = 5
})

return {
    Library = AZTUI,
    Window = Window,
    Options = AZTUI.Options,
}
