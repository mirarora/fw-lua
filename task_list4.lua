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
		bHiddenTask = false,			--隐藏任务
		bRecordFinish = true,			--完成能重复
		bCanRedoAfterFailure = true,	--失败能重复
		bShowPrompt = false, 			--不显示提示
		bCanSeekOut = false, 			--不允许被查找
		bFinishWhenDelvier = false,	--接受及完成
		bCanGiveUp = true,				--能放弃
	-- 	bRecordFinishCount = true, 		--是否记录完成次数
	-- 	iMaxFinishCount = 1,			--最大完成次数
	-- 	iClearFinishCountType = 10,		--清空完成次数的方式
										--0, -不清空,1, --每天,2—每周
										--在task_list_type脚本里枚举
		iAvailFrequency = TaskAvailFrequency.EverySeconds,
		iTimeInterval = 900
	},
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
	},
	--任务奖励显示
	AwardPreview = {
		Exp = function(TASKINTERFACE_POINTER)
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 100,bindmoney = 40}
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local ratio = 1		--奖励倍率
			return iExperience * ratio	--经验
		end,
	},
	--检查任务发放条件
	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end,
	--玩家接收该任务时调用
	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		local iValue = math.random(1,12)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14560, 1, iValue)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14560, 2, 0)
		return 0
	end,
	OnMethod = function(TASKINTERFACE_POINTER)
		local Method = {}
			Method.SubmitItem = true--提交特定物品
		return Method
	end,
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
	end,
	--不判断是否够地方拿到任务
	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		return 0
	end,
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
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,iBindMoney * ratio)		--魂币
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
		zhongzhu = 0,
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
			[1] = {21882,21883,21884,21885,21886,21887,21888,34954},--战士
			[2] = {21889,21890,21891,21892,21893,21894,21895,34955},--守护
			[3] = {21896,21897,21898,21899,21900,21901,21902,34956},--刺客
			[4] = {21903,21904,21905,21906,21907,21908,21909,34957},--火枪
			[5] = {21910,21911,21912,21913,21914,21915,21916,34958},--法师
			[6] = {21917,21918,21919,21920,21921,21922,21923,34959},--牧师
			[7] = {21924,21925,21926,21927,21928,21929,21930,34960},--血魔
			[8] = {21931,21932,21933,21934,21935,21936,21937,34961},--诗人
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
			[1] = {37865,27828,27829,27830,27831,27832,27833,27834},--战士
			[2] = {26726,26733,26740,26747,26754,26761,26768,37866},--守护
			[3] = {26727,26734,26741,26748,26755,26762,26769,37867},--刺客
			[4] = {26728,26735,26742,26749,26756,26763,26770,37868},--火枪
			[5] = {26729,26736,26743,26750,26757,26764,26771,37869},--法师
			[6] = {26730,26737,26744,26751,26758,26765,26772,37870},--牧师
			[7] = {26731,26738,26745,26752,26759,26766,26773,37871},--血魔
			[8] = {26732,26739,26746,26753,26760,26767,26774,37872},--诗人
		}
	},
	jinengshu ={
		[1] = {31594,31595,31596,31597,31598,31599,31600,31601,31602,31603,31604,31605,31606,31607,31608,31609,31610,31611,31612,31613,31614,35174,35175,35176,35177,35178,35179,35180,35181,35182,35183,35184,35185,35186,35187,35188,35189,35190,35191,35192,35193,35194,35195,35196,35197,0,0,0,0,0},
		[2] = {31615,31616,31617,31618,31619,31620,31621,31622,31623,31624,31625,31626,31627,31628,31629,31630,31631,31632,31633,35198,35199,35200,35201,35202,35203,35204,35205,35206,35207,35208,35209,35210,35211,35212,35213,35214,35215,35216,35217,35218,35219,35220,35221,0,0,0,0,0,0,0},
		[3] = {31634,31635,31636,31637,31638,31639,31640,31641,31642,31643,31644,31645,31646,31647,31648,31649,31650,31651,31652,31653,35222,35223,35224,35225,35226,35227,35228,35229,35230,35231,35232,35233,35234,35235,35236,35237,35238,35239,35240,35241,35242,35243,35244,35245,0,0,0,0,0,0},
		[4] = {31695,31696,31697,31698,31699,31700,31701,31702,31703,31704,31705,31706,31707,31708,31709,31710,31711,31712,31713,31714,35292,35293,35294,35295,35296,35297,35298,35299,35300,35301,35302,35303,35304,35305,35306,35307,35308,35309,35310,35311,35312,35313,35314,35315,35316,0,0,0,0,0},
		[5] = {31715,31716,31717,31718,31719,31720,31721,31722,31723,31724,31725,31726,31727,31728,31729,31730,31731,31732,35317,35318,35319,35320,35321,35322,35323,35324,35325,35326,35327,35328,35329,35330,35331,35332,35333,35334,35335,35336,35337,35338,35339,0,0,0,0,0,0,0,0,0},
		[6] = {31733,31734,31735,31736,31737,31738,31739,31740,31741,31742,31743,31744,31745,31746,31747,31748,31749,31750,31751,31752,31753,31754,31755,35340,35341,35342,35343,35344,35345,35346,35347,35348,35349,35350,35351,35352,35353,35354,35355,35356,35357,35358,35359,35360,35361,35362,35363,35364,35365,35366},
		[7] = {31654,31655,31656,31657,31658,31659,31660,31661,31662,31663,31664,31665,31666,31667,31668,31669,31670,31671,35246,35247,35248,35249,35250,35251,35252,35253,35254,35255,35256,35257,35258,35259,35260,35261,35262,35263,35264,35265,35266,35267,35268,0,0,0,0,0,0,0,0,0},
		[8] ={31672,31673,31674,31675,31676,31677,31678,31679,31680,31681,31682,31683,31684,31685,31686,31687,31688,31689,31690,31691,31692,31693,31694,35269,35270,35271,35272,35273,35274,35275,35276,35277,35278,35279,35280,35281,35282,35283,35284,35285,35286,35287,35288,35289,35290,35291,0,0,0,0},
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
	end,
	--玩家接收该任务时调用
	OnDeliver = function(TASKINTERFACE_POINTER,iParam)
		TaskList[14762].playerzhuangtai.zhiye = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业
		TaskList[14762].playerzhuangtai.zhongzhu = TaskCApi.GetPlayerRace(TASKINTERFACE_POINTER) + 1
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,14772) --发扩包任务
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14762, 1, iParam)
		TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iParam)
		if iParam < 5 then		--发装备8件套
			for i = 1,8 do
				local iItemID =TaskList[14762].zhuangbei[iParam][TaskList[14762].playerzhuangtai.zhiye][i]
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iItemID,1,true)
				else
					break
				end
			end
			--发70级XP和通用装备
			if iParam ==1 or iParam == 2 then
				--发XP道具
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[14762].xpdaoju70[TaskList[14762].playerzhuangtai.zhongzhu],1,true)
				end
				--发副手
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33656,1,true)
				end
				--发戒指 X 2
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33749,1,true)
				end
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33749,1,true)
				end
				--发项链
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33759,1,true)
				end
			end
			--发77级XP和通用装备
			if iParam ==3 or iParam ==4 then
				--发XP道具
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[14762].xpdaoju77[TaskList[14762].playerzhuangtai.zhongzhu],1,true)
				end
				--发副手
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33656,1,true)
				end
				--发戒指 X 2
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33751,1,true)
				end
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33751,1,true)
				end
				--发项链
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,33761,1,true)
				end
			end
			--发骑乘等其它道具
			for j = 1,5 do
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[14762].qitadaoju[j],1,true)
				else
					break
				end
			end
		--发技能书
		else
			for x = 1,50 do
				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER) > 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[14762].jinengshu[TaskList[14762].playerzhuangtai.zhiye][x],1,true)
				else
					break
				end
			end
		end
		--发金币和魂币
		TaskCApi.DeliverGold(TASKINTERFACE_POINTER,999000000)
		TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,999000000)
	end,
	OnMethod = function(TASKINTERFACE_POINTER)
		local Method = {}
		Method.iWaitTime = 0
		return Method
	end,
	OnCheckFinish = function(TASKINTERFACE_POINTER)
			local iRet = TASK_SUCC_FINISH
		return iRet
	end,
	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		return 0
	end,
	--完成该任务时服务器调用
	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
	end
}

