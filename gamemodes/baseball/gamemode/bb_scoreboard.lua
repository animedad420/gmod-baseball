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

function scoreboard:show()
	open = true
	
	local players = player.GetAll()
	PrintTable(players)
	
	local panel = vgui.Create("DPanel",dicks)
	panel:SetPos((ScrW()*0.5)-(sizeX*0.5),(ScrH()*0.5)-(sizeY*0.5))
	panel:SetSize(sizeX,sizeY)
	
	local fullscore = vgui.Create("DPanel",panel)
	fullscore:SetSize(sizeX,sizeY*0.25)
	fullscore:SetBackgroundColor(Color(64,64,64,255))
	
	fullscore.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(64, 64, 64, 255))
		
		draw.SimpleText( "RED TEAM", "UIScoreTeamFont", w*0.025, h*0.05, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.SimpleText( "BLUE TEAM", "UIScoreTeamFont", w*0.975, h*0.05, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
		
		draw.SimpleText( 0, "UIScoreRunsFont", w*0.05, h*1.1, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
		draw.SimpleText( 0, "UIScoreRunsFont", w*0.95, h*1.1, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)
	end
	
	local away = vgui.Create("DPanel",panel)
	away:SetPos(0,sizeY*0.25)
	away:SetSize(sizeX/3,sizeY*0.75)
	away:SetBackgroundColor(Color(200, 60, 60, 255))
	
	for i=0,19,1 do
		local playerBar = vgui.Create("DPanel",away)
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
			draw.SimpleText( "PlayerWithLongName " .. i+1 , "UIScoreNameFont", w*0.1, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText( "DH" , "UIScoreNameFont", w*0.825, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "999" , "UIScoreNameFont", w*0.975, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end
	
	local home = vgui.Create("DPanel",panel)
	home:SetPos(2*sizeX/3,sizeY*0.25)
	home:SetSize(sizeX/3,sizeY*0.75)
	home:SetBackgroundColor(Color(60, 60, 200, 255))
	
	for ID, ply in pairs(players) do
		print(ID)
		print(ply)
		
		local playerBar = vgui.Create("DPanel",home)
		playerBar:SetSize(sizeX/3,sizeY*0.03)
		local topBar = playerBar:GetTall()*0.8
		local midBar = playerBar:GetTall()*0.8
		if ID < 9 then midBar = 0 end
		local botBar = playerBar:GetTall()*0.8
		if ID < 10 then botBar = 0 end
		playerBar:SetPos(0,(playerBar:GetTall()+3)*(ID-1)+topBar+midBar+botBar)
		playerBar:SetBackgroundColor(Color(200, 200, 200, 255))
		
		print(ply:Nick())
		
		playerBar.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(200, 200, 200, 255))
			draw.SimpleText( "99" , "UIScoreNameFont", w*0.05, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			
			local Avatar = vgui.Create( "AvatarImage", playerBar )
			Avatar:SetSize( h , h )
			Avatar:SetPos( w*0.1 , 0 )
			Avatar:SetPlayer( LocalPlayer(), 64 )
			
			draw.SimpleText( ply:Nick(), "UIScoreNameFont", w*0.19, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText( "DH" , "UIScoreNameFont", w*0.825, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "999" , "UIScoreNameFont", w*0.975, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end
	
	for i=1,19,1 do
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
	end
	
	local other = vgui.Create("DPanel",panel)
	other:SetPos(sizeX/3,sizeY*0.25)
	other:SetSize(sizeX/3,sizeY*0.75)
	other:SetBackgroundColor(Color(200, 200, 200, 255))
	
	for i=0,19,1 do
		local playerBar = vgui.Create("DPanel",other)
		playerBar:SetSize(sizeX/3,sizeY*0.03)
		local topBar = playerBar:GetTall()*0.8
		playerBar:SetPos(0,(playerBar:GetTall()+3)*(i)+topBar)
		playerBar:SetBackgroundColor(Color(200, 200, 200, 255))
		
		playerBar.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(200, 200, 200, 255))
			--draw.SimpleText( "99" , "UIScoreNameFont", w*0.05, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "PlayerWithLongName " .. i+21 , "UIScoreNameFont", w*0.1, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			--draw.SimpleText( "DH" , "UIScoreNameFont", w*0.825, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText( "999" , "UIScoreNameFont", w*0.975, h/2, Color(0, 0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end
	
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