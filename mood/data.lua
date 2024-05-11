MOD_RPG.mood.levels = {
  ["0"] = "Jestes w beznadziejnym nastroju.",
  ["1"] = "Jestes w kiepskim nastroju.",
  ["2"] = "Jestes w nie najlepszym nastroju.",
  ["3"] = "Jestes w przecietnym nastroju.",
  ["4"] = "Jestes w dobrym nastroju.",
  ["5"] = "Jestes w bardzo dobrym nastroju.",
  ["6"] = "Jestes w znakomitym nastroju.",
}

MOD_RPG.mood.good_patterns = {
  { pattern = "^Usmiechasz sie(.*).$", value = "small_increase" },
  { pattern = "^Podskakujesz wesolo.$", value = 41 },
  { pattern = "^.* (?:wyplaca|wrecza) ci .* monet.*.$", value = "small_increase" },
  { pattern = "^(?:Dostajesz|Otrzymujesz) .* monet.*.$", value = "middle_increase" },
}

MOD_RPG.mood.bad_patterns = {
  { pattern = "^Klniesz(.*).$", value = "small_reduction" },
  { pattern = "^Zalamujesz sie calkowicie.$", value = "large_reduction" },
  { pattern = "^Placisz .* monet.*.$", value = "middle_reduction" },
  { pattern = "^Zamawiasz .* placac .*.$", value = -5 },
}