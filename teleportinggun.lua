SWEP.PrintName 		= "Teleport" 
 
SWEP.Author 		= "Cpt. Dave" 
SWEP.Instructions 	= "left click to teleport" 
SWEP.Contact 		= "Contact me on steam" 
SWEP.Purpose 		= "To Teleport!"
 
SWEP.AdminSpawnable = true 
SWEP.Spawnable 		= true 
 
SWEP.ViewModelFlip = false
 
SWEP.ViewModelFOV 	= 64 
SWEP.ViewModel 		= "models/weapons/v_crowbar.mdl" 
SWEP.WorldModel 	= "models/weapons/w_crowbar.mdl" 
 
SWEP.AutoSwitchTo 	= false 
SWEP.AutoSwitchFrom = true 
 
SWEP.Slot 			= 1 
SWEP.SlotPos = 1 
 
SWEP.HoldType = "Melee"
 
SWEP.FiresUnderwater = true 
 
SWEP.Weight = 0 
 
SWEP.DrawCrosshair = true 
 
SWEP.Category = "Teleportation" 
 
SWEP.DrawAmmo = false 
 
SWEP.Base = "weapon_base" 

 
SWEP.Primary.Sound = "ambient/levels/canals/drip1.wav"
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
 
function SWEP:Initialize()
	util.PrecacheSound(self.Primary.Sound)
		self:SetWeaponHoldType( self.HoldType )
end 
 
function SWEP:PrimaryAttack()

	if (!SERVER) then return end
	if ( !self:CanPrimaryAttack() ) then return end
	
	self:EmitSound(Sound(self.Primary.Sound))
	local trace = self.Owner:GetEyeTraceNoCursor()
	self.Owner:SetPos( trace.HitPos )
 
	
end 
 
 function SWEP:SecondaryAttack()
 
	if (!SERVER) then return end
	if ( !self:CanSecondaryAttack() ) then return end
	
	if (traceHit) and (saveTrace) then
		self:EmitSound(Sound(self.Primary.Sound))
		self.Owner:SetPos( traceHit )
	end
	
	if (!traceHit) and (!saveTrace) then
		saveTrace = self.Owner:GetEyeTraceNoCursor()
		traceHit = saveTrace.HitPos
		
	end
	
 end
 
 concommand.Add("teleClear", function()
 
	if (!saveTrace) and (!traceHit) then
		Msg("No save detected\n")
		return
	end
 
	if (saveTrace) and (traceHit) then
		saveTrace = nil
		traceHit = nil
		Msg("Teleport save has been cleared\n")
	end
 end )
 