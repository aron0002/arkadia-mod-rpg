function MOD_RPG.affluence:init()
  self:set_desc("poziom zamoznosci")
  self:set_internal_value(0)                    --- wartosc to troche odpowiednik wartosci monet w depozytach przeliczone na miedziaki
  self:set_level(1)
  self:set_target_internal_value(1000*24000)    --- 1000 mithryli
  --self:import_deposits_data()
  self:generate_triggers()
  self:generate_aliases()
  
  if scripts.event_handlers["mod_rpg_affluence"] then
    killAnonymousEventHandler(scripts.event_handlers["mod_rpg_affluence"])
  end
  scripts.event_handlers["mod_rpg_affluence"] = registerAnonymousEventHandler("mod_rpg_affluence", MOD_RPG.affluence.handle_events)  
  
end

function MOD_RPG.affluence:handle_events(event, arg, profile)
  MOD_RPG.affluence:import_deposits_data()
  --MOD_RPG.affluence:view()
end

function MOD_RPG.affluence:get_sublevel_desc()
  local l = self:get_level()
  if l == 10 then
    return ""
  end

  local current_value = self:get_internal_value()
   
  local min_value = 0
  if l-1 > 0 then
    min_value = MOD_RPG.affluence.level_values[tostring(l-1)]
  end
  local max_value = MOD_RPG.affluence.level_values[tostring(l)]
  local sub_level = 0
  local range = max_value - min_value
  local step = range / table.size(MOD_RPG.affluence.level_steps)
  while min_value < current_value do
    sub_level = sub_level + 1
    min_value = min_value + step
  end
  return MOD_RPG.affluence.level_steps[tostring(sub_level)]
end