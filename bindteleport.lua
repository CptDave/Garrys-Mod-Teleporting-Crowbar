//this will make it able to bind a key for teleportation
//by Cpt. Dave

if SERVER then AddCSLuaFile() end

if CLIENT then
	concommand.Add("+teleport", function()
		local ply = LocalPlayer()

		local traceHit = ply:GetEyeTraceNoCursor()
		ply:SetPos( traceHit.HitPos )
		
	end )
	
	concommand.Add("-teleport", function()
		return
	end )
end

