
AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )

if ( CLIENT ) then

	CreateConVar( "cl_playercolor", "0.24 0.34 0.41", { FCVAR_ARCHIVE, FCVAR_USERINFO, FCVAR_DONTRECORD }, "The value is a Vector - so between 0-1 - not between 0-255" )
	CreateConVar( "cl_weaponcolor", "0.30 1.80 2.10", { FCVAR_ARCHIVE, FCVAR_USERINFO, FCVAR_DONTRECORD }, "The value is a Vector - so between 0-1 - not between 0-255" )
	CreateConVar( "cl_playerskin", "0", { FCVAR_ARCHIVE, FCVAR_USERINFO, FCVAR_DONTRECORD }, "The skin to use, if the model has any" )
	CreateConVar( "cl_playerbodygroups", "0", { FCVAR_ARCHIVE, FCVAR_USERINFO, FCVAR_DONTRECORD }, "The bodygroups to use, if the model has any" )

end

local PLAYER = {}

PLAYER.DuckSpeed			= 0.1		-- How fast to go from not ducking, to ducking
PLAYER.UnDuckSpeed			= 0.1		-- How fast to go from ducking, to not ducking

--
-- Creates a Taunt Camera
--
PLAYER.TauntCam = TauntCamera()

--
-- See gamemodes/base/player_class/player_default.lua for all overridable variables
--
PLAYER.SlowWalkSpeed		= 50
PLAYER.WalkSpeed 			= 250
PLAYER.RunSpeed				= 600
PLAYER.JumpPower			= 0

--
-- Set up the network table accessors
--
function PLAYER:SetupDataTables()

	BaseClass.SetupDataTables( self )
	self.Player:NetworkVar( "Float", 7, "DiveTime" )
	self.Player:NetworkVar( "Float", 8, "MaxStaminaPercent" )
	self.Player:NetworkVar( "Float", 9, "Stamina" )
	self.Player:NetworkVar( "Float", 10, "MaxStamina" )
	self.Player:NetworkVar( "Vector", 0, "RunVector" )
	self.Player:NetworkVar( "Bool", 0, "IsDiving")
	self.Player:NetworkVar( "Bool", 1, "UsingPhysgun" )
	self.Player:NetworkVar( "Bool", 2, "UsingPsychicHands" )
	self.Player:NetworkVar( "Int", 0, "LegsStat")
	self.Player:NetworkVar( "Int", 1, "BodyStat")
	self.Player:NetworkVar( "Int", 2, "ArmsStat")
	self.Player:NetworkVar( "Int", 3, "HeartStat")
	self.Player:NetworkVar( "Int", 4, "StatPoints")
end


function PLAYER:Loadout()

	self.Player:RemoveAllAmmo()

	self.Player:Give( "psychichands" )
	self.Player:Give( "baseball_bat" )
	if self.Player:IsAdmin() then
		self.Player:Give( "gmod_tool" )
	end

	self.Player:SwitchToDefaultWeapon()

end

function PLAYER:SetModel()

	BaseClass.SetModel( self )

	local skin = self.Player:GetInfoNum( "cl_playerskin", 0 )
	self.Player:SetSkin( skin )

	local groups = self.Player:GetInfo( "cl_playerbodygroups" )
	if ( groups == nil ) then groups = "" end
	local groups = string.Explode( " ", groups )
	for k = 0, self.Player:GetNumBodyGroups() - 1 do
		self.Player:SetBodygroup( k, tonumber( groups[ k + 1 ] ) or 0 )
	end

end

--
-- Called when the player spawns
--
function PLAYER:Spawn()

	BaseClass.Spawn( self )

	local col = self.Player:GetInfo( "cl_playercolor" )
	self.Player:SetPlayerColor( Vector( col ) )

	local col = Vector( self.Player:GetInfo( "cl_weaponcolor" ) )
	if ( col:Length() < 0.001 ) then
		col = Vector( 0.001, 0.001, 0.001 )
	end
	self.Player:SetWeaponColor( col )

end

--
-- Return true to draw local (thirdperson) camera - false to prevent - nothing to use default behaviour
--
function PLAYER:ShouldDrawLocal()

	if ( self.TauntCam:ShouldDrawLocalPlayer( self.Player, self.Player:IsPlayingTaunt() ) ) then return true end

end

--
-- Allow player class to create move
--
function PLAYER:CreateMove( cmd )

	if ( self.TauntCam:CreateMove( cmd, self.Player, self.Player:IsPlayingTaunt() ) ) then return true end

end

--
-- Allow changing the player's view
--
function PLAYER:CalcView( view )

	if ( self.TauntCam:CalcView( view, self.Player, self.Player:IsPlayingTaunt() ) ) then return true end

	-- Your stuff here

end

function PLAYER:GetHandsModel()

	-- return { model = "models/weapons/c_arms_cstrike.mdl", skin = 1, body = "0100000" }

	local cl_playermodel = self.Player:GetInfo( "cl_playermodel" )
	return player_manager.TranslatePlayerHands( cl_playermodel )

end

function PLAYER:StartMove( move )

end

function PLAYER:FinishMove( move )

end

player_manager.RegisterClass( "player_sandbox", PLAYER, "player_default" )
