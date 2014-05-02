FateMail = {}
FateMail.prev_ptr = 0

-- 【書き換えよ】gmail.vbsの保存先パス (\は\\でエスケープする)
FateMail.vbs_path = "C:\\share\\ffxivminion\\LuaMods\\fatemail\\gmail.vbs"

-- 【書き換えよ】アラートメールを飛ばすFate名　※英語　※中間一致
FateMail.find_name = "山中湖の珍獣を追え！"

function FateMail.TEST()
	fate_list = MapObject:GetFateList()
	for i, fate in ipairs(fate_list) do
		d(fate.name)
	end
end

function FateMail.ModuleInit()
end

function FateMail.OnUpdateHandler(Event, ticks)
	if (gBotRunning == "0") then return false end

	fate_list = MapObject:GetFateList()

	for i, fate in ipairs(fate_list) do
		if (nil ~= string.find(fate.name, FateMail.find_name)) and
				(fate.ptr ~= FateMail.prev_ptr)	then
			os.execute("cscript.exe "..FateMail.vbs_path)
			FateMail.prev_ptr = fate.ptr
		end
	end
end

RegisterEventHandler("Module.Initalize",FateMail.ModuleInit)
RegisterEventHandler("Gameloop.Update", FateMail.OnUpdateHandler)