TaskList[14751] = --散人战场胜利脚本任务
{
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bRecordFinishCount = true,
 --     iMaxFinishCount = 5,		--每天最多可完成的次数：5	***
 -- 	iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
		bHiddenTask = true,       --隐藏
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
--		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
--		local kindnessID = 11	--恩德值的声望id
--		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
--		local costKindnessValue = TaskList[14573].CostkindnessValue	[math.min(5,icount+1)]	--本次重置次数需要消耗的恩德值
		if playerLev < 40 then	--40级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
--		if emptySlots < 1 then	--普通包裹栏需要1格
--			return TASK_PREREQU_FAIL_GIVEN_ITEM
--		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14751)	-- 随任务id不停变化***
   		if ulCurTime - ulDeliverTime > 30 then
   		    iRet = TASK_FAIL_FINISH
   		end

   		return iRet
   	end
   	,
   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
--			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
--			if emptySlots < 1 then	--普通包裹栏需要1格
--				return TASK_PREREQU_FAIL_GIVEN_ITEM
--			end
   		end
   		return 0
   	end
   	,
   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
		local only = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16610)	--散人战场奖励限制次数任务,限制1场1次
   		if bSuccess and (only == 0  or only == nil) then
			local kindnessID = 18	--战场点数的声望id
			local ReputationID = 21 -- 战场总声望id
			local playerLevel= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14761) --计次任务计算每日任务完成次数，每日清空
			local battlepoint = 0
			local vipbuffid = 2685
			local vipref= 1
			local timePackage = os.date("*t", os.time())
         	local year = timePackage.year
	        local day = timePackage.yday
	        local hour = timePackage.hour
        	local btime = 0	--时间属性加成
        	local yeartable = {0,366,731,1096,1461,1827,2182,2547,2912,3278,3643,4008,4373,4738,}
        	local firstday= 218
        	local daycount=yeartable[year-2011]+day-firstday    -- 离2012年8月5日有几天
			local Assistcomment
        	if math.floor(daycount/14)==(daycount/14) and hour>=18
        	then
        	   btime = 1
        	end
			local bVIP = TaskCApi.HasBuff(TASKINTERFACE_POINTER,vipbuffid)
			local Assist = TaskCApi.GetPlayerAssist(TASKINTERFACE_POINTER)
			if Assist>=10
			then
			   TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 15946, 1)  -- 置每次活跃度
			end
			local firstvic = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14760)
			if firstvic == 0
			then
			  TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 15945, Assist)  --置首胜活跃度
			end
			if Assist>=10
			then
			   Assist = 10
			end
			Assistcomment= Assist*0.08+0.2
			if bVIP then
			  vipref=2
			end

			local vic_times =  TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14756)
			if vic_times<=4 and vipref==2 then
				vipref=4
			end

			if playerLevel>=75
			then
			   battlepoint=(150+300*Assistcomment)*vipref+(150+300*Assistcomment)*btime
			   if icount>=(7000*vipref-battlepoint) and icount<=(7000*vipref)
			   then
			       battlepoint=7000*vipref-icount
			   elseif icount>=(7000*vipref)
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=70
			then
			   battlepoint=(105+210*Assistcomment)*vipref+(105+210*Assistcomment)*btime
			   if icount>=(5000*vipref-battlepoint) and icount<=(5000*vipref)
			   then
			       battlepoint=5000*vipref-icount
			   elseif icount>=5000*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=60
			then
			   battlepoint=(75+150*Assistcomment)*vipref+(75+150*Assistcomment)*btime
			   if icount>=(3500*vipref-battlepoint) and icount<=(3500*vipref)
			   then
			       battlepoint=3500*vipref-icount
			   elseif icount>=3500*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=40
			then
			   battlepoint=(45+90*Assistcomment)*vipref+(45+90*Assistcomment)*btime
			   if icount>=(2100*vipref-battlepoint) and icount<=(2100*vipref)
			   then
			       battlepoint=2100*vipref-icount
			   elseif icount>=(2100*vipref)
			   then
			       battlepoint =0
			   end
			end
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID, battlepoint)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,ReputationID, battlepoint)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 14761, battlepoint)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 16610, 1)
		end
   		return 0
   	end

}

