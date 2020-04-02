local function doSetRandomGender(cid)
	if not isCreature(cid) then 
		return true 
	end
	if isSummon(cid) then 
		return true 
	end
	local gender = 0
	local name = getCreatureName(cid)
	
	if not newpokedex[name] then 
		return true 
	end
	local rate = newpokedex[name].gender
		if rate == 0 then
			gender = 3
		elseif rate == 1000 then
			gender = 4
		elseif rate == -1 then
			gender = 0
		elseif math.random(1, 1000) <= rate then
			gender = 4
		else
			gender = 3
		end
	doCreatureSetSkullType(cid, gender)
end

----------------------------- Raid -----------------------------                                                   
function onSpawn(cid)
	doBroadcastMessage('O Raid '..getCreatureName(cid)..' apareceu!')
    registerCreatureEvent(cid, "Experience")
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "Direction_Raid")
	registerCreatureEvent(cid, "Cast_Raid")
	
	if isSummon(cid) then
		registerCreatureEvent(cid, "SummonDeath")
		return true
	end
	
	addEvent(doSetRandomGender, 5, cid)
	addEvent(adjustWildPoke, 5, cid)
	
return true
end
----------------------------- Raid -----------------------------