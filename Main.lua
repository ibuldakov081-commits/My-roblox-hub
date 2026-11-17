-- Сохрани это как raw файл на гитхабе и грузи через loadstring
local p = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local char = p.Character or p.CharacterAdded:Wait()
local folder = Instance.new("Folder", workspace)
folder.Name = "br_Visuals"

-- GUI
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 300)
frame.Position = UDim2.new(0, 10, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 2

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 4)

local function toggle(name, func)
    local b = Instance.new("TextButton", scroll)
    b.Size = UDim2.new(1, 0, 0, 25)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    b.Text = " " .. name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextXAlignment = Enum.TextXAlignment.Left
    b.Font = Enum.Font.Gotham
    b.TextSize = 12
    local state = false
    b.MouseButton1Click:Connect(function()
        state = not state
        b.BackgroundColor3 = state and Color3.fromRGB(100, 50, 150) or Color3.fromRGB(30, 30, 40)
        func(state)
    end)
end

-- Визуалы
local swords, planets, crown, sphere, orb = {}, {}, nil, nil, nil

toggle("Мечи", function(s)
    if s then for i=1,4 do local m=Instance.new("Part",folder) m.Size=Vector3.new(.5,4,.5) m.Material=Enum.Material.Neon m.Color=Color3.fromRGB(138,43,226) m.Anchored=true m.CanCollide=false table.insert(swords,{p=m,o=i*1.57}) end
    else for _,v in ipairs(swords) do v.p:Destroy() end swords={} end
end)

toggle("Снег", function(s)
    if s then local e=Instance.new("ParticleEmitter",char.HumanoidRootPart) e.Texture="rbxassetid://5107157403" e.Rate=100 e.Lifetime=NumberRange.new(3) e.Speed=NumberRange.new(5) e.Name="Snow" else char.HumanoidRootPart:FindFirstChild("Snow"):Destroy() end
end)

toggle("Небо", function(s)
    local sky = game.Lighting:FindFirstChildOfClass("Sky")
    if s then local n=Instance.new("Sky",game.Lighting) n.Name="brSky" n.SkyboxBk="rbxassetid://150592490" if sky then sky:Destroy() end
    else local n=game.Lighting:FindFirstChild("brSky") if n then n:Destroy() end if sky then sky.Parent=game.Lighting end end
end)

toggle("Планеты", function(s)
    if s then for i=1,3 do local m=Instance.new("Part",folder) m.Shape=Enum.PartType.Ball m.Size=Vector3.new(3,3,3) m.Material=Enum.Material.ForceField m.Anchored=true m.CanCollide=false m.Color=Color3.fromRGB(math.random(100,255),math.random(100,255),math.random(100,255)) table.insert(planets,{p=m,o=i*2.09,s=math.random(1,3)}) end
    else for _,v in ipairs(planets) do v.p:Destroy() end planets={} end
end)

toggle("Корона", function(s)
    if s then crown=Instance.new("Part",folder) crown.Shape=Enum.PartType.Cylinder crown.Size=Vector3.new(2,1,2) crown.Material=Enum.Material.Neon crown.Color=Color3.fromRGB(255,215,0) crown.Anchored=true crown.CanCollide=false
    else if crown then crown:Destroy() crown=nil end end
end)

toggle("Аура", function(s)
    if s then local e=Instance.new("ParticleEmitter",char.HumanoidRootPart) e.Name="Aura" e.Texture="rbxassetid://243660364" e.Rate=50 e.Speed=NumberRange.new(2) e.Lifetime=NumberRange.new(1) e.Size=NumberSequence.new(2,0) e.Color=ColorSequence.new(Color3.fromRGB(138,43,226))
    else char.HumanoidRootPart:FindFirstChild("Aura"):Destroy() end
end)

toggle("Сфера", function(s)
    if s then sphere=Instance.new("Part",folder) sphere.Shape=Enum.PartType.Ball sphere.Size=Vector3.new(10,10,10) sphere.Material=Enum.Material.ForceField sphere.Transparency=.5 sphere.Anchored=true sphere.CanCollide=false
    else if sphere then sphere:Destroy() sphere=nil end end
end)