TaskList[14752] = --散人战场失败脚本任务
{
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bRecordFinishCount = true,
 --     iMaxFinishCount = 5,		--每天最多可完成的次数：5	***
 -- 	iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
		bHiddenTask = true,       --先暂不隐藏
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
--		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
--		local kindnessID = 11	--恩德值的声望id
--		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
--		local costKindnessValue = TaskList[14573].CostkindnessValue	[math.min(5,icount+1)]	--本次重置次数需要消耗的恩德值
		if playerLev < 40 then	--40级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
--		if emptySlots < 1 then	--普通包裹栏需要1格
--			return TASK_PREREQU_FAIL_GIVEN_ITEM
--		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14752)	-- 随任务id不停变化***
   		if ulCurTime - ulDeliverTime > 30 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,
   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
--			if emptySlots < 1 then	--普通包裹栏需要1格
--				return TASK_PREREQU_FAIL_GIVEN_ITEM
--			end
   		end
   		return 0
   	end
   	,
   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
		local only = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16610)	--散人战场奖励限制次数任务,限制1场1次
   		if bSuccess and (only == 0  or only == nil) then
			local kindnessID = 18	--战场点数的声望id
			local ReputationID = 21 -- 战场总声望id
			local playerLevel= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14761) --计次任务计算每日任务完成次数，每日清空
			local battlepoint = 0
			local vipbuffid = 2685
			local vipref= 1
			local bVIP = TaskCApi.HasBuff(TASKINTERFACE_POINTER,vipbuffid)
			local timePackage = os.date("*t", os.time())
         	local year = timePackage.year
	        local day = timePackage.yday
	        local hour = timePackage.hour
        	local btime = 0	--时间属性加成
        	local yeartable = {0,366,731,1096,1461,1827,2182,2547,2912,3278,3643,4008,4373,4738,}
        	local firstday= 218
        	local daycount=yeartable[year-2011]+day-firstday    -- 离2012年8月5日有几天
			local Assist = TaskCApi.GetPlayerAssist(TASKINTERFACE_POINTER)
			local Assistcomment
			if Assist>=10
			then
			  TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 15946, 1)  -- 置每次活跃度
			end
        	if math.floor(daycount/14)==(daycount/14) and hour>=18
        	then
        	   btime = 1
        	end
			if bVIP then
			  vipref=2
			end
			if Assist>=10
			then
			   Assist = 10
			end
			Assistcomment= Assist*0.08+0.2
			if playerLevel>=75
			then
			   battlepoint=300*Assistcomment*vipref+300*Assistcomment*btime
			   if icount>=(7000*vipref-battlepoint) and icount<=(7000*vipref)
			   then
			       battlepoint=7000*vipref-icount
			   elseif icount>=(7000*vipref)
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=70
			then
			   battlepoint=210*Assistcomment*vipref+210*Assistcomment*btime
			   if icount>=(5000*vipref-battlepoint) and icount<=(5000*vipref)
			   then
			       battlepoint=5000*vipref-icount
			   elseif icount>=(5000*vipref)
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=60
			then
			   battlepoint=150*Assistcomment*vipref+150*Assistcomment*btime
			   if icount>=(3500*vipref-battlepoint) and icount<=(3500*vipref)
			   then
			       battlepoint=3500*vipref-icount
			   elseif icount>=(3500*vipref)
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=40
			then
			   battlepoint=90*Assistcomment*vipref+90*Assistcomment*btime
			   if icount>=(2100*vipref-battlepoint) and icount<=(2100*vipref)
			   then
			       battlepoint=2100*vipref-icount
			   elseif icount>=2100*vipref
			   then
			       battlepoint =0
			   end
			end
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID, battlepoint)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,ReputationID, battlepoint)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 14761, battlepoint)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 16610, 1)
		end
   		return 0
   	end

}

