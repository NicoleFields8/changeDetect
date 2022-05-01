local versionNum = "1.3"
local lastUpdate = "5/1/2022"

local autoCom = workspace.LegoGUI.SurfaceGui.Line1
local autoOff = "Auto Commends: Off"
local autoOn = "Auto Commends: On"

local player = game.Players.LocalPlayer
local curComs = player.leaderstats.Commends.Value
local addedComs = nil

local curTeam = player.TeamColor
local changedTeam = nil

curComs = player.leaderstats.Commends.Value

autoCom:GetPropertyChangedSignal("Text"):Connect(function()
	if autoCom.Text == autoOn then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Auto Commends";
			Text = "Auto Commends have been turned on.";
			Duration = 5;
		})
	elseif autoCom.Text == autoOff then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Auto Commends";
			Text = "Auto Commends have been turned off.";
			Duration = 5;
		})
	elseif autoCom.Text ~= autoOn or autoOff then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Auto Commends";
			Text = "Auto Commends have been switched to an unknown value. For more info see F9.";
			Duration = 5;
		})
		error("Auto Commends could not be found based on the information given. The LegoGUI text is " .. autoCom.Text)
	end
end)

print("Change Detector is currently running on version " .. versionNum .. " last updated on " .. lastUpdate)

--LOADED NOTIFICATION
game.StarterGui:SetCore("SendNotification", {
	Title = "✅ Successfully Loaded ✅";
	Text = "Change detector has been successfully loaded.";
	Duration = 5;
})

--LOAD SUCCESS
print("------------------------------------------------------------------------")
print("Change Detector has been successfully loaded!")
print("------------------------------------------------------------------------")
print("Version " .. versionNum)
print("Last updated on " .. lastUpdate)

--TEAM DETECTION

player:GetPropertyChangedSignal("TeamColor"):Connect(function()
	changedTeam = player.TeamColor

	game.StarterGui:SetCore("SendNotification", {
		Title = "Team Change";
		Text = "Your team has been changed to `" .. tostring(player.Team) .. "`";
		Duration = 5;
	})
end)

--COMMEND DETECTION
curComs = player.leaderstats.Commends.Value

player.leaderstats.Commends.Changed:Connect(function()
	addedComs = player.leaderstats.Commends.Value - curComs
	curComs = player.leaderstats.Commends.Value

	if addedComs == 1 then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Auto Commends";
			Text = "You have been given 1 auto commend. You now have " .. curComs .. " commends.";
			Duration = 5;
		})
	else
		game.StarterGui:SetCore("SendNotification", {
			Title = "Commend Change";
			Text = "You have been given " .. addedComs .. " commends. You now have " .. curComs .. " commends.";
			Duration = 5;
		})
	end
end)
