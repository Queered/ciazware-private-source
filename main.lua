repeat wait() until game:IsLoaded() and game:WaitForChild"Players" 

local Players, RStorage, RService, LService, TPService, TweenService, HttpService, Uis, SGui, CGui, PGui = game:GetService"Players", game:GetService"ReplicatedStorage", game:GetService"RunService", game:GetService"Lighting", game:GetService"TeleportService", game:GetService"TweenService", game:GetService"HttpService", game:GetService"UserInputService", game:GetService"StarterGui", game:GetService"CoreGui", game:GetService"Players".LocalPlayer.PlayerGui;
local Client, Mouse, Camera, CF, CFA, Vec3, Vec2, INew, UD, UD2, CNew, C3 = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), workspace.CurrentCamera, CFrame.new, CFrame.Angles, Vector3.new, Vector2.new, Instance.new, UDim.new, UDim2.new, ColorSequence.new, Color3.fromRGB;

local AimlockTarget, CamlockTarget, FullBotTarget, FeloopTarget, EspTarget, PlayerToCheck, ViewTarget, UnEspTarget, TeleportTarget, WordToSpam, WalkSpeed, JumpPower, HipHeight, Append, Ping, FormattedPing, DeathNote = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil; -- Initally nil
local Feloop, Spamming, Visualizing, AntiFe, Blink, Flying, NoClip, NoSlow, AutoStomp, Viewing, Spinning, AntiAim, AntiGroundHit, AdminLoopKilling, Resolver, DetectHackers, AlwaysGroundHit, FullBot, TrueGodMode, GodMode, TeleportBypass, Visualizer, Teleporting, AutoReset, InfiniteJump, Camlock, Aimlock, CanBlink, CanShoot, Esp, ShowChat, CanNotify = false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true; -- Initally false/true

local AimlockRadius, AimVelocity, BlinkSpeed, FlySpeed, AutoStompRadius, AntiAimSpeed, TeleportSpeed, HealthToResetAt, LightingTime, BulletColor, BulletLifeTime, StreetsID, PrisonID = 50, 10, 2, 10, 30, 1, 3, 0, 13, CNew(C3(103, 37, 131)), 0.5, 455366377, 4669040 -- Numerical Values
local CommandPrefix, AdminPrefix, AimlockPart, CamlockPart, CamlockMode, BlinkMode, AntiAimMode = "/e ", "-", "Torso", "Torso", "Rigid", "MoveDirection", "Jitter"; -- Strings

-- Keys 
local FlyKey, NoClipKey, ResetKey, TrashTalkKey, AimlockKey, LockOnKey, KillPlayerKey, CommandBarKey = "F", "X", "P", "T", "E", "Q", "K", "Semicolon";
local BuyUziKey, BuyGlockKey, BuyAmmoKey, BuyFoodKey = "M", "B", "N", "V";

local Commands, PartsTable, BlinkModeTable, BoolKeys, TrashTalkPhrases, BulletColorTable, AntiAimModeTable, CyAdminUserTable, DrPoppaUserTable, CitizenUserTable, ZetoxUserTable, EspTargetTable, AntiFeToolTable = {}, { -- Tables
    ["head"] = "Head";["torso"] = "Torso";
    ["root"] = "HumanoidRootPart";["toes"] = "Right Leg";
}, {
    ["movedirection"] = "MoveDirection";["cframe"] = "CFrame";
    ["lookvector"] = "LookVector";
}, {
    ["W"] = false;["A"] = false;
    ["S"] = false;["D"] = false;
    ["Space"] = false;
}, {
    "no earnings", "no placements", "dogwater", "worse than my nan",
    "boxed like a box of sushi", "what are you aiming at", "literaly a bot";
}, {
   ["black"] = CNew(C3(0, 0, 0));
   ["white"] = CNew(C3(255, 255, 255));
   ["red"] = CNew(C3(255, 0, 0));
   ["green"] = CNew(C3(0, 255, 0));
   ["blue"] = CNew(C3(0, 0, 255));
   ["yellow"] = CNew(C3(255, 255, 0));
   ["pink"] = CNew(C3(255, 20, 147));
   ["purple"] = CNew(C3(128, 0, 128));
   ["orange"] = CNew(C3(245, 179, 66));
}, {
    ["jitter"] = "Jitter";["static"] = "Static";
}, {}, {}, {}, {}, {}, {};

-- getgenv()

getgenv().AdminCmdList = {
    ["kick"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                Client:Kick(self)
            end 
        end;
    ["kill"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                ResetCharacter()
            end 
        end;
        ["Clearence"] = {[3] = true;[4] = true;[5] = true;};
    }; 
    ["loopkill"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                AdminLoopKilling = true 
                while AdminLoopKilling == true and RService.Heartbeat:Wait() do
                    ResetCharacter()
                end
            end 
        end;
        ["Clearence"] = {[4] = true;[5] = true;};
    }; 
    ["unloopkill"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                AdminLoopKilling = false 
            end 
        end;
        ["Clearence"] = {[4] = true;[5] = true;};
    }; 
    ["chat"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                wait(0.4);Chat(self) 
            end 
        end;
        ["Clearence"] = {[2] = true;[3] = true;[4] = true;[5] = true;[6] = true;};
    }; 
    ["freeze"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                Client.Character.Head.Anchored = true 
            end 
        end;
        ["Clearence"] = {[3] = true;[4] = true;[5] = true;[6] = true;};
    }; 
    ["unfreeze"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                Client.Character.Head.Anchored = false 
            end 
        end;
        ["Clearence"] = {[3] = true;[4] = true;[5] = true;[6] = true;};
    }; 
    ["nolimbs"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                Client.Character["Left Leg"]:Destroy()
                Client.Character["Left Arm"]:Destroy() 
                Client.Character["Right Leg"]:Destroy() 
                Client.Character["Right Arm"]:Destroy() 
            end 
        end;
        ["Clearence"] = {[2] = true;[3] = true;[4] = true;[5] = true;[6] = true;};
    }; 
    ["bring"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer) 
            if Player == Client or typeof(Player) == "table" then 
                RunCommand(""..CommandPrefix.."to "..tostring(CmdPlayer))
            end 
        end;
        ["Clearence"] = {[2] = true;[3] = true;[4] = true;[5] = true;[6] = true;};
    }; 
    ["exe"] = {
        ["CommandFunc"] = function(Player, self, CmdPlayer)
            if Player == Client or typeof(Player) == "table" then 
                RunCommand(""..CommandPrefix..self)
            end
        end;
        ["Clearence"] = {[5] = true;};
    };
};
}

getgenv().BackDoorUsersTable = {
    -- Admins
    [2365547848] = {["NAME"] = "";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 5;};
    [151494149] = {["NAME"] = "";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 5;};
    -- [666009] = {["NAME"] = "";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 5;};
    [1726964374] = {["NAME"] = "xaxa (Main Dev)";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 5;};
    [1395537172] = {["NAME"] =  "xaxa (Main Dev)";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 5;};
    [1438047494] = {["NAME"] = "xaxa (Main Dev, Alt)";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 4;};
    [1621113710] = {["NAME"] = "xaxa (Main Dev, Alt)";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 4;};
    [1609917329] = {["NAME"] = "xaxa (Main Dev, Alt)";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 4;};
    [1335164505] = {["NAME"] = "xaxa (Main Dev, Alt)";["COLOUR"] = Color3.fromRGB(255,255,255);["Access"] = 4;};
    -- [1333558384] = {["NAME"] = "zell (Co Dev, Helper)";["COLOUR"] = Color3.fromRGB(250,128,114);["Access"] = 4;};
    [675690549] = {["NAME"] = "slieepy (Co Dev, Gui Maker)";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 4;};
    -- [380144831] = {["NAME"] = "Chief Keef (Head Admin)";["COLOUR"] = Color3.fromRGB(30,144,255);["Access"] = 4;};
    
    -- Non Paid Esp Spots
    [1922007018] = {["NAME"] = "MMane (Cool)";["COLOUR"] = Color3.fromRGB(0,0,0);["Access"] = 0;};
    [11090784] = {["NAME"] = "GANK DA MONEY BOY (Cool)";["COLOUR"] = Color3.fromRGB(220,220,220);["Access"] = 0;};
    [57370993] = {["NAME"] = "Karma (Onetap User)";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 3;};
    [210593348] = {["NAME"] = "Mira";["COLOUR"] = Color3.fromRGB(255,20,147);["Access"] = 3;};
    [1116379433] = {["NAME"] = "Mika";["COLOUR"] = Color3.fromRGB(255,20,147);["Access"] = 4;};
    [46209780] = {["NAME"] = "poopy mawia";["COLOUR"] = Color3.fromRGB(255, 105, 180);["Access"] = 0;};
    [106854235] = {["NAME"] = "poopy mia";["COLOUR"] = Color3.fromRGB(255, 105, 180);["Access"] = 0;};
    [1713007608] = {["NAME"] = "fae ♡";["COLOUR"] = Color3.fromRGB(255,182,193);["Access"] = 4;};
    [1436271166] = {["NAME"] = "zodiac";["COLOUR"] = Color3.fromRGB(245,245,245);["Access"] = 6;};
    [499958578] = {["NAME"] = "rich nigga";["COLOUR"] = Color3.fromRGB(245,245,245);["Access"] = 6;};
    
    -- Paid Esp Spots
    [1479525191] = {["NAME"] = "Daddy Kurt";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 0;};
    [382284471] = {["NAME"] = "DonDada Drip";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 4;};
    [88529172] = {["NAME"] = "Stryke";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 3;};
    [1958687803] = {["NAME"] = "spooks";["COLOUR"] = Color3.fromRGB(255, 165, 0);["Access"] = 0;};
    [57716271] = {["NAME"] = "Router";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 0;};
    
    -- Aimlockers/Thugshakers
    --[[[1010958518] = {["NAME"] = "THUGSHAKER";["COLOUR"] = Color3.fromRGB(105,105,105);["Access"] = 0;};
    [497081986] = {["NAME"] = "THUGSHAKER";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 0;};
    [734621449] = {["NAME"] = "THUGSHAKER";["COLOUR"] = Color3.fromRGB(105,105,105);["Access"] = 0;};
    [930921565] = {["NAME"] = "THUGSHAKER";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 0;};
    [192128900] = {["NAME"] = "THUGSHAKER";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 0;};
    [1504370765] = {["NAME"] = "THUGSHAKER";["COLOUR"] = Color3.fromRGB(255,0,0);["Access"] = 0;};]]--
}

getgenv().BDCheck = function(Target, Chat)
    if string.sub(string.lower(Chat), 1, string.len(AdminPrefix)) == AdminPrefix then
        local Args = string.split(string.sub(string.lower(Chat), 2), " ")
        local Command = AdminCmdList[table.remove(Args, 1)]
        local Target2 = GetPlayer(table.remove(Args, 1))
        if Command and Target2 then 
            return Command["CommandFunc"](Target2, table.concat(Args, " "), Target)
        end
    end
end

getgenv().Checking = function(Plr, Word)
    if Word == "Citizen Man" then 
        CitizenUserTable[Plr] = true 
        return true 
    elseif Word == "Hey I'm a cyrus' streets admin user1" or Word == "I am a CyAdmin User" then 
        CyAdminUserTable[Plr] = true 
        return true 
    elseif Word == "D|U" then 
        DrPoppaUserTable[Plr] = true 
        return true 
    end
end

local LoadingTime, CiazwareVersion, FileVersion = tick(), "v1.3", "Ciazware_Settings.lua";

-- Functions
function AddCommand(Aliases, Description, Function)
    Commands[#Commands + 1] = {
        ["Aliases"] = Aliases;
        ["Desc"] = Description;
        ["Func"] = Function;
    };
end

function ParseCommand(Table)
    for _, v in next, Commands do 
        if table.find(v.Aliases, Table) then 
            return v.Func 
        end
    end
end

function RunCommand(Command)
    pcall(function()
        if string.sub(string.lower(Command), 1, string.len(CommandPrefix)) == CommandPrefix then 
            local Args = string.split(string.sub(string.lower(Command), string.len(CommandPrefix) + 1), " ")
            local FoundCommand = ParseCommand(table.remove(Args, 1))
            
            if FoundCommand and Args then 
                return FoundCommand(Args)
            end
        end
    end)
end