TaskList[14754] = --散人战场参与脚本任务
{
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bRecordFinishCount = true,
        iMaxFinishCount = 2,		--每天最多可完成的次数：2	***
    	iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
		bHiddenTask = true,       --隐藏
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
--		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
--		local kindnessID = 11	--恩德值的声望id
--		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
--		local costKindnessValue = TaskList[14573].CostkindnessValue	[math.min(5,icount+1)]	--本次重置次数需要消耗的恩德值
		if playerLev < 40 then	--40级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
--		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
--		if emptySlots < 1 then	--普通包裹栏需要1格
--			return TASK_PREREQU_FAIL_GIVEN_ITEM
--		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14754)	-- 随任务id不停变化***
   		if ulCurTime - ulDeliverTime > 60 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,
   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
--			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
--			if emptySlots < 1 then	--普通包裹栏需要1格
--				return TASK_PREREQU_FAIL_GIVEN_ITEM
--			end
   		end
   		return 0
   	end
   	,
   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
   		if bSuccess then
			local kindnessID = 18	--战场点数的声望id
			local ReputationID = 21 -- 战场总声望id
			local playerLevel= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14761) --计次任务计算每日任务完成次数，每日清空
			local battlepoint = 0
			local imoney = 0
			local vipbuffid = 2685
			local vipref= 1
			local timePackage = os.date("*t", os.time())
         	local year = timePackage.year
	        local day = timePackage.yday
	        local hour = timePackage.hour
        	local btime = 0	--时间属性加成
        	local yeartable = {0,366,731,1096,1461,1827,2182,2547,2912,3278,3643,4008,4373,4738,}
        	local firstday= 218
        	local daycount=yeartable[year-2011]+day-firstday    -- 离2012年8月5日有几天
        	if math.floor(daycount/14)==(daycount/14) and hour>=18
        	then
        	   btime = 1
        	end
			local bVIP = TaskCApi.HasBuff(TASKINTERFACE_POINTER,vipbuffid)
			if bVIP then
			  vipref=2
			end
			if playerLevel>=75
			then
			   battlepoint=200*vipref+200*btime
			   imoney = 20000
			   if icount>=(7000*vipref-battlepoint) and icount<=(7000*vipref)
			   then
			       battlepoint=7000*vipref-icount
			   elseif icount>=7000*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=70
			then
			   battlepoint=140*vipref+140*btime
			   imoney = 18000
			   if icount>=(5000*vipref-battlepoint) and icount<=(5000*vipref)
			   then
			       battlepoint=5000*vipref-icount
			   elseif icount>=(5000*vipref)
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=60
			then
			   battlepoint=100*vipref+100*btime
			   imoney = 15000
			   if icount>=(3500*vipref-battlepoint) and icount<=(3500*vipref)
			   then
			       battlepoint=3500*vipref-icount
			   elseif icount>=3500*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=40
			then
			   battlepoint=60*vipref+60*btime
			   imoney = 10000
			   if icount>=(2100*vipref-battlepoint) and icount<=(2100*vipref)
			   then
			       battlepoint=2100*vipref-icount
			   elseif icount>=(2100*vipref)
			   then
			       battlepoint =0
			   end
			end
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID, battlepoint)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,ReputationID, battlepoint)
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,imoney)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13122,1)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,1)
			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,14754,TaskBroadcastChannel.Trade)
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 14761, battlepoint)
		end
   		return 0
   	end
}

