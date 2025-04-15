scoreboard = scoreboard or {}

--print("bill goldberg")
--PrintTable(scoreboard)

local dicks = nil

--local sizeX = 800
--local sizeY = 600

--local sizeX = ScrH()/0.75
local sizeY = ScrH()*0.9
local sizeX = sizeY/0.75
--print(sizeX)
--print(sizeY)
local open = false

local scoreGraphic = Material("baseball/scoreui_scoreboard.png", "noclamp smooth")

local teamMat1 = Material("constructcomets.png", "noclamp smooth")
local teamMat2 = Material("flatgrassfriends.png", "noclamp smooth")

local playerGrad = Material("baseball/scoreui_playergradient.png", "noclamp smooth")

function scoreboard:show()
	print(dicks)
	open = true
	
	local playerlist = player.GetAll()
	--PrintTable(playerlist)
	
	local panel = vgui.Create("DPanel",dicks)
	panel:SetPos((ScrW()*0.5)-(sizeX*0.5),(ScrH()*0.5)-(sizeY*0.5))
	panel:SetSize(sizeX,sizeY)
	
	local awayColor = Color(200,60,60,255)
	local homeColor = Color(60,60,200,255)
	local otherColor = Color(200,200,200,255)
	
	local awayLight = Color(awayColor.r,awayColor.g,awayColor.b,awayColor.a)
	awayLight:AddLightness(0.425)
	local homeLight = Color(homeColor.r,homeColor.g,homeColor.b,homeColor.a)
	homeLight:AddLightness(0.425)
	local otherLight = Color(otherColor.r,otherColor.g,otherColor.b,otherColor.a)
	otherLight:AddLightness(0.425)
	
	local inning = GetGlobalInt( "inning" )
	local inningSide = GetGlobalBool( "inningside" )
	
	--[[panel.Paint = function(self,w,h)
		draw.TexturedQuad
		{
			texture = surface.GetTextureID "vgui/gradient-d",
			color = Color(0, 0, 0, 120),
			x = 0,
			y = h*0.4,
			w = w,
			h = h*0.6
		}
	end]]
	
	local fullscore = vgui.Create("DPanel",panel)
	fullscore:SetSize(sizeX,sizeY*0.2)
	fullscore:SetBackgroundColor(Color(64,64,64,255))
	
	fullscore.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(64, 64, 64, 255))
		
		surface.SetDrawColor( 255, 255, 255, 32 )
		surface.SetMaterial(teamMat1)
		surface.DrawTexturedRect(w*0.05, h*0.1, h*0.8, h*0.8)
		surface.SetMaterial(teamMat2)
		surface.DrawTexturedRect((w*0.95)-(h*0.8), h*0.1, h*0.8, h*0.8)
		
		draw.TexturedQuad
		{
			texture = surface.GetTextureID "vgui/gradient-d",
			color = Color(0, 0, 0, 120),
			x = 0,
			y = 0,
			w = w,
			h = h
		}
		surface.DrawTexturedRect( 0, 0, w, h )
		
		draw.SimpleText( "RED TEAM", "UIScoreTeamFont", w*0.0125, h*0.05, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.SimpleText( "BLUE TEAM", "UIScoreTeamFont", w*0.9885, h*0.05, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
		
		draw.SimpleText( 0, "UIScoreRunsFont", w*0.025, h*1.14, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
		draw.SimpleText( 0, "UIScoreRunsFont", w*0.975, h*1.14, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)
	end
	
	local backboard = vgui.Create("DPanel",fullscore)
	backboard:SetSize(sizeX*0.265,sizeY*0.17)
	backboard:SetPos(sizeX*0.5-(backboard:GetWide()*0.5),fullscore:GetWide()*0.0125)
	backboard:SetBackgroundColor(Color(158,158,158,255))
	
	local fullnine = vgui.Create("DPanel",fullscore)
	fullnine:SetSize(sizeX*0.35,sizeY*0.13)
	fullnine:SetPos(sizeX*0.5-(fullnine:GetWide()*0.5),fullscore:GetWide()*0.0425)
	fullnine:SetBackgroundColor(Color(255,255,255,255))
	
	fullnine.Paint = function(self,w,h)
		--draw.RoundedBox(0,0,0,w,h,Color(64, 64, 64, 0))
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial(scoreGraphic)
		surface.DrawTexturedRect( 0, 0, w, h )
		
		if inning > 1 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.035, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.035, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 1 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.035, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.035, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.035, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if inning > 2 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.1075, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.1075, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 2 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.1075, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.1075, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.1075, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if inning > 3 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.18, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.18, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 3 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.18, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.18, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.18, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if inning > 4 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.2525, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.2525, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 4 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.2525, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.2525, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.2525, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if inning > 5 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.325, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.325, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 5 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.325, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.325, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.325, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if inning > 6 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.3975, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.3975, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 6 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.3975, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.3975, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.3975, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if inning > 7 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.47, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.47, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 7 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.47, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.47, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.47, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if inning > 8 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.5425, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.5425, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 8 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.5425, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.5425, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.5425, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if inning > 9 then
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.615, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "9" , "UIScoreTeamFont", w*0.615, h*0.845, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		if inning == 9 then
			if inningSide == true then
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.615, h*0.51, Color(160, 160, 160, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.615, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText( "9" , "UIScoreTeamFont", w*0.615, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
			draw.SimpleText( "99" , "UIScoreTeamFont", w*0.705, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "99" , "UIScoreTeamFont", w*0.705, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		
			draw.SimpleText( "99" , "UIScoreTeamFont", w*0.8225, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "99" , "UIScoreTeamFont", w*0.8225, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		
			draw.SimpleText( "99" , "UIScoreTeamFont", w*0.942, h*0.51, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "99" , "UIScoreTeamFont", w*0.942, h*0.845, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	local away = vgui.Create("DPanel",panel)
	away:SetPos(0,sizeY*0.2)
	away:SetSize(sizeX/3,sizeY*0.8)
	away:SetBackgroundColor(awayColor)
	
	away.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,awayColor)
		draw.TexturedQuad
		{
			texture = surface.GetTextureID "vgui/gradient-d",
			color = Color(0, 0, 0, 200),
			x = 0,
			y = 0,
			w = w,
			h = h
		}
		draw.SimpleText( "LINEUP" , "UIScoreNameFont", w*0.5, h*0.03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText( "CAPTAIN" , "UIScoreNameFont", w*0.5, h*0.46, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText( "RESERVE" , "UIScoreNameFont", w*0.5, h*0.556, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	for i=0,19,1 do
		local playerBar = vgui.Create("DPanel",away)
		playerBar:SetSize(sizeX/3,sizeY*0.03)
		local topBar = playerBar:GetTall()*1.58
		local midBar = playerBar:GetTall()*1.58
		if i < 9 then midBar = 0 end
		local botBar = playerBar:GetTall()*1.58
		if i < 10 then botBar = 0 end
		playerBar:SetPos(0,(playerBar:GetTall()*1.103)*(i)+topBar+midBar+botBar)
		--playerBar:SetBackgroundColor(Color(255, 255, 255, 255))
		
		playerBar.Paint = function(self,w,h)
			draw.RoundedBox(3,w*0.01,0,w*0.98,h,awayColor)
			
			surface.SetDrawColor( 255, 255, 255, 196 )
			surface.SetMaterial(playerGrad)
			surface.DrawTexturedRect(w*0.01, 0, w*0.98, h)
			
			--[[draw.TexturedQuad
			{
				texture = surface.GetTextureID "vgui/gradient-d",
				color = ColorAlpha(awayColor,64),
				x = w*0.01,
				y = 0,
				w = w*0.98,
				h = h
			}
			
			draw.TexturedQuad
			{
				texture = surface.GetTextureID "vgui/gradient-r",
				color = ColorAlpha(awayColor,128),
				x = w*0.81,
				y = 0,
				w = w*0.18,
				h = h
			}]]
			
			draw.SimpleText( "99" , "UIScoreNameFont", w*0.05, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "PlayerWithLongName " .. i+1 , "UIScoreNameFont", w*0.1, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText( "DH" , "UIScoreNameFont", w*0.825, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "999" , "UIScoreNameFont", w*0.975, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end
	
	local home = vgui.Create("DPanel",panel)
	home:SetPos(2*sizeX/3,sizeY*0.2)
	home:SetSize(sizeX/3,sizeY*0.8)
	home:SetBackgroundColor(homeColor)
	
	home.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,homeColor)
		draw.TexturedQuad
		{
			texture = surface.GetTextureID "vgui/gradient-d",
			color = Color(0, 0, 0, 200),
			x = 0,
			y = 0,
			w = w,
			h = h
		}
		draw.SimpleText( "LINEUP" , "UIScoreNameFont", w*0.5, h*0.03, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText( "CAPTAIN" , "UIScoreNameFont", w*0.5, h*0.46, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText( "RESERVE" , "UIScoreNameFont", w*0.5, h*0.556, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	for ID, ply in pairs(playerlist) do
		--print(ID)
		--print(ply)
		
		local playerBar = vgui.Create("DPanel",home)
		playerBar:SetSize(sizeX/3,sizeY*0.03)
		local topBar = playerBar:GetTall()*1.58
		local midBar = playerBar:GetTall()*1.58
		if ID < 10 then midBar = 0 end
		local botBar = playerBar:GetTall()*1.58
		if ID < 11 then botBar = 0 end
		playerBar:SetPos(0,(playerBar:GetTall()*1.103)*(ID-1)+topBar+midBar+botBar)
		--playerBar:SetBackgroundColor(Color(200, 200, 200, 255))
		
		--print(ply:Nick())
		
		playerBar.Paint = function(self,w,h)
			draw.RoundedBox(3,w*0.01,0,w*0.98,h,homeColor)
			
			surface.SetDrawColor( 255, 255, 255, 196 )
			surface.SetMaterial(playerGrad)
			surface.DrawTexturedRect(w*0.01, 0, w*0.98, h)
			
			--[[draw.TexturedQuad
			{
				texture = surface.GetTextureID "vgui/gradient-d",
				color = ColorAlpha(homeColor, 64),
				x = w*0.01,
				y = 0,
				w = w*0.98,
				h = h
			}
			
			draw.TexturedQuad
			{
				texture = surface.GetTextureID "vgui/gradient-r",
				color = ColorAlpha(homeColor, 128),
				x = w*0.81,
				y = 0,
				w = w*0.18,
				h = h
			}]]
			
			draw.SimpleText( "?" , "UIScoreNameFont", w*0.05, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			
			local Avatar = vgui.Create( "AvatarImage", playerBar )
			Avatar:SetSize( h , h )
			Avatar:SetPos( w*0.1 , 0 )
			Avatar:SetPlayer( ply )
			
			draw.SimpleText( ply:Nick(), "UIScoreNameFont", w*0.19, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			
			draw.SimpleText( "?" , "UIScoreNameFont", w*0.825, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			
			local ping = ply:Ping()
			if ping == 0 then ping = "BOT" end
			
			draw.SimpleText( ping , "UIScoreNameFont", w*0.975, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end
	
	--[[for i=1,19,1 do
		local playerBar = vgui.Create("DPanel",home)
		playerBar:SetSize(sizeX/3,sizeY*0.03)
		local topBar = playerBar:GetTall()*0.8
		local midBar = playerBar:GetTall()*0.8
		if i < 9 then midBar = 0 end
		local botBar = playerBar:GetTall()*0.8
		if i < 10 then botBar = 0 end
		playerBar:SetPos(0,(playerBar:GetTall()+3)*(i)+topBar+midBar+botBar)
		playerBar:SetBackgroundColor(Color(200, 200, 200, 255))
		
		playerBar.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(200, 200, 200, 255))
			draw.SimpleText( "99" , "UIScoreNameFont", w*0.05, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "PlayerWithLongName " .. i+41 , "UIScoreNameFont", w*0.1, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText( "DH" , "UIScoreNameFont", w*0.825, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "999" , "UIScoreNameFont", w*0.975, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end]]
	
	local other = vgui.Create("DPanel",panel)
	other:SetPos(sizeX/3,sizeY*0.2)
	other:SetSize(sizeX/3,sizeY*0.8)
	other:SetBackgroundColor(Color(200, 200, 200, 255))
	
	other.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(200, 200, 200, 255))
		draw.TexturedQuad
		{
			texture = surface.GetTextureID "vgui/gradient-d",
			color = Color(0, 0, 0, 200),
			x = 0,
			y = 0,
			w = w,
			h = h
		}
	end
	
	for i=0,23,1 do
		local playerBar = vgui.Create("DPanel",other)
		playerBar:SetSize(sizeX/3,sizeY*0.03)
		local topBar = playerBar:GetTall()*0.25
		playerBar:SetPos(0,(playerBar:GetTall()*1.103)*(i)+topBar)
		--playerBar:SetBackgroundColor(Color(200, 200, 200, 255))
		
		playerBar.Paint = function(self,w,h)
			draw.RoundedBox(3,w*0.01,0,w*0.98,h,otherColor)
			
			surface.SetDrawColor( 255, 255, 255, 196 )
			surface.SetMaterial(playerGrad)
			surface.DrawTexturedRect(w*0.01, 0, w*0.98, h)
			
			--[[draw.TexturedQuad
			{
				texture = surface.GetTextureID "vgui/gradient-d",
				color = Color(200, 200, 200, 64),
				x = w*0.01,
				y = 0,
				w = w*0.98,
				h = h
			}
			
			draw.TexturedQuad
			{
				texture = surface.GetTextureID "vgui/gradient-r",
				color = Color(200, 200, 200, 128),
				x = w*0.81,
				y = 0,
				w = w*0.18,
				h = h
			}]]
			
			--draw.SimpleText( "99" , "UIScoreNameFont", w*0.05, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "PlayerWithLongName " .. i+21 , "UIScoreNameFont", w*0.1, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			--draw.SimpleText( "DH" , "UIScoreNameFont", w*0.825, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "999" , "UIScoreNameFont", w*0.975, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end
	
	print(scoreboard)
	
	--
	
	function scoreboard:hide()
		open = false
		panel:Remove()
	end
end

function GM:ScoreboardShow()
	scoreboard:show()
end

function GM:ScoreboardHide()
	scoreboard:hide()
end

function UpdateBoardSize()
	sizeY = ScrH()*0.9
	sizeX = sizeY/0.75
end

hook.Add( "OnScreenSizeChanged", "UpdateBoardSize", UpdateBoardSize )