toggle("Трейл", function(s)
    if s then local t=Instance.new("Trail",char.HumanoidRootPart) t.Name="Trail" t.Attachment0=Instance.new("Attachment",char.HumanoidRootPart) t.Attachment1=Instance.new("Attachment",char.HumanoidRootPart) t.Lifetime=.5 t.Color=ColorSequence.new(Color3.fromRGB(138,43,226))
    else char.HumanoidRootPart:FindFirstChild("Trail"):Destroy() end
end)

toggle("Свет", function(s)
    if s then local l=Instance.new("PointLight",char.HumanoidRootPart) l.Name="Glow" l.Range=15 l.Color=Color3.fromRGB(138,43,226) l.Brightness=2
    else char.HumanoidRootPart:FindFirstChild("Glow"):Destroy() end
end)

toggle("Орбита", function(s)
    if s then orb=Instance.new("ParticleEmitter",char.HumanoidRootPart) orb.Name="Orb" orb.Texture="rbxassetid://5107157403" orb.Rate=100 orb.Speed=NumberRange.new(0) orb.Lifetime=NumberRange.new(.5) orb.Size=NumberSequence.new(1.5,0)
    else char.HumanoidRootPart:FindFirstChild("Orb"):Destroy() orb=nil end
end)

toggle("Глаза", function(s)
    if s then local h=char:FindFirstChild("Head") local l=Instance.new("PointLight",h) l.Name="Eye" l.Color=Color3.fromRGB(255,0,0) l.Range=5 l.Brightness=5
    else char.Head:FindFirstChild("Eye"):Destroy() end
end)

toggle("Пламя", function(s)
    if s then local f=Instance.new("Fire",char.HumanoidRootPart) f.Name="Fire" f.Size=10 f.Color=Color3.fromRGB(138,43,226)
    else char.HumanoidRootPart:FindFirstChild("Fire"):Destroy() end
end)

toggle("Звездопад", function(s)
    if s then local e=Instance.new("ParticleEmitter",char.HumanoidRootPart) e.Name="Star" e.Texture="rbxassetid://5107157403" e.Rate=20 e.Speed=NumberRange.new(10,20) e.Lifetime=NumberRange.new(2) e.Size=NumberSequence.new(1,0) e.Color=ColorSequence.new(Color3.fromRGB(255,255,0))
    else char.HumanoidRootPart:FindFirstChild("Star"):Destroy() end
end)

toggle("Ночь", function(s)
    if s then game.Lighting.ClockTime=0 game.Lighting.Brightness=.5 else game.Lighting.ClockTime=14 game.Lighting.Brightness=2 end
end)

toggle("Радуга", function(s)
    if s then local t=Instance.new("Trail",char.HumanoidRootPart) t.Name="Rainbow" t.Attachment0=Instance.new("Attachment",char.HumanoidRootPart) t.Attachment1=Instance.new("Attachment",char.HumanoidRootPart) t.Lifetime=1
        task.spawn(function() while t.Parent do t.Color=ColorSequence.new(Color3.fromHSV(tick()%1,1,1)) task.wait(.05) end end)
    else char.HumanoidRootPart:FindFirstChild("Rainbow"):Destroy() end
end)

-- Анимация
rs.RenderStepped:Connect(function()
    local root = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    if root then
        local t = tick()
        for _,v in ipairs(swords) do v.p.CFrame = CFrame.new(root.Position + Vector3.new(math.cos(t*2+v.o)*5, 2, math.sin(t*2+v.o)*5)) end
        for _,v in ipairs(planets) do v.p.CFrame = CFrame.new(root.Position + Vector3.new(math.cos(t*v.s+v.o)*7, math.sin(t*2)*2+2, math.sin(t*v.s+v.o)*7)) end
        if sphere then sphere.CFrame = CFrame.new(root.Position) end
        if orb then orb.Parent = root end
    end
    if crown and head then crown.CFrame = CFrame.new(head.Position + Vector3.new(0,2,0)) * CFrame.Angles(0, t*2, 0) end
end)
