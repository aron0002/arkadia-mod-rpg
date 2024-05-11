function MOD_RPG:init()
  MOD_RPG.char:generate_native_infos()
  MOD_RPG.char:generate_native_states()
  MOD_RPG.char:generate_virtual_states()
  MOD_RPG.char:generate_virtual_attributes()
end

--- generowanie ogolnych informacji o postaci na podstawie informacji z muda
function MOD_RPG.char:generate_native_infos()
  self:add_info("name", self:create_info({ value = "", desc = "imie", native = true }))
  self:add_info("id", self:create_info({ value = "", desc = "unikalny identyfikator postac", native = true }))
  self:add_info("gender", self:create_info({ value = "", desc = "plec", native = true }))
  self:add_info("race", self:create_info({ value = "", desc = "rasa", native = true }))
  self:add_info("guild_occ", self:create_info({ value = "", desc = "opcjonalnie nazwa zawodu", native = true }))
  self:add_info("guild_race", self:create_info({ value = "", desc = "opcjonalnie nazwa gildii pochodzeniowej", native = true }))
  self:add_info("guild_lay", self:create_info({ value = "", desc = "opcjonalnie nazwa stowarzyszenia", native = true }))
end

--- aktualizacja ogolnych informacji o postaci na podstawie informacji z muda
function MOD_RPG.char:update_native_infos()
  if gmcp == nil then 
    return
  end
  MOD_RPG.char:update_info("name", "value", gmcp.char.info.name)
  MOD_RPG.char:update_info("id", "value", gmcp.char.info.id)
  MOD_RPG.char:update_info("gender", "value", gmcp.char.info.gender)
  MOD_RPG.char:update_info("race", "value", gmcp.char.info.race)
  if gmcp.char.info.guild_occ ~= nil then
    MOD_RPG.char:update_info("guild_occ", "value", gmcp.char.info.guild_occ)
  end
  if gmcp.char.info.guild_race ~= nil then
    MOD_RPG.char:update_info("guild_race", "value", gmcp.char.info.guild_race)
  end
  if gmcp.char.info.guild_lay ~= nil then
    MOD_RPG.char:update_info("guild_lay", "value", gmcp.char.info.guild_lay)
  end
end

--- generowanie stanow postaci na podstawie informacji z muda
function MOD_RPG.char:generate_native_states()
  self:add_state("hp", self:create_state({ level = 0, desc = "kondycja", native = true }))            --- INTEGER, od 0 do 6, poziom kondycji
  self:add_state("mana", self:create_state({ level = 0, desc = "mana", native = true }))              --- INTEGER, od 0 do 8, poziom many
  self:add_state("fatigue", self:create_state({ level = 0, desc = "mana", native = true }))           --- INTEGER, od 0 do 8, poziom zmeczenia
  self:add_state("improve", self:create_state({ level = 0, desc = "postepy", native = true }))        --- INTEGER, od 0 do 14, poziom postepow
  self:add_state("form", self:create_state({ level = 0, desc = "forma", native = true }))             --- INTEGER, od 0 do 6, poziom formy
  self:add_state("intox", self:create_state({ level = 0, desc = "upicie", native = true }))           --- INTEGER, od 0 do 9, poziom upicia
  self:add_state("headache", self:create_state({ level = 0, desc = "kac", native = true }))           --- INTEGER, od 0 do 5, poziom kaca
  self:add_state("stuffed", self:create_state({ level = 0, desc = "glod", native = true }))           --- INTEGER, od 0 do 2, poziom glodu
  self:add_state("soaked", self:create_state({ level = 0, desc = "pragnienie", native = true }))      --- INTEGER, od 0 do 2, poziom pragnienia
  self:add_state("encumbrance", self:create_state({ level = 0, desc = "obciazenie", native = true })) --- INTEGER, od 0 do 5, poziom obciazenia
  self:add_state("panic", self:create_state({ level = 0, desc = "panika", native = true }))           --- INTEGER, od 0 do 4, poziom paniki
end

--- generowanie stanow postaci na podstawie informacji z muda
function MOD_RPG.char:update_native_states()
  MOD_RPG.char:update_state("hp", "value", 6)
  MOD_RPG.char:update_state("mana", "value", 8)
  MOD_RPG.char:update_state("fatigue", "value", 0)
  MOD_RPG.char:update_state("improve", "value", 0)
  MOD_RPG.char:update_state("form", "value", 0)
  MOD_RPG.char:update_state("intox", "value", 0)
  MOD_RPG.char:update_state("headache", "value", 0)
  MOD_RPG.char:update_state("stuffed", "value", 3)
  MOD_RPG.char:update_state("soaked", "value", 3)
  MOD_RPG.char:update_state("encumbrance", "value", 0)
  MOD_RPG.char:update_state("panic", "value", 0)

  if gmcp == nil then 
    return
  end

  if gmcp.char.state.hp ~= nil then
    MOD_RPG.char:update_state("hp", "value", gmcp.char.state.hp)
  end
  if gmcp.char.state.mana ~= nil then
    MOD_RPG.char:update_state("mana", "value", gmcp.char.state.mana)
  end
  if gmcp.char.state.fatigue ~= nil then
    MOD_RPG.char:update_state("fatigue", "value", gmcp.char.state.fatigue)
  end
  if gmcp.char.state.improve ~= nil then
    MOD_RPG.char:update_state("improve", "value", gmcp.char.state.improve)
  end
  if gmcp.char.state.form ~= nil then
    MOD_RPG.char:update_state("form", "value", gmcp.char.state.form)
  end
  if gmcp.char.state.intox ~= nil then
    MOD_RPG.char:update_state("intox", "value", gmcp.char.state.intox)
  end
  if gmcp.char.state.headache ~= nil then
    MOD_RPG.char:update_state("headache", "value", gmcp.char.state.headache)
  end
  if gmcp.char.state.stuffed ~= nil then
    MOD_RPG.char:update_state("stuffed", "value", gmcp.char.state.stuffed)
  end
  if gmcp.char.state.soaked ~= nil then
    MOD_RPG.char:update_state("soaked", "value", gmcp.char.state.soaked)
  end
  if gmcp.char.state.encumbrance ~= nil then
    MOD_RPG.char:update_state("encumbrance", "value", gmcp.char.state.encumbrance)
  end
  if gmcp.char.state.panic ~= nil then
    MOD_RPG.char:update_state("panic", "value", gmcp.char.state.panic)
  end
end


--- stany dynamiczne postaci, zmieniaja sie w miare szybko i sa nietrwale, przykladem jest np kondycja postaci
function MOD_RPG.char:generate_virtual_states()
  self:add_state("mood", self:create_state(MOD_RPG.templates.state))                                  --- INTEGER, od 0 do 6, poziom nastroju
end

--- atrybuty postaci, zmieniaja sie w miare wolno i sa trwale, przykladem jest np jakas cecha postaci typu sila
function MOD_RPG.char:generate_virtual_attributes()
  self:add_attribute("affluence", self:create_attribute(MOD_RPG.templates.attribute))                 --- INTEGER, od 0 do 10, poziom zamoznosci
end

--- przeladowanie pluginu
function MOD_RPG:reload()
  load_plugin('arkadia-mod-rpg')
  MOD_RPG.char.update_native_infos()
  MOD_RPG.char:update_native_states()
end