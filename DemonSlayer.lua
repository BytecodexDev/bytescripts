-- [[
  Demon Slayer Script by BytecodexDev
]]

-- Configurations
_G.Settings = {
  AutofarmEnabled = true;
  KillAuraEnabled = true;
}
_G.Variables = {
  JumpPower = 200;
  Walkspeed = 200;
  AutofarmSpeed = 1 -- [1-10] - 1 being the fastest and 10 being the slowest.
}
-- Demon Slayer RPG 2 Scripts made by Bytecodex
--
_G.Settings = {
  AutofarmEnabled = true;
  KillAuraEnabled = true;
  InfBlockEnabled = true;
}
_G.Variables = {
  JumpPower = 200;
  Walkspeed = 200;
  AutofarmSpeed = 1 -- [1-10] - 1 being the fastest and 10 being the slowest.
}

local EzHook = loadstring(game:HttpGetAsync("https://pastebin.com/raw/3cCyS6GF"))() -- EzHook
EzHook:HookIndex('WalkSpeed', function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Variables['Walkspeed']
end, false)
EzHook:HookIndex('JumpPower', function()
game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.Variables['JumpPower']
end, false)


  while _G.Settings['KillAuraEnabled'] == true do wait()
    game:GetService('ReplicatedStorage').All.Animations.CombatRemote.LIGHTATTACKS:FireServer(1, "AttackConfirmation");
    wait();
    game:GetService('ReplicatedStorage').All.Animations.CombatRemote.LIGHTATTACKS:FireServer(2, "AttackConfirmation");
    wait()
    game:GetService('ReplicatedStorage').All.Animations.CombatRemote.LIGHTATTACKS:FireServer(3, "AttackConfirmation");
  end


  while _G.Settings['AutofarmEnabled'] == true do wait()
    local old = game.Players.LocalPlayer.Character.Humanoid:GetState()
    game:GetService('RunService').Stepped:connect(function()
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end)
    local function tweenHRP(obj, delay)
      local props = {
        CFrame = obj.CFrame
      }
      local ti = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, delay)
      game:GetService('TweenService'):Create(game.Players.LocalPlayer.Humanoid.Character.HumanoidRootPart, ti, props):Play()
    end
    for i, v in pairs(game.Workspace.Live:GetChildren()) do
      if v.Humanoid and v:IsNot('Folder') then
        if _G.Settings['KillAuraEnabled'] == false then
          tweenHRP(v.HumanoidRootPart, _G.Variables['AutofarmSpeed'])
          _G.Settings['KillAuraEnabled'] = true
          repeat until v.Humanoid.Health ~= 0
                return old
                end
            end
        end
  end


while _G.Settings['InfBlockEnabled'] == true do wait()
    game.Players.LocalPlayer.Character.BlockBarMax = tonumber(math.huge)
    game.Players.LocalPlayer.Character.BlockBar = tonumber(math.huge)
end
