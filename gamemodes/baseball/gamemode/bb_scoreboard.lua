scoreboard = scoreboard or {}

local dicks = nil
local sizeX = 800
local sizeY = 600

function scoreboard:show()
	
	local players = player.GetAll()
	PrintTable(players)
	
	local panel = vgui.Create("DPanel",dicks)
	panel:SetPos((ScrW()*0.5)-(sizeX*0.5),(ScrH()*0.5)-(sizeY*0.5))
	panel:SetSize(sizeX,sizeY)
	
	local fullscore = vgui.Create("DPanel",panel)
	fullscore:SetSize(sizeX,200)
	fullscore:SetBackgroundColor(Color(64,64,64,255))
	
	local away = vgui.Create("DPanel",panel)
	away:SetPos(0,sizeY/3)
	away:SetSize(sizeX*0.5,(sizeY*2)/3)
	away:SetBackgroundColor(Color(200, 60, 60, 255))
	
	local home = vgui.Create("DPanel",panel)
	home:SetPos(sizeX*0.5,sizeY/3)
	home:SetSize(sizeX*0.5,(sizeY*2)/3)
	home:SetBackgroundColor(Color(60, 60, 200, 255))
	
	--
	
	function scoreboard:hide()
		panel:Remove()
	end
end

function GM:ScoreboardShow()
	scoreboard:show()
end

function GM:ScoreboardHide()
	scoreboard:hide()
end

