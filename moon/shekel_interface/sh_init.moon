AddCSLuaFile "cl_manager.lua"
AddCSLuaFile "sh_manager.lua"
AddCSLuaFile "sh_playermeta.lua"

include "sh_manager.lua"
include "sh_playermeta.lua"

if SERVER
    include "sv_manager.lua"

if CLIENT
    include "cl_manager.lua"