TaskList[14755] = --散人战场活跃发奖脚本任务
{
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bRecordFinishCount = true,
        iMaxFinishCount = 1,		--每天最多可完成的次数：1	***
    	iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
		bHiddenTask = true,       --隐藏
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
--		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
--		local kindnessID = 11	--恩德值的声望id
--		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
--		local costKindnessValue = TaskList[14573].CostkindnessValue	[math.min(5,icount+1)]	--本次重置次数需要消耗的恩德值
		if playerLev < 40 then	--40级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 1 then	--普通包裹栏需要1格
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14755)	-- 随任务id不停变化***
   		if ulCurTime - ulDeliverTime > 60 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,
   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 1 then	--普通包裹栏需要1格
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
   		end
   		return 0
   	end
   	,
   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
   		if bSuccess then
			local kindnessID = 18	--战场点数的声望id
			local ReputationID = 21  --战场总计声望id
			local playerLevel= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14761) --计次任务计算每日任务完成次数，每日清空
			local battlepoint = 0
			local imoney = 0
			local runeid = 42089
			local runeamount = 0
			local vipbuffid = 2685
			local vipref= 1
			local timePackage = os.date("*t", os.time())
         	local year = timePackage.year
	        local day = timePackage.yday
	        local hour = timePackage.hour
        	local btime = 0--时间属性加成
        	local yeartable = {0,366,731,1096,1461,1827,2182,2547,2912,3278,3643,4008,4373,4738,}
        	local firstday= 218
        	local daycount=yeartable[year-2011]+day-firstday    -- 离2012年8月5日有几天
        	if math.floor(daycount/14)==(daycount/14) and hour>=18
        	then
        	   btime = 1
        	end
			local bVIP = TaskCApi.HasBuff(TASKINTERFACE_POINTER,vipbuffid)
			if bVIP then
			  vipref=2
			end
			if playerLevel>=75
			then
			   battlepoint=900*vipref+900*btime
			   imoney = 90000
			   local p = math.random()
				runeamount = 1
			   if p<=0.5
			   then
				 runeid = 42090
			   end
			   if icount>=(7000*vipref-battlepoint) and icount<=7000*vipref
			   then
			       battlepoint=7000*vipref-icount
			   elseif icount>=7000*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=70
			then
			   battlepoint=630*vipref+630*btime
			   imoney = 76000
			   runeamount = 1
			   if icount>=(5000*vipref-battlepoint) and icount<=5000*vipref
			   then
			       battlepoint=5000*vipref-icount
			   elseif icount>=5000*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=60
			then
			   battlepoint=450*vipref+450*btime
			   imoney = 60000
			   runeamount = 0
			   if icount>=(3500*vipref-battlepoint) and icount<=3500*vipref
			   then
			       battlepoint=3500*vipref-icount
			   elseif icount>=3500*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=40
			then
			   battlepoint=270*vipref+270*btime
			   imoney = 45000
			   runeamount = 0
			   if icount>=(2100*vipref-battlepoint) and icount<=2100*vipref
			   then
			       battlepoint=2100*vipref-icount
			   elseif icount>=2100*vipref
			   then
			       battlepoint =0
			   end
			end
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID, battlepoint)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,ReputationID, battlepoint)
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,imoney)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13122,2)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,2)
			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,14755,TaskBroadcastChannel.Trade)
			TaskCApi.ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 14761, battlepoint)
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,runeid,runeamount,true)
		end
   		return 0
   	end
}

