---------------------------------------------------------------
--  created:   2010.3.17
--  author:    liudong
--
--  内容：任务脚本文件。



--  说明：editor：xiaozhiyu

------------------------------------------------------------------
TaskList[14560] ={ --雷辛格随机事件-时间祭坛

--任务属性
Property = {
	bHiddenTask = false,		--隐藏任务
	bRecordFinish = true,	--完成能重复
	bCanRedoAfterFailure = true,	--失败能重复
	bShowPrompt = false, --不显示提示
	bCanSeekOut = false, --不允许被查找
	bFinishWhenDelvier = false,--接受及完成
	bCanGiveUp = true,--能放弃
-- 	bRecordFinishCount = true, --是否记录完成次数
-- 	iMaxFinishCount = 1,						--	最大完成次数
-- 	iClearFinishCountType = 10,		--清空完成次数的方式
														--0, -不清空,1, --每天,2—每周
														--在task_list_type脚本里枚举
	--iAvailFrequency = TaskAvailFrequency.EverySeconds,
	--iTimeInterval = 900

}
,
--提交道具的ID表
TimeItemNumber = {
	[1] = 41666,
	[2] = 41669,
	[3] = 41670,
	[4] = 41671,
	[5] = 41675,
	[6] = 41676,
	[7] = 41677,
	[8] = 41678,
	[9] = 41679,
	[10]= 41680,
	[11]= 41681,
	[12]= 41682,
}
,
--任务奖励显示
AwardPreview = {
	Exp = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local base_awards = { xp = 100,bindmoney = 40}
		local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
		local ratio = 1		--奖励倍率
		return iExperience * ratio	--经验
	end
	,
}
,
--检查任务发放条件
OnCheckDeliver = function(TASKINTERFACE_POINTER)
	return 0
end
,
--玩家接收该任务时调用
OnDeliver = function(TASKINTERFACE_POINTER)
	math.randomseed(os.time())
	local iValue = math.random(1,12)
	TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14560, 1, iValue)
	TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14560, 2, 0)
return 0
end
,

OnMethod = function(TASKINTERFACE_POINTER)
	local Method = {}
		Method.SubmitItem = true--提交特定物品
	return Method
end
,
--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
OnCheckFinish = function(TASKINTERFACE_POINTER)
	local iRet = TASK_NO_FINISH
	local ItemTrue = 0
	--取得玩家提交物品的ID和数量
	local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,14560)
	--物品ID不正确的时候返回
	if itemIDSubmitted and itemNumberSubmitted then
				for i=1,12 do
					if itemIDSubmitted ==  TaskList[14560].TimeItemNumber[i] then
						ItemTrue= 1
						break
					end
				end
				if ItemTrue == 1 then
					--获取任务随机数
					local ItemRandomNumber = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14560,1)
					--提交物品ID>目标ID返回提示“大了”
					if itemIDSubmitted > TaskList[14560].TimeItemNumber[ItemRandomNumber] then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14560, 29, 20011)
						--提交次数+1
						local ItemTijiaoNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14560,2) + 1
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14560, 2, ItemTijiaoNum)
					end
					--提交物品ID<目标ID返回提示“大了”
					if itemIDSubmitted < TaskList[14560].TimeItemNumber[ItemRandomNumber] then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14560, 29, 20012)
						--提交次数+1
						local ItemTijiaoNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14560,2) + 1
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14560, 2, ItemTijiaoNum)
					end
					--提交物品正确，完成任务
					if itemIDSubmitted == TaskList[14560].TimeItemNumber[ItemRandomNumber] then
						--提交次数+1
						local ItemTijiaoNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14560,2) + 1
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14560, 2, ItemTijiaoNum)
						--TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,14560, item_num)
						iRet = TASK_SUCC_FINISH
					end
					--回收所有任务相关道具
					local ItemNumInPacket
					for i =1,12 do
						ItemNumInPacket = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[14560].TimeItemNumber[i], true)
						TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,TaskList[14560].TimeItemNumber[i], ItemNumInPacket)
					end
				else
					TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14560, 29, 20000 )
				end

	end
	return iRet
end
,

--不判断是否够地方拿到任务
OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
	return 0
end
,

--完成该任务时服务器调用

OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1, ucRandomNum2)

		if bSuccess == true then
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local ratio = 1
			local base_awards = { xp = 100,bindmoney = 40}
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local iBindMoney = TaskMoneyAdjust[playerLev] * base_awards.bindmoney		--根据玩家等级,从全局表里找到对应的魂币经验系数
			local ItemTijiaoNum = ucRandomNum2
			if ItemTijiaoNum == 1 then
				ratio = 12		--奖励倍率
			end
			if ItemTijiaoNum == 2 then
				ratio = 6		--奖励倍率
			end
			if ItemTijiaoNum == 3 then
				ratio = 3		--奖励倍率
			end
			if ItemTijiaoNum >3 then
				ratio = 1 	--奖励倍率
			end
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iExperience * ratio)	--经验
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,iBindMoney * ratio)	--魂币
			return 0
		end
