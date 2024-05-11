--- infos to glownie stale ale jednorazowe informacje, porownywalne np do tytulu postaci przy jakims osiagnieciu
--- states to w miare szybko zmieniajcace sie informacje, porownywalne do natywnych wartosci ze "stan" postaci
--- attributes to raczej wolno zmieniajace sie informacje, porownywalne do natywnych wartosci z "cechy" postaci

MOD_RPG.char = {      --- odwzorowanie postaci
  infos = {},         --- dane o postaci
  states = {},        --- stan postaci, z muda + wirtualne
  attributes = {},    --- cechy postaci (tylko wirtualne, czyli nie natywne z muda)
}

function MOD_RPG.char:create_info(data)
  local info = table.deepcopy(MOD_RPG.templates.info)
  for k, v in pairs(data) do
    info[k] = v
  end
  return info
end

function MOD_RPG.char:add_info(name, info)
  if self.infos[name] == nil then
    self.infos[name] = info
  end
end

function MOD_RPG.char:update_info(name, key, value)
  if self.infos[name] ~= nil then
    self.infos[name][key] = value
  end
end

function MOD_RPG.char:create_state(data)
  local state = table.deepcopy(MOD_RPG.templates.state)
  for k, v in pairs(data) do
    state[k] = v
  end
  return state
end

function MOD_RPG.char:add_state(name, state)
  if self.states[name] == nil then
    self.states[name] = state
  end
end

function MOD_RPG.char:update_state(name, key, value)
  if self.states[name] ~= nil then
    self.states[name][key] = value
  end
end

function MOD_RPG.char:create_attribute(data)
  local attribute = table.deepcopy(MOD_RPG.templates.attribute)
  for k, v in pairs(data) do
    attribute[k] = v
  end
  return attribute
end

function MOD_RPG.char:add_attribute(name, attribute)
  if self.attributes[name] == nil then
    self.attributes[name] = attribute
  end
end

function MOD_RPG.char:update_attribute(name, key, value)
  if self.attributes[name] ~= nil then
    self.attributes[name][key] = value
  end
end