TaskList[14750] = --散人战场首次胜利脚本任务
{
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bRecordFinishCount = true,
        iMaxFinishCount = 1,		--每天最多可完成的次数：1	***
    	iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
		bHiddenTask = true,       --隐藏
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
--		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
--		local kindnessID = 11	--恩德值的声望id
--		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
--		local costKindnessValue = TaskList[14573].CostkindnessValue	[math.min(5,icount+1)]	--本次重置次数需要消耗的恩德值
		if playerLev < 40 then	--40级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 1 then	--普通包裹栏需要1格
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14750)	-- 随任务id不停变化***
   		if ulCurTime - ulDeliverTime > 60 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,
   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 1 then	--普通包裹栏需要1格
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
   		end
   		return 0
   	end
   	,
   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
   		if bSuccess then
			local kindnessID = 18	--战场点数的声望id
			local ReputationID = 21  --战场总计声望id
			local playerLevel= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14761) --计次任务计算每日任务完成次数，每日清空
			local battlepoint = 0
			local imoney = 0
			local itemid = 41995
			local itemmount = 0
			local vipbuffid = 2685
			local vipref= 1
			local timePackage = os.date("*t", os.time())
         	local year = timePackage.year
	        local day = timePackage.yday
	        local hour = timePackage.hour
        	local btime = 0	--时间属性加成
        	local yeartable = {0,366,731,1096,1461,1827,2182,2547,2912,3278,3643,4008,4373,4738,}
        	local firstday= 218
			local Assistcomment
        	local daycount=yeartable[year-2011]+day-firstday    -- 离2012年8月5日有几天
        	if math.floor(daycount/14)==(daycount/14) and hour>=18
        	then
        	   btime = 1
        	end
			local bVIP = TaskCApi.HasBuff(TASKINTERFACE_POINTER,vipbuffid)
			if bVIP then
			  vipref=2
			end
			local Assist = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15945)
			if Assist>=10
			then
			   Assist = 10
			end
			Assistcomment= Assist*0.08+0.2
			if playerLevel>=75
			then
			   battlepoint=1500*Assistcomment*vipref+1500*Assistcomment*btime
			   imoney = 100000
			   itemmount = 5
			   if icount>=(7000*vipref-battlepoint) and icount<=7000*vipref
			   then
			       battlepoint=7000*vipref-icount
			   elseif icount>=7000*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=70
			then
			   battlepoint=1050*Assistcomment*vipref+1050*Assistcomment*btime
			   imoney = 80000
			   itemmount = 3
			   if icount>=(5000*vipref-battlepoint) and icount<=5000*vipref
			   then
			       battlepoint=5000*vipref-icount
			   elseif icount>=5000*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=60
			then
			   battlepoint=750*Assistcomment*vipref+750*Assistcomment*btime
			   imoney = 75000
			   itemmount = 1
			   if icount>=(3500*vipref-battlepoint) and icount<=3500*vipref
			   then
			       battlepoint=3500*vipref-icount
			   elseif icount>=3500*vipref
			   then
			       battlepoint =0
			   end
			elseif playerLevel>=40
			then
			   battlepoint=450*Assistcomment*vipref+450*Assistcomment*btime
			   imoney = 50000
			   itemmount = 0
			   if icount>=(2100*vipref-battlepoint) and icount<=2100*vipref
			   then
			       battlepoint=2100*vipref-icount
			   elseif icount>=2100*vipref
			   then
			       battlepoint =0
			   end
			end
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID, battlepoint)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,ReputationID, battlepoint)
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,imoney)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13122,2)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,2)
			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,14750,TaskBroadcastChannel.Trade)
			TaskCApi.ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 14761, battlepoint)
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemid,itemmount,false)
		end
   		return 0
   	end
}

