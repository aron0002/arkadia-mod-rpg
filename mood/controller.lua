function MOD_RPG.mood:init()
  self:set_desc("poziom nastroju")              --- opis dla mood
  self:set_internal_value(50)                   --- startowa wartosc mood, wartosc to troche odpowiednik expa na danej cesze lub stanie; normalnie niewidoczna dla uzytkownika
  self:set_level(3)                             --- startowy poziom mood, poziom to docelowo prog ktory sie osiaga przy danej wartosci i reprezentuje opis stanu/cechy; widoczny dla uzytkownika

  --- docelowa wartosc na jakiej ma pracowac mood, czyli przedzial od 0 do X jaka mozna osiagnac na wartosciach, 
  -- teoretycznie celem nie musi byc najwieksza liczba
  -- przyklad: poziom mood to 0-6, ale liczba wplywajaca na dany poziom (czyli wartosc) moze byc np miedzy 0-100 i uzyskanie pewnej wartosci spowoduje ze poziom sie zmieni
  -- przyklad liczbowy: poziom 2 mozna osiagnac zdobywajac wartosc miedzy 20-29, dzieki temu mozna wartosc budowac wolniej niz poziom, troche taki odpowiednik umiejetnosci gdy przedzial jest 0-100
  self:set_target_internal_value(100)       
  self:generate_triggers()
  self:generate_aliases()
  
  if scripts.event_handlers["mod_rpg_mood"] then
    killAnonymousEventHandler(scripts.event_handlers["mod_rpg_mood"])
  end
  scripts.event_handlers["mod_rpg_mood"] = registerAnonymousEventHandler("mod_rpg_mood", MOD_RPG.mood.handle_events)  
end

--- male zwiekszenie wartosci, 10% maksymalnej mozliwej wartosci
function MOD_RPG.mood:small_increase()
  local v = round(MOD_RPG.mood:get_target_internal_value() * 0.1, 0)
  MOD_RPG.mood:change_internal_value(v)
end

--- srednie zwiekszenie wartosci, 30% maksymalnej mozliwej wartosci
function MOD_RPG.mood:middle_increase()
  local v = round(MOD_RPG.mood:get_target_internal_value() * 0.3, 0)
  MOD_RPG.mood:change_internal_value(v)
end

--- duze zwiekszenie wartosci, 50% maksymalnej mozliwej wartosci
function MOD_RPG.mood:large_increase()
  local v = round(MOD_RPG.mood:get_target_internal_value() * 0.5, 0)
  MOD_RPG.mood:change_internal_value(v)
end

--- male zmniejszenie wartosci, 10% maksymalnej mozliwej wartosci
function MOD_RPG.mood:small_reduction()
  local v = round(MOD_RPG.mood:get_target_internal_value() * 0.1, 0) * -1
  MOD_RPG.mood:change_internal_value(v)
end

--- srednie zmniejszenie wartosci, 30% maksymalnej mozliwej wartosci
function MOD_RPG.mood:middle_reduction()
  local v = round(MOD_RPG.mood:get_target_internal_value() * 0.3, 0) * -1
  MOD_RPG.mood:change_internal_value(v)
end

--- duze zmniejszenie wartosci, 50% maksymalnej mozliwej wartosci
function MOD_RPG.mood:large_reduction()
  local v = round(MOD_RPG.mood:get_target_internal_value() * 0.5, 0) * -1
  MOD_RPG.mood:change_internal_value(v)
end

function MOD_RPG.mood:handle_events(event, arg, profile)
  if type(event) == "number" then
    MOD_RPG.mood:change_internal_value(event)
    return
  elseif type(event) == "string" then
    MOD_RPG.mood[event]()
    return
  else
    echo("nierozpotnano typu")
  end
  echo(" cos nie zapalalo")
end