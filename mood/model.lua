MOD_RPG.mood = {}

function MOD_RPG.mood:set_internal_value(value)
  MOD_RPG.char:update_state("mood", "value", value)
end

function MOD_RPG.mood:get_internal_value()
  return MOD_RPG.char.states["mood"]["value"]
end

function MOD_RPG.mood:change_internal_value(number)
  local v = self:get_internal_value() + (number)
  if v < 0 then
    self:set_internal_value(0)
  elseif v >= self:get_target_internal_value() then
    self:set_internal_value(self:get_target_internal_value())
  elseif v < self:get_target_internal_value() then  
    self:set_internal_value(v)
  end
  self:update_level()
end

function MOD_RPG.mood:set_target_internal_value(value)
  MOD_RPG.char:update_state("mood", "target_value", value)
end

function MOD_RPG.mood:get_target_internal_value()
  return MOD_RPG.char.states["mood"]["target_value"]
end

function MOD_RPG.mood:set_desc(value)
  MOD_RPG.char:update_state("mood", "desc", value)
end

function MOD_RPG.mood:get_desc()
  return MOD_RPG.char.states["mood"]["desc"]
end

function MOD_RPG.mood:set_level(value)
  MOD_RPG.char:update_state("mood", "level", value)
end

function MOD_RPG.mood:get_level()
  return MOD_RPG.char.states["mood"]["level"]
end

function MOD_RPG.mood:update_level()
  local step = self:get_target_internal_value() / table.size(MOD_RPG.mood.levels)
  local current_value = self:get_internal_value()
  local level = -1
  local tmp = 0
  while tmp < current_value do
    level = level + 1
    tmp = tmp + step
  end
  if level > -1 then
    self:set_level(level)
  else
    self:set_level(0)
  end
end

function MOD_RPG.mood:generate_triggers()
  self:kill_triggers()
  
  for _,v in pairs(self.good_patterns) do
    table.insert(MOD_RPG_mood_triggers, tempRegexTrigger(v.pattern, function() raiseEvent("mod_rpg_mood", v.value) end))
  end         
  for _,v in pairs(self.bad_patterns) do
    table.insert(MOD_RPG_mood_triggers, tempRegexTrigger(v.pattern, function() raiseEvent("mod_rpg_mood", v.value) end))
  end
  --- miejsce wyswietlenia stanu
  table.insert(MOD_RPG_mood_triggers, tempRegexTrigger("^Wiek: .*.$", function() MOD_RPG.mood.display(matches[1]) end))  
end

function MOD_RPG.mood:generate_aliases()
  self:kill_aliases()
  table.insert(MOD_RPG_mood_aliases, tempAlias("^poziomy nastroju$", function() MOD_RPG.mood.display_levels() end))  
end

function MOD_RPG.mood:kill_triggers()
  if MOD_RPG_mood_triggers ~= nil then
    for k,v in pairs(MOD_RPG_mood_triggers) do
      if v then killTrigger(v) end
    end
  end
end

function MOD_RPG.mood:kill_aliases()
  if MOD_RPG_mood_aliases ~= nil then
    for k,v in pairs(MOD_RPG_mood_aliases) do
      if v then killAlias(v) end
    end
  end
end

MOD_RPG.mood:kill_triggers()
MOD_RPG_mood_triggers = {}

MOD_RPG.mood:kill_aliases()
MOD_RPG_mood_aliases = {}