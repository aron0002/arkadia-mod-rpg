MOD_RPG.event_counter = 0

--- aktualizacja info na podstawie zmian gmcp.char.info
function MOD_RPG:change_info_by_gmcp()
  for k, v in pairs(gmcp.char.info) do
    MOD_RPG.char:update_info(k, "value", v)
  end
  return
end

--- aktualizacja state na podstawie zmian gmcp.char.state
function MOD_RPG:change_state_by_gmcp()
  for k, v in pairs(gmcp.char.state) do
    MOD_RPG.char:update_state(k, "level", tonumber(v))
  end
  return
end

if scripts.event_handlers["mod_rpg_engine_gmcp_char_info"] then
  killAnonymousEventHandler(scripts.event_handlers["mod_rpg_engine_gmcp_char_info"])
end
scripts.event_handlers["mod_rpg_engine_gmcp_char_info"] = registerAnonymousEventHandler("gmcp.char.info", MOD_RPG.change_info_by_gmcp)

if scripts.event_handlers["mod_rpg_engine_gmcp_char_state"] then
  killAnonymousEventHandler(scripts.event_handlers["mod_rpg_engine_gmcp_char_state"])
end
scripts.event_handlers["mod_rpg_engine_gmcp_char_state"] = registerAnonymousEventHandler("gmcp.char.state", MOD_RPG.change_state_by_gmcp)

-- TODO: obsluga msg z gmcp
--[[
function MOD_RPG.handle_gmcp_msg()
end

if scripts.event_handlers["mod_rpg_engine_gmcp_msg"] then
  killAnonymousEventHandler(scripts.event_handlers["mod_rpg_engine_gmcp_msg"])
end
scripts.event_handlers["mod_rpg_engine_gmcp_msg"] = registerAnonymousEventHandler("gmcp.gmcp_msgs", MOD_RPG.handle_gmcp_msg)
]]--