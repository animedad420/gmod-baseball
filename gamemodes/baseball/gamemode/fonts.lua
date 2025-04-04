--FONT'Z

--  UIFont - For the lettering on the pitch count of the scorebug (probably replace this with textures)
surface.CreateFont( "UIFont", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 44,  --44 at 1080
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

--  UITitleFont - For the along the top of the scorebug
surface.CreateFont( "UITitleFont", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,  --30 at 1080
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

--  UIScoreFont - For the run count in the scorebug
surface.CreateFont( "UIScoreFont", {
	font = "Typographica", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 74, --74 at 1080
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

--  UiStaminaFont - For the stamina and fatigue display in the stat menu
surface.CreateFont( "UIStaminaFont", {
	font = "Coolvetica", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = ScrH()/22.5, --48 at 1080
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function ReloadFonts()
	surface.CreateFont( "UIStaminaFont", {
		font = "Coolvetica", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
		extended = false,
		size = ScrH()/22.5, --48 at 1080
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = false,
		additive = false,
		outline = false,
	} )
	--print("RELOADED FOJNTZ!!!!")
end

hook.Add( "OnScreenSizeChanged", "ReloadFonts", ReloadFonts )

ReloadFonts()