end
}
TaskList[14762] ={ --测试任务给装备
	--任务属性
	Property = {
		bCanGiveUp = true,--能放弃
		bRecordFinish = true,	--完成能重复
		bCanRedoAfterFailure = true,	--失败能重复
		bFinishWhenDelvier = true,--接受及完成
	},
	--玩家状态
	playerzhuangtai ={
		baoguo = 0,
		zhiye  = 0 ,
	}
	,
	--装备列表
	zhuangbei = {
		[1] ={ --70蓝装
			[1] = {34826,34827,34828,34829,34830,34831,34832,34833},--战士70
			[2] = {34834,34835,34836,34837,34838,34839,34840,34841},--守护
			[3] = {34842,34843,34844,34845,34846,34847,34848,34849},--刺客
			[4] = {34850,34851,34852,34853,34854,34855,34856,34857},--火枪
			[5] = {34858,34859,34860,34861,34862,34863,34864,34865},--法师
			[6] = {34866,34867,34868,34869,34870,34871,34872,34873},--牧师
			[7] = {34874,34875,34876,34877,34878,34879,34880,34881},--血魔
			[8] = {34882,34883,34884,34885,34886,34887,34888,34889},--诗人
		},
		[2]={ --70紫
			[1] = {21896,21897,21898,21899,21900,21901,21902,34956},--战士
			[2] = {21910,21911,21912,21913,21914,21915,21916,34958},--守护
			[3] = {21903,21904,21905,21906,21907,21908,21909,34957},--刺客
			[4] = {21917,21918,21919,21920,21921,21922,21923,34959},--火枪
			[5] = {21931,21932,21933,21934,21935,21936,21937,34961},--法师
			[6] = {21889,21890,21891,21892,21893,21894,21895,34955},--牧师
			[7] = {21924,21925,21926,21927,21928,21929,21930,34960},--血魔
			[8] = {21882,21883,21884,21885,21886,21887,21888,34954},--诗人
		},
		[3] ={--77蓝
			[1] = {37801,37802,37803,37804,37805,37806,37807,37808},--战士
			[2] = {37809,37810,37811,37812,37813,37814,37815,37816},--守护
			[3] = {37817,37818,37819,37820,37821,37822,37823,37824},--刺客
			[4] = {37825,37826,37827,37828,37829,37830,37831,37832},--火枪
			[5] = {37833,37834,37835,37836,37837,37838,37839,37840},--法师
			[6] = {37841,37842,37843,37844,37845,37846,37847,37848},--牧师
			[7] = {37849,37850,37851,37852,37853,37854,37855,37856},--血魔
			[8] = {37857,37858,37859,37860,37861,37862,37863,37864},--诗人
		},
		[4] = {--77紫
			[1] = {26727,26734,26741,26748,26755,26762,26769,37867},--战士
			[2] = {26729,26736,26743,26750,26757,26764,26771,37869},--守护
			[3] = {26728,26735,26742,26749,26756,26763,26770,37868},--刺客
			[4] = {26730,26737,26744,26751,26758,26765,26772,37870},--火枪
			[5] = {26732,26739,26746,26753,26760,26767,26774,37872},--法师
			[6] = {26726,26733,26740,26747,26754,26761,26768,37866},--牧师
			[7] = {26731,26738,26745,26752,26759,26766,26773,37871},--血魔
			[8] = {37865,27828,27829,27830,27831,27832,27833,27834},--诗人
		}
	},
	xpdaoju70 = {17765,17768,17771,17774,17777},
	xpdaoju77 = {17766,17769,17772,17775,17778},
	qitadaoju = {34423,37278,39617,42064,42065},

	--检查任务发放条件
	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local baoguo = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if baoguo < 16 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end
		return 0
	end
,
	--玩家接收该任务时调用
	OnDeliver = function(TASKINTERFACE_POINTER)
		TaskList[14762].playerzhuangtai.zhiye = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,14772) --发扩包任务
	end
,
	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iRet = TASK_SUCC_FINISH
		return iRet
	end
	,
	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		return 0
	end
,
--完成该任务时服务器调用

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1, ucRandomNum2)
		if bSuccess == true then
-- 			--发装备8件套
-- 			for i = 1,8 do
-- 				local iItemID =TaskList[14762].zhuangbei[iParam][TaskList[14762].playerzhuangtai.zhiye][i]
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iItemID,1,true)
-- 				else
-- 					break
-- 				end
-- 			end
-- 			--发70级XP和通用装备
-- 			if iParam < 3 then
-- 				--发XP道具
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[14762].xpdaoju70[TaskCApi.GetPlayerRace(TASKINTERFACE_POINTER)],1,true)
-- 				end
-- 				--发副手
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33656,1,true)
-- 				end
-- 				--发戒指 X 2
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33749,1,true)
-- 				end
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33749,1,true)
-- 				end
-- 				--发项链
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33759,1,true)
-- 				end
-- 			end
-- 			--发77级XP和通用装备
-- 			if iParam >2 then
-- 				--发XP道具
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[14762].xpdaoju77[TaskCApi.GetPlayerRace(TASKINTERFACE_POINTER)],1,true)
-- 				end
-- 				--发副手
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33656,1,true)
-- 				end
-- 				--发戒指 X 2
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33751,1,true)
-- 				end
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33751,1,true)
-- 				end
-- 				--发项链
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33761,1,true)
-- 				end
-- 			end
-- 			--发骑乘等其它道具
-- 			for j = 1,5 do
-- 				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
-- 					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[14762].qitadaoju[j],1,true)
-- 				else
-- 					break
-- 				end
-- 			end
			--发金币和魂币
			TaskCApi.DeliverGold(TASKINTERFACE_POINTER,999000000)
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,999000000)
			return 0
		end
	end
}
------------------------------------------------------------------

