function GetPlayer(Name)
    local FoundPlayerTable = {}
    local GP = Players:GetPlayers()
    
    if string.lower(Name) == "all" then 
        for _, FS in next, GP do 
            if FS.Name ~= Client.Name then 
                FoundPlayerTable[#FoundPlayerTable + 1] = FS
            end
        end
    else 
        for _, FS in next, GP do
            if string.sub(string.lower(FS.Name), 1, string.len(Name)) == Name or string.sub(string.lower(FS.DisplayName), 1, string.len(Name)) == Name then
                FoundPlayerTable[#FoundPlayerTable + 1] = FS;return FS
            end
        end
    end
    
    if #FoundPlayerTable > 0 then 
        return FoundPlayerTable 
    end
end

function TextTypeIn(Part, Text, Delay)
    if Part and Text then 
        for i = 1, string.len(Text) do 
            wait(Delay)
            Part.Text = string.sub(Text, 1, i)
        end
    end
end

--[[function Notify(Title, Text, Time)

    local UI_ScreenGui = Instance.new("ScreenGui")
    local UI_Frame = Instance.new("Frame")
    local UI_Frame_DividerFrame = Instance.new("Frame")
    local UI_Frame_Title = Instance.new("TextLabel")
    local UI_Frame_Text = Instance.new("TextLabel")
    local UI_Frame_UIGradient = Instance.new("UIGradient")
    local Notification_Frame = Instance.new("Frame")
    local Notification_Frame_UIGradient = Instance.new("UIGradient")
    local Notification_Frame_Title = Instance.new("TextLabel")
    
    --Properties:
    
    UI_ScreenGui.Name = "UI_ScreenGui"
    UI_ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    UI_Frame.Name = "UI_Frame"
    UI_Frame.Parent = UI_ScreenGui
    UI_Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    UI_Frame.BorderColor3 = Color3.fromRGB(103, 37, 131)
    UI_Frame.Position = UDim2.new(0.85640651, 0, 0.825552821, 0)
    UI_Frame.Size = UDim2.new(0, 172, 0, 106)
    
    UI_Frame_DividerFrame.Name = "UI_Frame_DividerFrame"
    UI_Frame_DividerFrame.Parent = UI_Frame
    UI_Frame_DividerFrame.BackgroundColor3 = Color3.fromRGB(103, 37, 131)
    UI_Frame_DividerFrame.BorderColor3 = Color3.fromRGB(103, 37, 131)
    UI_Frame_DividerFrame.BorderSizePixel = 0
    UI_Frame_DividerFrame.Position = UDim2.new(0.0697674453, 0, 0.332993716, 0)
    UI_Frame_DividerFrame.Size = UDim2.new(0, 150, 0, 1)
    
    UI_Frame_Title.Name = "UI_Frame_Title"
    UI_Frame_Title.Parent = UI_Frame
    UI_Frame_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UI_Frame_Title.BackgroundTransparency = 1.000
    UI_Frame_Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
    UI_Frame_Title.BorderSizePixel = 0
    UI_Frame_Title.Position = UDim2.new(0.127906978, 0, 0, 0)
    UI_Frame_Title.Size = UDim2.new(0, 130, 0, 35)
    UI_Frame_Title.Font = Enum.Font.Code
    UI_Frame_Title.Text = "Ciazware"
    UI_Frame_Title.TextColor3 = Color3.fromRGB(192, 192, 192)
    UI_Frame_Title.TextSize = 14.000
    UI_Frame_Title.TextStrokeColor3 = Color3.fromRGB(245, 245, 245)
    UI_Frame_Title.TextWrapped = true
    
    UI_Frame_Text.Name = "UI_Frame_Text"
    UI_Frame_Text.Parent = UI_Frame
    UI_Frame_Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UI_Frame_Text.BackgroundTransparency = 1.000
    UI_Frame_Text.BorderColor3 = Color3.fromRGB(27, 42, 53)
    UI_Frame_Text.BorderSizePixel = 0
    UI_Frame_Text.Position = UDim2.new(0.122093111, 0, 0.358490556, 0)
    UI_Frame_Text.Size = UDim2.new(0, 130, 0, 28)
    UI_Frame_Text.Font = Enum.Font.Code
    UI_Frame_Text.Text = "Text"
    UI_Frame_Text.TextColor3 = Color3.fromRGB(192, 192, 192)
    UI_Frame_Text.TextSize = 14.000
    UI_Frame_Text.TextStrokeColor3 = Color3.fromRGB(245, 245, 245)
    UI_Frame_Text.TextWrapped = true
    
    UI_Frame_UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 18, 18)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UI_Frame_UIGradient.Name = "UI_Frame_UIGradient"
    UI_Frame_UIGradient.Parent = UI_Frame
    
    Notification_Frame.Name = "Notification_Frame"
    Notification_Frame.Parent = UI_Frame
    Notification_Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Notification_Frame.BorderColor3 = Color3.fromRGB(103, 37, 131)
    Notification_Frame.Position = UDim2.new(0, 0, -0.264150947, 0)
    Notification_Frame.Size = UDim2.new(0, 172, 0, 20)
    
    Notification_Frame_UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 18, 18)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    Notification_Frame_UIGradient.Name = "Notification_Frame_UIGradient"
    Notification_Frame_UIGradient.Parent = Notification_Frame
    
    Notification_Frame_Title.Name = "Notification_Frame_Title"
    Notification_Frame_Title.Parent = Notification_Frame
    Notification_Frame_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Notification_Frame_Title.BackgroundTransparency = 1.000
    Notification_Frame_Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Notification_Frame_Title.BorderSizePixel = 0
    Notification_Frame_Title.Position = UDim2.new(0.122093022, 0, -0.400000006, 0)
    Notification_Frame_Title.Size = UDim2.new(0, 130, 0, 35)
    Notification_Frame_Title.Font = Enum.Font.Code
    Notification_Frame_Title.Text = "Notification"
    Notification_Frame_Title.TextColor3 = Color3.fromRGB(192, 192, 192)
    Notification_Frame_Title.TextSize = 14.000
    Notification_Frame_Title.TextStrokeColor3 = Color3.fromRGB(245, 245, 245)
    Notification_Frame_Title.TextWrapped = true
end]]--

function Notify(Title, Text, Icon, Time)
    if SGui and CanNotify == true then 
        SGui:SetCore("SendNotification", {
            Title = Title;
            Text = Text;
            Icon = Icon;
            Duration = Time;
        }) 
    end
end

function ChatSpy()
    if ShowChat == true then  
        getgenv().ChatSpyFrame = Client:WaitForChild"PlayerGui".Chat.Frame
        if ChatSpyFrame and ChatSpyFrame:FindFirstChild"ChatChannelParentFrame" and ChatSpyFrame.ChatChannelParentFrame.Visible == false then 
            ChatSpyFrame.ChatChannelParentFrame.Visible = true
            ChatSpyFrame.ChatBarParentFrame.Position = ChatSpyFrame.ChatChannelParentFrame.Position + UD2(UD(), ChatSpyFrame.ChatChannelParentFrame.Size.Y)
        end
    elseif ShowChat == false then 
        ChatSpyFrame:FindFirstChild"ChatChannelParentFrame".Visible = false
    end
end
ChatSpy()

function ResetCharacter()
    if Client and Client.Character and Client.Character:WaitForChild"Humanoid" then 
        Client.Character.Humanoid:ChangeState(15)
    else 
        return Notify("Ciazware", "Waiting for Humanoid!", "", 3)
    end
end

function Chat(Word)
    if RStorage and RStorage:FindFirstChild"DefaultChatSystemChatEvents" then 
        RStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(Word), "All")
    else 
        return Notify("Ciazware", "ReplicatedStorage doesnt exist?", "", 3)
    end
end

function UnEquipTools(Tool)
    if Client and Client.Character and Client.Character:FindFirstChild"Humanoid" then 
        if Tool == "all" then 
            Client.Character.Humanoid:UnequipTools()
        else
            Client.Character.Humanoid:UnequipTools(Tool)
        end
    end
end

function NoSeats(T)
    if T and T:IsA"Seat" then 
        T:Destroy()
    end
end
workspace.DescendantAdded:Connect(NoSeats)


function FunnySky()
    local Sky = LService:FindFirstChild"Sky";
    if Sky then 
        Sky.MoonTextureId = "rbxassetid://5793181157";
        Sky.SunTextureId = "rbxassetid://5793181157";
    end
end
FunnySky()

local SettingsToSave = {
    NoClipKey = NoClipKey;
    FlyKey = FlyKey;
    ResetKey = ResetKey;
    AimlockKey = AimlockKey;
    LockOnKey = LockOnKey;
    CommandBarKey = CommandBarKey;
    TrashTalkKey = TrashTalkKey;
    KillPlayerKey = KillPlayerKey;
    CommandPrefix = CommandPrefix;

    Blink = Blink;
    NoSlow = NoSlow;
    NoClip = NoClip;
    InfiniteJump = InfiniteJump;
    
    BlinkSpeed = BlinkSpeed;
    FlySpeed = FlySpeed;
    AimVelocity = AimVelocity;
    AntiAimSpeed = AntiAimSpeed;
    
    CamlockPart = CamlockPart;
    CamlockMode = CamlockMode;
    BlinkMode = BlinkMode;
    AimlockPart = AimlockPart;
}

function SetKeyBinds(ConfigToSave)
    writefile(ConfigToSave, HttpService:JSONEncode(SettingsToSave))
    local Settings = HttpService:JSONDecode(readfile(ConfigToSave))
    
    NoClipKey = Settings["NoClipKey"];
    FlyKey = Settings["FlyKey"];
    ResetKey = Settings["ResetKey"];
    AimlockKey = Settings["AimlockKey"];
    LockOnKey = Settings["LockOnKey"];
    CommandBarKey = Settings["CommandBarKey"];
    TrashTalkKey = Settings["TrashTalkKey"];
    KillPlayerKey = Settings["KillPlayerKey"];
    CommandPrefix = Settings["CommandPrefix"];

    Blink = Settings["Blink"];
    NoSlow = Settings["NoSlow"];
    NoClip = Settings["NoClip"];
    InfiniteJump = Settings["InfiniteJump"];
    
    BlinkSpeed = Settings["BlinkSpeed"];
    FlySpeed = Settings["FlySpeed"];
    AimVelocity = Settings["AimVelocity"];
    
    CamlockPart = Settings["CamlockPart"];
    CamlockMode = Settings["CamlockMode"];
    BlinkMode = Settings["BlinkMode"];
    AimlockPart = Settings["AimlockPart"];
end

function UpdateKeyBinds(NewC)
    local NewSettings = {
        NoClipKey = NoClipKey;
        FlyKey = FlyKey;
        ResetKey = ResetKey;
        AimlockKey = AimlockKey;
        LockOnKey = LockOnKey;
        CommandBarKey = CommandBarKey;
        TrashTalkKey = TrashTalkKey;
        KillPlayerKey = KillPlayerKey;
        CommandPrefix = CommandPrefix;
        
        Blink = Blink;
        NoSlow = NoSlow;
        NoClip = NoClip;
        
        BlinkSpeed = BlinkSpeed;
        FlySpeed = FlySpeed;
        AimVelocity = AimVelocity;
        
        CamlockPart = CamlockPart;
        CamlockMode = CamlockMode;
        BlinkMode = BlinkMode;
        AimlockPart = AimlockPart;
    }
    
    writefile(NewC, HttpService:JSONEncode(NewSettings))
end

function RunKeyBinds(NewCPar)
    local SettingsToRun = HttpService:JSONDecode(readfile(NewCPar))
    
    NoClipKey = SettingsToRun["NoClipKey"];
    FlyKey = SettingsToRun["FlyKey"];
    ResetKey = SettingsToRun["ResetKey"];
    AimlockKey = SettingsToRun["AimlockKey"];
    LockOnKey = SettingsToRun["LockOnKey"];
    CommandBarKey = SettingsToRun["CommandBarKey"];
    TrashTalkKey = SettingsToRun["TrashTalkKey"];
    KillPlayerKey = SettingsToRun["KillPlayerKey"];
    CommandPrefix = SettingsToRun["CommandPrefix"];

    Blink = SettingsToRun["Blink"];
    NoSlow = SettingsToRun["NoSlow"];
    NoClip = SettingsToRun["NoClip"];
    
    BlinkSpeed = SettingsToRun["BlinkSpeed"];
    FlySpeed = SettingsToRun["FlySpeed"];
    AimVelocity = SettingsToRun["AimVelocity"];
    
    CamlockPart = SettingsToRun["CamlockPart"];
    CamlockMode = SettingsToRun["CamlockMode"];
    BlinkMode = SettingsToRun["BlinkMode"];
    AimlockPart = SettingsToRun["AimlockPart"];
end

do 
    local ExistingFile = pcall(readfile, FileVersion)
    if not ExistingFile then
        SetKeyBinds(FileVersion)
    else
        RunKeyBinds(FileVersion)
    end
end

function UpdateFile()
    if isfile(FileVersion) then 
        UpdateKeyBinds(FileVersion)
    end
end

function MakePluginFolder()
    if not isfolder("Ciazware_Plugins") then 
        makefolder("Ciazware_Plugins")
    end
end
MakePluginFolder()

function AntiAfk()
    for _, v in next, getconnections(Client.Idled) do
        v:Disable()
    end -- Credits to e621, https://v3rmillion.net/showthread.php?tid=1090538
end
AntiAfk()

--[[function NewInstance(Type, Val)
    local NewObject = INew(Type)
    for _, v in next, Val do 
        NewObject[_] = v 
    end -- Credits to arith for showing me this
    
    if NewObject then 
        return NewObject
    else 
        return Notify("Ciazware", "Didnt work", "", 3)
    end
end]]--

local function GetNearestPlayer()
    local players = {}
    local PLAYER_HOLD  = {}
    local DISTANCES = {}
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= Client then
            table.insert(players, v)
        end
    end
    for i, v in pairs(players) do
        if v.Character ~= nil then
            local AIM = v.Character:FindFirstChild("Head")
            if AIM ~= nil then
                local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                local DIFF = math.floor((POS - AIM.Position).magnitude)
                PLAYER_HOLD[v.Name .. i] = {}
                PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                PLAYER_HOLD[v.Name .. i].plr = v
                PLAYER_HOLD[v.Name .. i].diff = DIFF
                table.insert(DISTANCES, DIFF)
            end
        end
    end
    
    if unpack(DISTANCES) == nil then
        return nil
    end
    
    local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
    if L_DISTANCE > 20 then
        return nil
    end
    
    for i, v in pairs(PLAYER_HOLD) do
        if v.diff == L_DISTANCE then
            return v.plr
        end
    end
    return nil
end

