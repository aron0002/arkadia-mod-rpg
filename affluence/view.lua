function MOD_RPG.affluence:view()
  display(MOD_RPG.char.attributes["affluence"])
end

function MOD_RPG.affluence.display(string)
  local desc = MOD_RPG.affluence.levels[tostring(MOD_RPG.affluence:get_level())]
  local e = "a"
  if string.find(desc, "X") then
    if MOD_RPG.char.infos["gender"]["value"] == "male" then
      e = "y"
    end
    desc = string.gsub(desc, "X", e)
  end
  desc = desc..MOD_RPG.affluence:get_sublevel_desc().."."
  selectString(string, 1)
  replace(string.."\n"..desc.."\n", true)
  deselect()
  resetFormat()
end

function MOD_RPG.affluence.display_levels()
  local levels = {}
  for _,v in pairs(MOD_RPG.affluence.levels) do
    local x = string.gsub(v, "Jestes ", "")
    --x = string.gsub(x, 'u.', "u")
    table.insert(levels, x)
  end

  local desc = table.concat(levels, ", ")
  local e = "a"
  if string.find(desc, "X") then
    if MOD_RPG.char.infos["gender"]["value"] == "male" then
      e = "y"
    end
    desc = string.gsub(desc, "X", e)
  end
  cecho("\nDostepne poziomy zamoznosci:\n   "..desc..".\n")
end