TaskList[15774] = --散人战场周常脚本任务
{
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bRecordFinishCount = true,
        iMaxFinishCount = 1,		--每周最多可完成的次数：1	***
    	iClearFinishCountType = TaskClearFinishCountType.Weekly,--每周清空
		iClearFinishCountDay = 2,
		iClearFinishCountHour = 0,
		iClearFinishCountMin = 0,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
		bHiddenTask = true,       --隐藏
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
--		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
--		local kindnessID = 11	--恩德值的声望id
--		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
--		local costKindnessValue = TaskList[14573].CostkindnessValue	[math.min(5,icount+1)]	--本次重置次数需要消耗的恩德值
		if playerLev < 40 then	--40级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 2 then	--普通包裹栏需要2格
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15774)	-- 随任务id不停变化***
   		if ulCurTime - ulDeliverTime > 60 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,
   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 1 then	--普通包裹栏需要1格
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
   		end
   		return 0
   	end
   	,
   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
	local magicstone={
	                   [1]={43303,43310,43317,43324,43331,43338,43345},
	                   [2]={43304,43311,43318,43325,43332,43339,43346},
					   [3]={43305,43312,43319,43326,43333,43340,43347},
					   [4]={43306,43313,43320,43327,43334,43341,43348},
					   [5]={43307,43314,43321,43328,43335,43342,43349},
					   [6]={43308,43315,43322,43329,43336,43343,43350},
					  }
   		if bSuccess then
			local kindnessID = 34	--战神点数的声望id
			local playerLevel= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local imoney = 0
			local itemid = 44147
			local itemmount = 0
			local magicstoneid= 0
			local magicstonemount=0
			local vipbuffid = 2685
			local vipref= 1
			local count = 0
			local battlepoint
			local timePackage = os.date("*t", os.time())
			local weeklyday= timePackage.wday
			count = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,35)
			local bVIP = TaskCApi.HasBuff(TASKINTERFACE_POINTER,vipbuffid)
			if bVIP then
			  vipref=2
			end
			if playerLevel>=75
			then
			   battlepoint=100
			   if math.random()<0.01 and count<5              --最终改为0.01
			   then
			    itemmount = 1
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER,35,1)
			   end
			elseif playerLevel>=70
			then
			   battlepoint=80
			   if math.random()<0.01 and count<5                 --最终改为0.01
			   then
			    itemmount = 1
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER,35,1)
			   end
			elseif playerLevel>=60
			then
			   battlepoint=70
			   if math.random()<0.01 and count<5                 --最终改为0.01
			   then
			    itemmount = 1
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER,35,1)
			   end
			elseif playerLevel>=40
			then
			   battlepoint=60
			   if math.random()<0.01 and count <5                --最终改为0.01
			   then
			    itemmount = 1
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER,35,1)
			   end
			end
			if playerLevel>=73
			then
			   if math.random()<=0.005                        --最终改为0.005
			   then
				   magicstonemount=1
			       local k=math.random(1,7)
				   magicstoneid= magicstone[6][k]
			   end
			elseif  playerLevel>=68
			then
			   if math.random()<=0.005                        --最终改为0.005
			   then
				   magicstonemount=1
			       local k=math.random(1,7)
				   magicstoneid= magicstone[5][k]
			   end
			elseif playerLevel>=63
			then
			   if math.random()<=0.005                       --最终改为0.005
			   then
				   magicstonemount=1
			       local k=math.random(1,7)
				   magicstoneid= magicstone[4][k]
			   end
			elseif playerLevel>=58
			then
			   if math.random()<=0.005                         --最终改为0.005
			   then
				   magicstonemount=1
			       local k=math.random(1,7)
				   magicstoneid= magicstone[3][k]
			   end
			elseif playerLevel>=53
            then
			   if math.random()<=0.005                      --最终改为0.005
			   then
				   magicstonemount=1
			       local k=math.random(1,7)
				   magicstoneid= magicstone[2][k]
			   end
			else
			   if math.random()<=0.005                      --最终改为0.005
			   then
				   magicstonemount=1
			       local k=math.random(1,7)
				   magicstoneid= magicstone[1][k]
			   end
			end
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID, battlepoint)
			if itemmount>= 1
			then
			   TaskCApi.Broadcast(TASKINTERFACE_POINTER ,15774,TaskBroadcastChannel.System)
			   TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemid,itemmount,false)
			end
			if magicstonemount>=1
			then
			   TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,magicstoneid,magicstonemount,false)
			end
			if weeklyday==2
			then
			  TaskCApi.ClearFinishRecordsOnly(TASKINTERFACE_POINTER, 15770)
			end
		end
   		return 0
   	end
}