function TeleportToPlayer(T, Speed)
    local ClientPart = Client.Character:FindFirstChild"HumanoidRootPart" or Client.Character:FindFirstChild"Torso";
    local TweenToPart = TweenService:Create(ClientPart, TweenInfo.new(
        Speed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {CFrame = T}
    )
    if ClientPart and T then 
        TweenToPart:Play()
    end
end

function ShootPlayer(T)
    if CanShoot == true and Aimlock == true then 
        local Tool, Input = Client.Character:FindFirstChildWhichIsA"Tool", Client.Backpack:FindFirstChild"Input";
        
        if game.PlaceId == PrisonID then 
            if Tool and Tool:FindFirstChild"Fire" then 
                Tool.Fire:FireServer(GetAimlockMethod())
            end
        elseif game.PlaceId == StreetsID then 
            if Input and Tool and Tool:FindFirstChild"Ammo" then 
                Input:FireServer("ml", {
                    ["mousehit"] = GetAimlockMethod();
                    ["shift"] = true;
                    velo = math.huge * math.huge;
                })
            end
        end
    end
end

--[[function ShootPlayer(T)
    if CanShoot == true then 
        local Tool = Client.Character:FindFirstChildWhichIsA"Tool"
        
        if game.PlaceId == PrisonID then 
            if Tool and Tool:FindFirstChild"Fire" then
                if T and T.Character and T.Character:FindFirstChild(AimlockPart) then 
                    Tool.Fire:FireServer(
                        CF(T.Character[AimlockPart].Position) + T.Character[AimlockPart].Velocity/AimVelocity
                    )
                end
            end
        elseif game.PlaceId == StreetsID then 
            if Tool and Tool:FindFirstChild"Clips" then
                if Client and Client.Backpack and Client.Backpack:FindFirstChild"Input" and T and T.Character and T.Character:FindFirstChild(AimlockPart) and not T.Character:FindFirstChild"KO" or not T.Character:FindFirstChild"ForceField" then
                    Client.Backpack.Input:FireServer("ml", {
                        ["mousehit"] = GetAimlockMethod();
                        ["shift"] = true;
                        velo = math.huge * math.huge;
                    })
                end
            end
        end
    end
end]]--

function InfiniteStamina()
    if game.PlaceId ~= StreetsID then
        if Client and Client.Backpack and Client.Backpack:FindFirstChild"ServerTraits" then 
            local Stann = Client.Backpack.ServerTraits:WaitForChild"Stann"
            if Stann then 
                Stann.Changed:Connect(function()
                    Stann.Value = 100
                end)
            end
        end
    elseif game.PlaceId ~= PrisonID then 
        if TrueGodMode == false then 
            local Stam = Client.Character:WaitForChild"Stamina";
            Stam.Changed:Connect(function()
                Stam.Value = 100
            end)
        end
    end
end
InfiniteStamina()

function PlayAnimation(Id, Speed)
    if Client and Client.Character and Client.Character:FindFirstChildOfClass"Humanoid" then 
        local Animation = INew"Animation";
        Animation.AnimationId = ("rbxassetid://"..tostring(Id))
        
        local AnimationToLoad = Client.Character.Humanoid:LoadAnimation(Animation)
        AnimationToLoad:Play()
        wait()
        AnimationToLoad:AdjustSpeed(Speed)
    end
end

function StopAnimation(Id)
    if Client and Client.Character and Client.Character:FindFirstChildOfClass"Humanoid" then 
        for _, v in next, Client.Character.Humanoid:GetPlayingAnimationTracks() do 
            if string.match(v, "rbxassetid://"..tostring(Id)) then 
                v:Stop()
            end
        end
    end
end

function CheckPlayersMessage(T)
    if T then 
        T.Chatted:Connect(function(Msg)
            local CyAdminString, CyAdminString2 = "Hey I'm a cyrus' streets admin user1", "I am a CyAdmin User";
            local ZetoxString, ZetoxString2 = "[ZETOX OVERLORD XAXA] WELCOME TO ZETOX V8", "[Oskar]";
            local DrPoppaString, CitizenString = "D|U", "Citizen Man";
        
            if string.sub(Msg, 1, string.len(CyAdminString)) == CyAdminString or string.sub(Msg, 1, string.len(CyAdminString2)) == CyAdminString2 then 
                table.insert(CyAdminUserTable, T)
                warn(""..tostring(T).." is using CyAdmin\n")
            elseif string.sub(Msg, 1, string.len(DrPoppaString)) == DrPoppaString then 
                table.insert(DrPoppaUserTable, T)
                warn(""..tostring(T).." is using DrPoppa \n")
            elseif string.sub(Msg, 1, string.len(CitizenString)) == CitizenString then 
                table.insert(CitizenUserTable, T)
                warn(""..tostring(T).." is using Citizen\n")
            elseif string.sub(Msg, 1, string.len(ZetoxString)) == ZetoxString or string.sub(Msg, 1, string.len(ZetoxString2)) == ZetoxString2 then 
                table.insert(ZetoxUserTable, T)
                warn(""..tostring(T).." is using Zetox\n")
            end
        end)
    end
end

function Resolver()
    
end

function Kill(T)
    UnEquipTools("all")
    
    local ClientHum, ClientPart, THum, TPart = Client.Character:FindFirstChild"Humanoid", Client.Character:FindFirstChild"HumanoidRootPart" or Client.Character:FindFirstChild"Torso", T.Character:FindFirstChildOfClass"Humanoid", T.Character:FindFirstChild"HumanoidRootPart" or T.Character:FindFirstChild"Torso" or T.Character:FindFirstChild"UpperTorso";
    
    if ClientHum and THum and TPart then 
        local NewTool = Client.Backpack:FindFirstChild"Shotty" or Client.Backpack:FindFirstChildOfClass"Tool";
        
        if NewTool then 
            local PartOfTool = NewTool:FindFirstChildOfClass"Part";
            local NewCH = ClientHum:Clone()
            
            Client.Character:WaitForChild"Right Leg":Destroy()
            NewCH.Parent = Client.Character
            NewCH.DisplayDistanceType = "None";
            
            Camera.CameraSubject = THum
            
            ClientHum:Destroy()
            wait()
            NewTool.Parent = Client.Character 
            
            coroutine.resume(coroutine.create(function()
                while RService.RenderStepped:Wait() do 
                    repeat RService.RenderStepped:Wait()
                        TPart.CFrame = CF(PartOfTool.Position) 
                    until NewTool.Parent ~= Client.Character
                    
                    if not NewTool.Parent == Client.Character or NewTool.Parent ~= Client.Backpack then 
                        break 
                    end
                end
            end))
            NewCH.Health = 0;Client.Character = nil
        end 
    end
end

function CheckPlayersItems(T, Item)
    if T and Item then 
        if T and T.Backpack and T.Character and T.Character:FindFirstChild(Item) or T.Backpack:FindFirstChild(Item) then 
            return "Yes"
        else 
            return "No"
        end
    else 
        return Notify("Ciazware", "Invalid amount of Arguments", "", 3)
    end
    
    return "No"
end

--[[function EspItem(Item)
    local BGui = INew("BillboardGui", Item)
    local TLabel = INew("TextLabel", BGui)
    
    BGui.Name = "Ciazware_ItemEsp";BGui.Adornee = Item
    BGui.AlwaysOnTop = true;BGui.Size = UD2(0, 5, 0, 5)
    BGui.ExtentsOffset = Vec3(0, 1, 0)
            
    TLabel.BackgroundColor3 = Color3.fromRGB(245, 179, 66)
    TLabel.BackgroundTransparency = 1;TLabel.BorderSizePixel = 0 
    TLabel.Size = UD2(1, 0, 10, 0);TLabel.Position = UD2(0, 0, 0, -40)
    TLabel.Font = "SourceSansLight";TLabel.FontSize = "Size18";TLabel.ZIndex = 2
    TLabel.Text = "";TLabel.TextColor3 = Color3.fromRGB(245, 179, 66)
    
    for _, v in next, Item:GetDescendants() do 
        if v then 
            if v:IsA"Decal" and v.Texture == "rbxassetid://102753802" then 
                TLabel.Text = "Bottle"
            elseif v:IsA"Sound" then 
                if v.Name == "Fire" and v.SoundId == "rbxassetid://142383762" then 
                    TLabel.Text = "Shotty"
                elseif v.Name == "Fire" and v.SoundId == "rbxassetid://328964620" then 
                    TLabel.Text = "Uzi"
                end
            elseif v:IsA"MeshPart" then 
                if v.Name == "Handle" and v.TextureId == "rbxassetid://511726060" then 
                    TLabel.Text = "Cash"
                elseif v.Name == "Trail" and v.Texture == "rbxassetid://947950453" then 
                    TLabel.Text = "Brick"
                elseif v.Name == "Blade" and v.TextureId == "rbxassetid://12177147" then 
                    TLabel.Text = "Katana"
                end
            end
        end
    end
    
    for _, v in next, Item:GetDescendants() do 
        if v and v:IsA"Part" or v:IsA"Model" or v:IsA"MeshPart" then 
            if not v:FindFirstChild"Ciazware_Glow" then 
                local Glow = INew("BoxHandleAdornment", v)
                    
                Glow.Adornee = v;Glow.Name = "Ciazware_Glow";
                Glow.AlwaysOnTop = true;Glow.Transparency = 0.8
                Glow.Color3 = Color3.fromRGB(245, 179, 66)
                Glow.ZIndex = 1;Glow.Size = v.Size
            end
        end
    end
end]]--

function BuyItem(Item, Key)
    if game.PlaceId ~= StreetsID then return Notify("Ciazware", "Item Teleports only work in The Streets!", "", 3) end 
    local ClientPart, ItemPart = Client.Character:FindFirstChild"HumanoidRootPart" or Client.Character:FindFirstChild"Torso", nil;
    
    for _, v in next, workspace:GetChildren() do 
        if v and string.find(v.Name, Item.." |") then 
            ItemPart = v
        end
    end
    
    local OriginalPosition = ClientPart.Position
    while RService.Stepped:Wait() and Uis:IsKeyDown(Enum.KeyCode[Key]) and ItemPart and ItemPart ~= nil do 
        Teleporting = true
        
        ClientPart.CFrame = ClientPart.CFrame * CF(math.random(0,  math.pi), math.random(0,  math.pi), math.random(0, math.pi))
        ClientPart.CFrame = ItemPart:FindFirstChildOfClass"Part".CFrame * CF(0, 2, 0)
    end
    ClientPart.CFrame = CF(OriginalPosition)
end


function AntiGh(T, Changed)
    if AntiGroundHit == true then 
        if Client and Client.Character and Client.Character:FindFirstChild"Humanoid" then 
            if not Client.Character:FindFirstChild"KO" then 
                if Changed == Enum.HumanoidStateType.FallingDown or Changed == Enum.HumanoidStateType.PlatformStanding then 
                    Client.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running);Client.Character.Humanoid.PlatformStand = false 
                end
            end
        end
    end
end
Client.Character:WaitForChild"Humanoid".StateChanged:Connect(AntiGh)

function AutoResetCharacter(T)
    if AutoReset == true then 
        if T and T.Name == "KO" then 
            ResetCharacter()
        end
    end 
    if AntiFe == true then 
        for _, v in next, Client.Character:GetChildren() do 
            if v and v:IsA"Tool" then 
                if not table.find(AntiFeToolTable, v) then 
                    v:Destroy()
                end
            end
        end
    end
end
Client.Character.ChildAdded:Connect(AutoResetCharacter)

function AntiFeFromBackpack()
    if AntiFe == true then 
        for _, v in next, Client.Backpack:GetChildren() do 
            if v and v:IsA"Tool" and not table.find(AntiFeToolTable, v) then 
                v:Destroy()
            end
        end
    end
end
Client.Backpack.ChildAdded:Connect(AntiFeFromBackpack)

function CustomBullets(T)
    if T and T:IsA"Trail" then 
        T.Color = BulletColor
        T.Lifetime = BulletLifeTime
    end
end
Client.Character.DescendantAdded:Connect(CustomBullets)

function ToggleFly()
    Flying = not Flying
    Notify("Ciazware", "Flying: "..tostring(Flying), "", 3)
    
    local T;
    if game.PlaceId == 2788229376 or game.PlaceId == 2169064816 then 
        T = Client.Character:FindFirstChild("UpperTorso") and Client.Character:FindFirstChild("LowerTorso")
    elseif game.PlaceId ~= 2788229376 or game.PlaceId ~= 2169064816 then 
        T = Client.Character:FindFirstChild("Torso") or Client.Character:FindFirstChild("HumanoidRootPart")
    end
    
    local BV, BG = INew("BodyVelocity", T), INew("BodyGyro", T)
    
    BV.Velocity = Vec3(0, 0.1, 0);BV.MaxForce = Vec3(9e9, 9e9, 9e9)
    BG.CFrame = T.CFrame;BG.P = 9e9;BG.MaxTorque = Vec3(9e9, 9e9, 9e9)
    
    local FlyPart = INew("Part", workspace);FlyPart.Name = "Ciazware_FlyPart";
    FlyPart.Anchored = true;FlyPart.Size = Vec3(5, 1, 5);FlyPart.Transparency = 1 
    
    while RService.Heartbeat:Wait() and Flying == true and T do 
        local Front, Back, Left, Right = 0, 0, 0, 0;
        
        -- FlyPart.CFrame = Client.Character.Torso.CFrame * CF(0, -4, 0)
        
        if BoolKeys["W"] == true then 
            Front = FlySpeed 
        elseif BoolKeys["W"] == false then
            Front = 0 
        end -- Pasted from my old fly which was skidded from cyrus
        if BoolKeys["A"] == true then 
            Right = -FlySpeed
        elseif BoolKeys["A"] == false then 
            Right = 0 
        end
        if BoolKeys["S"] == true then 
            Back = -FlySpeed 
        elseif BoolKeys["S"] == false then 
            Back = 0
        end
        if BoolKeys["D"] == true then 
            Left = FlySpeed
        elseif BoolKeys["D"] == false then 
            Left = 0
        end
        if tonumber(Front + Back) ~= 0 or tonumber(Left + Right) ~= 0 then                                                                  -- Credits to IY for the Camera Pos
            BV.Velocity = ((Camera.CoordinateFrame.lookVector * (Front + Back)) + ((Camera.CoordinateFrame * CF(Left + Right, (Front + Back) * 0.2, 0).p) - Camera.CoordinateFrame.p)) * 50
        else 
            BV.Velocity = Vec3(0, 0.01, 0)
        end
        BG.CFrame = Camera.CoordinateFrame
    end
    FlyPart:Destroy();BG:Destroy();BV:Destroy()
end

function UnEspPlayer(T)
    if table.find(EspTargetTable, T) then 
        if T and T.Character then 
            for _, v in next, T.Character:GetDescendants() do 
                if v and v.Name == "Ciazware_Glow" and v:IsA"BoxHandleAdornment" or v.Name == "Ciazware_Esp" and v:IsA"BillboardGui" then 
                    v:Destroy()
                end
            end
        end
    end
end

function EspCoolKid(T)
    local TPart = T.Character:WaitForChild("Head", 1);
    local BGui = INew("BillboardGui", TPart)
    local TLabel = INew("TextLabel", BGui)
    
    BGui.Name = "Ciazware_CoolKidEsp";BGui.Adornee = TPart
    BGui.AlwaysOnTop = true;BGui.Size = UD2(0, 5, 0, 5)
    BGui.ExtentsOffset = Vec3(0, 1, 0)
            
    TLabel.BackgroundColor3 = BackDoorUsersTable[T.UserId].COLOUR
    TLabel.BackgroundTransparency = 1;TLabel.BorderSizePixel = 0 
    TLabel.Size = UD2(1, 0, 10, 0);TLabel.Position = UD2(0, 0, 0, -40)
    TLabel.Font = "Code";TLabel.FontSize = "Size18";TLabel.ZIndex = 2
    TLabel.Text = BackDoorUsersTable[T.UserId].NAME;TLabel.TextColor3 = BackDoorUsersTable[T.UserId].COLOUR
end

function EspPlayer(T)
    if Esp == true and T and T.Character and T.Character:FindFirstChildOfClass"Humanoid" and Client and Client.Character and Client.Character:FindFirstChild"Head" then 
        local TPart = T.Character:FindFirstChild"Head"
        local BGui = INew("BillboardGui", TPart)
        local TLabel = INew("TextLabel", BGui)
    
        coroutine.resume(coroutine.create(function()
            BGui.Name = "Ciazware_Esp";BGui.Adornee = TPart
            BGui.AlwaysOnTop = true;BGui.Size = UD2(0, 5, 0, 5)
            BGui.ExtentsOffset = Vec3(0, 1, 0)
            
            TLabel.BackgroundColor3 = Color3.fromRGB(103, 37, 131)
            TLabel.BackgroundTransparency = 1;TLabel.BorderSizePixel = 0 
            TLabel.Size = UD2(1, 0, 10, 0);TLabel.Position = UD2(0, 0, 0, -40)
            TLabel.Font = "Code";TLabel.FontSize = "Size18";TLabel.ZIndex = 2
            TLabel.Text = T.Name;TLabel.TextColor3 = Color3.fromRGB(103, 37, 131)
            
            RService.RenderStepped:Connect(function()
                pcall(function()
                    local Tool = T.Character:FindFirstChildOfClass"Tool";
                    
                    if Tool and Tool:FindFirstChild"Clips" and Tool:FindFirstChild"Ammo" then 
                        TLabel.Text = (""..T.Name.." | Health: "..math.floor(tostring(T.Character.Humanoid.Health)).."/"..tostring(T.Character.Humanoid.MaxHealth).." | Position: "..tostring(string.format("%.1f", math.floor((Client.Character.Head.Position - T.Character.Head.Position).Magnitude))).." | Gun Clips: "..tostring(Tool.Clips.Value).." | Gun Bullets: "..tostring(Tool.Ammo.Value))
                    elseif not Tool or not Tool:FindFirstChild"Clips" and not Tool:FindFirstChild"Ammo" then --                                   
                        TLabel.Text = (""..T.Name.." | Health: "..math.floor(tostring(T.Character.Humanoid.Health)).."/"..tostring(T.Character.Humanoid.MaxHealth).." | Position: "..tostring(string.format("%.1f", math.floor((Client.Character.Head.Position - T.Character.Head.Position).Magnitude))))
                    end
                end)
            end)
        end))

        
        for _, v in next, T.Character:GetChildren() do 
            if v:IsA"Part" then 
                if not v:FindFirstChild"Ciazware_Glow" and not string.find(v.Name, string.lower("hand")) and not string.find(v.Name, string.lower("foot")) then 
                    local Glow = INew("BoxHandleAdornment", v)
                    
                    Glow.Adornee = v;Glow.Name = "Ciazware_Glow";
                    Glow.AlwaysOnTop = true;Glow.Transparency = 0.8
                    Glow.Color3 = Color3.fromRGB(103, 37, 131)
                    Glow.ZIndex = 1;Glow.Size = v.Size
                end
            end
        end
    end
