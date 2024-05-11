MOD_RPG.affluence = {
  money = {       --- suma pieniedzy w depozytach, po rodzaju monet
    mithryl = 0,
    gold = 0,
    silver = 0,
    copper = 0,
  },
}

function MOD_RPG.affluence:set_internal_value(value)
  MOD_RPG.char:update_attribute("affluence", "value", value)
  self:update_level()
end

function MOD_RPG.affluence:get_internal_value()
  return MOD_RPG.char.attributes["affluence"]["value"]
end

function MOD_RPG.affluence:set_target_internal_value(value)
  MOD_RPG.char:update_attribute("affluence", "target_value", value)
end

function MOD_RPG.affluence:get_target_internal_value()
  return MOD_RPG.char.attributes["affluence"]["target_value"]
end

function MOD_RPG.affluence:set_desc(value)
  MOD_RPG.char:update_attribute("affluence", "desc", value)
end

function MOD_RPG.affluence:get_desc()
  return MOD_RPG.char.attributes["affluence"]["desc"]
end

function MOD_RPG.affluence:set_level(value)
  MOD_RPG.char:update_attribute("affluence", "level", value)
end

function MOD_RPG.affluence:get_level()
  return MOD_RPG.char.attributes["affluence"]["level"]
end

function MOD_RPG.affluence:update_level()
  local current_value = self:get_internal_value()
  local level = 0
  local tmp = 0
  if current_value >= tonumber(MOD_RPG.affluence.level_values[tostring(10)]) then
    level = 10
  else
    while tmp < current_value do
      level = level + 1
      tmp = tonumber(MOD_RPG.affluence.level_values[tostring(level)])
    end
  end
  if level > 0 then
    self:set_level(level)
  else
    self:set_level(1)
  end
end

function MOD_RPG.affluence:add_money(money)
  local mon = MOD_RPG.affluence.money
  mon["mithryl"] = tonumber(mon["mithryl"]) + tonumber(money["mithryl"])
  mon["gold"] = tonumber(mon["gold"]) + tonumber(money["gold"])
  mon["silver"] = tonumber(mon["silver"]) + tonumber(money["silver"])
  mon["copper"] = tonumber(mon["copper"]) + tonumber(money["copper"])
  MOD_RPG.affluence.money = mon
  local function sum_money(money)
    return tonumber(money["copper"] + (money["silver"] * 12) + (money["gold"]*240) + (money["mithryl"]*24000))
  end
  local v = sum_money(MOD_RPG.affluence.money)
  self:set_internal_value(v)
end

function MOD_RPG.affluence:import_deposits_data()
  MOD_RPG.affluence.money = { mithryl = 0, gold = 0, silver = 0, copper = 0 }
  local function get_key_for_value( t, value )
    for k,v in pairs(t) do
      if v==value then return k end
    end
    return nil
  end
  scripts.character_name = "Valen"
  local retrieved = db:fetch(scripts.boxes.db.boxes, { db:eq(scripts.boxes.db.boxes.character, scripts.character_name) })
  local tmp = nil
  local money = {}
  local loc_id = nil
  for k, v in pairs(retrieved) do
    money = {}
    if string.find(v["box"], "Twoj depozyt zawiera ") and string.find(v["box"], "monet") then
      tmp = string.split(v["box"], "Twoj depozyt zawiera ")
      if #tmp == 2 then
        money = self:get_money_by_string(tmp[2]:sub(1, -2))
        self:add_money(money)
      end
    end
  end
  return
end

function MOD_RPG.affluence:get_money_by_string(str)
  local function str2money(str)
    local amount = 0
    local tmp = string.split(str, " ")
    if #tmp == 2 then
      amount = 1
    else
      amount = tmp[1]
      if tonumber(amount) == nil then
        amount = scripts.string_to_liczebnik[tmp[1]]
      end
    end
    if string.find(str, "mith") then
      return { "mithryl", tostring(amount) }
    end
    if string.find(str, "zlot") then
      return { "gold", tostring(amount) }
    end
    if string.find(str, "sreb") then
      return { "silver", tostring(amount) }
    end
    if string.find(str, "miedz") then
      return { "copper", tostring(amount) }
    end   
  end
  
  local money = { mithryl = 0, gold = 0, silver = 0, copper = 0 }
  local raw_content = {}
  local tmp = string.split(str, " i ")
  if #tmp == 1 then
    if string.find(tmp[1], "monet") then
      raw_content = str2money(tmp[1])
      money[raw_content[1]] = tonumber(raw_content[2])
    end
  elseif #tmp == 2 then   
    if string.find(tmp[2], "monet") then
      raw_content = str2money(tmp[2])
      money[raw_content[1]] = tonumber(raw_content[2])
    end
    if string.find(tmp[1], "monet") then
      tmp = string.split(tmp[1], ", ")
      for _,v2 in pairs(tmp) do
        if string.find(v2, "monet") then
          raw_content = str2money(v2)
          money[raw_content[1]] = tonumber(raw_content[2])
        end
      end
    end
  end
  return money
end

function MOD_RPG.affluence:generate_triggers()
  self:kill_triggers()
  --- miejsce wyswietlenia cechy
  table.insert(MOD_RPG_affluence_triggers, tempRegexTrigger("^Jestes .* odwage.$", function() MOD_RPG.affluence.display(matches[1]) end))  
end

function MOD_RPG.affluence:generate_aliases()
  self:kill_aliases()
  table.insert(MOD_RPG_affluence_aliases, tempAlias("^poziomy zamoznosci$", function() MOD_RPG.affluence.display_levels() end))  
end


function MOD_RPG.affluence:kill_triggers()
  if MOD_RPG_affluence_triggers ~= nil then
    for k,v in pairs(MOD_RPG_affluence_triggers) do
      if v then killTrigger(v) end
    end
  end
end

function MOD_RPG.affluence:kill_aliases()
  if MOD_RPG_affluence_aliases ~= nil then
    for k,v in pairs(MOD_RPG_affluence_aliases) do
      if v then killAlias(v) end
    end
  end
end

MOD_RPG.affluence:kill_triggers()
MOD_RPG_affluence_triggers = {}
MOD_RPG.affluence:kill_aliases()
MOD_RPG_affluence_aliases = {}
