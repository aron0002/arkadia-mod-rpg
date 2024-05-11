function scripts.boxes:update_box(update_str)
    local retrieved = db:fetch(self.db.boxes, {
        db:eq(self.db.boxes.character, scripts.character_name),
        db:eq(self.db.boxes.bank, self.current_box)
    })

    if not retrieved or table.size(retrieved) == 0 then
        if not db:add(self.db.boxes, { character = scripts.character_name, bank = self.current_box }) then
            self.current_box = nil
            scripts:print_log("Cos nie tak z baza")
            return
        end
    end

    local bank_item = db:fetch(self.db.boxes, {
        db:eq(self.db.boxes.character, scripts.character_name),
        db:eq(self.db.boxes.bank, self.current_box)
    })[1]

    bank_item["box"] = update_str

    bank_item["updated"] = getTime(true, "dd/MM/yyyy hh:mm:ss")
    if not db:update(self.db.boxes, bank_item) then
        self.current_box = nil
        scripts:print_log("Cos nie tak z baza")
        return
    end

    scripts:print_log("Ok, depozyt '" .. self.current_box .. "' uaktualniony", true)
    self.current_box = nil
    raiseEvent("mod_rpg_affluence")
end