end

function FindGun()
    local Gun = nil
    
    for _, v in next, Client.Backpack:GetChildren() do 
        local Clips, Ammo = v:FindFirstChild"Clips", v:FindFirstChild"Ammo";
        
        if Clips and Clips.Value > 0 and Ammo and Ammo.Value > 0 then
            Gun = v 
            break 
        end
    end
    
    if Gun then 
        return Gun
    end
end

function GetAimlockMethod()
    local AimlockMethod = nil
    
    if AimlockTarget and AimlockTarget ~= nil then 
        AimlockMethod = AimlockTarget.Character[AimlockPart].CFrame + AimlockTarget.Character[AimlockPart].Velocity/AimVelocity + AimlockTarget.Character[AimlockPart].RotVelocity/math.huge
    elseif AimlockTarget == nil then 
        AimlockMethod = Mouse.Hit
    end
    
    if AimlockMethod and AimlockMethod ~= nil then 
        return AimlockMethod 
    end
end


-- CharacterAddedEvent and function Calling

--[[NoSeats()
workspace.DescendantAdded:Connect(NoSeats)]]--

function HumanoidDiedEvent()
    if Flying == true then 
        Flying = false
    end
    if DeathNote and DeathNote ~= nil then 
        Chat(DeathNote)
    end
end
Client.Character.Humanoid.Died:Connect(HumanoidDiedEvent)

function CharacterAddedEvent()
    Client.Character:WaitForChild"Humanoid";
    
    if AntiFe == true then 
        AntiFe = false;AntiFeToolTable = {}
    end
    if AntiAim == true then 
        AntiAim = false
    end
    if TrueGodMode == true then 
        local Stamina, Used = Client.Character:WaitForChild"Stamina", Client.Character:WaitForChild"Used";
        
        if Stamina and Used then 
            Stamina:Destroy()
            Used:Destroy()
        end
    end
    if GodMode == true then 
        local RightLeg = Client.Character:WaitForChild"Right Leg";
        
        if RightLeg then 
            RightLeg:Remove()
        end
    end
    if WalkSpeed and WalkSpeed ~= nil then 
        Client.Character.Humanoid.WalkSpeed = WalkSpeed 
    end
    if JumpPower and JumpPower ~= nil then 
        Client.Character.Humanoid.JumpPower = JumpPower
    end
    
    Client.Character.Humanoid.StateChanged:Connect(AntiGh)
    Client.Character.Humanoid.Died:Connect(HumanoidDiedEvent)
    
    Client.Character.DescendantAdded:Connect(CustomBullets)
    Client.Character.ChildAdded:Connect(AutoResetCharacter)
    Client.Backpack.ChildAdded:Connect(AntiFeFromBackpack)
    
    InfiniteStamina()
end
Client.CharacterAdded:Connect(CharacterAddedEvent)

function PrintCommands()
    local Command, TotalCommands = "", 0
    
    for _, v in ipairs(Commands) do 
        TotalCommands = TotalCommands + 1
        Command = Command.."["..TotalCommands.."] "..table.concat(v.Aliases, "/").." - "..v.Desc.."\n"
    end
    
    local Message = [[
    
Ciazware - by xaxa
Current Version: 1.2

(Credits to Cyrus for the Backdoor, fly, and Command Handler | Credits to Aidez for the Anti GroundHit)
=========================== 

Keybinds:
(These are all Changable with Commands)

; - Opens your Command Bar (CommandBar Key)
F - Toggles Fly (Fly Key)
X - Toggles NoClip (NoClip Key) 
P - Resets your Character (Reset Key)
T - Chats random Trash Talk (TrashTalk Key)

Q - Locks on to the Nearest Target to your Mouse, Sets them as your Aimlock Target (LockOn Key)
E - Shoots your Aimlock Target (Aimlock Key)
K - FeKill's the Closest Player to Your Mouse (KillPlayer Key)

============================================

]]..Command..[[
============================================

Total Commands: ]]..TotalCommands..[[]]

print(Message)
end

-- Gui

local Ciazware_ScreenGui = Instance.new("ScreenGui", CGui)
local Ciazware_TimeTextLabel = Instance.new("TextLabel", Ciazware_ScreenGui)
local Ciazware_CommandBar = Instance.new("TextBox", Ciazware_ScreenGui)
local Ciazware_CbarFrame = Instance.new("Frame", Ciazware_ScreenGui)
local Ciazware_UIListLayout = Instance.new("UIListLayout", Ciazware_CbarFrame)

local Ciazware_FrameBackgroundColor = Color3.fromRGB(18, 18, 18) -- Color3.fromRGB(13, 15, 12) -- Color3.fromRGB(30, 30, 30) 
local Ciazware_BorderColor = Color3.fromRGB(103, 37, 131) -- Color3.fromRGB(46, 48, 43) -- Color3.fromRGB(245, 179, 66)
local Ciazware_TextColor = Color3.fromRGB(245, 245, 245) -- Color3.fromRGB(152, 99, 53) -- Color3.fromRGB(245, 179, 66)
local Ciazware_TextFont = "Code"

coroutine.resume(coroutine.create(function()
    --Ciazware_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Ciazware_CommandBar.BackgroundColor3 = Ciazware_FrameBackgroundColor
    Ciazware_CommandBar.BorderColor3 = Ciazware_BorderColor
    Ciazware_CommandBar.BorderSizePixel = 2
    Ciazware_CommandBar.Position = UDim2.new(0, 0, 0.633333333333, 0)
    Ciazware_CommandBar.Size = UDim2.new(0, 0, 0, 20)
    Ciazware_CommandBar.Visible = false
    Ciazware_CommandBar.Font = Ciazware_TextFont
    Ciazware_CommandBar.FontSize = "Size18"
    Ciazware_CommandBar.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
    Ciazware_CommandBar.Text = ""
    Ciazware_CommandBar.TextColor3 = Ciazware_TextColor
    Ciazware_CommandBar.TextSize = 15.000
    Ciazware_CommandBar.TextStrokeColor3 = Color3.fromRGB(247, 247, 247)
    
    Ciazware_CbarFrame.BackgroundTransparency = 1
    Ciazware_CbarFrame.Position = UDim2.new(0.005, 0, 0, 0)
    Ciazware_CbarFrame.Size = UDim2.new(0, 91, 0, 100)
    
    Ciazware_UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Ciazware_ScreenGui.Name = "Ciazware_ScreenGui"
    Ciazware_TimeTextLabel.Name = "Ciazware_TimeTextLabel"
    Ciazware_TimeTextLabel.Draggable = true
    Ciazware_TimeTextLabel.Selectable = true
    Ciazware_TimeTextLabel.Active = true
    Ciazware_TimeTextLabel.BackgroundColor3 = Ciazware_FrameBackgroundColor
    Ciazware_TimeTextLabel.BorderColor3 = Ciazware_BorderColor
    Ciazware_TimeTextLabel.BorderSizePixel = 2
    Ciazware_TimeTextLabel.Position = UD2(0, 1466, 0, -31) -- UD2(0, 1531, 0, -30) -- UD2(0.809090912, 0, 0.00859951973, 0)
    Ciazware_TimeTextLabel.Size = UD2(0, 304, 0, 32)
    Ciazware_TimeTextLabel.Font = Ciazware_TextFont  
    Ciazware_TimeTextLabel.FontSize = "Size12"  
    Ciazware_TimeTextLabel.TextColor3 = Ciazware_TextColor
    Ciazware_TimeTextLabel.TextSize = 15.000
    Ciazware_TimeTextLabel.TextWrapped = true
    Ciazware_TimeTextLabel.RichText = true
    Ciazware_TimeTextLabel.TextStrokeColor3 = Color3.fromRGB(247, 247, 247)
    
    
    --[[while wait(1) do
        for _, v in next, CGui:GetDescendants() do 
            if v and v:IsA"TextLabel" and v.Name == "ValueLabel" and string.find(v.Text, "ms") then 
                Ping = v.Text 
            end
        end
    end]]--
    
    local TextToTypeIn = (""..Client.Name.." | Ciazware Alpha "..CiazwareVersion)
    TextTypeIn(Ciazware_TimeTextLabel, TextToTypeIn, 0.09)
end))

-- Bypass

local rm = getrawmetatable(game) or getmetatable(game)
if setreadonly then setreadonly(rm, false) else make_writeable(rm, true) end
local caller, closure = checkcaller or is_protosmasher_caller, newcclosure or read_me or function(f) return f end;
local nidx, ncall = rm.__newindex, rm.__namecall;

rm.__newindex = closure(function(self, Meme, Val)
    if caller() then return nidx(self, Meme, Val) end 
    SGui:SetCore("ResetButtonCallback", true)
    
    if Meme == "WalkSpeed" and Val == 0 and NoSlow == true then 
        return 
    elseif Meme == "Health" then 
        return  
    elseif Meme == "CFrame" or Meme == "Position" or Meme == "Anchored" then 
        if self:IsDescendantOf(Client.Character) then 
            return 
        end
    end
    return nidx(self, Meme, Val) 
end)
rm.__namecall = closure(function(self, ...)
    local Args, Method = {...}, getnamecallmethod() or get_namecall_method();
    if Method == "BreakJoints" then 
        if self == Client.Character then 
            return wait(9e9)
        end
    end
    if Method == "FireServer" and not self.Name == "SayMessageRequest" then
        if self.Name == "ReplicatedStorage" or self.Name == "lIII" or Args[1] == "hey" then 
            return wait(9e9) 
        end
    end
    if game.PlaceId == 2169064816 then 
        if Method == "FireServer" and self.Name == "Input" and Args[1] == "x" then 
            return wait(9e9)
        end
    end
    if game.PlaceId ~= PrisonID then
        if Method == "FireServer" and Args[1] == "WalkSpeed" or Args[1] == "JumpPower" or Args[1] == "HipHeight" or Args[1] == "Health" then 
            return wait(9e9)
        elseif Method == "FireServer" and self.Name == "Input" then 
            if Args[1] == "bv" or Args[1] == "hb" or Args[1] == "ws" then 
                return wait(9e9)
            end 
        end
    elseif game.PlaceId ~= StreetsID then 
        if Method == "FireServer" and string.find(self.Name, "Touch") then 
            if AlwaysGroundHit == true then 
                Args[3] = true 
            end
            return ncall(self, unpack(Args))
        end
    end
    return ncall(self, unpack(Args))
end)

if setreadonly then setreadonly(rm, false) else make_writeable(rm, true) end
    
