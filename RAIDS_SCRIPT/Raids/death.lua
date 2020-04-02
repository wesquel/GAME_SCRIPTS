----------------------------- Raid -----------------------------

local raids = {
        ["Caterpie"] =  {storage = 80001,loot1 = {2160},q1 = {5},loot2 = {2152},q2={25},loot3={2148},q3 ={50} ,loot4 = {12416}, q4 = {100}},
        ["Caterpiee"] = {storage = 80003,loot1 = {1234,1245},q1 = {},loot2 = {},q2={},loot3={},q3 ={} ,loot4 = {}, q4 = {}}
}

function onDeath(cid)
	local raid = raids[getCreatureName(cid)]
    if getCreatureName(cid) then
		local query = db.getResult("SELECT player_id,value FROM  player_storage WHERE key == "..raids[getCreatureName(cid)].storage.." and CAST(value AS int) > 0 ORDER BY CAST(value AS int) DESC;")
		local players = {}
		local q = 1
		if (query:getID() ~= -1) then  
			repeat
			local name = tostring(getNamebyid(query:getDataString("player_id")))
			local sto = getPlayerStorageValue(getCreatureByName(name), 80001)
			local rand = 0
			local id_i = 0
			if sto then
				doPlayerSendTextMessage(getCreatureByName(name), TALKTYPE_ORANGE_1, "Rank Raid: ("..q..") Dano: ("..tostring(getPlayerStorageValue(getCreatureByName(name), 80001))..")")
				------------------------------------------- dar item ao player ------------------------------------------------------
				if q == 1 then
					rand = math.random(#raid.loot1)
					id_i = raid.loot1[rand]
					doBroadcastMessage('O Raid '..getCreatureName(cid)..' foi morto por: '..name.." " .. "Dano: " .. tostring(getPlayerStorageValue(getCreatureByName(name), 80001)))
					doPlayerAddItem(getCreatureByName(name),raid.loot1[rand],math.random(raid.q1[rand]))
					doPlayerSendTextMessage(getCreatureByName(name), TALKTYPE_ORANGE_1,'Voce acaba de receber ' ..tostring(getItemNameById(id_i)) .. ' Parabens!')
				end
				if q <= 2 then
					rand = math.random(#raid.loot2)
					id_i = raid.loot2[rand]
					doPlayerAddItem(getCreatureByName(name),raid.loot2[rand],math.random(raid.q2[rand]))
					doPlayerSendTextMessage(getCreatureByName(name), TALKTYPE_ORANGE_1,'Voce acaba de receber ' ..tostring(getItemNameById(id_i)) .. ' Parabens!')
				end
				if q <= 3 then
					rand = math.random(#raid.loot3)
					id_i = raid.loot3[rand]
					doPlayerAddItem(getCreatureByName(name),raid.loot3[rand],math.random(raid.q3[rand]))
					doPlayerSendTextMessage(getCreatureByName(name), TALKTYPE_ORANGE_1,'Voce acaba de receber ' ..tostring(getItemNameById(id_i)) .. ' Parabens!')
				end
				rand = math.random(#raid.loot4)
				id_i = raid.loot4[rand]
				doPlayerAddItem(getCreatureByName(name),raid.loot4[rand],math.random(raid.q4[rand]))
				doPlayerSendTextMessage(getCreatureByName(name), TALKTYPE_ORANGE_1,'Voce acaba de receber ' ..tostring(getItemNameById(id_i)) .. ' Parabens!')
				------------------------------------------- dar item ao player ------------------------------------------------------
			end
			setPlayerStorageValue(getCreatureByName(name), 80001, 0)
			db.executeQuery("UPDATE player_storage SET value = 0 WHERE key = "..raids[getCreatureName(cid)].storage.." and player_id = '"..tostring(query:getDataString("player_id")).."';")
			q = q + 1
			until not query:next()
		query:free()
		end
    end
    return true
end
----------------------------- Raid -----------------------------