
local raids = {
        ["Caterpie"] = {storage = 80001},
        ["Caterpiee"] = {storage = 80003}
}


if #getCreatureSummons(attacker) >= 1 and not isInArray({POISONEDDAMAGE, BURNEDDAMAGE}, combat) then
	doPlayerSendTextMessage(attacker, MESSAGE_STATUS_DEFAULT, "Your "..getPokeName(getCreatureSummons(attacker)[1]).." dealt "..valor.." damage to "..getSomeoneDescription(cid)..".")
			----------------------------------------------raid------------------------------------
	if raids[getCreatureName(cid)] then
		doCreatureSetStorage(attacker, raids[getCreatureName(cid)].storage, getPlayerStorageValue(attacker, raids[getCreatureName(cid)].storage) + valor)
		local query = db.getResult("SELECT id FROM players WHERE name == '"..getCreatureName(attacker).."';")
		local player_idd = query:getDataString("id")
		db.executeQuery("UPDATE player_storage SET value = "..(getPlayerStorageValue(attacker, raids[getCreatureName(cid)].storage) + valor).." WHERE key = "..raids[getCreatureName(cid)].storage.." and player_id = "..player_idd..";")
	end
			----------------------------------------------raid------------------------------------
end