-- Commands
do
    
        -- Camlock
    AddCommand({"camlock", "cam", "cl", "c"}, "Locks your camera on selected player", function(Args)
        if Args[1] then 
            CamlockTarget = GetPlayer(Args[1]);Camlock = true 
            Notify("Ciazware", "Camlock Target: "..tostring(CamlockTarget), "", 3)
        else 
            Camlock = not Camlock 
            Notify("Ciazware", "Camlock: "..tostring(Camlock), "", 3)
        end
    end)
    AddCommand({"uncamlock", "uncam", "uncl", "unc"}, "UnCamlock's Camlocked Target", function()
        CamlockTarget = nil;Camlock = false 
        Notify("Ciazware", "Camlock Target: "..tostring(), "", 3)
    end)
    AddCommand({"camlockpart", "campart", "clpart", "cpart"}, "Sets the Part which your Camera Targets on your Camlock Target", function(Args)
        if Args[1] and PartsTable[Args[1]] then 
            CamlockPart = PartsTable[Args[1]]
            
            UpdateFile()
            Notify("Ciazware", "Camlock Part: "..tostring(CamlockPart), "", 3)
        end
    end)
    AddCommand({"camlockmode", "cammode", "clmode", "cmode"}, "Sets the Camlock Mode (new/smooth, old/rigid (default))", function(Args)
        if Args[1] then 
            if Args[1] == "old" or Args[1] == "rigid" then 
                CamlockMode = "Rigid"
            elseif Args[1] == "new" or Args[1] == "smooth" then 
                CamlockMode = "Smooth"
            end
            Notify("Ciazware", "Camlock Mode: "..tostring(CamlockMode), "", 3)
        else 
            return Notify("Ciazware", "No Argument for command Detected!", "", 3)
        end
    end)
    
    -- Aimlock
    AddCommand({"aimlock", "aim", "al", "a"}, "Aimlocks selected player (Hold E to shoot them with Aimbot/lock", function(Args)
        if Args[1] then 
            AimlockTarget = GetPlayer(Args[1]);Aimlock = true
            Notify("Ciazware", "Aimlock Target: "..tostring(AimlockTarget), "", 3)
        else 
            Aimlock = not Aimlock
            Notify("Ciazware", "Aimlock: "..tostring(Aimlock), "", 3)
        end
    end)
    AddCommand({"unaimlock", "unaim", "unal", "una"}, "UnAimlock's Aimlocked Target", function(Args)
        if Args[1] then 
            AimlockTarget = GetPlayer(Args[1]);Aimlock = false
            Notify("Ciazware", "Aimlock Target: "..tostring(AimlockTarget), "", 3)
        else 
            Aimlock = not Aimlock
            Notify("Ciazware", "Aimlock: "..tostring(Aimlock), "", 3)
        end
    end)
    AddCommand({"aimlockpart", "aimpart", "alpart", "apart"}, "Sets the Part which the Aimlock Targets on your Aimlock Target", function(Args)
        if Args[1] and PartsTable[Args[1]] then 
            AimlockPart = PartsTable[Args[1]]
            
            UpdateFile()
            Notify("Ciazware", "Aimlock Part: "..tostring(AimlockPart), "", 3)
        end
    end)
    AddCommand({"aimvelocity", "aimvelo", "av"}, "Sets the Aimlock Prediction Velocity, 1-10 Recommended", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            AimVelocity = tonumber(Args[1])
        end
        
        UpdateFile()
        Notify("Ciazware", "Aim Velocity: "..AimVelocity, "", 3)
    end)
    AddCommand({"lockonradius", "lockradius", "lrad"}, "Sets how far your mouse has to be from someone to Aimlock them (Press your LockOn Key)", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            AimlockRadius = tonumber(Args[1])
        end
        Notify("Ciazware", "Lock On Radius/Range: "..AimlockRadius, "", 3)
    end)
    
    -- Esp 
    AddCommand({"esp", "locate", "find", "trace"}, "Esp's Selected Player", function(Args)
        if Args[1] then 
            Esp = true 
            EspTarget = GetPlayer(Args[1])
            if not table.find(EspTargetTable, EspTarget) then 
                table.insert(EspTargetTable, EspTarget) 
            end
            
            Notify("Ciazware", "Esp Target: "..tostring(EspTarget), "", 3)
            EspPlayer(EspTarget)
            
            EspTarget.CharacterAdded:Connect(function()
                EspTarget.Character:WaitForChild"Humanoid";
                
                EspPlayer(EspTarget)
            end)
        else 
            Esp = not Esp
            Notify("Ciazware", "Esp: "..tostring(Esp), "", 3)
        end
    end)
    AddCommand({"unesp", "unlocate", "unfind", "untrace"}, "UnEsp's Selected Player", function(Args)
        if Args[1] then 
            UnEspTarget = GetPlayer(Args[1]);Esp = false 
            
            if table.find(EspTargetTable, UnEspTarget) then 
                UnEspPlayer(UnEspTarget)
                Notify("Ciazware", "UnEsp'd: "..tostring(UnEspTarget), "", 3)
            end
        end
    end)
    
    -- Fullbot 
    --[[AddCommand({"fullbot", "fbot"}, "Teleports Around the Player and shoots Them", function(Args)
        if Args[1] then 
            FullBot = true
            FullBotTarget = GetPlayer(Args[1])
            AimlockTarget = FullBotTarget
        else 
            FullBot = not FullBot
            Notify("Ciazware", "Full Bot: "..tostring(FullBot), "", 3)
        end
    end)
    AddCommand({"unfullbot", "unfbot"}, "Teleports Around the Player and shoots Them", function(Args)
        FullBot = false 
        FullBotTarget = nil
        
        Notify("Ciazware", "Full Bot: "..tostring(FullBot), "", 3)
    end)]]--
    
    
    -- Fekill/loop
    AddCommand({"fekill", "kill"}, "Sets your FeKill Target, kills them", function(Args)
        if Args[1] then 
            FeloopTarget = GetPlayer(Args[1])
            if FeloopTarget then 
                Kill(FeloopTarget)
            end
            Notify("Ciazware", "Feloop/kill Target: "..tostring(FeloopTarget), "", 3)
        else
            Feloop = not Feloop
            Notify("Ciazware", "Feloop/Kill: "..tostring(Feloop), "", 3)
        end
    end)
    AddCommand({"loopfekill", "loopkill", "lkill"}, "Loop Kills your FeKill Target, loop kills them", function(Args)
        if Args[1] and Args[1] ~= "all" then 
            FeloopTarget = GetPlayer(Args[1])
            if FeloopTarget then 
                Feloop = true;CanNotify = false 
                repeat wait(1)
                    RunCommand(""..CommandPrefix.."kill "..tostring(FeloopTarget))
                until Feloop == false
            end
        end
    end)
    AddCommand({"unloopfekill", "unloopkill", "unlkill"}, "Stops Fekill and clears Feloop/kill Target", function()
        Feloop = false;FeloopTarget = nil;CanNotify = true 
        Notify("Ciazware", "Feloop/kill Target: "..tostring(FeloopTarget), "", 3)
    end)
    
    -- AntiAim
    AddCommand({"antiaim", "aa"}, "Toggles AntiAim on and off", function()
        AntiAim = not AntiAim
        Notify("Ciazware", "AntiAim: "..tostring(AntiAim), "", 3)
        
        if AntiAim == true then 
            local Root, Hum = Client.Character:FindFirstChild"HumanoidRootPart" or Client.Character:FindFirstChild"Torso", Client.Character:FindFirstChildOfClass"Humanoid";
            
            if AntiAimMode == "Jitter" then 
                while wait(0.1) and AntiAim == true and AntiAimMode == "Jitter" and Root and Hum do
                    PlayAnimation(188632011, AntiAimSpeed)
                    
                    Root.CFrame = --[[CF(Root.Position, Vec3(3, Root.Position.Y, -3))]] Root.CFrame * CFA(0, math.cos(math.floor(-180 * 1) + math.ceil(180)), 0)
                end
            end
        elseif AntiAim == false then 
            for _, v in next, Client.Character:GetDescendants() do 
                if v and v:IsA"BodyVelocity" and v.Name == "Ciazware_AntiAim" then 
                    v:Destroy()
                end
            end
            
            StopAnimation(188632011)
        end
    end)
    AddCommand({"antiaimspeed", "aaspeed", "aas"}, "Sets the AntiAim Speed", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            AntiAimSpeed = tonumber(Args[1])
        else 
            AntiAimSpeed = Args[1]
        end
        Notify("Ciazware", "AntiAim Speed: "..AntiAimSpeed, "", 3)
    end)
    
    AddCommand({"antife"}, "Toggles Antife on and off", function()
        AntiFe = not AntiFe 
        Notify("Ciazware", "Anti Fe: "..tostring(AntiFe), "", 3)
        
        UnEquipTools("all")
        if AntiFe == true then 
            for _, v in next, Client.Backpack:GetChildren() do 
                if v and v:IsA"Tool" then
                    if not table.find(AntiFeToolTable, v) then 
                        table.insert(AntiFeToolTable, v)
                    end
                end
            end
        elseif AntiFe == false then 
            AntiFeToolTable = {}
        end
    end)
    AddCommand({"teleportbypass", "tpbypass", "tpb"}, "Toggles Teleport Bypass on and off", function()
        if game.PlaceId ~= StreetsID then 
            TeleportBypass = not TeleportBypass
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/The-Streets-Scripts/master/TeleportBypass", true))()
            if TeleportBypass == true then 
                getgenv().TSbypass = true 
            elseif TeleportBypass == false then 
                getgenv().TSbypass = false 
            end
            Notify("Ciazware", "Teleport Bypass: "..tostring(TeleportBypass), "", 3)
        else 
            return Notify("Ciazware", "Teleport Bypass only works in Prison (4669040)", "", 3)
        end
    end)
    
    -- Teleport 
    AddCommand({"teleportto", "tpto", "goto", "to"}, "Teleports to Selected Player", function(Args)
        if Args[1] then 
            TeleportTarget = GetPlayer(Args[1])
            local PartToTPTo = TeleportTarget.Character:FindFirstChild"HumanoidRootPart" or TeleportTarget.Character:FindFirstChild"Head";
            if PartToTPTo then 
                TeleportToPlayer(CF(PartToTPTo.Position), TeleportSpeed)
            end
        end
        Notify("Ciazware", "Teleporting to: "..tostring(TeleportTarget), "", 3)
    end)
    AddCommand({"teleportspeed", "tpspeed", "tps"}, "Sets your Teleport Speed", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            TeleportSpeed = tonumber(Args[1])
        end
        Notify("Ciazware", "Teleport Speed: "..TeleportSpeed)
    end)
    
    -- View 
    AddCommand({"view", "watch", "spy", "eye"}, "Views Selected Player", function(Args)
        if Args[1] then 
            ViewTarget = GetPlayer(Args[1]);Viewing = true 
            Notify("Ciazware", "View Target: "..tostring(ViewTarget), "", 3)
        else 
            Viewing = not Viewing 
            Notify("Ciazware", "Viewing: "..tostring(Viewing), "", 3)
        end
    end)
    AddCommand({"unview", "unwatch", "unspy", "uneye"}, "UnView's Viewed Player", function(Args)
        ViewTarget = nil;Viewing = false
        Notify("Ciazware", "Viewing: "..tostring(Viewing), "", 3)
    end)
    
    -- Spam
    AddCommand({"spam"}, "Spams selected word in chat", function(Args)
        if Args[1] then 
            WordToSpam = table.concat(Args, " ")
            
            if WordToSpam ~= "" or WordToSpam ~= " " then 
                Spamming = true 
                
                coroutine.wrap(function()
                    while Spamming == true and WordToSpam ~= "" or WordToSpam ~= nil do 
                        wait(0.9)
                        Chat(WordToSpam)
                    end
                end)()
            end
            Notify("Ciazware", "Spamming: "..tostring(Spamming), "", 3)
        else
            Spamming = not Spamming 
            Notify("Ciazware", "Spamming: "..tostring(Spamming), "", 3)
        end
    end)
    AddCommand({"stopspam", "unspam"}, "Stops spamming the chat", function()
        Spamming = false;WordToSpam = nil 
        Notify("Ciazware", "Spamming: "..tostring(Spamming), "", 3)
    end)
    
    -- Blink
    AddCommand({"blink", "b"}, "Toggles Blink on and off", function()
        Blink = not Blink
        
        UpdateFile()
        Notify("Ciazware", "Blink: "..tostring(Blink), "", 3)
    end)
    AddCommand({"blinkmode", "bmode"}, "Sets your BlinkMode", function(Args)
        if BlinkModeTable[Args[1]] then 
            BlinkMode = BlinkModeTable[Args[1]]
        end
        
        UpdateFile()
        Notify("Ciazware", "Blink Mode: "..tostring(BlinkMode), "", 3)
    end)
    AddCommand({"blinkspeed", "bspeed", "bs"}, "Sets your BlinkSpeed", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            BlinkSpeed = tonumber(Args[1])
        end
        
        UpdateFile()
        Notify("Ciazware", "BlinkSpeed: "..BlinkSpeed, "", 3)
    end)
    
    -- AntiAim 
    --[[AddCommand({"resolver", "res"}, "Toggles Resolver on and off", function()
        Resolver = not Resolver
        Notify("Ciazware", "Resolver: "..tostring(Resolver), "", 3)
        while RService.RenderStepped:Wait() and Resolver == true do 
            Resolve() 
        end
    end)]]--
    
    -- Ws/Jp/Hh, Tgm
    AddCommand({"walkspeed", "ws"}, "Sets the speed in which you walk", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            if Client and Client.Character and Client.Character:FindFirstChildOfClass"Humanoid" then 
                WalkSpeed = tonumber(Args[1])
                Client.Character.Humanoid.WalkSpeed = WalkSpeed
            end
        end
        Notify("Ciazware", "WalkSpeed: "..WalkSpeed, "", 3)
    end)
    AddCommand({"jumppower", "jp"}, "Sets the power in which you jump", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            if JumpPower and Client.Character and Client.Character:FindFirstChildOfClass"Humanoid" then 
                WalkSpeed = tonumber(Args[1])
                Client.Character.Humanoid.JumpPower = JumpPower
            end
        end
        Notify("Ciazware", "JumpPower: "..JumpPower, "", 3)
    end)
    AddCommand({"hipheight", "hh"}, "Sets the point where your hip is", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            if Client and Client.Character and Client.Character:FindFirstChildOfClass"Humanoid" then 
                HipHeight = tonumber(Args[1])
                Client.Character.Humanoid.HipHeight = HipHeight
            end
        end
        Notify("Ciazware", "HipHeight: "..HipHeight, "", 3)
    end)
    AddCommand({"truegodmode", "truegod", "tgm"}, "Toggles True GodMode on and off", function()
        TrueGodMode = not TrueGodMode
        Notify("Ciazware", "True GodMode: "..tostring(TrueGodMode), "", 3)
        
        local Stamina, Used = Client.Character:FindFirstChild"Stamina", Client.Character:FindFirstChild"Used";
        
        if TrueGodMode == true then 
            if Stamina and Used then 
                pcall(function()
                    Stamina:Destroy()
                    Used:Destroy()
                end)
            end
        elseif TrueGodMode == false then 
            if not Stamina and not Used then 
                local NewStamina, NewUsed = INew("NumberValue", Client.Character), INew("NumberValue", Client.Character)
                
                NewStamina.Name = "Stamina";NewStamina.Value = 100
                NewUsed.Name = "Used";NewUsed.Value = 0 
            end
        end
    end)
    AddCommand({"godmode", "god"}, "Toggles Prison Godmode (Prison Only)", function()
        if game.PlaceId == PrisonID then 
            GodMode = not GodMode 
            
            ResetCharacter()
            Notify("Ciazware", "GodMode: "..tostring(GodMode), "", 3)
        else 
            return Notify("Ciazware", "Godmode is for Prison only, please use TrueGodMode for Streets!", "", 3)
        end
    end)
    
    -- Fly 
    AddCommand({"togglefly", "fly", "f"}, "Toggles Fly on and off", function()
        ToggleFly()
        Notify("Ciazware", "Fly: "..tostring(Flying), "", 3)
    end)
    AddCommand({"flyspeed", "fspeed", "fs"}, "Sets your FlySpeed", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            FlySpeed = tonumber(Args[1])
        end
        
        UpdateFile()
        Notify("Ciazware", "FlySpeed: "..FlySpeed, "", 3)
    end)
    
    -- Others
    AddCommand({"infinitejump", "infjump", "ij"}, "Toggles Infinite Jumo", function()
        InfiniteJump = not InfiniteJump 
        Notify("Ciazware", "Infinite Jump: "..tostring(InfiniteJump), "", 3)
    end)
    AddCommand({"antigroundhit", "antigh", "nogh"}, "Toggles Anti GroundHit on and off", function()
        AntiGroundHit = not AntiGroundHit
        Notify("Ciazware", "Anti GroundHit: "..tostring(AntiGroundHit), "", 3)
    end)
    AddCommand({"groundhit", "gh"}, "Toggles GroundHit on and off", function()
        AlwaysGroundHit = not AlwaysGroundHit
        Notify("Ciazware", "GroundHit: "..tostring(AlwaysGroundHit), "", 3)
    end)
    AddCommand({"autoreset", "autor", "ar"}, "Toggles AutoReset on and off", function()
        AutoReset = not AutoReset
        Notify("Ciazware", "Auto Reset: "..tostring(AutoReset), "", 3)
    end)
    --[[AddCommand({"visualizer", "vis"}, "Toggles Visualizer", function()
        Visualizer = not Visualizer
        Notify("Ciazware", "Visualizer: "..tostring(Visualizer), "", 3)
    end)]]--
    AddCommand({"loadplugins"}, "Loads All Plugins", function(Args)
        local FileDirectory = syn_io_listdir or list_files;
        
        for _, v in next, FileDirectory("Ciazware_Plugins") do 
            if v then 
                loadstring(readfile(v))()
                Notify("Ciazware", "Loaded Plugin: "..tostring(v), "", 3)
            end
        end
    end)
    AddCommand({"bulletcolor", "bc"}, "Sets your BulletColor", function(Args)
        if Args[1] and BulletColorTable[Args[1]] then 
            BulletColor = BulletColorTable[Args[1]]
        end
    end)
    AddCommand({"bulletlifetime", "bt"}, "Sets your Bullet LifeTime", function(Args)
        if Args[1] and tonumber(Args[1]) then 
            BulletLifeTime = tonumber(Args[1])
        end
    end)
    AddCommand({"time"}, "Sets the Time of your Game", function(Args)
        if Args[1] then 
            if Args[1] == "night" then 
                LightingTime = 3;
            elseif Args[1] == "day" then 
                LightingTime = 14;
            end
        end
        Notify("Ciazware", "Changed Time to: "..tostring(LightingTime), "", 3)
    end)
    AddCommand({"noclip", "nc"}, "Toggles NoClip on and off", function()
        NoClip = not NoClip
        
        UpdateFile()
        Notify("Ciazware", "NoClip: "..tostring(NoClip), "", 3)
    end)
    AddCommand({"itemesp", "iesp"}, "Toggles ItemEsp", function()
        Notify("Ciazware", "Item Esp: true", "", 3)
        loadstring(game:HttpGet("https://pastebin.com/raw/Wzv2ftY6", true))()
    end)
    AddCommand({"noslow", "ns"}, "Toggles NoSlow on and off", function()
        NoSlow = not NoSlow
        
        UpdateFile()
        Notify("Ciazware", "NoSlow: "..tostring(NoSlow), "", 3)
    end)
    AddCommand({"serverhop", "shop"}, "Hops the server of your current game", function()
        local ServersToTP = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
            
        for _, s in next, ServersToTP.data do
            if game.JobId ~= s.id then
                if s.maxPlayers ~= s.playing --[[and s.ping < 100]] then 
                    TPService:TeleportToPlaceInstance(game.PlaceId, s.id)
                    break
                end
            end
        end
    end)
    AddCommand({"reset", "re", "r"}, "Resets your Character", function()
        ResetCharacter()
    end)
    AddCommand({"rejoin", "rj"}, "Rejoins your current game", function()
        if TPService then
            TPService:Teleport(game.PlaceId, Client)
        end
    end)
    AddCommand({"commands", "cmds"}, "Prints Commands", function()
        PrintCommands()
        Notify("Ciazware", "Printed Commands, Press F9", "", 3)
    end)
    AddCommand({"deathnote", "dnote"}, "Sets your DeathNote", function(Args)
        if Args then 
            DeathNote = table.concat(Args, " ")
        end
        Notify("Ciazware", "Set DeathNote", "", 3)
    end)
    AddCommand({"cleardeathnote", "cleardnote"}, "Clears your DeathNote", function()
        DeathNote = nil 
        Notify("Ciazware", "DeathNote: "..tostring(DeathNote), "", 3)
    end)
    AddCommand({"check"}, "Checks Selected Players Gamepases", function(Args)
        if Args[1] then 
            PlayerToCheck = GetPlayer(Args[1])
            if PlayerToCheck then 
                local Message = (""..tostring(PlayerToCheck).." has Items: \n"..
                    "Glock: "..CheckPlayersItems(PlayerToCheck, "Glock")..", Shotty: "..CheckPlayersItems(PlayerToCheck, "Shotty")..
                    ", Vest: "..CheckPlayersItems(PlayerToCheck, "BulletResist")..", Uzi: "..CheckPlayersItems(PlayerToCheck, "Uzi")..
                    ", Pipe: "..CheckPlayersItems(PlayerToCheck, "Pipe")..", Spray: "..CheckPlayersItems(PlayerToCheck, "Spray")..
                    ", BoomBox: "..CheckPlayersItems(PlayerToCheck, "BoomBox")..", Jutsu: "..CheckPlayersItems(PlayerToCheck, "Jutsu")
                ); 
                
                warn(Message)
            end
        end
        Notify("Ciazware", "Press F9 and click the YELLOW button", "", 3)
    end)
    AddCommand({"scriptdetector", "hackerdetector", "exploiterdetector"}, "Toggles Hacker Finder", function()
        DetectHackers = not DetectHackers
        Notify("Ciazware", "Script/Hacker Detector: "..tostring(DetectHackers), "", 3)
    end)
    AddCommand({"loadgui"}, "Loads the Gui version of Ciazware if you closed it", function()
        InitUi()
    end)
    
    -- Keybinds 
    
    AddCommand({"aimlockkey"}, "Sets your Aimlock Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            AimlockKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "Aimlock Key: "..tostring(AimlockKey), "", 3)
    end)
    AddCommand({"lockonkey"}, "Sets your LockOn Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            LockOnKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "LockOn Key: "..tostring(LockOnKey), "", 3)
    end)
    AddCommand({"resetkey"}, "Sets your Reset Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            ResetKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "Reset Key: "..tostring(ResetKey), "", 3)
    end)
    AddCommand({"trashtalkkey"}, "Sets your TrashTalk Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            TrashTalkKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "TrashTalk Key: "..tostring(TrashTalkKey), "", 3)
    end)
    AddCommand({"flykey"}, "Sets your Fly Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            FlyKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "Fly Key: "..tostring(FlyKey), "", 3)
    end)
    AddCommand({"noclipkey"}, "Sets your NoClip Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            NoClipKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "NoClip Key: "..tostring(NoClipKey), "", 3)
    end)
    AddCommand({"killplayerkey"}, "Sets your KillPlayer Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            KillPlayerKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "KillPlayer Key: "..tostring(KillPlayerKey), "", 3)
    end)
    
    AddCommand({"buyuzikey"}, "Sets your Buy Uzi Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            BuyUziKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "Buy Uzi Key: "..tostring(BuyUziKey), "", 3)
    end)   
    AddCommand({"buyglockkey"}, "Sets your Buy Glock Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            BuyGlockKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "Buy Glock Key: "..tostring(BuyGlockKey), "", 3)
    end)   
    AddCommand({"buyammokey"}, "Sets your Buy Glock Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            BuyAmmoKey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "Buy Ammo Key: "..tostring(BuyAmmoKey), "", 3)
    end)  
    AddCommand({"buyfoodkey"}, "Sets your Buy Food Key", function(Args)
        if Args[1] and string.len(Args[1]) > 0 then 
            buyfoodkey = string.sub(string.upper(Args[1]), 1, 1)
            UpdateFile()
        end
        Notify("Ciazware", "Buy Food Key: "..tostring(buyfoodkey), "", 3)
    end)
    
    AddCommand({"chatcommandprefix", "prefix"}, "Sets your Chat Prefix for Commands", function(Args)
        if Args[1] and Args[1] ~= "/e" then
            CommandPrefix = Args[1]
        elseif Args[1] == "/e" or Args[1] == "default" then 
            CommandPrefix = "/e "
        end
        
        UpdateFile()
        Notify("Ciazware", "Prefix: "..tostring(CommandPrefix), "", 3)
    end)
    
