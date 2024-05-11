function MOD_RPG.mood:view()
  display(MOD_RPG.char.states["mood"])
end

function MOD_RPG.mood.display(string)
  local desc = MOD_RPG.mood.levels[tostring(MOD_RPG.mood:get_level())]
  selectString(string, 1)
  replace(desc.."\n"..string, true)
  deselect()
  resetFormat()
end


function MOD_RPG.mood.display_levels()
  local levels = {}
  for _,v in spairs(MOD_RPG.mood.levels) do
    local x = string.gsub(v, "Jestes ", "")
    x = string.gsub(x, 'u.', "u")
    table.insert(levels, x)
  end
  cecho("\nDostepne poziomy nastroju:\n   "..table.concat(levels, ", ")..".\n")
end