TaskList[16253] = --芳香岛采花任务
{
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = true,
  		bRecordFinishCount = true,
        iMaxFinishCount = 1,		--每天最多可完成的次数：1	***
    	iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan
  	},

	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表
		Exp = function(TASKINTERFACE_POINTER)
		local playerLev= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local xp = 1400
		local itemID = 46265
		local ItemNumInPacket = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, itemID, true)
		if ItemNumInPacket >= 80 and ItemNumInPacket < 100 then
			xp = 1400
		elseif ItemNumInPacket >= 100 and ItemNumInPacket < 120 then
			xp = 1800
		elseif ItemNumInPacket >= 120 and ItemNumInPacket < 140 then
			xp = 2200
		elseif ItemNumInPacket >= 140 and ItemNumInPacket < 160 then
			xp = 2600
		elseif ItemNumInPacket >= 160 then
			xp = 3000
		end
		local iExperience = TaskExpAdjust[playerLev] * xp
			return iExperience
		end,
	},

	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		if playerLev < 60 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		return 0										--返回值是0则直接发放，如果是其他值则会给出相应错误代码
	end,

	OnDeliver = function(TASKINTERFACE_POINTER)		--玩家接收该任务时调用
	--在这里执行一些发放子任务、推入Method表和AwardPreview表的操作
		return 0
	end,

	OnAIEvent = function(TASKINTERFACE_POINTER)		--当接收到ai脚本发送的消息事件时调用
		return 0
	end,

	OnMethod = function(TASKINTERFACE_POINTER)			--服务器杀怪、取得物品时调用,客户端任务界面显示时调用,返回Method表。
		local Method = {
			CollectItem = {
				Item1 = {ID = 46265, Num = 80, Common = true}
			}
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		local iRet = TASK_NO_FINISH
		local itemID = 46265
		local ItemNumInPacket = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,46265, true)
		if ItemNumInPacket >= 80 then
			iRet = TASK_SUCC_FINISH
		end
		--TASK_NO_FINISH   = 0 --未完成
		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成
		return iRet
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查
		if bSuccess then
   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end
   		return 0
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，
		local level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local xp = 0
		local itemID = 46265
		local ItemNumInPacket = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, itemID, true)
		if ItemNumInPacket >= 80 and ItemNumInPacket < 100 then
			xp = 1400
		elseif ItemNumInPacket >= 100 and ItemNumInPacket < 120 then
			xp = 1800
		elseif ItemNumInPacket >= 120 and ItemNumInPacket < 140 then
			xp = 2200
		elseif ItemNumInPacket >= 140 and ItemNumInPacket < 160 then
			xp = 2600
		elseif ItemNumInPacket >= 160 then
			xp = 3000
		end
		if bSuccess then
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, TaskExpAdjust[level]*xp)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,itemID, ItemNumInPacket)
		end
		TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, 16260, false)
		return 0
	end,
}

------------------------------------------------------------------

