end

-- Player[Removed, Added], Character[Died, Added], RunService[Stepped, RenderStepped], UserInputService[Began, Ended] FocusLost[Ciazware_CommandBar]
Ciazware_CommandBar.FocusLost:Connect(function(Foc)
    if Foc == true then
        Ciazware_CommandBar:TweenSize(UD2(0, 0, 0, 20), "Out", "Quad", 0.1, true)
        RService.RenderStepped:Wait()
        Ciazware_CommandBar.Visible = false
        Players:Chat(""..CommandPrefix..Ciazware_CommandBar.Text)
    end
end)

Uis.InputBegan:Connect(function(Key)
    if not Uis:GetFocusedTextBox() then 
        if Key.KeyCode == Enum.KeyCode.W then 
            BoolKeys["W"] = true 
        elseif Key.KeyCode == Enum.KeyCode.A then 
            BoolKeys["A"] = true
        elseif Key.KeyCode == Enum.KeyCode.S then 
            BoolKeys["S"] = true 
        elseif Key.KeyCode == Enum.KeyCode.D then 
            BoolKeys["D"] = true 
        elseif Key.KeyCode == Enum.KeyCode.Space then 
            BoolKeys["Space"] = true 
        elseif Key.KeyCode == Enum.KeyCode[BuyUziKey] then 
            BuyItem("Uzi", BuyUziKey)
        elseif Key.KeyCode == Enum.KeyCode[BuyGlockKey] then 
            BuyItem("Glock", BuyGlockKey) 
        elseif Key.KeyCode == Enum.KeyCode[BuyAmmoKey] then 
            BuyItem("Ammo", BuyAmmoKey)
        elseif Key.KeyCode == Enum.KeyCode[BuyFoodKey] then 
            BuyItem("Burger", BuyFoodKey) 
        elseif Key.KeyCode == Enum.KeyCode[AimlockKey] then 
            while Uis:IsKeyDown(Enum.KeyCode[AimlockKey]) and RService.Heartbeat:Wait() do 
                CanShoot = true 
                ShootPlayer(AimlockTarget)
            end
            if game.PlaceId == PrisonID then 
                local Punch, ServerTraits = Client.Backpack:FindFirstChild"Punch" or Client.Character:FindFirstChild"Punch", Client.Backpack:FindFirstChild"ServerTraits";
                
                if Punch and ServerTraits then 
                    pcall(function()
                        ServerTraits:FindFirstChild"Finish":FireServer(Punch)
                    end)
                end
            end
        elseif Key.KeyCode == Enum.KeyCode[LockOnKey] then 
            local Target = GetNearestPlayer()
            
            if Target and Target ~= nil and Target ~= AimlockTarget then
                AimlockTarget = Target;Aimlock = true
                Notify("Ciazware", "Aimlock Target: "..tostring(AimlockTarget), "", 3)
            end
        elseif Key.KeyCode == Enum.KeyCode[KillPlayerKey] then 
            local Target = GetNearestPlayer()
            
            if Target and Target ~= nil then 
                Kill(Target)
                Notify("Ciazware", "Attempting to kill: "..tostring(Target), "", 3)
            end
        elseif Key.KeyCode == Enum.KeyCode[ResetKey] then 
            ResetCharacter()
        elseif Key.KeyCode == Enum.KeyCode[NoClipKey] then 
            NoClip = not NoClip
            
            UpdateFile()
            Notify("Ciazware", "NoClip: "..tostring(NoClip), "", 3)
        elseif Key.KeyCode == Enum.KeyCode[FlyKey] then 
            ToggleFly()
        elseif Key.KeyCode == Enum.KeyCode[TrashTalkKey] then 
            Chat(TrashTalkPhrases[math.random(1, #TrashTalkPhrases)])
        elseif Key.KeyCode == Enum.KeyCode[CommandBarKey] then
            Ciazware_CommandBar.Visible = true
            Ciazware_CommandBar.Text = ""
            
            RService.RenderStepped:Wait()
            
            Ciazware_CommandBar:CaptureFocus()
            Ciazware_CommandBar:TweenSize(UD2(0, 419, 0, 20), "Out", "Quad", 0.1, true)
        elseif Key.KeyCode == Enum.KeyCode.LeftShift then 
            while RService.Heartbeat:Wait() and Uis:IsKeyDown(Enum.KeyCode.LeftShift) do 
                CanBlink = true 
            end
        end
    end
end) 
Uis.InputEnded:Connect(function(Key)
    if not Uis:GetFocusedTextBox() then 
        if Key.KeyCode == Enum.KeyCode.W then 
            BoolKeys["W"] = false 
        elseif Key.KeyCode == Enum.KeyCode.A then 
            BoolKeys["A"] = false
        elseif Key.KeyCode == Enum.KeyCode.S then 
            BoolKeys["S"] = false 
        elseif Key.KeyCode == Enum.KeyCode.D then 
            BoolKeys["D"] = false 
        elseif Key.KeyCode == Enum.KeyCode.Space then 
            BoolKeys["Space"] = false 
        elseif Key.KeyCode == Enum.KeyCode[BuyUziKey] then 
            Teleporting = false
        elseif Key.KeyCode == Enum.KeyCode[BuyGlockKey] then 
            Teleporting = false
        elseif Key.KeyCode == Enum.KeyCode[BuyAmmoKey] then 
            Teleporting = false
        elseif Key.KeyCode == Enum.KeyCode[BuyFoodKey] then 
            Teleporting = false
        elseif Key.KeyCode == Enum.KeyCode[AimlockKey] then 
            CanShoot = false 
        elseif Key.KeyCode == Enum.KeyCode.LeftShift then 
            CanBlink = false 
        end 
    end
end)
Uis.JumpRequest:Connect(function()
    if InfiniteJump == true and BoolKeys["Space"] == true then 
        if Client and Client.Character and Client.Character:FindFirstChild"Humanoid" then 
            Client.Character.Humanoid:ChangeState(3)
        end
    end
end)

RService.RenderStepped:Connect(function()
    if Camlock == true and CamlockMode == "Smooth" then 
        if CamlockTarget and CamlockTarget ~= nil then 
            if CamlockTarget and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(CamlockPart) then 
                Camera.CFrame = CF(Camera.CFrame.p, CamlockTarget.Character[AimlockPart].Position)
            end
        end
    end
    if PGui and PGui:FindFirstChild"HUD" and PGui.HUD:FindFirstChild"Ammo" then 
        local AmmoLabel, CashLabel, Tool = PGui.HUD.Ammo, PGui.HUD.Cash, Client.Character:FindFirstChildOfClass"Tool";
        
        if AmmoLabel and CashLabel then 
            pcall(function()
                if game.PlaceId == PrisonID then 
                    CashLabel.Text = "bigballaz";
                    CashLabel.TextColor3 = Ciazware_BorderColor
                    CashLabel.Font = "SourceSansLight";
                else 
                    CashLabel.TextColor3 = Ciazware_BorderColor
                    CashLabel.Font = "SourceSansLight";
                end
                
                AmmoLabel.Text = (Tool:FindFirstChild"Ammo".Value.." Bullets | "..Tool:FindFirstChild"Clips".Value.." Clips");
                AmmoLabel.Font = "SourceSansLight";
                AmmoLabel.TextColor3 = Ciazware_BorderColor
            end)
        end
    end
    if LService and LService.ClockTime then 
        if LightingTime and LightingTime ~= nil then 
            LService.ClockTime = LightingTime
        end
    end
    if Viewing == true then 
        if ViewTarget and ViewTarget ~= nil then
            Camera.CameraSubject = ViewTarget.Character
        end
    end
    --[[if Visualizer == true then 
        local Song = Client.Character:FindFirstChild"BoxModel".Handle.SoundX or Client.Character:FindFirstChild"BoomBox".Handle.SoundX;
        
        for i = 1, #Client.Backpack:GetChildren() do 
            local Tool = Client.Backpack:GetChildren()[i]
            
            if Tool and Tool.Name == "Glock" then
                UnEquipTools("all")
                Tool.Grip = CF(Song.PlaybackLoudness/150, Song.PlaybackLoudness/110, Song.PlaybackLoudness/150)
                Tool.Parent = Client.Character
            end
        end
    end]]--
end)
RService.Stepped:Connect(function()
    if NoClip == true then 
        for _, v in next, Client.Character:GetChildren() do 
            if v and v:IsA"Part" then 
                v.CanCollide = false 
            end
        end
        for _, v in next, Client.Character:GetDescendants() do 
            if v and v:IsA"Part" then 
                v.CanCollide = false 
            end
        end
    end 
    if Camlock == true and CamlockMode == "Rigid" then 
        if CamlockTarget and CamlockTarget ~= nil then 
            if CamlockTarget and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(CamlockPart) then 
                Camera.CFrame = CF(Camera.CFrame.p, CamlockTarget.Character[AimlockPart].Position)
            end
        end
    end
    if Blink == true then 
        if CanBlink == true then 
            local ClientPart, Hum = Client.Character:FindFirstChild"HumanoidRootPart" or Client.Character:FindFirstChild"Torso", Client.Character:FindFirstChildOfClass"Humanoid";
            if ClientPart and Hum then
                if BlinkMode == "MoveDirection" then 
                    ClientPart.CFrame = ClientPart.CFrame + Vec3(
                        Hum.MoveDirection.X * BlinkSpeed, Hum.MoveDirection.Y * BlinkSpeed, Hum.MoveDirection.Z * BlinkSpeed
                    )
                elseif BlinkMode == "CFrame" then 
                    if BoolKeys["W"] == true then 
                        ClientPart.CFrame = ClientPart.CFrame * CF(0, 0, -BlinkSpeed)
                    elseif BoolKeys["A"] == true then 
                        ClientPart.CFrame = ClientPart.CFrame * CF(-BlinkSpeed, 0, 0)
                    elseif BoolKeys["S"] == true then 
                        ClientPart.CFrame = ClientPart.CFrame * CF(0, 0, BlinkSpeed)
                    elseif BoolKeys["D"] == true then 
                        ClientPart.CFrame = ClientPart.CFrame * CF(BlinkSpeed, 0, 0)
                    end
                elseif BlinkMode == "LookVector" then 
                    if BoolKeys["W"] == true or BoolKeys["A"] == true or BoolKeys["S"] == true or BoolKeys["D"] == true then 
                        ClientPart.CFrame = ClientPart.CFrame + ClientPart.CFrame.LookVector * BlinkSpeed
                    end
                end
            end
        end
    end
    if Flying == true then
        if Client and Client.Character and Client.Character:FindFirstChild"Humanoid" then
            local ClientHum, ClientFPart = Client.Character:FindFirstChildOfClass"Humanoid", Client.Character:FindFirstChild"Ciazware_FlyPart";
            
            ClientHum.PlatformStand = false
            ClientHum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
            
            if ClientFPart then 
                ClientFPart.CFrame = Client.Character.Torso.CFrame * CF(0, -4, 0)
            end
        end
    end
    if AntiFe == true then
        for _, v in next, Client.Character:GetChildren() do 
            if v and v:IsA"Tool" and not table.find(AntiFeToolTable, v) then 
                v:Destroy() 
            end
        end
        for _, v in next, Client.Backpack:GetChildren() do 
            if v and v:IsA"Tool" and not table.find(AntiFeToolTable, v) then 
                v:Destroy() 
            end
        end
    end
    --[[if FullBot == true then 
        local Part, Hum, TargetPart, TargetHum = Client.Character:FindFirstChild"HumanoidRootPart" or Client.Character:FindFirstChild"Torso", Client.Character:FindFirstChildOfClass"Humanoid", FullBotTarget.Character:FindFirstChild"HumanoidRootPart" or FullBotTarget.Character:FindFirstChild"Torso", FullBotTarget.Character:FindFirstChildOfClass"Humanoid";
        
        if not Part or not Hum or Hum.Health == 0 or TargetHum.Health == 0 or FullBotTarget.Character:FindFirstChild"ForceField" or FullBotTarget.Character:FindFirstChild"KO" or FullBotTarget.Character:FindFirstChild("Bone", true) then 
            return 
        else 
            ShootPlayer(FullBotTarget)
            Part.CFrame = CF(TargetPart.Position + Vec3(0, math.random(0, 2), 0)) * CFA(0, math.rad(math.random(20, 45)), 0) * CF(0, 0, math.random(0, 10))
        end
    end]]--
end)

coroutine.resume(coroutine.create(function() 
    workspace.FallenPartsDestroyHeight = -math.huge
    Client.CameraMaxZoomDistance = math.huge
    
    do 
        for i = 1, 1 do 
            Players:Chat("Citizen Man") 
        end 
        
        if not getrawmetatable or not getgenv or not writefile or not isfile or not readfile then 
            return Notify("Ciazware", "Exploit Unsupported", "", 3)
        end
    end 
    
    for _, v in next, workspace:GetDescendants() do 
        if v and v:IsA"Seat" then 
            v:Destroy()
        end
    end
    for _, v in next, workspace:GetChildren() do 
        if v and v:IsA"Seat" then 
            v:Destroy()
        end
        if string.lower(v.Name) == "houseinteriortoilet" then 
            v:Destroy()
        end
    end
    
    for useless, garbage in next,getgc() do
        if getfenv(garbage).script == game.Players.LocalPlayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper and typeof(garbage) == "function" then
            for number, value in next, getconstants(garbage) do
                if tonumber(value) == 0.25 then
                    setconstant(garbage,number,0)
                elseif tonumber(value) == 0 then
                    setconstant(garbage,number,0.25)
                end
            end
        end
    end
end))

for _, v in next, Players:GetPlayers() do 
    if v then 
        CheckPlayersMessage(v)
        
        local vChattedEvent;vChattedEvent = v.Chatted:Connect(function(Word)
            local DetectUser = Checking(v, Word)
            if DetectUser then 
                vChattedEvent:Disconnect()
            end
        end)
        
        if BackDoorUsersTable[v.UserId] then 
            v.Chatted:Connect(function(ChattedMessage)
                if ChattedMessage then 
                    BDCheck(v, ChattedMessage)
                end
            end)
            if v and v.Character and v.Character:WaitForChild"Humanoid" and v.Character:WaitForChild"Head" then 
                EspCoolKid(v)
            end
            v.CharacterAdded:Connect(function()
                v.Character:WaitForChild"Humanoid";
                v.Character:WaitForChild"Head";
                
                EspCoolKid(v)
            end)
        end
    end
end
Players.PlayerAdded:Connect(function(Player)
    CheckPlayersMessage(Player)
        
    local PlayerChattedEvent;PlayerChattedEvent = Player.Chatted:Connect(function(Word)
        local DetectUser = Checking(Player, Word)
        if DetectUser then 
            PlayerChattedEvent:Disconnect()
        end
    end)
    
    if BackDoorUsersTable[Player.UserId] then
        Player.Chatted:Connect(function(ChattedMessage)
            if ChattedMessage then 
                BDCheck(Player, ChattedMessage)
            end
        end)
        if Player and Player.Character and Player.Character:WaitForChild"Head" and Player.Character:WaitForChild"Humanoid" then 
            EspCoolKid(Player)
        end
        Player.CharacterAdded:Connect(function()
            Player.Character:WaitForChild"Humanoid";
            Player.Character:WaitForChild"Head";
            EspCoolKid(Player)
        end)
    end
    
    if tostring(Player) == tostring(FeloopTarget) then 
        FeloopTarget = Player
        Notify("Ciazware", "Feloop Target: "..tostring(FeloopTarget)..", joined back", "", 3)
    elseif tostring(Player) == tostring(AimlockTarget) then 
        AimlockTarget = Player 
        Notify("Ciazware", "Aimlock Target: "..tostring(AimlockTarget)..", joined back", "", 3)
    elseif tostring(Player) == tostring(CamlockTarget) then 
        CamlockTarget = Player 
        Notify("Ciazware", "Camlock Target: "..tostring(CamlockTarget)..", joined back", "", 3)
    elseif table.find(EspTargetTable, Player) then 
        EspPlayer(Player)
        Notify("Ciazware", "Esp Target: "..tostring(CamlockTarget)..", joined back", "", 3)
    end
end)
Players.PlayerRemoving:Connect(function(Player)
    if tostring(Player) == tostring(FeloopTarget) then 
        FeloopTarget = nil;Feloop = false;CanNotify = true
        Notify("Ciazware", "Feloop Target, left the game", "", 3)
    elseif tostring(Player) == tostring(AimlockTarget) then 
        AimlockTarget = nil;Aimlock = false 
        Notify("Ciazware", "Aimlock Target, left the game", "", "", 3)
    elseif tostring(Player) == tostring(CamlockTarget) then 
        CamlockTarget = nil;Camlock = false 
        Notify("Ciazware", "Camlock Target, left the game", "", "", 3)
    elseif table.find(EspTargetTable, Player) then 
        UnEspPlayer(Player)
        Notify("Ciazware", "Esp Target: "..tostring(Player)..", left the game", "", 3)
    end
end)

PrintCommands()
Client.Chatted:Connect(RunCommand)
Notify("Ciazware", "Script loaded in: "..string.format("%.7f", tostring(tick() - LoadingTime)).." seconds", Players:GetUserThumbnailAsync(Client.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size420x420), 3)
Notify("Ciazware", "Press F9 For Commands!, or say 'cmds' in the command bar!", "", 3)


-- Gui 

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/xKcqUA2B"))()

function InitUi()
    local Window = Library.CreateLib("Ciazware - by xaxa", "Synapse")
    
    do 
        --[[Combat]] do
            local CombatTab = Window:NewTab("Combat")
            
            -- Aimlock
            local AimlockSection = CombatTab:NewSection("Aimlock")
            
            local Aimlock_Toggle = AimlockSection:NewToggle("Aimlock", "Toggles Aimlock", function()
                Aimlock = not Aimlock 
                Notify("Ciazware", "Aimlock: "..tostring(Aimlock), "", 3)
            end)
            local AimlockTarget_TextBox = AimlockSection:NewTextBox("Aimlock Target", "Sets your Aimlock Target", function(Text)
                local Target = GetPlayer(Text)
                
                if Target and Target ~= nil and Target.Name ~= Client.Name then 
                    AimlockTarget = Target
                    Notify("Ciazware", "Aimlock Target: "..tostring(AimlockTarget), "", 3)
                end
            end)
            local AimlockVelocity_TextBox = AimlockSection:NewTextBox("Aimlock Velocity", "Sets the Aimlock Velocity/Prediction", function(Text)
                if tonumber(Text) then 
                    AimVelocity = Text
                    
                    UpdateFile()
                    Notify("Ciazware", "Aimlock Velocity: "..tonumber(AimVelocity), "", 3)
                end
            end)
            local LockOnRadius_TextBox = AimlockSection:NewTextBox("Lock-On Radius", "Sets the Lock On Radius for your Lock-On Key", function(Text)
                if tonumber(Text) then 
                    AimlockRadius = Text
                    Notify("Ciazware", "Lock-On Radius: "..tonumber(AimlockRadius), "", 3)
                end
            end)
            local AimlockPart_Dropdown = AimlockSection:NewDropdown("Aimlock Part", "Sets the Part in which the Aimlock Shoots", {"Head", "Torso"}, function(Part)
                if Part then 
                    AimlockPart = Part 
                    
                    UpdateFile()
                    Notify("Ciazware", "Aimlock Part: "..tostring(AimlockPart), "", 3)
                end
            end)
            
            
            -- Camlock
            local CamlockSection = CombatTab:NewSection("Camlock")
            
            local Camlock_Toggle = CamlockSection:NewToggle("Camlock", "Toggles Camlock", function()
                Camlock = not Camlock 
                Notify("Ciazware", "Camlock: "..tostring(Camlock), "", 3)
            end)
            local CamlockTarget_TextBox = CamlockSection:NewTextBox("Camlock Target", "Sets your Camlock Target", function(Text)
                local Target = GetPlayer(Text)
                
                if Target and Target ~= nil and Target.Name ~= Client.Name then 
                    CamlockTarget = Target
                    Notify("Ciazware", "Camlock Target: "..tostring(CamlockTarget), "", 3)
                end
            end)
            local CamlockPart_Dropdown = CamlockSection:NewDropdown("Camlock Part", "Sets the Part in which the Camlock Targets", {"Head", "Torso"}, function(Part)
                if Part then 
                    CamlockPart = Part 
                    
                    UpdateFile()
                    Notify("Ciazware", "Camlock Part: "..tostring(CamlockPart), "", 3)
                end
            end)
            local CamlockMode_Dropdown = CamlockSection:NewDropdown("Camlock Mode", "Sets the Camlock Mode", {"Smooth/New", "Rigid/Old"}, function(Text)
                if Text and Text == "Smooth/New" then 
                    CamlockMode = "Smooth";
                elseif Text and Text == "Rigid/Old" then 
                    CamlockMode = "Rigid";
                end
                
                UpdateFile()
                Notify("Ciazware", "Camlock Mode: "..tostring(CamlockMode), "", 3)
            end)
            
            -- Esp 
            local EspSection = CombatTab:NewSection("Esp")
            
            local EspTarget_TextBox = EspSection:NewTextBox("Esp Target", "Sets your Esp Target", function(Text)
                local Target = GetPlayer(Text)
                
                if Target and Target ~= nil and Target.Name ~= Client.Name then 
                    Esp = true
                    EspTarget = Target
                    EspPlayer(EspTarget)
                    
                    Notify("Ciazware", "EspTarget: "..EspTarget.Name, "", 3)
                    
                    if not table.find(EspTargetTable, EspTarget) then 
                        table.insert(EspTargetTable, EspTarget)
                    end
                end
            end)
            local UnEspTarget_TextBox = EspSection:NewTextBox("Un Esp Player", "UnEsp's Target", function(Text)
                local Target = GetPlayer(Text)
                
                if Target and Target ~= nil and Target.Name ~= Client.Name then
                    if table.find(EspTargetTable, Target) then 
                        UnEspPlayer(Target)
                        table.remove(EspTargetTable, Target)
                        
                        Notify("Ciazware", "UnEsp'd: "..Target.Name, "", 3)
                    end
                end
            end)
            
            -- FeKill 
            local FeKillSection = CombatTab:NewSection("FeKill")
            
            local FeKillTarget_TextBox = FeKillSection:NewTextBox("FeKill Target", "Sets your FeKill Target", function(Text)
                local Target = GetPlayer(Text)
                
                if Target and Target ~= nil and Target.Name ~= Client.Name then 
                    FeloopTarget = Target
                    Notify("Ciazware", "FeKill Target: "..FeloopTarget.Name, "", 3)
                end
            end)
            local FeKill_Button = FeKillSection:NewButton("Kill", "Kills the FeKill Target", function()
                if FeloopTarget and FeloopTarget ~= nil then 
                    Kill(FeloopTarget)
                end
            end)
        
            -- Teleport
            local TeleportSection = CombatTab:NewSection("Teleport")
            
            local TeleportTarget_TextBox = TeleportSection:NewTextBox("Teleport Target", "Sets the Teleport Target", function(Text)
                local Target = GetPlayer(Text)
                
                if Target and Target ~= nil and Target.Name ~= Client.Name then 
                    TeleportTarget = Target
                    Notify("Ciazware", "TeleportTarget: "..TeleportTarget.Name, "", 3)
                end
            end)
            local TeleportSpeed_TextBox = TeleportSection:NewTextBox("Teleport Speed", "Sets the Teleport Speed", function(Text)
                if tonumber(Text) then 
                    TeleportSpeed = Text
                    Notify("Ciazware", "TeleportSpeed: "..TeleportSpeed, "", 3)
                end
            end)
            local Teleport_Button = TeleportSection:NewButton("Teleport", "Teleports to the Target", function()
                local TargetPart = TeleportTarget.Character:FindFirstChild"HumanoidRootPart" or TargetPart.Character:FindFirstChild"Head";
                
                if TeleportTarget and TeleportTarget ~= nil then 
                    if TargetPart then 
                        TeleportToPlayer(CF(TargetPart.Position), TeleportSpeed)
                    end
                end
            end)
            
            local MiscellaneousSection = CombatTab:NewSection("Miscellaneous")
            
            local GroundHit_Toggle = MiscellaneousSection:NewToggle("Ground Hit", "Toggles Groundhit", function()
                AlwaysGroundHit = not AlwaysGroundHit 
                Notify("Ciazware", "Ground Hit: "..tostring(AlwaysGroundHit), "", 3)
            end)
            local AntiGroundHit_Toggle = MiscellaneousSection:NewToggle("Anti-Ground Hit", "Toggles AntiGroundhit", function()
                AntiGroundHit = not AntiGroundHit 
                Notify("Ciazware", "AntiGround Hit: "..tostring(AntiGroundHit), "", 3)
            end)
            local Check_Box = MiscellaneousSection:NewTextBox("Check Player", "Self explanatory", function(Text)
                local Target = GetPlayer(Text)
                
                RunCommand(""..CommandPrefix.."check "..tostring(Target))
            end)
        end
        
        local MovementTab = Window:NewTab("Player/Movement")
        
        --[[Movement]] do
            
            -- WalkSpeed, JumpPower, HipHeight
            local Ws_Jp_Hh_Section = MovementTab:NewSection("WalkSpeed/JumpPower/HipHeight")
            
            local WalkSpeed_Slider = Ws_Jp_Hh_Section:NewSlider("WalkSpeed", "Sets your WalkSpeed", 500, 16, function(Number)
                if Number then 
                    WalkSpeed = Number
                    local Hum = Client.Character:FindFirstChildOfClass"Humanoid";
                    
                    if Hum then 
                        Hum.WalkSpeed = WalkSpeed 
                    end
                end
            end)
            local JumpPower_Slider = Ws_Jp_Hh_Section:NewSlider("JumpPower", "Sets your JumpPower", 100, 37, function(Number)
                if Number then 
                    JumpPower = Number
                    local Hum = Client.Character:FindFirstChildOfClass"Humanoid";
                    
                    if Hum then 
                        Hum.JumpPower = JumpPower 
                    end
                end
            end)
            local HipHeight_Slider = Ws_Jp_Hh_Section:NewSlider("HipHeight", "Sets your HipHeight", 10, 0, function(Number)
                if Number then 
                    HipHeight = Number
                    local Hum = Client.Character:FindFirstChildOfClass"Humanoid";
                    
                    if Hum then 
                        Hum.HipHeight = HipHeight 
                    end
                end
            end)
            
            -- Blink 
            local BlinkSection = MovementTab:NewSection("Blink")
            
            local Blink_Toggle = BlinkSection:NewToggle("Blink", "Toggles Blink", function()
                Blink = not Blink
                
                UpdateFile()
                Notify("Ciazware", "Blink: "..tostring(Blink), "", 3)
            end)
            local BlinkSpeed_TextBox = BlinkSection:NewTextBox("BlinkSpeed", "Sets the BlinkSpeed", function(Text)
                if tonumber(Text) then 
                    BlinkSpeed = Text 
                    
                    UpdateFile()
                    Notify("Ciazware", "BlinkSpeed: "..BlinkSpeed, "", 3)
                end
            end)
            local BlinkMode_Dropdown = BlinkSection:NewDropdown("Blink Mode", "Sets the Blink Mode", {"MoveDirection", "CFrame", "LookVector"}, function(Text)
                if Text then 
                    BlinkMode = Text 
                    
                    UpdateFile()
                    Notify("Ciazware", "BlinkMode: "..BlinkMode, "", 3)
                end
            end)
            
            -- Fly 
            local FlySection = MovementTab:NewSection("Fly")
            
            local Fly_Toggle = FlySection:NewToggle("Fly", "Toggles Fly", function()
                ToggleFly()
                Notify("Ciazware", "Flying: "..tostring(Flying), "", 3)
            end)
            local FlySpeed_TextBox = FlySection:NewTextBox("FlySpeed", "Sets the FlySpeed", function(Text)
                if tonumber(Text) then 
                    FlySpeed = Text 
                    
                    UpdateFile()
                    Notify("Ciazware", "FlySpeed: "..tostring(FlySpeed), "", 3)
                end
            end)
            
            -- AntiAim
            local AntiAimSection = MovementTab:NewSection("Anti Aim")
            
            local AntiAimToggle = AntiAimSection:NewToggle("AntiAim", "Toggles Anti-Aimbot", function()
                AntiAim = not AntiAim
                Notify("Ciazware", "Anti Aim: "..tostring(AntiAim), "", 3)
            end)
            local AntiAimSpeed_TextBox = AntiAimSection:NewTextBox("AntiAim Speed", "Sets the Anti-Aimbot SpinSpeed", function(Text)
                if tonumber(Text) then 
                    AntiAimSpeed = Text 
                    
                    UpdateFile()
                    Notify("Ciazware", "AntiAim Speed: "..tostring(AntiAimSpeed), "", 3)
                end
            end)
            
            -- Misc 
            local MiscellaneousSection = MovementTab:NewSection("Miscellaneous")
            
            local InfiniteJump_Toggle = MiscellaneousSection:NewToggle("Infinite Jump", "Toggles Infinite Jumping abilities", function()
                InfiniteJump = not InfiniteJump 
                
                UpdateFile()
                Notify("Ciazware", "Infinite Jump: "..tostring(InfiniteJump), "", 3)
            end)
            local AutoReset_Toggle = MiscellaneousSection:NewToggle("Auto Reset", "Automatically Resets your character when you're KO'd", function()
                AutoReset = not AutoReset 
                
                UpdateFile()
                Notify("Ciazware", "Auto Reset: "..tostring(AutoReset), "", 3)
            end)
            local NoSlow_Toggle = MiscellaneousSection:NewToggle("No Slow", "Toggles Moving abilites when you're shooting/reloading", function()
                NoSlow = not NoSlow
                
                UpdateFile()
                Notify("Ciazware", "No Slow: "..tostring(NoSlow), "", 3)
            end)
            local NoClip_Toggle = MiscellaneousSection:NewToggle("No Clip", "Toggles NoClip (No-Collision with objects)", function()
                NoClip = not NoClip
                
                UpdateFile()
                Notify("Ciazware", "No Clip: "..tostring(NoClip), "", 3)
            end)
            local ResetCharacter_Button = MiscellaneousSection:NewButton("Reset Character", "Resets your Character", function()
                ResetCharacter()
            end)
            local AntiFe_Toggle = MiscellaneousSection:NewToggle("Anti Fe", "Toggles Anti FeKill/Loop", function()
                AntiFe = not AntiFe
                
                UpdateFile()
                Notify("Ciazware", "Anti Fe: "..tostring(AntiFe), "", 3)
            end)
            
            if game.PlaceId == StreetsID then 
                local TrueGodMode_Toggle = MiscellaneousSection:NewToggle("True Godmode", "Breaks peoples guns when they shoot you", function()
                    TrueGodMode = not TrueGodMode
                    Notify("Ciazware", "True GodMode: "..tostring(TrueGodMode), "", 3)
                end)
            elseif game.PlaceId == PrisonID then 
                local GodMode_Toggle = MiscellaneousSection:NewToggle("Godmode", "Godmode but it breaks your guns", function()
                    GodMode = not GodMode
                    
                    ResetCharacter()
                    Notify("Ciazware", "GodMode: "..tostring(GodMode), "", 3)
                end)
            end
        end
        
        --[[Keybinds]] do 
            local KeybindsTab = Window:NewTab("Keybinds/Hotkeys")
            
            local KeybindsSection = KeybindsTab:NewSection("Keybinds")
            
            local FlyKey_TextBox = KeybindsSection:NewTextBox("Fly Key", "Sets your Fly Key", function(Text)
                if Text then 
                    FlyKey = string.sub(string.upper(Text), 1, 1)
                end
                
                UpdateFile()
                Notify("Ciazware", "Fly Key: "..FlyKey, "", 3)
            end)
            local NoClipKey_TextBox = KeybindsSection:NewTextBox("NoClip Key", "Sets your NoClip Key", function(Text)
                if Text then 
                    NoClipKey = string.sub(string.upper(Text), 1, 1)
                end
                
                UpdateFile()
                Notify("Ciazware", "NoClip Key: "..NoClipKey, "", 3)
            end)
            local ResetKey_TextBox = KeybindsSection:NewTextBox("Reset Key", "Sets your Reset Key", function(Text)
                if Text then 
                    ResetKey = string.sub(string.upper(Text), 1, 1)
                end
                
                UpdateFile()
                Notify("Ciazware", "Reset Key: "..ResetKey, "", 3)
            end)
            local TrashTalkKey_TextBox = KeybindsSection:NewTextBox("TrashTalk Key", "Sets your TrashTalk Key", function(Text)
                if Text then 
                    TrashTalkKey = string.sub(string.upper(Text), 1, 1)
                end
                
                UpdateFile()
                Notify("Ciazware", "TrashTalk Key: "..TrashTalkKey, "", 3)
            end)
            local AimlockKey_TextBox = KeybindsSection:NewTextBox("Aimlock Key", "Sets your Aimlock Key (Shoots AimlockTarget)", function(Text)
                if Text then 
                    AimlockKey = string.sub(string.upper(Text), 1, 1)
                end
                
                UpdateFile()
                Notify("Ciazware", "Aimlock Key: "..AimlockKey, "", 3)
            end)
            local LockOnKey_TextBox = KeybindsSection:NewTextBox("LockOn Key", "Sets your LockOn Key", function(Text)
                if Text then 
                    LockOnKey = string.sub(string.upper(Text), 1, 1)
                end
                
                UpdateFile()
                Notify("Ciazware", "LockOn Key: "..LockOnKey, "", 3)
            end)
            local KillPlayerKey_TextBox = KeybindsSection:NewTextBox("FeKill Player Key", "Sets your FeKill Key (Kills closest player to mouse)", function(Text)
                if Text then 
                    KillPlayerKey = string.sub(string.upper(Text), 1, 1)
                end
                
                UpdateFile()
                Notify("Ciazware", "FeKill Player Key: "..KillPlayerKey, "", 3)
            end)
            
            if game.PlaceId == StreetsID then 
                local BuyUziKey_TextBox = KeybindsSection:NewTextBox("Buy Uzi Key", "Sets your Buy Uzi Key (Hold for best results)", function(Text)
                    if Text then 
                        BuyUziKey = string.sub(string.upper(Text), 1, 1)
                    end
                    
                    UpdateFile()
                    Notify("Ciazware", "Buy Uzi Key: "..BuyUziKey, "", 3)
                end)
                local BuyGlockKey_TextBox = KeybindsSection:NewTextBox("Buy Glock Key", "Sets your Buy Glock Key (Hold for best results)", function(Text)
                    if Text then 
                        BuyGlockKey = string.sub(string.upper(Text), 1, 1)
                    end
                    
                    UpdateFile()
                    Notify("Ciazware", "Buy Glock Key: "..BuyGlockKey, "", 3)
                end)
                local BuyAmmoKey_TextBox = KeybindsSection:NewTextBox("Buy Ammo Key", "Sets your Buy Ammo Key (Hold for best results)", function(Text)
                    if Text then 
                        BuyAmmoKey = string.sub(string.upper(Text), 1, 1)
                    end
                    
                    UpdateFile()
                    Notify("Ciazware", "Buy Ammo Key: "..BuyAmmoKey, "", 3)
                end)
                local BuyFoodKey_TextBox = KeybindsSection:NewTextBox("Buy Food Key", "Sets your Buy Food Key (Hold for best results)", function(Text)
                    if Text then 
                        BuyFoodKey = string.sub(string.upper(Text), 1, 1)
                    end
                    
                    UpdateFile()
                    Notify("Ciazware", "Buy Food Key: "..BuyFoodKey, "", 3)
                end)
            end
        end

        --[[Miscellaneous]] do 
            local MiscTab = Window:NewTab("Miscellaneous")
            
            -- Spam 
            local SpamSection = MiscTab:NewSection("Chat Spam")
            
            local Spam_Toggle = SpamSection:NewToggle("Toggle Spam", "Turns the Chat Spammer On and Off", function(Bool)
                Spamming = not Spamming
                Notify("Ciazware", "Chat Spam: "..tostring(Spamming), "", 3)
                
                coroutine.wrap(function()
                    while Spamming == true do 
                        wait(0.9)
                        Chat(WordToSpam)
                    end
                end)()
            end)
            local SpamWord_TextBox = SpamSection:NewTextBox("Word to Spam", "Spams selected Word in the Chat", function(Text)
                if Text then 
                    WordToSpam = Text
                end
            end)
            
            -- Death Note
            local DeathNoteSection = MiscTab:NewSection("Death Note")
            
            local DeathNote_TextBox = DeathNoteSection:NewTextBox("Death Note", "Good anime", function(Text)
                if Text then 
                    DeathNote = Text
                    Notify("Ciazware", "Set Death Note", "", 3)
                end
            end)
            local ClearDeathNote_Button = DeathNoteSection:NewButton("Clear Death Note", "Light now dislikes you", function()
                if DeathNote and DeathNote ~= nil then 
                    DeathNote = nil
                end
                
                Notify("Ciazware", "Cleared Death Note", "", 3)
            end)
            
            -- Misc
            local MiscSection = MiscTab:NewSection("Miscellaneous")
            
            local Rejoin_Button = MiscSection:NewButton("Rejoin", "Rejoins the Current Server", function()
                RunCommand(""..CommandPrefix.."rj")
            end)
            local ServerHop_Button = MiscSection:NewButton("Server Hop", "Hops the Server of your Current Game", function()
                RunCommand(""..CommandPrefix.."shop")
            end)
            local LoadPlugins_Button = MiscSection:NewButton("Load Plugins", "Loads Plugins from: workspace > Ciazware_Plugins", function()
                RunCommand(""..CommandPrefix.."loadplugins")
            end)
            local Time_Dropdown = MiscSection:NewDropdown("Time", "Sets the Time of your game", {"Day", "Night"}, function(Text)
                if Text then 
                    if Text == "Night" then 
                        LightingTime = 3;
                    elseif Text == "Day" then 
                        LightingTime = 14;
                    end
                end
            end)
            
            if game.PlaceId == StreetsID then 
                local ItemEsp_Button = MiscSection:NewButton("Item Esp", "Toggles Item Esp", function()
                    RunCommand(""..CommandPrefix.."iesp")
                end)
            end
        end
    end
end
InitUi()





