
---------------------------------------------------------------
--  created:   2009.8.24
--  author:    cy
--  内容：任务脚本文件。


--  修改：QF
--  内容：新增游戏内用脚本任务


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--cy测试脚本任务，任务脚本和任务编辑器和请勿改动
TaskList[6835] =
{
  	Property =
  	{
  		bKeyTask = true,
  		bCanGiveUp = true,
  		bShowPrompt = true,
  	}
   	,

	-- 成功时有效

	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			return 100--返回0时为？？？，其他为显示的值

		end
		,
		-- 非绑定钱
		Gold = function(TASKINTERFACE_POINTER)
			return 200--返回0时为？？？，其他为显示的值

		end
		,
		-- 绑定钱
		BindMoney = function(TASKINTERFACE_POINTER)
			return 300--返回0时为？？？，其他为显示的值

		end
		,
		-- SP
		SP = function(TASKINTERFACE_POINTER)
			return 400--返回0时为？？？，其他为显示的值

		end
		,
		-- 声望
		Reputation = function(TASKINTERFACE_POINTER)
			return 500--返回0时为？？？，其他为显示的值

		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 7075, NUM = 1},--0时为？？？，其他显示物品和数量

						Item2 = {ID = 7076, NUM = 2},
					}
			return items
		end
		,
		-- 副职业经验
		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			soe = {
						SOE1 = {ID = 1, EXP = 10},--id为副职业id，exp为数值，exp为0显示？？？
						SOE2 = {ID = 2, EXP = 20},
				  }
			return soe
		end
		,

		-- 区域声望
		FriendShips = function(TASKINTERFACE_POINTER)
			local friendships = {}
			friendships = {
								FS1 = {ID = 1, VAL = 10},--id为声望id，val为数值；val=0 ，？？？（id=-1） 声望 ？？？（val=0）
								FS2 = {ID = 2, VAL = 20},
						  }
			return friendships
		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 1 --公会贡献度
			factionaward.money = 2   --公会资金
			factionaward.melee = 3   --公会武装
			factionaward.magic = 4   --公会魔法
			factionaward.economy = 5 -- 公会经济
			factionaward.culture = 6 --公会文明
			factionaward.belief = 7  --公会信仰
			factionaward.credit = 8  --公会功勋
			factionaward.vitality = 9 --公会活跃度
			return factionaward
		end
		,

	}
	,

   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
   		return 0
   	end
   	,

   	OnDeliver = function(TASKINTERFACE_POINTER, iParam)
   		local iRatio = 1   --奖励倍数
   		if iParam == 1 then
			iRatio = 1
		elseif iParam == 2 then
			iRatio = 3
		end

		TaskCApi.DeliverGold(TASKINTERFACE_POINTER, 1000*iRatio)       --发金
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.KillMonster = { Mons1={ID=21, Num=3},}
   		Method.iTimeLimit = 60
   		return Method
   	end
   	,

   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

   		if TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 6835, "Mons1") >= 3 then
      	   iRet = TASK_SUCC_FINISH
      	end

   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 6835)
   		if ulCurTime - ulDeliverTime > 60 then
   		    iRet = TASK_FAIL_FINISH
   		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		return 0
   	end
   	,

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess, iParam)
   	   	local iRatio = 1   --奖励倍数
   		if iParam == 1 then
			iRatio = 1
		elseif iParam == 2 then
			iRatio = 3
		end

   		if bSuccess then
   		   TaskCApi.DeliverGold(TASKINTERFACE_POINTER, 1000*iRatio)       --发金
   		else
   		   TaskCApi.DeliverGold(TASKINTERFACE_POINTER, 100*iRatio)
   		end

   		return 0
   	end
  }


TaskList[6023] =
{
  	--玩家上线时调用


   	Property = {}
  		--设置可变属性

   	,

	--TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, iItemID, bCommon) --获取玩家包裹里指定物品个数，iItemID为物品ID，bCommon值为true表示普通物品、false表示任务物品。


   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iItemID = 7114
	   	if iPlayerLev < 3 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格

   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, iItemID, true) < 3 then	--某普通物品个数大于3
			return TASK_PREREQU_FAIL_NO_ITEM
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
   		--发道具或奖励
		TaskCApi.DeliverGold(TASKINTERFACE_POINTER,1000)         	    --发金
		TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,5757, 1)       --发5757普通物品1个
		--TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,7114, 1)	--收取7114普通物品1个
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
   		if iPlayerLev <= 10 then
   		    Method.KillMonster = { Mons1={ID=21, Num=3}, Mons2={ID=22, Num=5},}
   		else
   		    Method.KillMonster = { Mons1={ID=21, Num=3}, Mons2={ID=22, Num=5}, Mons3={ID=23, Num=7},}
   		    Method.CollectItem = { Item1={ID=9049, Num=10, Common=true},}
   		    Method.iTimeLimit = 120 --2分钟没完成则任务失败
   		end

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

      	local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
   		if iPlayerLev <= 10 then
      		if TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 6023, "Mons1") and
      		   TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 6023, "Mons2") >= 5 then
      		       iRet = TASK_SUCC_FINISH
      		end
   		else
   		    if TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 6023, "Mons1") >= 3 and
   		       TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 6023, "Mons2") >= 5 and
   		       TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 6023, "Mons3") >= 7 and
   		       TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 9049, true)   >= 10 and
   		       TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 760,  false)  >= 3 then
   		           iRet = TASK_SUCC_FINISH
   		    end
   		end

   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 6023)
   		if ulCurTime - ulDeliverTime > 120 then
   		    iRet = TASK_FAIL_FINISH
   		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 2 then --普通包裹栏需要2格
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
   	    	end

   	   		if TaskCApi.GetShowTaskRemainCount(TASKINTERFACE_POINTER) < 1  and  --发1个可见任务
   		   	   TaskCApi.GetActiveTaskListRemainSpace(TASKINTERFACE_POINTER) < 5 then  --发放的任务有4个子任务
			   --【疑似bug】--如果发放的任务有前提，但不满足，这时弹出提示框，但任务能照常完成。--应该不允许完成。
			   --需要加一个接口，判断发放任务的接受条件是否满足
   		   	   return TASK_PREREQU_FAIL_FULL
   	   		end
   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 5757, 1)    --收取5757普通物品1个
			TaskCApi.DeliverTaskItem(TASKINTERFACE_POINTER, 760, 3)      	--发760任务物品3个
			TaskCApi.DeliverNewTaskxxxx(TASKINTERFACE_POINTER, 3757)           --开启新任务3757
   		else
   		   TaskCApi.TakeAwayGold(TASKINTERFACE_POINTER, 1000)         	     --收取金
		   TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 7114, 1)      --收取5757普通物品1个
		   TaskCApi.DeliverTaskItem(TASKINTERFACE_POINTER, 760, 3)      	 --发760任务物品3个
   		end

   		return 0
   	end
}

TaskList[6717] = --社交家交涉任务:by xzy
{
  	Property =
  	{
  		bRecordFinish = false,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bFinishWhenDelvier = true,	--接受即完成！

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多完成1次

  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.SheJiaoJia,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效

	AwardPreview =
	{

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--检查身上是否有重复任务id 7164-7214  6374-6424
		for i = 7164,7214 do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, i)  then
			return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

		for j = 6374,6424 do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then
			return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

		--需要社交家等级至少为3级

		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, 32) then
			return TASK_PREREQU_FAIL_LUA_TASK
		elseif TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER, 32) < 3 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
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
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   	    	local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 6374)
			if iRet ~= 0 then
			    return iRet
			end
   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then

			math.randomseed(os.time())
			local iRandomNum = math.random(0, 1)
			local iTask1 = math.random(7164,7214)
			local iTask2 = math.random(6374,6424)

			if iTask1 == 7168 or iTask1 == 7202 then	--去掉 羊毛 和 发狂
				iTask1 = 7164
			end

			if iRandomNum == 0 then
-- 				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, math.random(7164,7214))
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTask1)
			else
-- 				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, math.random(6374,6424))
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTask2)
			end
   		end

   		return 0
   	end
}

TaskList[7680] = --为任务ID7680:石工玫瑰001收产品
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成
  		bCanRedoAfterFailure = true,--失败可重复完成

		bUIButtonTask = true, --界面任务

  		bCanGiveUp = true,--可放弃
  		bShowPrompt = true,--显示系统提示
  		bCanSeekOut = true,--允许被查找

  		bRecordFinishCount = true,--记录完成次数
  		iMaxFinishCount = 1,--最大完成次数为1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,--任务类型：活动
  		iTopic = TaskTopic.YiBan,--一般主题任务
  	}
   	,

	-- 成功时有效

	AwardPreview =
	{

		-- 经验
		Exp = function(TASKINTERFACE_POINTER)

			local AwardMulti = 60										--经验奖励系数
			local AwardMultiply = {1,1.2,1.4,1.6,1.8,2,2.1,2.2,2.3,2.4}			--奖励倍率修正表，索引

			local ChargeVacationId = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 1) --所收取的物品产自的副职业id
			local ChargeVacationLevel =TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 2) --所收取的物品产自的副职业等级

			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMultiply[ChargeVacationLevel] * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值

		end
		,

		-- 物品，有概率发放浮云奖励。
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 0, NUM = 0},--0时为？？？，其他显示物品和数量
			}
			return items
		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 1 --公会贡献度
			factionaward.credit = 1  --公会功勋
			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)   --玩家等级
		--检查玩家等级是否>=25
		if iPlayerLev < 25 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end


		--必须在一个公会里
		local iGuild = TaskCApi.GetFactionLev(TASKINTERFACE_POINTER)
		if iGuild < 0 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

		local OpenVacationId = { 0,1,5,6,}--当前开放的可收取物品的副职业id，可扩展


		--如果没有学会生产类副职业，则无法发放
		for i, v in pairs(OpenVacationId) do
			if TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, v) then
				return 0
			elseif i == #OpenVacationId then
				return TASK_PREREQU_FAIL_BELOW_LEVEL
			end
		end

		--[[
		if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,9748) then--如果身上有任务9748，则不能发放，防止无限制随机
			return TASK_PREREQU_FAIL_LUA_TASK
		end
		]]--
   		return 0

   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local OpenVacationId = { 0,1,5,6,}--当前开放的可收取物品的副职业id，可扩展

		--要收取的物品表格，副职业id为索引

		local ChargeItems = {
			--炼金001-080
			[0] = {
				--炼金1阶1-10
				21102,   --玫瑰油
				21106,   --清香剂
				9636,    --勇猛药剂
				9637,    --坚固药剂
				9649,    --弱效佐餐药剂

				9650,    --弱效助酒药剂
				21102,   --玫瑰油
				21106,   --清香剂
				9649,    --弱效佐餐药剂
				9650,    --弱效助酒药剂

				--炼金2阶11-20
				9658,    --初级助酒药剂 原为(紫风铃之心21103)
				9657,    --初级佐餐药剂 原为(紫风铃之辉21107)
				9641,    --物理药剂
				9642,    --神圣药剂
				9643,    --冰霜药剂

				9644,    --火焰药剂
				9645,    --风暴药剂
				21079,   --大地药剂
				21080,   --黑暗药剂
				9657,    --初级佐餐药剂

				--炼金3阶21-30
				9422,    --弱效生命之源 原为(黄金之心21104)
				9423,    --弱效魔法之泉 原为(黄金之辉21108)
				9422,    --弱效生命之源
				9423,    --弱效魔法之泉
				9426,    --初级战斗药剂

				9422,    --弱效生命之源
				9423,    --弱效魔法之泉
				9663,    --低效佐餐药剂
				9664,    --低效助酒药剂
				9422,    --弱效生命之源

				--炼金4阶31-40（40级封顶）
				9424,    --初级生命之源
				9425,    --初级魔法之泉
				21105,   --太阳之心
				21109,   --太阳之辉
				9654,    --狂野药水

				9659,    --愤怒药剂
				9660,    --石肤药剂
				9662,    --狂暴药剂
				9704,    --次级佐餐药剂
				9705,    --次级助酒药剂

				--炼金5阶41-50（5.18版本更新，开放5级）
				21638,--5级炼金瞬回生命药水
				21642,--5级炼金瞬回魔法药水
				9719,--中效佐餐药剂
				9720,--中效助酒药剂
				9647,--低效生命药剂

				9648,--低效魔力药剂
				9661,--无敌药剂
				9719,--中效佐餐药剂
				9720,--中效助酒药剂
				9647,--低效生命药剂

				--炼金6阶51-60
				9652,--太阳之心
				9653,--太阳之辉
				9654,--狂野药水
				9655,--搏命药水
				9660,--石肤药剂

				9662,--狂暴药剂
				7143,--无土之土
				9654,--狂野药水
				9655,--搏命药水
				9660,--石肤药剂

				--炼金7阶61-70 (2011.3.17修改)
				9430,	--中效生命药剂
				9431,	--中效魔力药剂
				30987,	--强效佐餐药剂
				30988,	--强效助酒药剂
				9430,	--中效生命药剂

				9430,	--中效生命药剂
				9431,	--中效魔力药剂
				30987,	--强效佐餐药剂
				30988,	--强效助酒药剂
				30988,	--强效助酒药剂


				--炼金8阶71-80
				9704,--次级佐餐药剂
				9705,--次级助酒药剂
				9706,--次级营养药剂
				9704,--次级佐餐药剂
				9705,--次级助酒药剂

				9706,--次级营养药剂
				9704,--次级佐餐药剂
				9705,--次级助酒药剂
				9706,--次级营养药剂
				9704,--次级佐餐药剂
			},

			--烹饪1001-1080
			[1] = {
				--烹饪1阶

				19033, --甜奶酪
				19040, --甜牛奶
				19033, --甜奶酪
				19040, --甜牛奶
				19033, --甜奶酪

				19040, --甜牛奶
				19033, --甜奶酪
				19040, --甜牛奶
				19033, --甜奶酪
				19040, --甜牛奶

				--烹饪2阶111-120
				11690,    --热辣鱼排
				11691,    --椰香小饼
				17190,    --米香蟹斗
				17080,    --椰枣汁
				17081,    --鳄鱼浓汤

				17082,    --艾西甜酒酿
				11690,    --热辣鱼排
				11691,    --椰香小饼
				17190,    --米香蟹斗
				17080,    --椰枣汁

				--烹饪3阶

				12238,    --圣甲虫大餐
				12239,    --鱼香面包
				12246,    --多味拌面
				17191,    --甜香燕麦粥
				12235,    --睡莲花酒

				12236,    --精灵美酒
				17083,    --浅色忧郁
				17084,    --清新温泉水
				12238,    --圣甲虫大餐
				12239,    --奶酪面包

				--烹饪4阶

				12231,    --美味蛋卷
				12232,    --浓汤香草面
				23288,    --烤旗鱼
				17192,    --锡月鱼排
				9760,     --蜥蜴血酒

				12233,    --蛋奶酒
				12255,    --夜旗鱼汤
				12242,    --草莓酒
				12231,    --美味蛋卷
				12232,    --浓汤香草面

				--烹饪5阶(5.18更新版本。1206修改黄沙蛋糕改为蜘蛛蛋卷13439，1208由于不更客户端，改回来)
				12241,--美味花鳍鱼
				12244,--海鲜煎蛋卷
				12250,--黄沙蛋糕
				12259,--香烤熊肋排
				12247,--麻辣野味大餐

				9758,--萨提洛斯葡萄酒
				17085,--粉红诱惑
				17086,--菊花酿
				17087,--黑月秘酿
				11688,--银莲酒

				--烹饪6阶（1206修改黄沙蛋糕改为蜘蛛蛋卷13439，1208由于不更客户端，改回来)

				12244,--海鲜煎蛋卷
				12250,--黄沙蛋糕
				12259,--香烤熊肋排
				12247,--清炒紫苜蓿
				9758, --尼索葡萄酒

				17085,--粉红诱惑
				17086,--菊花酿
				17087,--黑月密酿
				17195,--森林大杂烩
				17086,--菊花酿

				--烹饪7阶(2011.3.17扩展）

				34161,	--美味眠鱼骨
				34162,	--荷香面包
				34164,	--晶骨鱼汤
				34165,	--晨露酒
				34166,	--祝福清露

				34161,	--美味眠鱼骨
				34162,	--荷香面包
				34164,	--晶骨鱼汤
				34165,	--晨露酒
				34166,	--祝福清露

				--烹饪8阶

				17194,--玫瑰鱼柳
				17194,
				17194,
				17194,
				17194,

				17088,--瓜皮凉酒
				17088,
				17088,
				17088,
				17088,
			},
			--采矿5001-5010
			[5] = {
				7056, --1阶  铜矿
				7057, --2阶  汞矿石
				11683,--3阶  锡矿石
				17455,--4阶  锌矿石
				17456,--5阶  铅矿石

				7058, --6阶  铁矿石
				7058, --7阶  铁矿石
				7058, --8阶  铁矿石
				7058, --9阶  铁矿石
				7060, --10阶 硫磺矿石
			},
			--采摘6001-6020
			[6] = {
				7076,  --1阶  野蔷薇
				7075,  --1阶  薰衣草

				7081,  --2阶  纸莎草
				9517,  --2阶  椰枣

				7084,  --3阶  睡莲
				7082,  --3阶  风信子

				7080,  --4阶  紫罗兰
				9514,  --4阶  龙芽草

				9518,  --5阶  紫苜蓿
				9501,  --5阶  晚香玉

				17063, --6阶  梦境花
				17065, --6阶  霜叶草

				34111, --7阶  流光荷
				34107, --7阶  晨露草

				34111, --8阶
				34107, --8阶

				7079,  --9阶
				17063, --9阶

				17065, --10阶
				17065, --10阶

			},
		}

		--初始化副职业表格，存储索引所指示的副职业id产品在ChargeItems{}里物品id
		--[副职业id] = {收取物品表里起始id对应的序号，每级生产产品数}
		local VacationItemsStart = {
		[0] = 10,--炼金
		[1] = 10,--烹饪
		[5] = 1, --采矿
		[6] = 2, --采摘
		}

		local iPlayervacationid ={}
		for i,v in ipairs(OpenVacationId) do	--将玩家学会的副职业存入表iPlayervacationid{}
			if TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, v) then
				iPlayervacationid[#iPlayervacationid+1] = v
			end
		end

		--选择一个生产类副职业

		local VacationId = 0 --副职业种类，默认为炼金，防止取空
		local VacationLevel= 1 --副职业级别，默认为1级，防止取空

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)   --玩家等级

		--固定玩家每天随到的内容，当天奇偶数*玩家创建角色的时间 %#iPlayervacationid+1
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --取得玩家角色创建时间

		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		VacationId = iPlayervacationid[ (timePackage.yday + RoleCreateTime ) % #iPlayervacationid + 1] --决定收取物品属于的副职业类别
		VacationLevel = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER, VacationId)		--函数获得副职业级别

		--防止玩家随机到不可到达的地图的内容，在玩家等级和副职业等级中取最小值

		if VacationId == 5 then --采矿是30级才学会的，所以要特殊处理
			if VacationLevel > math.floor(iPlayerLevel/10)-2 then
				VacationLevel = math.floor(iPlayerLevel/10)-2
			end
		else
			if VacationLevel > math.floor(iPlayerLevel/10) then
				VacationLevel = math.floor(iPlayerLevel/10)
			end
		end

		local iRandomR = VacationItemsStart[VacationId]		  		--随机半径
		local NeedItemsStart = 1+(VacationLevel-1)*iRandomR   		--需要随机的物品开始的索引号

		local NeedItemId 											--需要的物品id

		if VacationId == 5 then --采矿的话没有产物随机
			NeedItemId = ChargeItems[VacationId][NeedItemsStart]
		else
			NeedItemId = ChargeItems[VacationId][NeedItemsStart + timePackage.yday * RoleCreateTime % iRandomR]
		end


		--服务器debug问题start

		local tabNeedItem = {9654, 9655, 9660, 9662, 9659, 9661, 7143, 9652, 9653}

		for i , v in ipairs(tabNeedItem) do
			if v == NeedItemId then
				NeedItemId = 9704
			end
		end

		if NeedItemId == 12250 then --烹饪的黄沙蛋糕改为 蜘蛛蛋卷
			NeedItemId = 13439
		end

		if NeedItemId == 17195 then --烹饪的丛林大杂烩改为 蜘蛛蛋卷
			NeedItemId = 13439
		end

		--服务器debug问题end

		local  key1,key2 --物品id存储方法 key1=id/200,key2=id%200,id=key1+key2
		key1 = math.floor(NeedItemId / 200)
		key2 = NeedItemId % 200

		--设置随机数

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,7680, 1, VacationId)		--存储副职业种类
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,7680, 2, VacationLevel)	--存储副职业等级

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,7680, 3, key1)				--存储物品id/200
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,7680, 4, key2)				--存储物品id%200

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 3)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 4)

		local NeedItemId = key1 * 200 + key2						--解析出收取物品id

		Method.CollectItem = { Item1={ID=NeedItemId, Num=3, Common=true},}

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 3)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 4)
		local ChargeItemId = key1 * 200 + key2						--解析出收取物品id

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,ChargeItemId, true) >= 3 then
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格

   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		--变量1号副职业种类，2号副职业等级，3号4号为物品id（3号变量值*200+4号变量值）

		local AwardMulti = 60--存放奖励系数
		local AwardMultiply = {1,1.2,1.4,1.6,1.8,2,2.1,2.2,2.3,2.4}			--奖励倍率修正表，索引

		local ChargeVacationId = ucRandomNum1 					--所收取的物品产自的副职业id
		local ChargeVacationLevel = ucRandomNum2 				--所收取的物品产自的副职业等级

		local ChargeItemId = ucRandomNum3 * 200 + ucRandomNum4 --所收取的物品id

		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

		local AwardNum


		if bSuccess then
			--TaskCApi.DeliverSideOccupExp(TASKINTERFACE_POINTER,ucRandomNum1,10 * AwardMultiply[ChargeVacationLevel])--给玩家发放副职业经验
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, ChargeItemId, 3)    	--收取普通物品3个

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMultiply[ChargeVacationLevel] * AwardMulti)--给玩家发放经验

			--发放工会贡献度1点
			TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, 1)

			--发放功勋1点
			TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, 1)

			--发放浮云奖励
			math.randomseed(os.time())
			AwardNum = math.random(1,100)

			--20%概率发1级古币
			if AwardNum <= 20 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 9049, 1,false)
			end

			--1%概率发2级古币

			if AwardNum == 21 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 9050, 1,false)
			end

		--else--失败发放一个任务9748
			--TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,9748)
   		end

   		return 0
   	end
}

TaskList[7700] = --社交家随机发放任务
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成
  		bCanRedoAfterFailure = true,--失败可重复完成
  		bCanGiveUp = true,--可放弃
  		bShowPrompt = true,--显示系统提示
  		bFinishWhenDelvier = true,--接受即完成
		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多完成1次

  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.SheJiaoJia,--任务类型：社交家
  		iTopic = TaskTopic.YiBan,--一般主题任务

  	}
   	,

	-- 成功时有效
	AwardPreview =
	{

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--检查玩家等级>=20
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--检查身上是否有重复任务id 7012-7036
		for j = 7012,7036 do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then
			return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

		--需要社交家等级至少为2级

		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, 32) then
			return TASK_PREREQU_FAIL_LUA_TASK
		elseif TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER, 32) < 2 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

   		iRet = TASK_SUCC_FINISH

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then
			local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 7012)
   	   		if iRet ~=0  then --是否可以发放新任务






   		   	   return TASK_PREREQU_FAIL_FULL

   	   		end
   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

			math.randomseed(os.time())
			--随机任务id段7012-7036
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, math.random(7012,7036))--从7012-7036中随机一个新任务并开启






   		end

   		return 0
   	end
}

TaskList[7787] = --生产任务活动
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, --放弃任务发失败奖励

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 80,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--存放奖励系数
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值


		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}

			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local ItemId

			if PlayerLevel < 30 then

				if PlayerLevel<20 then		--玩家10-19，发紫草酒12343
					ItemId = 12343
				else						--玩家20-29，发鳄鱼浓汤17081
					ItemId = 17081
				end
			else
				if PlayerLevel < 40 then					--玩家30-39，发睡莲花酒12235
					ItemId = 12235
				elseif PlayerLevel <50 then	--玩家40+，发草莓酒12242
					ItemId = 12242
				elseif PlayerLevel < 60 then --玩家50-59，发黑月密酿17087
					ItemId = 17087
				elseif PlayerLevel < 70 then --玩家60-69，发丛林甜果露17088
					ItemId = 17088
				elseif PlayerLevel < 80 then --玩家70-79，发甜梦酒34163
					ItemId = 34163
				else--玩家80+，发甜梦酒34163
					ItemId = 34163
				end
			end


			items = {
						Item1 = {ID = ItemId, NUM = 4},--0时为？？？，其他显示物品和数量
					}
			return items
		end
		,
		-- 副职业经验




		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			soe = {
						SOE1 = {ID = 1, EXP = 2},--id为副职业id，exp为数值，exp为0显示？？？
				  }
			return soe
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 15 then --等级需要高于15级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 2 then --普通包裹栏需要2格
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--[[
		math.randomseed(os.time())
		local iRandomMethod = math.random(1, 2) --玩家随到的任务种类
		]]--

		--修改的部分，固定玩家每天随到的内容，当天奇偶数*玩家创建角色的时间mod2
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --取得玩家角色创建时间

		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday
		local iRandomMethod =  ( timePackage.yday + RoleCreateTime )% 2 + 1 --玩家当天随到的任务种类

   		--发道具或奖励
		TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 20468, 1, true)     --发 篝火发生器

		if iRandomMethod == 1 then
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 20469, 1, true) --发 烤肉叉

		else
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 20470, 1, true) --发 菜锅
		end

		--设置随机数

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 7787, 1, iRandomMethod)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 7787, 1)

   		if iRandomMethod < 2 then
   		    Method.CollectItem = { Item1 = {ID=20468, Num=1, Common=true},
				Item2 = {ID=20469, Num=1, Common=true},
				Item3 = {ID=20484, Num=2, Common=true},
			} --篝火发生器,烤肉叉,考狼肉
			Method.iTimeLimit = 3600 --1小时没完成则任务失败
   		else
   		    Method.CollectItem = { Item1={ID=20468, Num=1, Common=true},
				Item2 = {ID=20470, Num=1, Common=true},
				Item3 = {ID=20487, Num=4, Common=true},
				}  --篝火发生器，菜锅，甜蜜果露
			Method.iTimeLimit = 3600 --1小时没完成则任务失败
		end

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 7787, 1)

		if iRandomMethod < 2 then
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 20468, true)   >= 1 and
				TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 20469, true)   >= 1 and
				TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 20484, true)   >= 2 then
					iRet = TASK_SUCC_FINISH
			end
		else
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 20468, true)   >= 1 and
				TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 20470, true)   >= 1 and
				TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 20487, true)   >= 4 then
					iRet = TASK_SUCC_FINISH
			end
		end

   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 7787)
   		if ulCurTime - ulDeliverTime > 3600 then
   		    iRet = TASK_FAIL_FINISH
   		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格





   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 60									--存放奖励系数
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

		local FuYunAward = {
					{pro = 30 , id1 = 27124 , id2 = 27135,}, --2级持续配方(10)1级厨师
					{pro = 25 , id1 = 27125 , id2 = 27136,}, --3级持续配方(20)2级厨师
					{pro = 20 , id1 = 27126 , id2 = 27137,}, --4级持续配方(30)3级厨师
					{pro = 15 , id1 = 27127 , id2 = 27138,}, --5级持续配方(40)4级厨师
					{pro = 10 , id1 = 27128 , id2 = 27139,}, --6级持续配方(50)5级厨师
					{pro = 8 ,  id1 = 27129 , id2 = 27140,}, --7级持续配方(60)6级厨师
					{pro = 6 ,  id1 = 27130 , id2 = 27141,}, --8级持续配方(65)7级厨师
					{pro = 5 ,  id1 = 27131 , id2 = 27142,}, --9级持续配方(70)7级厨师
					{pro = 4 ,  id1 = 27132 , id2 = 27143,}, --10级持续配方
					{pro = 3 ,  id1 = 27133 , id2 = 27144,}, --11级持续配方
				}

   		if bSuccess then
			if ucRandomNum1 == 1 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20468, 1)    --收取篝火发生器 1个
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20469, 1)    --收取烤肉叉  1个
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20484, 2)    --收取烤熊肉  1个
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20509, 1)	 --收取烹饪说明 1个

			else
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20468, 1)    --收取篝火发生器 1个
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20470, 1)    --收取菜锅  1个
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20487, 4)    --收取果露  1个
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20509, 1)	 --收取烹饪说明 1个
			end


			--给玩家发放副职业经验
			TaskCApi.DeliverSideOccupExp(TASKINTERFACE_POINTER, 1,2)
			--给玩家发放经验

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)
			--给玩家发放奖励

			--发放中等&浮云奖励
			math.randomseed(os.time())
			AwardNum = math.random(1,1000)
			AwardNum2 = math.random(1,2)

			local ItemId

			if PlayerLevel < 30 then

				if PlayerLevel<20 then		--玩家10-19，发紫草酒12343
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 12343, 4, false)
					if AwardNum > 650 then
						ItemId = 27088 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --10-19的时候发27088和 27100
					end
				else						--玩家20-29，发鳄鱼浓汤17081
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 17081, 4, false)
					if AwardNum > 650  then
						ItemId = 27089 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --20-29的时候发27089和 27101
					end
				end
			else
				if PlayerLevel < 40 then					--玩家30-39，发睡莲花酒12235
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 12235, 4, false)
					if AwardNum > 650  then
						ItemId = 27090 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --30-39的时候发27090和 27102
					end
				elseif PlayerLevel <50 then	--玩家40+，发草莓酒12242
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 12242, 4, false)
					if AwardNum > 650  then
						ItemId = 27091 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --40-49的时候发27091和 27103
					end
				elseif PlayerLevel < 60 then --玩家50-59，发黑月密酿17087
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 17087, 4, false)
					if AwardNum > 650  then
						ItemId = 27092 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --50-59的时候发27092和 27104
					end
				elseif PlayerLevel < 70 then --玩家60-69，发丛林甜果露17088
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 17088, 4, false)
					if AwardNum > 650  then
						ItemId = 27093 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --50-59的时候发27093和 27105
					end
				elseif PlayerLevel < 80 then --玩家70-79，发甜梦酒34163
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 34163, 4, false)
					if AwardNum > 650  then
						ItemId = 27094 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --50-59的时候发27094和 27106
					end
				else--玩家80+，发甜梦酒34163
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 34163, 4, false)
					if AwardNum> 650  then
						ItemId = 27094 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --80+的时候发27094和 27106
					end
				end
			end

			--浮云奖励发特殊配方

			local AwardLevel

			if AwardNum <= 30 then
				--计算表中索引值

				AwardLevel = math.floor( PlayerLevel / 10)
				--[[
				if PlayerLevel <= 60 then
					AwardLevel = math.floor( PlayerLevel / 10)
				else
					AwardLevel = math.floor( PlayerLevel / 5 ) - 6
				end
				]]--

				for i = AwardLevel,1,-1 do
					if i == AwardLevel then
						if AwardNum <= FuYunAward[i].pro then
							if AwardNum2 == 1 then
								TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, FuYunAward[i].id1, 1, false)
							else
								TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, FuYunAward[i].id2, 1, false)
							end
						end
					else
						if AwardNum > FuYunAward[i+1].pro and AwardNum <= FuYunAward[i].pro  then
							if AwardNum2 == 1 then
								TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, FuYunAward[i].id1, 1, false)
							else
								TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, FuYunAward[i].id2, 1, false)
							end
						end

					end
				end

			end

			--阶段性奖励计数14016+1
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 14016, 1)

		else--失败清空任务
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20468, 1)    --收取篝火发生器 1个
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20469, 1)    --收取烤肉叉  1个
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20470, 1)    --收取菜锅  1个
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20509, 1)	 --收取烹饪说明 1个
   		end

   		return 0
   	end
}


--[[
TaskList[7892] = --收藏总起任务
{
  	Property =
  	{
  		bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bAbsoluteTime = true,
  		bShowPrompt = true,
  		bCanSeekOut = true,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 100,
  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iAvailFrequency  = TaskAvailFrequency.EverySeconds,
  		iTimeInterval = 3600,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)

			return 100--返回0时为？？？，其他为显示的值




		end
		,
		-- 非绑定钱
		Gold = function(TASKINTERFACE_POINTER)
			return 200--返回0时为？？？，其他为显示的值




		end
		,
		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			return 300--返回0时为？？？，其他为显示的值




		end
		,
		-- SP
		SP = function(TASKINTERFACE_POINTER)
			return 400--返回0时为？？？，其他为显示的值




		end
		,
		-- 声望
		Reputation = function(TASKINTERFACE_POINTER)
			return 500--返回0时为？？？，其他为显示的值




		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 7075, NUM = 1},--0时为？？？，其他显示物品和数量




						Item2 = {ID = 7076, NUM = 2},
					}
			return items
		end
		,
		-- 副职业经验




		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			soe = {
						SOE1 = {ID = 1, EXP = 10},--id为副职业id，exp为数值，exp为0显示？？？




						SOE2 = {ID = 2, EXP = 20},
				  }
			return soe
		end
		,

		-- 区域声望
		FriendShips = function(TASKINTERFACE_POINTER)
			local friendships = {}
			friendships = {
								FS1 = {ID = 1, VAL = 10},--id为声望id，val为数值；val=0 ，？？？（id=-1） 声望 ？？？（val=0）




								FS2 = {ID = 2, VAL = 20},
						  }
			return friendships
		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 1 --公会贡献度




			factionaward.money = 2   --公会资金
			factionaward.melee = 3   --公会武装
			factionaward.magic = 4   --公会魔法
			factionaward.economy = 5 -- 公会经济
			factionaward.culture = 6 --公会文明
			factionaward.belief = 7  --公会信仰
			factionaward.credit = 8  --公会功勋
			factionaward.vitality = 9 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--高于10级





	   	if iPlayerLev < 10 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		for i = 7893, 7896 do --查看是否已经完成过7893-7896任务
			if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, i, true) then
				break
			elseif i ==7896 then
				return TASK_PREREQU_FAIL_LUA_TASK	--全部完成过了
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		local iRandomNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 7892, 1)

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iRandomNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 7892,1)

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, iRandomNum) then
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, Self, bSuccess)
   		return 0
   	end
   	,

   	--完成该任务时服务器调用






   	OnAward = function(TASKINTERFACE_POINTER, Self, bSuccess)
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用





		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验






		if bSuccess then
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,AwardExpAdjust * AwardMultiply[ChargeVacationLevel] * AwardMulti)--给玩家发放经验





   		end

   		return 0
   	end
}
]]--

TaskList[8089] = --海威要塞发奖任务8089
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
		bHiddenTask = true, 		--隐藏任务

  		bAbsoluteTime = true,
  		bShowPrompt = true,
  		bFinishWhenDelvier = true,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,
  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.FuBen,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)

			return 0--返回0时为？？？，其他为显示的值

		end
		,
		-- 绑定钱

		BindMoney = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值
		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 0, NUM = 0},--0时为？？？，其他显示物品和数量
					}
			return items
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--高于20级

	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
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

		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 6835)
   		if ulCurTime - ulDeliverTime > 360 then
   		    iRet = TASK_FAIL_FINISH
   		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		local iIndex = 180013
		local iValue = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex)

		local ikey = math.floor(iValue/100) --180013可能在0和70-240中取值，商可能为0，1，2

		if bSuccess then

			if ikey == 0 then --不需要发放物品，不用做检查
				return 0

			else --需要发放物品





				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then--普通包裹栏需要1格





					return TASK_PREREQU_FAIL_GIVEN_ITEM
				end
			end
   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，数量为分线变量180013的数值乘以1.1，作为经验奖励，修正等级60，非恒定等级
		--需求奖励2：给任务发道具，根据分线变量180013的数值除以100的商，如果为0则不发任务；
		--变量为1则发任务8802,变量为2则发任务8803,变量为3则发任务8804,变量为4则发任务8805
		--需求奖励3：奖励系数为60,60级修正等级，绑定钱





		--180014为1时，发放8620

		local iIndex = 180013
		local iIndex2 = 180014
		local iValue = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex)
		local iValue180014 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex2)

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAwardMutli = math.floor(iValue * 1.1)
		local iItemMutli = math.floor(iValue/100)
		local iMoneyMutli = 60

   		if bSuccess then

			if iPlayerLevel < 81 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMoneyMutli * TaskMoneyAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[80])
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMoneyMutli * TaskMoneyAdjust[80])
			end

			if iItemMutli > 0 then
				if iItemMutli >= 5 then
					iItemMutli = 4
				end
				local TaskID = 0
				if iPlayerLevel < 45 then
					TaskID = 12384 + iItemMutli					--小于45级发绑定卷轴任务
				else
					TaskID = 8801 + iItemMutli					--大于45级发不绑定卷轴任务
				end
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, TaskID)
			end

			if iValue180014 == 1 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8620)
			end

   		end

   		return 0
   	end
}

TaskList[8162] = --少数诀活动辅助8162
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bRecordFinishCount = true,
		iMaxFinishCount = 10,
  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效




	AwardPreview =
	{

	}
	,

   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		--需要关联任务8161

   		if not TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, 8161) then
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end


		--检查身上是否有重复任务id 8193.8194
		for j = 8193,8194 do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then
			return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

   		return 0
   	end
   	,

   	OnDeliver = function(TASKINTERFACE_POINTER)
   		--18号全局变量决定题目号





		local value = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 18)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8162, 1, value)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.iWaitTime = 0

   		return Method
   	end
   	,

   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local QuestionNum = 11 --当前题库可随机题目数
		local GlobalData = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8162, 1)

		if GlobalData then
			if GlobalData <= QuestionNum and GlobalData >0 then
			iRet = TASK_SUCC_FINISH
			end
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		if bSuccess then
			local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,8193)
			if iRet ~=0  then --是否可以发放新任务





				return TASK_PREREQU_FAIL_FULL
			end
		end
   		return 0
   	end
   	,

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess, iParam)
   		if bSuccess then
			if iParam == 1 then
				--选择A,16+1
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,8193)
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER,16, 1)
			else
				--选择B,17+1
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,8194)
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER,17, 1)
			end
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) --取得玩家等级
			local AwardExpAdjust = TaskExpAdjust[PlayerLevel]					--等级系数
			local AwardExp = 45												--奖励系数
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExp * AwardExpAdjust)
		end

   		return 0
   	end
}


TaskList[8193] = --少数诀活动辅助后续A
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,--不可放弃

  		bShowPrompt = true,
  		bCanSeekOut = true,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,


	-- 成功时有效

	AwardPreview =
	{

	}
	,

   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
   		return 0
   	end
   	,

   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.iWaitTime = 0
		Method.iTimeLimit = 180 --3分钟没完成则任务失败
   		return Method
   	end
   	,

   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iRet = TASK_NO_FINISH

		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER,8193)

   		if ulCurTime - ulDeliverTime > 180 then
   		    iRet = TASK_FAIL_FINISH
		else
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

		if bSuccess then
			local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 8163)
   	   		if iRet ~=0  then --是否可以发放新任务





   		   	   return TASK_PREREQU_FAIL_FULL
   	   		end
   		end

   		return 0
   	end
   	,

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--如果接受任务时选的A，那么判断全局函数16是否小于全局函数17。
		--小于则发放任务“投票成功ID:8163”并播放感谢词“恭喜你，你属于少数派，选A的人数比选B的人数少（全局函数17-16的值）”，
		--大于发放“任务失败ID:8164”并播放感谢词“很可惜，你属于多数派，选A的人数比选B的人数多（全局函数16-17的值）”。
		--如果参数并不属于以上两个，则发放“任务失败8164”，不发放感谢词。
		local value16 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 16)
		local value17 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 17)
		local value20 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 20)--20号变量为1时，多数派胜利

   		if bSuccess then

			if value20 == 0 then --少数胜
				if value16 < value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8163)

				elseif value16 > value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)

				else
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)
				end

			else	--多数胜利
				if value16 < value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8163)

				elseif value16 > value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)

				else
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)
				end

			end
		else
			--失败的收走一个
			local iItemsid = 21180
			local iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false) --任务物品

			if iItemsnum > 0 then
				--如果存在，就收走任务物品
				TaskCApi.TakeAwayTaskItem(TASKINTERFACE_POINTER,iItemsid, 1)
			end

   		end

   		return 0
   	end
}


TaskList[8194] = --少数诀活动辅助后续B
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,--不可放弃

  		bShowPrompt = true,
  		bCanSeekOut = true,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效




	AwardPreview =
	{

	}
	,

   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
   		return 0
   	end
   	,

   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.iWaitTime = 0
		Method.iTimeLimit = 180 --3分钟没完成则任务失败

   		return Method
   	end
   	,

   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER,8194)

   		if ulCurTime - ulDeliverTime > 180 then
   		    iRet = TASK_FAIL_FINISH
		else
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

		if bSuccess then
			local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,8163)
   	   		if iRet ~=0  then --是否可以发放新任务





   		   	   return TASK_PREREQU_FAIL_FULL
   	   		end
   		end

   		return 0
   	end
   	,

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess, iParam)
		--如果接受任务时选的B，那么判断全局函数17是否小于全局函数16。





		--小于于发放任务“投票成功”并播放感谢词“恭喜你，你属于少数派，选B的人数比选A的人数少（全局函数16-17的值）”，
		--大于发放“任务失败”并播放感谢词“很可惜，你属于多数派，选B的人数比选A的人数多（全局函数17-16的值）”。






		--如果参数并不属于以上两个，则发放“任务失败8164”，不发放感谢词。





		local value16 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 16)
		local value17 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 17)
		local value20 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 20)--20号变量为1时，多数派胜利






   		if bSuccess then

			if value20 == 0 then --少数胜





				if value16 > value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8163)

				elseif value16 < value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)

				else
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)
				end

			else	--多数胜利
				if value16 < value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8163)

				elseif value16 > value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)

				else
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)
				end

			end

		else
			--失败的收走一个21180
			local iItemsid = 21180
			local iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false) --任务物品

			if iItemsnum > 0 then
				--如果存在，就收走任务物品
				TaskCApi.TakeAwayTaskItem(TASKINTERFACE_POINTER,iItemsid, 1)
			end
   		end

   		return 0
   	end
}

TaskList[8204] = --为任务ID8204:石工玫瑰002物品换经验

{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成
  		bCanRedoAfterFailure = true,--失败可重复完成
  		bCanGiveUp = true,--可放弃
  		bShowPrompt = true,--显示系统提示
  		bCanSeekOut = true,--允许被查找

  		bRecordFinishCount = true,--记录完成次数
  		iMaxFinishCount = 3,--最大完成次数为3
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,--任务类型：石工玫瑰
  		iTopic = TaskTopic.YiBan,--一般主题任务
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 75										--奖励系数
			local AwardMultiTab ={0.6 , 1 , 1.4 ,0,0,0,0,0}				--每天3次

			local CompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8204) --当日已经完成次数
			local AwardTimes = CompleteTimes + 1

			local PlayerLevel = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 1) 							--接受任务时玩家的等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel]

			local AwardExp = AwardExpAdjust * AwardMulti * AwardMultiTab[AwardTimes]	--给玩家发放经验

			return AwardExp--返回0时为？？？，其他为显示的值

		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)   --玩家等级
		--检查玩家等级是否>=35
		if iPlayerLev < 35 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

   		return 0

   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local OpenVacationNum = 3 --当前开放的可收取物品的副职业个数，可扩展

		--要收取的物品表格，副职业等级为索引

		--产物排列顺序为 炼金，烹饪，工艺，符文，
		local ChargeItems = {
			--1阶产品，只有炼金、烹饪

			[1] = {
				--1-10
				21432, --1级炼金
				21419, --1级烹饪
				21432, --1级炼金
				21419, --1级烹饪
				21432, --1级炼金
				21419, --1级烹饪
				21432, --1级炼金
				21419, --1级烹饪
				21432, --1级炼金
				21419, --1级烹饪
			},

			--2阶产品，只有炼金、烹饪

			[2] = {
				--1~5
				21433, --2级炼金
				21420, --2级烹饪
				21433, --2级炼金
				21420, --2级烹饪
				21433, --2级炼金

				--6~10
				21420, --2级烹饪
				21433, --2级炼金
				21420, --2级烹饪
				21433, --2级炼金
				21420, --2级烹饪
			},

			--3阶产品，只有炼金、烹饪、工艺、符文

			[3] = {
				21434, --3级炼金
				21421, --3级烹饪
				11672, --1级工艺
				21452, --1级符文
				21434, --3级炼金

				21421, --3级烹饪
				11672, --1级工艺
				21452, --1级符文
			},

			--4阶产品，只有炼金、烹饪、工艺、符文


			[4] = {
				--1~5
				21435, --4级炼金
				21422, --4级烹饪
				11673, --2级工艺
				21453, --2级符文
				21435, --4级炼金
				--6~10
				21422, --4级烹饪
				11673, --2级工艺
				21453, --2级符文
			},

			--5阶产品，只有炼金、烹饪、工艺、符文

			[5] = {
				--1~5
				21436, --5级炼金
				21423, --5级烹饪
				11674, --3级工艺
				21454, --3级符文
				21436, --5级炼金
				--6~10
				21423, --5级烹饪
				11674, --3级工艺
				21454, --3级符文
			},

			--6阶产品，只有炼金、烹饪、工艺、符文
			[6] = {
				--1~5
				21437, --6级炼金
				21424, --6级烹饪
				11675, --4级工艺
				21455, --4级符文
				21437, --6级炼金
				--6~10
				21424, --6级烹饪
				11675, --4级工艺
				21455, --4级符文
			},

			[7] = {
				--1~5
				28009, --7级炼金
				28013, --7级烹饪
				11676, --5级工艺
				21455, --5级符文
				28009, --7级炼金
				--6~10
				28013, --7级烹饪
				11676, --5级工艺
				21455, --5级符文
			},

			[8] = {
				--1~5
				28009, --7级炼金
				28013, --7级烹饪
				11676, --5级工艺
				21455, --5级符文
				28009, --7级炼金
				--6~10
				28013, --7级烹饪
				11676, --5级工艺
				21455, --5级符文
			},
		}


		local iRandomTotalType = 40 --系统预设的随机序列可能性总数，总是等于表TabRandomOrder的项数

		--系统预设的随机序列中元素n ，n/10 取整为随机半径（不大于3），n%OpenVacationNum为随机到的内容
		local TabRandomOrder = {
			[1]  = {11,21,31,},--表长度为每天可完成次数
			[2]  = {25,38,19,},
			[3]  = {34,29,12,},
			[4]  = {24,15,19,},
			[5]  = {31,24,15,},
			[6]  = {13,32,33,},
			[7]  = {19,25,27,},
			[8]  = {15,37,17,},
			[9]  = {25,22,21,},
			[10] = {19,36,18,},
			[11] = {15,31,12,},
			[12] = {25,21,15,},
			[13] = {31,15,11,},
			[14] = {21,11,34,},
			[15] = {19,33,31,},
			[16] = {13,32,25,},
			[17] = {24,31,21,},
			[18] = {22,11,38,},
			[19] = {37,29,18,},
			[20] = {14,19,32,},
			[21] = {24,15,31,},
			[22] = {26,21,32,},
			[23] = {18,11,39,},
			[24] = {22,19,25,},
			[25] = {34,32,12,},
			[26] = {15,34,15,},
			[27] = {28,31,22,},
			[28] = {12,38,32,},
			[29] = {11,36,32,},
			[30] = {36,15,22,},
			[31] = {27,14,13,},
			[32] = {29,12,35,},
			[33] = {16,19,36,},
			[34] = {24,14,39,},
			[35] = {19,37,13,},
			[36] = {28,36,12,},
			[37] = {33,11,15,},
			[38] = {36,31,12,},
			[39] = {37,25,12,},
			[40] = {18,21,39,},

			}

		--固定玩家每天随到的内容
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --取得玩家角色创建时间
		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		local iRandomType = ( timePackage.yday + RoleCreateTime ) % iRandomTotalType + 1 --玩家当天随到的任务种类,即TabRandomOrder{}的索引
		local iCompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8204) --8204任务当日已经完成次数

		local iItemOrder = TabRandomOrder[iRandomType][ iCompleteTimes+1 ] --所需物品的原始序列，用来确定所需要收取的物品具体是哪个个

		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)   --玩家等级
		local VacationHighLevel = math.floor(PlayerLevel / 10)

		local VacationLevel --收取的产品等级

		if VacationHighLevel > 2 then
			VacationLevel = VacationHighLevel - 3 + math.floor(iItemOrder/10)
		else
			VacationLevel = math.floor(iItemOrder/10) %	VacationHighLevel + 1 --如果玩家为10+，则收取1级物品；为20+，则收取可能为1级或者2级
		end

		local NeedItemId = 33 --为NeedItemId初始化一个值，防止取空
		NeedItemId = ChargeItems[VacationLevel][iItemOrder % OpenVacationNum+1]

		local  key1,key2 --物品id存储方法 key1=id/200,key2=id%200,id=key1+key2
		key1 = math.floor(NeedItemId / 200)
		key2 = NeedItemId % 200

		--设置随机数

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8204, 1, PlayerLevel)		--存储玩家等级
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8204, 2, key1)				--存储物品id/200
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8204, 3, key2)				--存储物品id%200

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 2)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 3)

		local NeedItemId = key1 * 200 + key2						--解析出收取物品id

		Method.CollectItem = { Item1={ID=NeedItemId, Num=1, Common=true},}

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 2)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 3)
		local ChargeItemId = key1 * 200 + key2						--解析出收取物品id

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, ChargeItemId, true) >= 1 then
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2,ucRandomNum3)
		--变量1号接受任务时玩家等级，2号3号为物品id（2号变量值*200+3号变量值）

		local AwardMulti = 75										--奖励系数
		local AwardMultiTab ={0.6 , 1 , 1.4 ,0,0,0,0,0}				--每天3次

		local CompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8204) --当日已经完成次数
		local AwardTimes = CompleteTimes

		local PlayerLevel = ucRandomNum1 							--接受任务时玩家的等级，发奖励用

		local ChargeItemId = ucRandomNum2 * 200 + ucRandomNum3  	--所收取的物品id

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel]

		if bSuccess then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, ChargeItemId, 1)    		--收取普通物品1个
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti * AwardMultiTab[AwardTimes])	--给玩家发放经验

   		end

   		return 0
   	end
}


TaskList[8547] = --1级_公会任务基础库随机

{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成
  		bCanRedoAfterFailure = true,--失败可重复完成
  		bCanGiveUp = true,--可放弃
  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃清空任务

		bBuildTask = true, --公会建设任务

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每轮最多完成4次

  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会

  		iTopic = TaskTopic.YiBan,--一般主题任务
  	}
   	,

	-- 成功时有效

	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547) + 1--环任务完成次数（包括本次）

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验

			local iExpAwardMutli = 1  --基础经验系数
			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust
			return iExpAward --返回0时为？？？，其他为显示的值

		end
		,

		-- 绑定钱

		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
			--绑定金
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547) + 1--环任务完成次数（包括本次）
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱
			local iMonAwardMutli = 1  --基础金钱系数
			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust
			return iMonAward--返回0时为？？？，其他为显示的值
		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 1 --公会贡献度
			factionaward.money = 0   --公会资金
			factionaward.credit = 1  --公会功勋
			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--检测身上是否有其他主任务





		local MainTaskTable = {8548, 8549, 8550, 8551}		--公会主任务列表





		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}								--建立一个对比参考库

		local TaskTypeNum = 4								--公会主任务类别





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
		--60以下任务为连号任务




			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556
				AssistTaskTable40[i] = i + 8566
			end
		else
		--60+直接建立表格
			--先兼容20-59的基础任务
			for i = 1,20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
 			end
			--新增库任务




			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)
		end

		--从要随机的任务库中删除已有任务和高级任务

		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then

					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for n = 1 , 10 do
								if AssistTaskTable20[n] == j then
									table.remove(AssistTaskTable20,n)
								end
							end
						end
					end

				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end

				elseif iPlayerLev <=80 then
					for j ,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then

							for i = 1, 22 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end

				end
			end
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}					--30+基础库杀怪任务





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end
		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 60 then
			local LowLevelBaseTable = {8567,8568,8570,8571}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576}	--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <=80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]

		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8547, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8547, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子




		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8547, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8547, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable = {
		--贡献度




				[1]=1,
				[2]=1,
				[3]=1,
				[4]=1,
			}

		local ExploitTable = {
		--功勋
				[1]=1,
				[2]=1,
				[3]=1,
				[4]=1,
			}

		local GuildMonTable = {
		--公会资金
				[1]=0,
				[2]=0,
				[3]=0,
				[4]=0,
			}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱





		local iExpAwardMutli = 1  --基础经验系数
		local iMonAwardMutli = 1  --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数
		local iZiYuanMutli1 = 1   --基础1号资源奖励系数





		local iPersonalActive = 2		--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)--环任务完成次数（包括本次）

		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable[FinishTime]) 					--发放工会功勋度




				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度




				TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable[FinishTime]) 		--发放贡献度
				--TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable[FinishTime]*iGuildMoneyMuti)		--发放工会资金
				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)

					--频道广播
					TaskCApi.Broadcast(TASKINTERFACE_POINTER, 8547, TaskBroadcastChannel.Kingdom)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务
					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end

				end
			end



		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)
   		end

		--TaskCApi.Broadcast(TASKINTERFACE_POINTER, 8547, TaskBroadcastChannel.Local)
		--TaskCApi.Broadcast(TASKINTERFACE_POINTER, 8547, TaskBroadcastChannel.Kingdom)

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}


TaskList[8548] = --1级_公会任务_公会城堡随机
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成
  		bCanRedoAfterFailure = true,--失败可重复完成
  		bCanGiveUp = true,--可放弃
  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃清空任务

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制

  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会
  		iTopic = TaskTopic.YiBan,--一般主题任务

  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--4以及以下级别
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8548) + 1--环任务完成次数（包括本次）

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验

			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值
		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8548) + 1--环任务完成次数（包括本次）

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱

			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值
		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度

				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
				}
			local ContributionTable40 = {
			--贡献度

					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ContributionTable60 = {
			--贡献度
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			--3号资源,4级以及以下等级基地

			local GuildZiYuan320Lel4 ={

					[1]=2,
					[2]=3,
					[3]=4,
					[4]=5,
				}
			local GuildZiYuan340Lel4 ={
					[1]=3,
					[2]=6,
					[3]=9,
					[4]=12,
				}
			local GuildZiYuan360Lel4 ={
					[1]=5,
					[2]=9,
					[3]=15,
					[4]=20,
				}
			--4号资源,4级以及以下等级基地




			local GuildZiYuan420Lel4 ={
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=5,
				}
			local GuildZiYuan440Lel4 ={
					[1]=3,
					[2]=6,
					[3]=9,
					[4]=12,
				}
			local GuildZiYuan460Lel4 ={
					[1]=5,
					[2]=9,
					[3]=15,
					[4]=20,
				}

			--1234号资源,5级公会的基地
			local GuildZiYuan20Lel5 ={

					[1]=1,
					[2]=1,
					[3]=2,
					[4]=3,
				}
			local GuildZiYuan40Lel5 ={
					[1]=3,
					[2]=3,
					[3]=4,
					[4]=5,
				}
			local GuildZiYuan60Lel5 ={
					[1]=3,
					[2]=5,
					[3]=7,
					[4]=9,
				}

			--12345号资源,6级公会的基地
			local GuildZiYuan20Lel6 ={

					[1]=1,
					[2]=1,
					[3]=2,
					[4]=2,
				}
			local GuildZiYuan40Lel6 ={
					[1]=2,
					[2]=3,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan60Lel6 ={
					[1]=3,
					[2]=4,
					[3]=5,
					[4]=7,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8548) + 1--环任务完成次数（包括本次）

			local iGuildlevel = TaskCApi.GetFactionLev(TASKINTERFACE_POINTER)	--玩家所在公会等级（基地等级+3）

			local iGuildMoneyMuti = 1
			local factionaward = {}

			--[[
			10.12.6修正bug
			5级公会城堡任务应发放belief值，而不是武装值。

			--]]

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度
				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度

				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				if iGuildlevel <=4 then --4级以及以下基地

					factionaward.economy = GuildZiYuan320Lel4[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan420Lel4[FinishTime]		--发放4#工会资源
				elseif iGuildlevel == 5 or iGuildlevel == 6 then--5/6级工会的基地
					factionaward.belief = GuildZiYuan20Lel5[FinishTime] 		--发放5#工会资源
					factionaward.magic = GuildZiYuan20Lel5[FinishTime]			--发放2#工会资源
					factionaward.economy = GuildZiYuan20Lel5[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan20Lel5[FinishTime]		--发放4#工会资源
				elseif iGuildlevel == 7 then--7级工会的基地
					--factionaward.melee 	 = GuildZiYuan20Lel6[FinishTime] 		--发放1#工会资源
					factionaward.magic	 = GuildZiYuan20Lel6[FinishTime]		--发放2#工会资源
					factionaward.economy = GuildZiYuan20Lel6[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan20Lel6[FinishTime]		--发放4#工会资源
					factionaward.belief  = GuildZiYuan20Lel6[FinishTime]		--发放5#工会资源
				end

			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度

				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度


				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				if iGuildlevel <= 4 then --4级以及以下基地

					factionaward.economy = GuildZiYuan340Lel4[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan440Lel4[FinishTime]		--发放4#工会资源
				elseif iGuildlevel == 5 or iGuildlevel == 6 then--5.6级工会的基地
					factionaward.magic = GuildZiYuan40Lel5[FinishTime]			--发放2#工会资源
					factionaward.economy = GuildZiYuan40Lel5[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan40Lel5[FinishTime]		--发放4#工会资源
					factionaward.belief = GuildZiYuan40Lel5[FinishTime] 		--发放5#工会资源
				elseif iGuildlevel == 7 then--7级工会的基地
					--factionaward.melee 	 = GuildZiYuan40Lel6[FinishTime] 		--发放1#工会资源
					factionaward.magic	 = GuildZiYuan40Lel6[FinishTime]		--发放2#工会资源
					factionaward.economy = GuildZiYuan40Lel6[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan40Lel6[FinishTime]		--发放4#工会资源
					factionaward.belief  = GuildZiYuan40Lel6[FinishTime]		--发放5#工会资源
				end

			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度

				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度

				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				if iGuildlevel <= 4 then--4级以及以下基地


					factionaward.economy = GuildZiYuan360Lel4[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan460Lel4[FinishTime]		--发放4#工会资源
				elseif iGuildlevel == 5 or iGuildlevel == 6 then--56级工会的基地
					factionaward.belief = GuildZiYuan60Lel5[FinishTime] 		--发放5#工会资源
					factionaward.magic = GuildZiYuan60Lel5[FinishTime]			--发放2#工会资源
					factionaward.economy = GuildZiYuan60Lel5[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan60Lel5[FinishTime]		--发放4#工会资源
				elseif iGuildlevel == 7 then--7级工会的基地
					--factionaward.melee 	 = GuildZiYuan60Lel6[FinishTime] 		--发放1#工会资源
					factionaward.magic	 = GuildZiYuan60Lel6[FinishTime]		--发放2#工会资源
					factionaward.economy = GuildZiYuan60Lel6[FinishTime] 		--发放3#工会资源
					factionaward.culture = GuildZiYuan60Lel6[FinishTime]		--发放4#工会资源
					factionaward.belief  = GuildZiYuan60Lel6[FinishTime]		--发放5#工会资源
				end

			end

			factionaward.vitality = 2 --公会活跃度

			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8548 --省事用的。。

		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8548 --省事用的。。

		--检测身上是否有其他主任务

		local MainTaskTable = {8547, 8549, 8550, 8551}		--公会主任务列表
		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 ={}

		local TaskTypeNum = 4								--公会主任务类别

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556
				AssistTaskTable40[i] = i + 8566
			end
		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除




							for i = 1 , 10 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end

			end
		end

		--追加城堡专用任务（不属于基础任务库）
		if iPlayerLev <60 then
			table.insert(AssistTaskTable20, 8577)
			table.insert(AssistTaskTable20, 8578)

			table.insert(AssistTaskTable40, 8585)
			table.insert(AssistTaskTable40, 8586)

		elseif iPlayerLev >= 60 then
			table.insert(AssistTaskTable60, 8577)
			table.insert(AssistTaskTable60, 8578)
			table.insert(AssistTaskTable60, 8585)
			table.insert(AssistTaskTable60, 8586)
			table.insert(AssistTaskTable60, 9624)
			table.insert(AssistTaskTable60, 9625)
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}					--30+基础库杀怪任务




			--城堡任务特色库8577和8578都是低级任务，所以不屏蔽

			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 60 then
			local LowLevelBaseTable = {8567,8568,8570,8571, 8585}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576, 8586}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+5] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子




		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 8548 --省事用的。。

   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 8548 --省事用的。。


		--4以及以下级别
		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ContributionTable40 = {
		--贡献度
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ContributionTable60 = {
		--贡献度
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local ExploitTable20 = {
		--功勋
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ExploitTable40 = {
		--功勋
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ExploitTable60 = {
		--功勋
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}


		local GuildMonTable20 = {
		--公会资金
				[1]=500,
				[2]=1000,
				[3]=1500,
				[4]=2000,
			}
		local GuildMonTable40 = {
		--公会资金
				[1]=1000,
				[2]=2000,
				[3]=3000,
				[4]=4000,
			}
		local GuildMonTable60 = {
		--公会资金
				[1]=2000,
				[2]=3000,
				[3]=5000,
				[4]=6000,
			}

		--3号资源,4级以及以下等级基地

		local GuildZiYuan320Lel4 ={

				[1]=2,
				[2]=3,
				[3]=4,
				[4]=5,
			}
		local GuildZiYuan340Lel4 ={
				[1]=3,
				[2]=6,
				[3]=9,
				[4]=12,
			}
		local GuildZiYuan360Lel4 ={
				[1]=5,
				[2]=9,
				[3]=15,
				[4]=20,
			}

		--4号资源,4级以及以下等级基地

		local GuildZiYuan420Lel4 ={
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=5,
			}
		local GuildZiYuan440Lel4 ={
				[1]=3,
				[2]=6,
				[3]=9,
				[4]=12,
			}
		local GuildZiYuan460Lel4 ={
				[1]=5,
				[2]=9,
				[3]=15,
				[4]=20,
			}

		--2345号资源,5级公会的基地
		local GuildZiYuan20Lel5 ={

				[1]=1,
				[2]=1,
				[3]=2,
				[4]=3,
			}
		local GuildZiYuan40Lel5 ={
				[1]=3,
				[2]=3,
				[3]=4,
				[4]=5,
			}
		local GuildZiYuan60Lel5 ={
				[1]=3,
				[2]=5,
				[3]=7,
				[4]=9,
			}

		--12345号资源,5级公会的基地
		local GuildZiYuan20Lel6 ={

				[1]=1,
				[2]=1,
				[3]=2,
				[4]=2,
			}
		local GuildZiYuan40Lel6 ={
				[1]=2,
				[2]=3,
				[3]=3,
				[4]=4,
			}
		local GuildZiYuan60Lel6 ={
				[1]=3,
				[2]=4,
				[3]=5,
				[4]=7,
			}

		local iGuildlevel = TaskCApi.GetFactionLev(TASKINTERFACE_POINTER)	--玩家所在公会等级

		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验

		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱


		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值


		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）

		--[[
			10.12.6修正bug
			5级公会城堡任务应发放belief值，而不是武装值。
		--]]

		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金
				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度

				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 					--发放工会功勋度
					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度
					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金

					if iGuildlevel <= 4 then--4级以及以下基地

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320Lel4[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420Lel4[FinishTime]) 		--发放4#工会资源

					elseif iGuildlevel == 5 or iGuildlevel == 6  then
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan20Lel5[FinishTime]) 		--发放2#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan20Lel5[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan20Lel5[FinishTime]) 		--发放4#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan20Lel5[FinishTime]) 		--发放5#工会资源

					elseif iGuildlevel ==7 then
						--TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 0 ,GuildZiYuan20Lel6[FinishTime]) 		--发放1#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan20Lel6[FinishTime]) 		--发放2#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan20Lel6[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan20Lel6[FinishTime]) 		--发放4#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan20Lel6[FinishTime]) 		--发放5#工会资源

					end

				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 					--发放工会功勋度

					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度

					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金

					if iGuildlevel <= 4 then--4级以及以下基地

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340Lel4[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440Lel4[FinishTime]) 		--发放3#工会资源
					elseif iGuildlevel == 5 or iGuildlevel == 6  then
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan40Lel5[FinishTime]) 		--发放2#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan40Lel5[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan40Lel5[FinishTime]) 		--发放4#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan40Lel5[FinishTime]) 		--发放5#工会资源

					elseif iGuildlevel ==7 then
						--TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 0 ,GuildZiYuan40Lel6[FinishTime]) 		--发放1#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan40Lel6[FinishTime]) 		--发放2#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan40Lel6[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan40Lel6[FinishTime]) 		--发放4#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan40Lel6[FinishTime]) 		--发放5#工会资源
					end

				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 					--发放工会功勋度

					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度

					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金

					if iGuildlevel <= 4 then--4级以及以下基地

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360Lel4[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460Lel4[FinishTime]) 		--发放3#工会资源
					elseif iGuildlevel == 5 or iGuildlevel == 6 then
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan60Lel5[FinishTime]) 		--发放2#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan60Lel5[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan60Lel5[FinishTime]) 		--发放4#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan60Lel5[FinishTime]) 		--发放5#工会资源

					elseif iGuildlevel ==7 then
						--TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 0 ,GuildZiYuan60Lel6[FinishTime]) 		--发放1#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan60Lel6[FinishTime]) 		--发放2#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan60Lel6[FinishTime]) 		--发放3#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan60Lel6[FinishTime]) 		--发放4#工会资源
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan60Lel6[FinishTime]) 		--发放5#工会资源
					end
				end


				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务
					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[8549] = --1级_公会任务_住房生活随机
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成
  		bCanRedoAfterFailure = true,--失败可重复完成

  		bCanGiveUp = true,--可放弃
  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃清空任务

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每轮4次，轮数靠牌子限制

  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会
  		iTopic = TaskTopic.YiBan,--一般主题任务
  	}
   	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8549 --省事用的。。存本任务id

		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--每天第一次做任务时检查是否有牌子id=22917
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,
	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--4以及以下级别
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8549) + 1--环任务完成次数（包括本次）

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验
			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值
		end
		,

		-- 绑定钱
		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8549) + 1--环任务完成次数（包括本次）
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱
			local iMonAwardMutli = 1  --基础金钱系数
			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值
		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}

			local ContributionTable40 = {
			--贡献度
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ContributionTable60 = {
			--贡献度
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3号资源
					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3号资源
					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3号资源
					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}

			local GuildZiYuan420 ={
			--4号资源
					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan440 ={
			--4号资源
					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan460 ={
			--4号资源
					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8549) + 1--环任务完成次数（包括本次）
			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度
				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度
				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				--4级以及以下基地
				factionaward.economy = GuildZiYuan320[FinishTime] 		--发放3#工会资源
				factionaward.culture = GuildZiYuan420[FinishTime]		--发放4#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度
				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度
				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				--4级以及以下基地
				factionaward.economy = GuildZiYuan360[FinishTime] 		--发放3#工会资源
				factionaward.culture = GuildZiYuan460[FinishTime]		--发放4#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度
				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度
				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				--4级以及以下基地

				factionaward.economy = GuildZiYuan360[FinishTime] 		--发放3#工会资源
				factionaward.culture = GuildZiYuan460[FinishTime]		--发放4#工会资源

			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,


   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8549 --省事用的。。

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8550, 8551}		--公会主任务列表（不包括本任务）

		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556
				AssistTaskTable40[i] = i + 8566
			end
		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库

				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加生活住房专用任务（不属于基础任务库）
		if iPlayerLev< 60 then
			table.insert(AssistTaskTable20, 8579)
			table.insert(AssistTaskTable20, 8580)

			table.insert(AssistTaskTable40, 8587)
			table.insert(AssistTaskTable40, 8588)

		elseif iPlayerLev <80 then
			table.insert(AssistTaskTable60, 8579)
			table.insert(AssistTaskTable60, 8580)

			table.insert(AssistTaskTable60, 8587)
			table.insert(AssistTaskTable60, 8588)

			table.insert(AssistTaskTable60, 9630)
			table.insert(AssistTaskTable60, 9631)
		end

				--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566,8579,8580}		--30+基础库杀怪任务,后两个是住房特色任务

			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+基础库杀怪任务




			--由于8587和8588都是低级杀怪，所以不屏蔽

			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end

		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]

		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子





		end
		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 8549 --省事用的。。






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, TaskCApi, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 8549 --省事用的。。





		--4以及以下级别
		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}

		local ContributionTable40 = {
		--贡献度




				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ContributionTable60 = {
		--贡献度




				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}


		local ExploitTable20 = {
		--功勋
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ExploitTable40 = {
		--功勋
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ExploitTable60 = {
		--功勋
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local GuildMonTable20 = {
		--公会资金
				[1]=500,
				[2]=1000,
				[3]=1500,
				[4]=2000,
			}
		local GuildMonTable40 = {
		--公会资金
				[1]=1000,
				[2]=2000,
				[3]=3000,
				[4]=4000,
			}
		local GuildMonTable60 = {
		--公会资金
				[1]=2000,
				[2]=3000,
				[3]=5000,
				[4]=6000,
			}

		local GuildZiYuan320 ={
		--3号资源




				[1]=2,
				[2]=4,
				[3]=6,
				[4]=8,
			}
		local GuildZiYuan340 ={
		--3号资源




				[1]=4,
				[2]=8,
				[3]=12,
				[4]=16,
			}
		local GuildZiYuan360 ={
		--3号资源




				[1]=8,
				[2]=12,
				[3]=18,
				[4]=28,
			}

		local GuildZiYuan420 ={
		--4号资源




				[1]=1,
				[2]=2,
				[3]=3,
				[4]=4,
			}
		local GuildZiYuan440 ={
		--4号资源




				[1]=2,
				[2]=4,
				[3]=6,
				[4]=8,
			}
		local GuildZiYuan460 ={
		--4号资源




				[1]=4,
				[2]=6,
				[3]=9,
				[4]=14,
			}

		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱






		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金

					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金

					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金

					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460[FinishTime]) 			--发放4#工会资源
				end


				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)


   		return 0
   	end
}

TaskList[8550] = --1级_公会任务_金库随机
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成





  		bCanRedoAfterFailure = true,--失败可重复完成





  		bCanGiveUp = true,--可放弃





  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃清空任务

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会





  		iTopic = TaskTopic.YiBan,--一般主题任务





  	}
   	,
	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)

			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8550) + 1--环任务完成次数（包括本次）





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验




			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8550) + 1--环任务完成次数（包括本次）




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱




			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3号资源




					[1]=3,
					[2]=6,
					[3]=9,
					[4]=12,
				}
			local GuildZiYuan340 ={
			--3号资源




					[1]=6,
					[2]=12,
					[3]=18,
					[4]=24,
				}
			local GuildZiYuan360 ={
			--3号资源




					[1]=12,
					[2]=18,
					[3]=27,
					[4]=42,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8550) + 1--环任务完成次数（包括本次）




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金
				factionaward.economy = GuildZiYuan320[FinishTime] 					--发放3#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金
				factionaward.economy = GuildZiYuan340[FinishTime] 					--发放3#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金
				factionaward.economy = GuildZiYuan360[FinishTime] 					--发放3#工会资源

			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8550 --省事用的。。存本任务id

		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8550 --存本任务id

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8549, 8551}		--公会主任务列表（不包括本任务）






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556
				AssistTaskTable40[i] = i + 8566
			end
		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加金库专用任务（不属于基础任务库）
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable20, 8581)
			table.insert(AssistTaskTable20, 8582)

			table.insert(AssistTaskTable40, 8589)
			table.insert(AssistTaskTable40, 8590)

		elseif iPlayerLev<= 80 then
			table.insert(AssistTaskTable60, 8581)
			table.insert(AssistTaskTable60, 8582)

			table.insert(AssistTaskTable60, 8589)
			table.insert(AssistTaskTable60, 8590)

			table.insert(AssistTaskTable60, 9626)
			table.insert(AssistTaskTable60, 9627)

		end

		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}					--30+基础库杀怪任务




			--8581,8582均为20-30杀怪金库任务，不屏蔽





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571, 8589}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576, 8590}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子





		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 8550 --省事用的。。






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end


		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 8550 --省事用的。。





		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ContributionTable40 = {
		--贡献度




				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ContributionTable60 = {
		--贡献度




				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local ExploitTable20 = {
		--功勋
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ExploitTable40 = {
		--功勋
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ExploitTable60 = {
		--功勋
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local GuildMonTable20 = {
		--公会资金
				[1]=500,
				[2]=1000,
				[3]=1500,
				[4]=2000,
			}
		local GuildMonTable40 = {
		--公会资金
				[1]=1000,
				[2]=2000,
				[3]=3000,
				[4]=4000,
			}
		local GuildMonTable60 = {
		--公会资金
				[1]=2000,
				[2]=3000,
				[3]=5000,
				[4]=6000,
			}

		local GuildZiYuan320 ={
		--3号资源




				[1]=3,
				[2]=6,
				[3]=9,
				[4]=12,
			}
		local GuildZiYuan340 ={
		--3号资源




				[1]=6,
				[2]=12,
				[3]=18,
				[4]=24,
			}
		local GuildZiYuan360 ={
		--3号资源




				[1]=12,
				[2]=18,
				[3]=27,
				[4]=42,
			}

		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱






		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--发放3#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--发放3#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--发放3#工会资源
				end

				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[8551] = --1级_公会任务_宴会随机
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成





  		bCanRedoAfterFailure = true,--失败可重复完成





  		bCanGiveUp = true,--可放弃





  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃非失败





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会





  		iTopic = TaskTopic.YiBan,--一般主题任务





  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--4以及以下级别
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8551) + 1--环任务完成次数（包括本次）





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验




			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8551) + 1--环任务完成次数（包括本次）




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱




			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan340 ={
			--3号资源




					[1]=4,
					[2]=8,
					[3]=1,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}

			local GuildZiYuan420 ={
			--4号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan460 ={
			--4号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8551) + 1--环任务完成次数（包括本次）




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.economy = GuildZiYuan320[FinishTime] 		--发放3#工会资源
				factionaward.culture = GuildZiYuan420[FinishTime]		--发放4#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.economy = GuildZiYuan340[FinishTime] 		--发放3#工会资源
				factionaward.culture = GuildZiYuan440[FinishTime]		--发放4#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.economy = GuildZiYuan360[FinishTime] 		--发放3#工会资源
				factionaward.culture = GuildZiYuan460[FinishTime]		--发放4#工会资源
			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8551 --省事用的。。存本任务id

		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8551 --存本任务id

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8549, 8550}		--公会主任务列表（不包括本任务）






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556
				AssistTaskTable40[i] = i + 8566
			end
		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加宴会专用任务（不属于基础任务库）
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable20, 8583)
			table.insert(AssistTaskTable20, 8584)

			table.insert(AssistTaskTable40, 8591)
			table.insert(AssistTaskTable40, 8592)
		elseif iPlayerLev <= 80 then
			table.insert(AssistTaskTable60, 8583)
			table.insert(AssistTaskTable60, 8584)

			table.insert(AssistTaskTable60, 8591)
			table.insert(AssistTaskTable60, 8592)

			table.insert(AssistTaskTable60, 9628)
			table.insert(AssistTaskTable60, 9629)
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566,8583,8584}		--30+基础库杀怪任务





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571, 8592}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576, 8591}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子





		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 8551 --省事用的。。






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 8551 --省事用的。。





		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ContributionTable40 = {
		--贡献度




				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ContributionTable60 = {
		--贡献度




				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local ExploitTable20 = {
		--功勋
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ExploitTable40 = {
		--功勋
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ExploitTable60 = {
		--功勋
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local GuildMonTable20 = {
		--公会资金
				[1]=500,
				[2]=1000,
				[3]=1500,
				[4]=2000,
			}
		local GuildMonTable40 = {
		--公会资金
				[1]=1000,
				[2]=2000,
				[3]=3000,
				[4]=4000,
			}
		local GuildMonTable60 = {
		--公会资金
				[1]=2000,
				[2]=3000,
				[3]=5000,
				[4]=6000,
			}

		local GuildZiYuan320 ={
		--3号资源




				[1]=1,
				[2]=2,
				[3]=3,
				[4]=4,
			}
		local GuildZiYuan340 ={
		--3号资源




				[1]=4,
				[2]=8,
				[3]=12,
				[4]=16,
			}
		local GuildZiYuan360 ={
		--3号资源




				[1]=8,
				[2]=12,
				[3]=18,
				[4]=28,
			}

		local GuildZiYuan420 ={
		--4号资源




				[1]=2,
				[2]=4,
				[3]=6,
				[4]=8,
			}
		local GuildZiYuan440 ={
		--4号资源




				[1]=2,
				[2]=4,
				[3]=6,
				[4]=8,
			}
		local GuildZiYuan460 ={
		--4号资源




				[1]=4,
				[2]=6,
				[3]=9,
				[4]=14,
			}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱






		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460[FinishTime]) 			--发放4#工会资源
				end

				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[9968] = --驯兽师喂食活动奖励发放任务


{
  	Property =
  	{
  		bCanRedo = true,			--成功可重复完成




  		bCanRedoAfterFailure = true,--失败可重复完成





		bHiddenTask = true, 		--隐藏任务

  		bCanGiveUp = true,			--可放弃





  		bShowPrompt = false,			--显示系统提示
  		bFinishWhenDelvier = true,--接受即完成





		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多完成1次





  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,	--任务类型：活动




  		iTopic = TaskTopic.YiBan,	--一般主题任务





  	}
   	,

	-- 成功时有效




	AwardPreview =
	{

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

   		iRet = TASK_SUCC_FINISH

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		local iSideOccupId = 35 --驯兽师id35
		local bHasSideOccup = TaskCApi. HasSideOccup (TASKINTERFACE_POINTER, iSideOccupId )	 --玩家是否学会驯兽师这个副职业

		if bSuccess then
			if bHasSideOccup then

				local iSideOccupLev = TaskCApi. GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) --获取玩家当前驯兽师等级





				local iSideOccupExpMultiTab = {
												[1] = 5367000 ,
												[2] = 25607000 ,
												[3] = 59828000 ,
												[4] = 106860000 ,
												[5] = 168490000 ,
												[6] = 168490000 ,
												[7] = 168490000 ,
												[8] = 168490000 ,
												[9] = 168490000 ,
												[10] = 168490000 ,
												} --每级驯兽师对应的宠物经验

				local iSideOccupExp = iSideOccupExpMultiTab[iSideOccupLev]


				TaskCApi.DeliverPetExperience(TASKINTERFACE_POINTER,iSideOccupExp) --发放宠物经验


			end
		end

   		return 0
   	end
}

TaskList[10368] = --2级_公会任务_花园
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成





  		bCanRedoAfterFailure = true,--失败可重复完成





  		bCanGiveUp = true,--可放弃





  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃非失败





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会





  		iTopic = TaskTopic.YiBan,--一般主题任务





  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--2级基地




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10368) + 1--环任务完成次数（包括本次）





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验




			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10368) + 1--环任务完成次数（包括本次）




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱




			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan240 ={
			--2号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan260 ={
			--2号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local GuildZiYuan420 ={
			--4号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan460 ={
			--4号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10368) + 1--环任务完成次数（包括本次）




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan220[FinishTime] 		--发放2#工会资源
				factionaward.culture = GuildZiYuan420[FinishTime]		--发放4#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan240[FinishTime] 		--发放2#工会资源
				factionaward.culture = GuildZiYuan440[FinishTime]		--发放4#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan260[FinishTime] 		--发放2#工会资源
				factionaward.culture = GuildZiYuan460[FinishTime]		--发放4#工会资源
			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10368 --省事用的。。存本任务id

		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10368 --存本任务id

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10369, 10370, 10371, 10444, 10445}		--公会主任务列表（不包括本任务）






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556

			end

			for i = 1, 20 do
				AssistTaskTable40[i] = i + 8556
			end

		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 22 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加花园专用任务（不属于基础任务库）
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable20, 9349)
			table.insert(AssistTaskTable20, 9362)

			table.insert(AssistTaskTable40, 9349)
			table.insert(AssistTaskTable40, 9362)
			table.insert(AssistTaskTable40, 9402)
			table.insert(AssistTaskTable40, 9409)

		elseif iPlayerLev <= 80 then
			table.insert(AssistTaskTable60, 9349)
			table.insert(AssistTaskTable60, 9362)
			table.insert(AssistTaskTable60, 9402)
			table.insert(AssistTaskTable60, 9409)
			table.insert(AssistTaskTable60, 9935)
			table.insert(AssistTaskTable60, 9945)
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}		--30+基础库杀怪任务





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子





		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10368 --省事用的。。






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10368 --省事用的。。





		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan240 ={
			--2号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan260 ={
			--2号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local GuildZiYuan420 ={
			--4号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan460 ={
			--4号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱






		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan220[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan240[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan260[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460[FinishTime]) 			--发放4#工会资源
				end

				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10369] = --2级_公会任务_炼金室

{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成





  		bCanRedoAfterFailure = true,--失败可重复完成





  		bCanGiveUp = true,--可放弃





  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃非失败





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会





  		iTopic = TaskTopic.YiBan,--一般主题任务





  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--2级基地




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10369) + 1--环任务完成次数（包括本次）





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验




			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10369) + 1--环任务完成次数（包括本次）




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱




			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan240 ={
			--2号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,

				}
			local GuildZiYuan260 ={
			--2号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}

			local GuildZiYuan320 ={
			--3号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan340 ={
			--3号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan360 ={
			--3号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10369) + 1--环任务完成次数（包括本次）




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan220[FinishTime] 		--发放2#工会资源
				factionaward.economy  = GuildZiYuan320[FinishTime]		--发放3#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan240[FinishTime] 		--发放2#工会资源
				factionaward.economy = GuildZiYuan340[FinishTime]		--发放3#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan260[FinishTime] 		--发放2#工会资源
				factionaward.economy  = GuildZiYuan360[FinishTime]		--发放3#工会资源
			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10369 --省事用的。。存本任务id

		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10369 --存本任务id

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10370, 10371, 10444, 10445}		--公会主任务列表（不包括本任务）






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556

			end

			for i = 1, 20 do
				AssistTaskTable40[i] = i + 8556
			end

		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 22 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加花园专用任务（不属于基础任务库）
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable20, 9435)
			table.insert(AssistTaskTable20, 9437)
			table.insert(AssistTaskTable20, 9439)

			table.insert(AssistTaskTable40, 9435)
			table.insert(AssistTaskTable40, 9437)
			table.insert(AssistTaskTable40, 9439)
			table.insert(AssistTaskTable40, 9440)
			table.insert(AssistTaskTable40, 9442)
			table.insert(AssistTaskTable40, 9444)

		elseif iPlayerLev <= 80 then
			table.insert(AssistTaskTable60, 9435)
			table.insert(AssistTaskTable60, 9437)
			table.insert(AssistTaskTable60, 9439)
			table.insert(AssistTaskTable60, 9440)
			table.insert(AssistTaskTable60, 9442)
			table.insert(AssistTaskTable60, 9444)
			table.insert(AssistTaskTable60, 9985)
			table.insert(AssistTaskTable60, 9987)
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}		--30+基础库杀怪任务





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子





		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10369 --省事用的。。






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10369 --省事用的。。





		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan240 ={
			--2号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,

				}
			local GuildZiYuan260 ={
			--2号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}

			local GuildZiYuan320 ={
			--3号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan340 ={
			--3号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan360 ={
			--3号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱






		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan220[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan240[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan260[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--发放4#工会资源
				end

				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10370] = --2级_公会任务_渔场
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成





  		bCanRedoAfterFailure = true,--失败可重复完成





  		bCanGiveUp = true,--可放弃





  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃非失败





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会





  		iTopic = TaskTopic.YiBan,--一般主题任务





  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--2级基地




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10370) + 1--环任务完成次数（包括本次）





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验




			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10370) + 1--环任务完成次数（包括本次）




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱




			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan240 ={
			--2号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan260 ={
			--2号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local GuildZiYuan320 ={
			--3号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10370) + 1--环任务完成次数（包括本次）




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan220[FinishTime] 		--发放2#工会资源
				factionaward.economy  = GuildZiYuan320[FinishTime]		--发放3#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan240[FinishTime] 		--发放2#工会资源
				factionaward.economy = GuildZiYuan340[FinishTime]		--发放3#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan260[FinishTime] 		--发放2#工会资源
				factionaward.economy  = GuildZiYuan360[FinishTime]		--发放3#工会资源
			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10370 --省事用的。。存本任务id

		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10370 --存本任务id

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10369, 10371, 10444, 10445}		--公会主任务列表（不包括本任务）






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556

			end

			for i = 1, 20 do
				AssistTaskTable40[i] = i + 8556
			end

		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 22 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加渔场专用任务（不属于基础任务库）
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable20, 9456)
			table.insert(AssistTaskTable20, 9458)

			table.insert(AssistTaskTable40, 9456)
			table.insert(AssistTaskTable40, 9458)
			table.insert(AssistTaskTable40, 9463)
			table.insert(AssistTaskTable40, 9466)

		elseif iPlayerLev <= 80 then
			table.insert(AssistTaskTable60, 9456)
			table.insert(AssistTaskTable60, 9458)
			table.insert(AssistTaskTable60, 9463)
			table.insert(AssistTaskTable60, 9466)
			table.insert(AssistTaskTable60, 9977)
			table.insert(AssistTaskTable60, 9979)
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}		--30+基础库杀怪任务





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子





		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10370 --省事用的。。






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10370 --省事用的。。





		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan240 ={
			--2号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan260 ={
			--2号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local GuildZiYuan320 ={
			--3号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱






		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan220[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan240[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan260[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--发放4#工会资源
				end

				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10371] = --2级_公会任务_酒吧
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成





  		bCanRedoAfterFailure = true,--失败可重复完成





  		bCanGiveUp = true,--可放弃





  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃非失败





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会





  		iTopic = TaskTopic.YiBan,--一般主题任务





  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--2级基地




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10371) + 1--环任务完成次数（包括本次）





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验




			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10371) + 1--环任务完成次数（包括本次）




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱




			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan420 ={
			--4号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan460 ={
			--4号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan560 ={
			--5号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10371) + 1--环任务完成次数（包括本次）




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.culture = GuildZiYuan420[FinishTime] 		--发放4#工会资源
				factionaward.belief   = GuildZiYuan520[FinishTime]		--发放5#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.culture = GuildZiYuan440[FinishTime] 		--发放4#工会资源
				factionaward.belief  = GuildZiYuan540[FinishTime]		--发放5#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.culture = GuildZiYuan460[FinishTime] 		--发放4#工会资源
				factionaward.belief   = GuildZiYuan560[FinishTime]		--发放5#工会资源
			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10371 --省事用的。。存本任务id

		--检查玩家等级>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10371 --存本任务id

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10369, 10370, 10444, 10445}		--公会主任务列表（不包括本任务）






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then
			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556

			end

			for i = 1, 20 do
				AssistTaskTable40[i] = i + 8556
			end

		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 22 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加酒吧专用任务（不属于基础任务库）
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable20, 9450)
			table.insert(AssistTaskTable20, 9446)

			table.insert(AssistTaskTable40, 9450)
			table.insert(AssistTaskTable40, 9446)
			table.insert(AssistTaskTable40, 9451)
			table.insert(AssistTaskTable40, 9455)

		elseif iPlayerLev <= 80 then
			table.insert(AssistTaskTable60, 9450)
			table.insert(AssistTaskTable60, 9446)
			table.insert(AssistTaskTable60, 9451)
			table.insert(AssistTaskTable60, 9455)
			table.insert(AssistTaskTable60, 9983)
			table.insert(AssistTaskTable60, 9984)
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}		--30+基础库杀怪任务





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子





		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10371 --省事用的。。






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10371 --省事用的。。





		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan420 ={
			--4号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan460 ={
			--4号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan560 ={
			--5号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱






		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan520[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan540[FinishTime]) 			--发放4#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan560[FinishTime]) 			--发放4#工会资源
				end

				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10444] = --2级_公会任务_地质协会
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成





  		bCanRedoAfterFailure = true,--失败可重复完成





  		bCanGiveUp = true,--可放弃





  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,

		bClearAsGiveup = true, --放弃非失败





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会





  		iTopic = TaskTopic.YiBan,--一般主题任务





  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--2级基地




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10444) + 1--环任务完成次数（包括本次）





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验




			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10444) + 1--环任务完成次数（包括本次）




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱




			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan560 ={
			--5号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10444) + 1--环任务完成次数（包括本次）




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.economy = GuildZiYuan320[FinishTime] 		--发放3#工会资源
				factionaward.belief   = GuildZiYuan520[FinishTime]		--发放5#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.economy = GuildZiYuan340[FinishTime] 		--发放3#工会资源
				factionaward.belief  = GuildZiYuan540[FinishTime]		--发放5#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.economy = GuildZiYuan360[FinishTime] 		--发放3#工会资源
				factionaward.belief   = GuildZiYuan560[FinishTime]		--发放5#工会资源
			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10444 --省事用的。。存本任务id

		--检查玩家等级>=40
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 40 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10444 --存本任务id

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10369, 10370, 10371, 10445}		--公会主任务列表（不包括本任务）






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 10								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then

			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556

			end

			for i = 1, 20 do
				AssistTaskTable40[i] = i + 8556
			end

		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 22 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加地质协会专用任务（不属于基础任务库）
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable40, 9418)
			table.insert(AssistTaskTable40, 9434)


		elseif iPlayerLev <= 80 then
			table.insert(AssistTaskTable60, 9418)
			table.insert(AssistTaskTable60, 9434)
			table.insert(AssistTaskTable60, 9954)
			table.insert(AssistTaskTable60, 9958)
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}		--30+基础库杀怪任务





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子





		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10444 --省事用的。。






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10444 --省事用的。。





		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan560 ={
			--5号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱






		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan520[FinishTime]) 			--发放5#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan540[FinishTime]) 			--发放5#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--发放3#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan560[FinishTime]) 			--发放5#工会资源
				end

				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10445] = --2级_公会任务_魔宠
{


  	Property =
  	{
  		bCanRedo = true,--成功可重复完成
  		bCanRedoAfterFailure = true,--失败可重复完成
  		bCanGiveUp = true,--可放弃
  		bShowPrompt = true,--显示系统提示
		bCanSeekOut = true,
		bClearAsGiveup = true, --放弃非失败
		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多完成4次，靠牌子限制

  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--任务类型：公会
  		iTopic = TaskTopic.YiBan,--一般主题任务
  	}
   	,

	-- 成功时有效




	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			--2级基地
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10445) + 1--环任务完成次数（包括本次）
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验
			local iExpAwardMutli = 1  --基础经验系数

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 绑定钱




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10445) + 1--环任务完成次数（包括本次）




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱




			local iMonAwardMutli = 1  --基础金钱系数

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--返回0时为？？？，其他为显示的值




		end
		,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan240 ={
			--2号资源

					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan260 ={
			--2号资源
					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5号资源

					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5号资源
					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan560 ={
			--5号资源
					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10445) + 1--环任务完成次数（包括本次）




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable20[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan220[FinishTime] 		--发放2#工会资源
				factionaward.belief   = GuildZiYuan520[FinishTime]		--发放5#工会资源
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable40[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan240[FinishTime] 		--发放2#工会资源
				factionaward.belief  = GuildZiYuan540[FinishTime]		--发放5#工会资源
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--发放工会功勋度




				factionaward.contribution = ContributionTable60[FinishTime] 		--发放贡献度




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--发放工会资金

				factionaward.magic = GuildZiYuan260[FinishTime] 		--发放2#工会资源
				factionaward.belief   = GuildZiYuan560[FinishTime]		--发放5#工会资源
			end

			factionaward.vitality = 2 --公会活跃度




			return factionaward
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10445 --省事用的。。存本任务id

		--检查玩家等级>=40
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 40 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查身上是否有任务格子
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		--每天第一次做任务时检查是否有牌子id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if FinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 23911, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10445 --存本任务id

		--检测身上是否有其他主任务





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10369, 10370, 10371, 10444}		--公会主任务列表（不包括本任务）






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 10								--公会主任务类别（不包括本任务）





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--玩家等级

		--初始化辅助任务库AssistTable20:8557-8566;初始化辅助任务库AssistTable40:8567-8576
		if iPlayerLev < 60 then

			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556

			end

			for i = 1, 20 do
				AssistTaskTable40[i] = i + 8556
			end

		elseif iPlayerLev < 81 then
			for i = 1, 20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
			end
			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)

		end

		--从要随机的任务库中删除已有任务





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--检查身上是否有重复任务id,20-39;40+
			--8557-8566,8567-8576基础库





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --如果有则从随机辅任务库中将此项删除





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--如果有则从随机辅任务库中将此项删除





							for i = 1 , 22 do
								if AssistTaskTable60[i] == v then
									table.remove(AssistTaskTable60,i)
								end
							end
						end
					end
				end
			end
		end

		--追加地质协会专用任务（不属于基础任务库）
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable40, 10446)
			table.insert(AssistTaskTable40, 10447)
			table.insert(AssistTaskTable40, 10448)
			table.insert(AssistTaskTable40, 10449)
			table.insert(AssistTaskTable40, 10450)
			table.insert(AssistTaskTable40, 10451)

		elseif iPlayerLev <= 80 then
			table.insert(AssistTaskTable60, 10446)
			table.insert(AssistTaskTable60, 10447)
			table.insert(AssistTaskTable60, 10448)
			table.insert(AssistTaskTable60, 10449)
			table.insert(AssistTaskTable60, 10450)
			table.insert(AssistTaskTable60, 10451)
			table.insert(AssistTaskTable60, 10452)
			table.insert(AssistTaskTable60, 10453)
		end


		--对特殊角色特殊处理




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30基础库杀怪任务




			local HighLevelBaseTable = {8562,8566}		--30+基础库杀怪任务





			--20-29的玩家不会随机到30+杀怪任务




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+玩家不会随机到20-29杀怪任务




			else
				for m =1 , #LowLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end
						if AssistTaskTable20[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable20,j)
						end
					end
				end
			end

		end

		--40-49的玩家不会随机到50+杀怪任务




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50基础库杀怪任务




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+基础库杀怪任务





			if iPlayerLev < 50 then
				for m = 1 , #HighLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+2] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+3] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == HighLevelBaseTable[m+4] then
							table.remove(AssistTaskTable40,j)
						end

					end
				end

			--50+玩家不会随机到40-49杀怪任务




			else
				for m = 1 , #LowLevelBaseTable do
					local Tablelength40 = #AssistTaskTable40
					for j=1, Tablelength40 do
						if AssistTaskTable40[j] == LowLevelBaseTable[m] then
							table.remove(AssistTaskTable40,j)
						end
						if AssistTaskTable40[j] == LowLevelBaseTable[m+1] then
							table.remove(AssistTaskTable40,j)
						end
					end
				end
			end

		end


		local iRandomR, key
		local DeliverTaskID
		math.randomseed(os.time())
		if iPlayerLev < 40 then
			iRandomR = #AssistTaskTable20
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--将要发放的辅助库任务id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--拆解任务id，存入随机数；key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--接受任务时候需要发放任务和收取物品（第一次时收取）





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --收走一个牌子
		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--发放辅助任务

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10445 --省事用的。。


   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--当玩家放弃辅助任务时，认为主任务失败
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10445 --省事用的。。





		local ExpTable = {
		--经验
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--绑定金




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--贡献度




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--贡献度




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--贡献度




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--功勋
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--功勋
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--功勋
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--公会资金
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--公会资金
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--公会资金
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan240 ={
			--2号资源




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan260 ={
			--2号资源




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5号资源




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5号资源




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan560 ={
			--5号资源




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--本等级修正经验
		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--本等级修正金钱
		local iExpAwardMutli = 1 --基础经验系数
		local iMonAwardMutli = 1 --基础金钱系数
		local iGuildMoneyMuti = 1 --工会资金系数

		local iPersonalActive = 2	--活跃度奖励数值

		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--环任务完成次数（包括本次）

		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--发放经验
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--发放帮定金

				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--发放工会活跃度

				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--发放工会功勋度

					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan220[FinishTime]) 			--发放2#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan520[FinishTime]) 			--发放5#工会资源
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan240[FinishTime]) 			--发放2#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan540[FinishTime]) 			--发放5#工会资源
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--发放工会功勋度




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--发放贡献度





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--发放工会资金
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan260[FinishTime]) 			--发放2#工会资源
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan560[FinishTime]) 			--发放5#工会资源
				end

				if FinishTime == 4 then --4环结束时清空任务完成次数
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--取9286完成次数判断是否改发放额外奖励,如果没完成过则发放任务




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--放弃清掉本轮循环次数记录
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--清除任务完成结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}


TaskList[11265] = --冬赐节，圣诞树的嫩枝
{
	--任务完成方式
	tabMethod =
	{
		[1]={0,32610,1,},--完成方式 0寻物 1杀怪，目标id，数量，
		[2]={0,32612,1,},
		[3]={0,32613,1,},
	}
	,

  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false,    --不可查找

		bClearAsGiveup = false, --放弃任务发失败奖励

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 150,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 120									--存放奖励系数
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值

		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local ItemId = 32499 --冬赐节庆典徽章
			items = {
						Item1 = {ID = ItemId, NUM = 2},--0时为？？？，其他显示物品和数量
					}
			return items
		end
		,
	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 20 then --等级需要高于20级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--前提任务11211冬天到了
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,11211,true) then
			return TASK_PREREQU_FAIL_LUA_TASK

		end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		local iRandNum = 3 --任务随机的完成方式种类
		--完成方式1：寻物。给玩家一粒种子（id=32550)，去精灵新手村（哀伤丛林）的某个点种下种子后，采一支嫩芽回来
		--完成方式2：寻物。给玩家一柄自残之刀（技能物品id=32555），刺伤自己，得到血液凝质（任务随机发生器），滴灌血族新手村的某个土壤，召矿采集。
		--完成方式3：寻物。使用笼子(技能物品id=32556)抓住一只小动物，将它送给人类新手村的xxx，换取一只嫩芽（任务物品）带回来。

		--修改的部分，固定玩家每天随到的内容，当天奇偶数*玩家创建角色的时间mod2
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --取得玩家角色创建时间

		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday
		local iRandomMethod =  ( timePackage.yday + RoleCreateTime )% iRandNum + 1 --玩家当天随到的任务种类


		--测试用内容
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iRandomMethod = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end


   		--发道具或奖励

		local tabDeliverItem = {
					[1]=32550, --世界树的种子
					[2]=32555, --鲜血之刺
					[3]=32556, --宠物捕捉笼
					}

		if not iRandomMethod then --防止iRandomMethod取空，强制赋值为方式1
			iRandomMethod = 1
		end

		if tabDeliverItem[iRandomMethod] then
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, tabDeliverItem[iRandomMethod] , 1, true)

		end


		--设置随机数
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 11265, 1, iRandomMethod)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 11265, 1)

		Method.CollectItem = { Item1 = {ID=TaskList[11265].tabMethod[iRandomMethod][2], Num=TaskList[11265].tabMethod[iRandomMethod][3], Common=true},} --世界树的嫩芽

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 11265, 1)

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[11265].tabMethod[iRandomMethod][2], true) >= TaskList[11265].tabMethod[iRandomMethod][3] then
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1)
		local AwardMulti = 120									--存放奖励系数
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

		local tabDeliverItem = {
					[1]=32550, --世界树的种子
					[2]=32555, --鲜血之刺
					[3]=32556, --宠物捕捉笼
					}

   		if bSuccess then
			local num = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[11265].tabMethod[ucRandomNum1][2], true)
			if not num then
				num = 1
			end

			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[11265].tabMethod[ucRandomNum1][2], num)

			--发放冬赐节庆典徽章2个
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 32499, 2, true)

			--给玩家发放经验
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

		else--失败清空任务
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, tabDeliverItem[ucRandomNum1], 1)

			local num = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[11265].tabMethod[ucRandomNum1][2], true)
			if not num then
				num = 0
			end

			if num > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[11265].tabMethod[ucRandomNum1][2], num)
			end

			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32551, true)
			if  num1 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32551, num1)    --清空任务
			end

			local num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32611, true)
			if  num2 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32611, num2)    --清空任务
			end

   		end

   		return 0
   	end
}

TaskList[11303] = --名人的神赐节许愿卡
{
	--任务完成方式
	tabMethod =
	{
		[1]={1,32652,1,},--1完成方式杀怪，杀怪id，数量
		[2]={1,32653,1,},
	}
	,

  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false, --不可查找

		bClearAsGiveup = false, --放弃任务发失败奖励

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 150,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 100									--存放奖励系数
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值

		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local ItemId = 32499 --冬赐节庆典徽章
			items = {
						Item1 = {ID = ItemId, NUM = 1},--0时为？？？，其他显示物品和数量
					}
			return items
		end
		,
	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 20 then --等级需要高于20级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--前提任务11211冬天到了
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,11211,true) then
			return TASK_PREREQU_FAIL_LUA_TASK

		end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		local iRandNum = 2 --任务随机的完成方式种类
		--完成方式1：杀怪。给玩家一个水晶能量引导器（技能物品id=32553），采矿得到能量水晶，净化巨人村里“石化藤蔓”（怪id=32652）
		--完成方式2：杀怪。玩家杀死地图的怪物掉落符能火焰（技能物品id=32554），在矮人新手村除掉一块冰(id=32653)后，释放被冷冻的树枝。

		--修改的部分，固定玩家每天随到的内容，当天奇偶数*玩家创建角色的时间mod2
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --取得玩家角色创建时间

		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday
		local iRandomMethod =  ( timePackage.yday + RoleCreateTime )% iRandNum + 1 --玩家当天随到的任务种类


		--测试用内容
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iRandomMethod = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end


   		--发道具或奖励
		local tabDeliverItem = {
					[1]=32553, --水晶能量引导装置
					[2]=0,
					}
		if tabDeliverItem[iRandomMethod] > 0 then
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, tabDeliverItem[iRandomMethod] , 1, true)
		end

		--设置随机数
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 11303, 1, iRandomMethod)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 11303, 1)

		Method.KillMonster = { Mons1={ID=TaskList[11303].tabMethod[iRandomMethod][2], Num=TaskList[11303].tabMethod[iRandomMethod][3]},}

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 11303, 1)

		if TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 11303, "Mons1")  >= 1 then
				iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 2 then --普通包裹栏需要1格
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1)
		local AwardMulti = 100									--存放奖励系数
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

		local tabDeliverItem = {
					[1]=32553, --水晶能量引导装置
					[2]=0,
					}


   		if bSuccess then

			local iRandomBook  , iRandomBookId

			iRandomBook = 1

			--发放书籍奖励
			math.randomseed(os.time())
			iRandomBook = math.random(1,32)

			iRandomBookId = 32749 + iRandomBook

			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iRandomBookId, 1, true)

			--发放冬赐节庆典徽章1个
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 32499, 1, true)

			--给玩家发放经验
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

   		end

		--清空任务，无论成功失败
		if ucRandomNum1 ==1 then
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32553, true)
			if  num1 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32553, num1)    --清空任务
			end

			local num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32558, true)
			if  num2 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32558, num2)    --清空任务
			end


		elseif ucRandomNum1 ==2 then

			--杀死火焰领主得到32554在放弃任务时候理应被清空
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32554, true)
			if  num1 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32554, num1)    --清空任务
			end

		end

   		return 0
   	end
}



TaskList[12004] = --工会基地2级活力井酒桶
{
  	Property =
  	{
  		bCanRedo = true,		--成功可重复完成
  		bCanRedoAfterFailure = true,--失败可重复完成
  		bCanGiveUp = true,		--可放弃
  		bShowPrompt = false,	--不显示系统提示
  		bFinishWhenDelvier = true,--接受即完成
		bHiddenTask = true, 		--隐藏任务

  		iType  = TaskType.SheJiaoJia,--任务类型：社交家
  		iTopic = TaskTopic.YiBan,--一般主题任务

  	}
   	,

	-- 成功时有效
	AwardPreview =
	{

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格
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

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --等待0s自动完成
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)

   		local iRet = TASK_NO_FINISH

		--10min失败
		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 12004)
   		if ulCurTime - ulDeliverTime > 600 then
   		    iRet = TASK_FAIL_FINISH
   		end

   		iRet = TASK_SUCC_FINISH



   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

		if bSuccess then

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格

			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end

		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local tabAwarditems = {
								[1] = 9056,--甜蜜梦境 9056
								[2] = 9057,--迷香梦境 9057
								[3] = 9058,--海澜梦境 9058
								[4] = 9059,--苍翠梦境 9059
								[5] = 9059,--紫晶梦境 9060（开放之前只发放苍翠梦境）
								}

			local ItemId --发放的奖励物品id

			local ilevel = math.floor( (iPlayerLevel+20) / 20)

			if ilevel == 1 then
				ItemId = tabAwarditems[ilevel]

			else
				math.randomseed(os.time())--随机发奖概率，为2发放本级别，为1发放次级
				iRate = math.random(1,2)

				ItemId = tabAwarditems[ilevel - 2 + iRate]
			end

			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 1, false)

   		end

   		return 0
   	end
}

TaskList[12641] = --灾域虚空－武器01
{
	--每种武器对应要收取的物品内容
	Tabweapon =
	{
		--[职业id]= {武器id，需求物品id}
		[1]= {36371,36339,},     --战士
		[2]= {36372,36339,},     --守护
		[3]= {36373,36339,},     --刺客
		[4]= {36374,36339,},     --火枪
		[5]= {36375,36339,},     --法师
		[6]= {36376,36339,},     --牧师
		[7]= {36377,36339,},     --血魔
		[8]= {36378,36339,},     --诗人

	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = false,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,

		iSuitableLevel = 80,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60			--存放奖励系数
			local PlayerLevel = 75 			--发奖励用，锁定等级75

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值


		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

	   	if iPlayerLev < 75 then --等级需要高于75级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--玩家身上必须有本职业对应残破的武器
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[12641].Tabweapon[iOccupation][1], true) < 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end


   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		Method.CollectItem = { Item1 = {ID=TaskList[12641].Tabweapon[iOccupation][2], Num=1, Common=true},} --武器需求物品：灾域之刃

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12641].Tabweapon[iOccupation][2], true) >= 1 then--武器需求物品：虚灵精华36232
				iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 60									--存放奖励系数
		local PlayerLevel = 75 			--，发奖励用
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

   		if bSuccess then

			--锁定经验等级上限为79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--收走物品
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12641].Tabweapon[iOccupation][2], 1)    --收取材料 1个

			--给玩家发放经验

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

   		end

   		return 0
   	end
}

TaskList[12666] = --灾域虚空－帽子01
{
	--每种职业帽子对应要收取的物品内容
	Tabweapon =
	{
		--[职业id]= {帽子id，需求物品id}
		[1]= {36387,36340,},     --战士
		[2]= {36388,36340,},     --守护
		[3]= {36389,36340,},     --刺客
		[4]= {36390,36340,},     --火枪
		[5]= {36391,36340,},     --法师
		[6]= {36392,36340,},     --牧师
		[7]= {36393,36340,},     --血魔
		[8]= {36394,36340,},     --诗人

	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = false,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--存放奖励系数
			local PlayerLevel = 75 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值


		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

	   	if iPlayerLev < 75 then --等级需要高于75级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--玩家身上必须有本职业对应残破的武器
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[12666].Tabweapon[iOccupation][1], true) < 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end


   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		Method.CollectItem = { Item1 = {ID=TaskList[12666].Tabweapon[iOccupation][2], Num=1, Common=true},} --武器需求物品：灾域之刃

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12666].Tabweapon[iOccupation][2], true) >= 1 then--武器需求物品：虚灵精华36232
				iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 60									--存放奖励系数
		local PlayerLevel = 75 			--取得玩家等级，发奖励用
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

   		if bSuccess then

			--锁定经验等级上限为79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--收走物品
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12666].Tabweapon[iOccupation][2], 1)    --收取材料 1个

			--给玩家发放经验

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

   		end

   		return 0
   	end
}

TaskList[12669] = --灾域虚空－护肩01
{
	--每种职业护肩对应要收取的物品内容
	Tabweapon =
	{
		--[职业id]= {护肩id，需求物品id}
		[1]= {36379,36341,},     --战士
		[2]= {36380,36341,},     --守护
		[3]= {36381,36341,},     --刺客
		[4]= {36382,36341,},     --火枪
		[5]= {36383,36341,},     --法师
		[6]= {36384,36341,},     --牧师
		[7]= {36385,36341,},     --血魔
		[8]= {36386,36341,},     --诗人
	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = false,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--存放奖励系数
			local PlayerLevel = 75 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值


		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

	   	if iPlayerLev < 75 then --等级需要高于75级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--玩家身上必须有本职业对应残破的武器
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[12669].Tabweapon[iOccupation][1], true) < 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end


   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		Method.CollectItem = { Item1 = {ID=TaskList[12669].Tabweapon[iOccupation][2], Num=1, Common=true},} --武器需求物品：灾域之刃

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12669].Tabweapon[iOccupation][2], true) >= 1 then--武器需求物品：虚灵精华36232
				iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 60									--存放奖励系数
		local PlayerLevel = 75 			--取得玩家等级，发奖励用
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

   		if bSuccess then
			--锁定经验等级上限为79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--收走物品
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12669].Tabweapon[iOccupation][2], 1)    --收取材料 1个

			--给玩家发放经验

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

   		end

   		return 0
   	end
}

TaskList[12650] = --灾域虚空－武器03灵魂清洗
{
	--每种职业武器对应要收取的物品内容
	Tabweapon =
	{
		--[职业id]= 残破武器id，奖励的武器id
		[1]= {36371,36435,},     --战士
		[2]= {36372,36436,},     --守护
		[3]= {36373,36437,},     --刺客
		[4]= {36374,36438,},     --火枪
		[5]= {36375,36439,},     --法师
		[6]= {36376,36440,},     --牧师
		[7]= {36377,36441,},     --血魔
		[8]= {36378,36442,},     --诗人
	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = true,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 80									--存放奖励系数
			local PlayerLevel = 75 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值
		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

			local ItemId = TaskList[12650].Tabweapon[iOccupation][2]

			items = {
						Item1 = {ID = ItemId, NUM = 1},--0时为？？？，其他显示物品和数量
					}
			return items
		end
		,


	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local iPremiseTaskID = 12647 --前提任务id

	   	if iPlayerLev < 75 then --等级需要高于75级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--检查是否已经完成前置任务12647
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,iPremiseTaskID,true) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--设置随机数以用于显示追踪
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12650, 1, iOccupation)		--存储玩家职业

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		Method.SubmitItem = true --提交物品的完成方式

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		--提交的物品id，提交的物品数量
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12650)
		if itemIDSubmitted and itemNumberSubmitted then
			if itemIDSubmitted == TaskList[12650].Tabweapon[iOccupation][1] and itemNumberSubmitted == 1 then--如果提交的是本职业的对应残破武器
					iRet = TASK_SUCC_FINISH
			elseif itemIDSubmitted ~= TaskList[12650].Tabweapon[iOccupation][1] then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12650, 28, 20000)

			elseif itemNumberSubmitted > 1 then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12650, 29, 20001)
			end
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)

		local TaskID1 = 12641
		local TaskID2 = 12647

		local AwardMulti = 80									--存放奖励系数
		local PlayerLevel = 75 			--取得玩家等级，发奖励用
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

   		if bSuccess then

			--锁定经验等级上限为79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--收走物品
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12650].Tabweapon[iOccupation][1], 1)    --收取材料 1个

			--给玩家发放经验

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

			--发放武器
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[12650].Tabweapon[iOccupation][2], 1,true)

			--清空前置任务记录，开始新的循环
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID1)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID2)

   		end

   		return 0
   	end
}

TaskList[12668] = --灾域虚空－帽子03
{
	--每种职业武器对应要收取的物品内容
	Tabweapon =
	{
		--[职业id]= 残破帽子id，奖励的帽子id
		[1]= {36387,36451,},     --战士
		[2]= {36388,36452,},     --守护
		[3]= {36389,36453,},     --刺客
		[4]= {36390,36454,},     --火枪
		[5]= {36391,36455,},     --法师
		[6]= {36392,36456,},     --牧师
		[7]= {36393,36457,},     --血魔
		[8]= {36394,36458,},     --诗人

	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = true,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--存放奖励系数
			local PlayerLevel = 75 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值
		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

			local ItemId = TaskList[12668].Tabweapon[iOccupation][2]

			items = {
						Item1 = {ID = ItemId, NUM = 1},--0时为？？？，其他显示物品和数量
					}
			return items
		end
		,


	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local iPremiseTaskID = 12667 --前提任务id

	   	if iPlayerLev < 75 then --等级需要高于75级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--检查是否已经完成前置任务12667
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,iPremiseTaskID,true) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--设置随机数以用于显示追踪
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12668, 1, iOccupation)		--存储玩家职业


		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		Method.SubmitItem = true --提交物品的完成方式

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		--提交的物品id，提交的物品数量
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12668)
		if itemIDSubmitted and itemNumberSubmitted then
			if itemIDSubmitted == TaskList[12668].Tabweapon[iOccupation][1] and itemNumberSubmitted == 1 then--如果提交的是本职业的对应残破武器
					iRet = TASK_SUCC_FINISH
			elseif itemIDSubmitted ~= TaskList[12668].Tabweapon[iOccupation][1] then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12668, 28, 20000)

			elseif itemNumberSubmitted > 1 then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12668, 29, 20001)
			end
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local TaskID1 = 12666
		local TaskID2 = 12667

		local AwardMulti = 60									--存放奖励系数
		local PlayerLevel = 75 			--取得玩家等级，发奖励用
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

   		if bSuccess then

			--锁定经验等级上限为79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--收走物品
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12668].Tabweapon[iOccupation][1], 1)    --收取材料 1个

			--给玩家发放经验

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

			--发放帽子
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[12668].Tabweapon[iOccupation][2], 1,true)

			--清空前置任务记录，开始新的循环
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID1)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID2)

   		end

   		return 0
   	end
}

TaskList[12671] = --灾域虚空－护肩03
{
	--每种职业护肩对应要收取的物品内容
	Tabweapon =
	{
		--[职业id]= 残破护肩id，奖励的护肩id
		[1]= {36379,36443,},     --战士
		[2]= {36380,36444,},     --守护
		[3]= {36381,36445,},     --刺客
		[4]= {36382,36446,},     --火枪
		[5]= {36383,36447,},     --法师
		[6]= {36384,36448,},     --牧师
		[7]= {36385,36449,},     --血魔
		[8]= {36386,36450,},     --诗人

	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = true,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--存放奖励系数
			local PlayerLevel = 75 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值
		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

			local ItemId = TaskList[12671].Tabweapon[iOccupation][2]

			items = {
						Item1 = {ID = ItemId, NUM = 1},--0时为？？？，其他显示物品和数量
					}
			return items
		end
		,


	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local iPremiseTaskID = 12670 --前提任务id

	   	if iPlayerLev < 75 then --等级需要高于75级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--检查是否已经完成前置任务12670
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,iPremiseTaskID,true) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--设置随机数以用于显示追踪
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12671, 1, iOccupation)		--存储玩家职业

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		Method.SubmitItem = true --提交物品的完成方式

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		--提交的物品id，提交的物品数量
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12671)
		if itemIDSubmitted and itemNumberSubmitted then
			if itemIDSubmitted == TaskList[12671].Tabweapon[iOccupation][1] and itemNumberSubmitted == 1 then--如果提交的是本职业的对应残破武器
					iRet = TASK_SUCC_FINISH
			elseif itemIDSubmitted ~= TaskList[12671].Tabweapon[iOccupation][1] then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12671, 28, 20000)

			elseif itemNumberSubmitted > 1 then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12671, 29, 20001)
			end
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local TaskID1 = 12669
		local TaskID2 = 12670

		local AwardMulti = 60									--存放奖励系数
		local PlayerLevel = 75 			--取得玩家等级，发奖励用
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--获取玩家职业

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

   		if bSuccess then
			--收走物品
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12671].Tabweapon[iOccupation][1], 1)    --收取材料 1个

			--锁定经验等级上限为79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--给玩家发放经验
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

			--发放护肩
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[12671].Tabweapon[iOccupation][2], 1,true)

			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID1)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID2)

   		end

   		return 0
   	end
}

TaskList[12760] = --武器师日常
{
	--任务完成方式一共有4大类，分别对应索引1，2，3，4
	Tabtaskmethod =
	{
		--1类为收取武器生产过程中的产品.索引项为副职业等级
		[1] = {
			--1级武器师
			[1] = {
			--品质2=蓝色，1=绿色；物品id
					{2 , 28315,},
					{2 , 28316,},
					{2 , 28317,},
					{2 , 28318,},
					{2 , 28343,},
					{2 , 28344,},
					{2 , 28345,},
					{2 , 28346,},
					{1 , 28886,},
					{1 , 28887,},
					{1 , 28888,},
					{1 , 28889,},
					{1 , 28914,},
					{1 , 28915,},
					{1 , 28916,},
					{1 , 28917,},
				},

			--2级武器师
			[2] = {
					{2 , 28319,},
					{2 , 28320,},
					{2 , 28321,},
					{2 , 28322,},
					{2 , 28347,},
					{2 , 28348,},
					{2 , 28349,},
					{2 , 28350,},
					{1 , 28890,},
					{1 , 28891,},
					{1 , 28892,},
					{1 , 28893,},
					{1 , 28918,},
					{1 , 28919,},
					{1 , 28920,},
					{1 , 28921,},
				},

			--3级武器师
			[3] = {
					{2 , 28323,},
					{2 , 28324,},
					{2 , 28325,},
					{2 , 28326,},
					{2 , 28351,},
					{2 , 28352,},
					{2 , 28353,},
					{2 , 28354,},
					{1 , 28894,},
					{1 , 28895,},
					{1 , 28896,},
					{1 , 28897,},
					{1 , 28922,},
					{1 , 28923,},
					{1 , 28924,},
					{1 , 28925,},
				},

			--4级武器师
			[4] = {
					{2 , 28327,},
					{2 , 28328,},
					{2 , 28329,},
					{2 , 28330,},
					{2 , 28355,},
					{2 , 28356,},
					{2 , 28357,},
					{2 , 28358,},
					{1 , 28898,},
					{1 , 28899,},
					{1 , 28900,},
					{1 , 28901,},
					{1 , 28926,},
					{1 , 28927,},
					{1 , 28928,},
					{1 , 28929,},
				},

			--5级武器师
			[5] = {
					{2 , 28331,},
					{2 , 28332,},
					{2 , 28333,},
					{2 , 28334,},
					{2 , 28359,},
					{2 , 28360,},
					{2 , 28361,},
					{2 , 28362,},
					{1 , 28902,},
					{1 , 28903,},
					{1 , 28904,},
					{1 , 28905,},
					{1 , 28930,},
					{1 , 28931,},
					{1 , 28932,},
					{1 , 28933,},
				},

			--6级武器师
			[6] = {
					{2 , 28335,},
					{2 , 28336,},
					{2 , 28337,},
					{2 , 28338,},
					{2 , 28363,},
					{2 , 28364,},
					{2 , 28365,},
					{2 , 28366,},
					{1 , 28906,},
					{1 , 28907,},
					{1 , 28908,},
					{1 , 28909,},
					{1 , 28934,},
					{1 , 28935,},
					{1 , 28936,},
					{1 , 28937,},
				},

			--7级武器师(未开放，80级装备生产）
			[7] = {
					{1, 28925,},
				},

			},

		--2类为杀当前等级怪物，索引项为等级分段
		[2] = {
			--怪物id，任务物品36693=魔化钢锭
			[40] = {50, 36693} , 	--狮鹫,魔化钢锭
			[45] = {44, 36693} , 	--幽魂纳迦,魔化钢锭
			[50] = {42, 36693} , 	--小魔女,魔化钢锭
			[55] = {53, 36693} , 	--多头蛇蜥,魔化钢锭
			[60] = {10464, 36693} , --食人雾,魔化钢锭
			[65] = {10463, 36693} , --丛林黑豹,魔化钢锭
			[70] = {10449, 36693} , --枯木杀手,魔化钢锭
			[75] = {10444, 36693} , --咬趾虫,魔化钢锭
			[80] = {10444, 36693} , --咬趾虫,魔化钢锭

			},

		--3类完成特定任务后完成，表内容为对应的任务id
		[3] = {
				[1] = {12797, 12810,},
				[2] = {12798, 12812,},
				},

		--4类为需要物品,根据副职业等级收取的物品不同
		[4] = {
				--炼金
				[1] = {
						[1] = 9704,--9704	次级佐餐药剂，40
						[2] = 9719,--9719	中效佐餐药剂，50
						[3] = 9729,--9729	佐餐药剂，	  60
						[4] = 30987,--30987	强效佐餐药剂，70
						[5] = 30987,
						[6] = 30987,
						[7] = 30987,
						[8] = 30987,
					},
				--烹饪
				[2] = {
						[1] = 12255,--12255	夜旗鱼汤，40
						[2] = 11688,--11688	银莲酒，  50
						[3] = 12264,--12264	龙舌兰酒，60
						[4] = 34165,--34165	晨露酒，  70
						[5] = 34165,
						[6] = 34165,
						[7] = 34165,
						[8] = 34165,
					}
			},
	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = true,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,
		iMaxFinishCount = 1,--最大完成次数为1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 副职业经验
		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			local tabSideOccupExp = {7,15,26,76,91,182,200,200}											--存放副职业经验奖励

			local iSideOccupId = 9 																		--武器师副职业id
			local iSideOccuplev = TaskCApi.GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) 		--获取玩家武器师等级

			soe = {
						SOE1 = {ID = iSideOccupId, EXP = tabSideOccupExp[iSideOccuplev]},--id为副职业id，exp为数值，exp为0显示？？？
				  }
			return soe
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iSideOccupIdhighlevel = 6 --当前满级武器师为6级

		local iSideOccupId = 9 --武器师副职业id

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 40 then --等级需要高于40级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--检查是否学会武器师
		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, iSideOccupId) then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

		--当前满级武器师为iSideOccupIdhighlevel级，所以iSideOccupIdhighlevel级以及iSideOccupIdhighlevel级以上将不会接到此任务
		if TaskCApi. GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) >= iSideOccupIdhighlevel then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iflagtaskid = 12761		--武器师flag计数任务id
		local itaskmethodid = 1 		--随机到的任务类型，默认为1，避免空值
		local isubtaskmethodid = 1		--针对cd类任务库的子任务类型，默认为1

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--玩家等级

		--取得玩家角色创建时间
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)

		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--取flag任务完成次数，如果7<=x<=8则随机D类任务库
		local iflagtasktimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iflagtaskid) + 1
		if iflagtasktimes ==7 then
			itaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 3
		elseif iflagtasktimes >= 8 then
			itaskmethodid = 4
		else--flag计数为1-6时，仅在abc类内随机，通过时间和角色id加和取余数固定玩家当天的随机内容
			itaskmethodid = ( RoleCreateTime + dayInYear) % 3 + 1
		end

		--测试用内容,4493控制itaskmethodid
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		if itaskmethodid == 3 then --C类任务有2种类型
			isubtaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 1

			--测试用内容
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end

			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][1])--发放分支任务

		elseif itaskmethodid == 4 then --D类任务有2种类型
			isubtaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 1

			--测试用内容
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end
		end

		--测试用内容,4493和4495控制两个id
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)

			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end
		end

		--设置随机数以用于存储随机到的当前任务内容
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 1, itaskmethodid)		--任务类型（ABCD大类）
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 2, isubtaskmethodid)		--子任务类型（针对CD类任务库）
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 3, 100)					--给交纳物品用的随机数，防止取空，预存值100
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 4, iPlayerLev)			--存储玩家等级,给客户端显示追踪用

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local itaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 1)		--取出任务类型（ABCD大类）
		local isubtaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 2)	--取出子任务类型（针对CD类任务库）
		local iPlayerLev = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 4)			--取出玩家接受任务时的人物等级

		local iSideOccupId = 9 																		--武器师副职业id
		local iSideOccuplev = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,iSideOccupId) 		--获取玩家武器师等级

		if itaskmethodid == 1 then
			Method.SubmitItem = true--提交物品的完成方式

		elseif itaskmethodid == 2 then
			local iPlayerLev2 = math.floor(iPlayerLev /5)*5
			--杀怪

			Method.KillMonster = {
						Mons1={ID=TaskList[12760].Tabtaskmethod[itaskmethodid][iPlayerLev2][1], Num=0, DropItemID =TaskList[12760].Tabtaskmethod[itaskmethodid][iPlayerLev2][2], DropItemProbability = 1},
						}
			Method.CollectItem = {
						Item1={ID=TaskList[12760].Tabtaskmethod[itaskmethodid][iPlayerLev2][2], Num=1, Common=false},
						}

		elseif itaskmethodid == 3 then
			--cd库类任务都是通过完成特定任务的方式来实现
			local iTaskid = TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][2]
			Method.CompleteTask = {TaskID = iTaskid , Num = 1}

		else
			local iItemID = TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][math.floor(iPlayerLev/10)-3]
			Method.CollectItem = {Item1={ID=iItemID, Num=5, Common=true}, }
		end

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local itaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 1)		--取出任务类型（ABCD大类）
		local isubtaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 2)	--取出子任务类型（针对CD类任务库）
		local iPlayerLev = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 4)			--取出玩家接受任务时的人物等级						--玩家等级

		local iSideOccupId = 9 																		--武器师副职业id
		local iSideOccuplev = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,iSideOccupId) 		--获取玩家武器师等级

		if itaskmethodid == 1 then
		--提交物品的方式来实现
			--提交的物品id，提交的物品数量
			local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12760)

			if itemIDSubmitted and itemNumberSubmitted then

				for i,j in pairs(TaskList[12760].Tabtaskmethod[1][iSideOccuplev]) do
					if itemIDSubmitted == j[2] and  itemNumberSubmitted == 1 then
					--设置随机数以用于存储玩家交纳的物品索引
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 3, i)

					iRet = TASK_SUCC_FINISH

					return iRet

					elseif itemIDSubmitted == j[2] and itemNumberSubmitted > 1 then
					--数量不对
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12760, 29, 20001)
					end

					if i == 16 then --物品不对
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12760, 28, 20000)
					end
				end
			end

		elseif itaskmethodid == 2 then

		--杀怪获得任务物品
			local iPlayerLev2 = math.floor(iPlayerLev /5)*5
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12760].Tabtaskmethod[itaskmethodid][iPlayerLev2][2],  false)  >= 1 then
   		           iRet = TASK_SUCC_FINISH
   		    end


		elseif itaskmethodid == 3 then
		--C任务库通过完成任务的方式来实现
			local iTaskid = TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][2]
			local TaskCompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskid)

			if TaskCompleteTimes >= 1 then
				iRet = TASK_SUCC_FINISH
			end

		else
		--D任务库寻物
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][math.floor(iPlayerLev/10)-3], true)>= 5 then
   		           iRet = TASK_SUCC_FINISH
   		    end
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)

		local AwardMulti = 30																		--存放角色经验奖励系数
		local tabSideOccupExp = {7,15,26,76,91,182,200,200}											--存放副职业经验奖励

		local PlayerLevel = ucRandomNum4												 			--取得玩家接收任务时的等级，发奖励用
		local iSideOccupId = 9 																		--武器师副职业id
		local iSideOccuplev = TaskCApi.GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) 		--获取玩家武器师等级

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 											--玩家等级的修正经验

   		if bSuccess then

			if ucRandomNum1 == 1 then
				--[[
				--由于功能限制，此处物品不再收取
				local iItemsid = TaskList[12760].Tabtaskmethod[1][iSideOccuplev][ucRandomNum3][2]
				--收走物品
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemsid, 1)    					--收取武器 1个

				if TaskList[12760].Tabtaskmethod[1][iSideOccuplev][ucRandomNum3][1] == 2 then			--蓝色品质物品额外奖励小额人物经验
				--给玩家发放经验
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)
				end
				]]--

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12761)--发放flag任务以计数

			elseif ucRandomNum1 == 2 then
				local iPlayerLev2 = math.floor(PlayerLevel /5)*5
				local iItemsid = TaskList[12760].Tabtaskmethod[2][iPlayerLev2][2]
				local iItemsnum = 1

				if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false) > 1 then
					iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false)
				end

				--收走任务物品
				TaskCApi.TakeAwayTaskItem(TASKINTERFACE_POINTER,iItemsid, iItemsnum)

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12761)--发放flag任务以计数

			elseif ucRandomNum1 == 3 then

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12761)--发放flag任务以计数

				--清空辅助任务计数
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12797)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12798)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12810)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12812)


			elseif ucRandomNum1 == 4 then
				iItemsid = TaskList[12760].Tabtaskmethod[ucRandomNum1][ucRandomNum2][math.floor(PlayerLevel/10)-3]
				--收走任务物品
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemsid, 5)

				--D类任务完成，清除flag任务完成次数
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12761)
			end

			TaskCApi.DeliverSideOccupExp (TASKINTERFACE_POINTER, iSideOccupId, tabSideOccupExp[iSideOccuplev] )--发放副职业经验

		else
			--失败的话需要中止C库的引导任务
			if ucRandomNum1 == 3 then
				local iTaskID = TaskList[12760].Tabtaskmethod[ucRandomNum1][ucRandomNum2][1]
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iTaskID) then
				--如果存在，则中止
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskID, false)
				end

				local iTaskID2 = TaskList[12760].Tabtaskmethod[ucRandomNum1][ucRandomNum2][2]
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iTaskID2) then
				--如果存在，则中止
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskID2, false)
				end

			end

   		end

		--失败或者放弃需要收走B类库中的任务物品
		if ucRandomNum1 == 2 then
			local iPlayerLev2 = math.floor(PlayerLevel /5)*5

			local iItemsid = TaskList[12760].Tabtaskmethod[2][iPlayerLev2][2]
			local iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false)

			if iItemsnum > 0 then
				--如果存在，就收走任务物品
				TaskCApi.TakeAwayTaskItem(TASKINTERFACE_POINTER,iItemsid, iItemsnum)
			end

		--无论失败成功或者放弃清空C类任务的任务完成计数
		elseif ucRandomNum1 == 3 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12797)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12798)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12810)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12812)
		end

   		return 0
   	end
}


TaskList[12763] = --防具师日常
{
	--任务完成方式一共有4大类，分别对应索引1，2，3，4
	Tabtaskmethod =
	{
		--1类为收取武器生产过程中的产品.索引项为副职业等级
		[1] = {
			--1级防具师
			[1] = {
			--品质2=蓝色，1=绿色；物品id

					{2 , 28399,},
					{2 , 28455,},
					{2 , 28511,},
					{2 , 28567,},
					{2 , 28623,},
					{2 , 28679,},
					{2 , 28735,},
					{2 , 28400,},
					{2 , 28456,},
					{2 , 28512,},
					{2 , 28568,},
					{2 , 28624,},
					{2 , 28680,},
					{2 , 28736,},
					{2 , 28402,},
					{2 , 28458,},
					{2 , 28514,},
					{2 , 28570,},
					{2 , 28626,},
					{2 , 28682,},
					{2 , 28738,},
					{1 , 28970,},
					{1 , 29026,},
					{1 , 29082,},
					{1 , 29138,},
					{1 , 29194,},
					{1 , 29250,},
					{1 , 29306,},
					{1 , 28971,},
					{1 , 29027,},
					{1 , 29083,},
					{1 , 29139,},
					{1 , 29195,},
					{1 , 29251,},
					{1 , 29307,},
					{1 , 28973,},
					{1 , 29029,},
					{1 , 29085,},
					{1 , 29141,},
					{1 , 29197,},
					{1 , 29253,},
					{1 , 29309,},
					{2 , 28373,},
					{2 , 28429,},
					{2 , 28485,},
					{2 , 28541,},
					{2 , 28597,},
					{2 , 28653,},
					{2 , 28709,},
					{2 , 28374,},
					{2 , 28430,},
					{2 , 28486,},
					{2 , 28542,},
					{2 , 28598,},
					{2 , 28654,},
					{2 , 28710,},
					{2 , 28401,},
					{2 , 28457,},
					{2 , 28513,},
					{2 , 28569,},
					{2 , 28625,},
					{2 , 28681,},
					{2 , 28737,},
					{1 , 28944,},
					{1 , 29000,},
					{1 , 29056,},
					{1 , 29112,},
					{1 , 29168,},
					{1 , 29224,},
					{1 , 29280,},
					{1 , 28945,},
					{1 , 29001,},
					{1 , 29057,},
					{1 , 29113,},
					{1 , 29169,},
					{1 , 29225,},
					{1 , 29281,},
					{1 , 28972,},
					{1 , 29028,},
					{1 , 29084,},
					{1 , 29140,},
					{1 , 29196,},
					{1 , 29252,},
					{1 , 29308,},
					{2 , 28372,},
					{2 , 28428,},
					{2 , 28484,},
					{2 , 28540,},
					{2 , 28596,},
					{2 , 28652,},
					{2 , 28708,},
					{2 , 28371,},
					{2 , 28427,},
					{2 , 28483,},
					{2 , 28539,},
					{2 , 28595,},
					{2 , 28651,},
					{2 , 28707,},
					{1 , 28943,},
					{1 , 28999,},
					{1 , 29055,},
					{1 , 29111,},
					{1 , 29167,},
					{1 , 29223,},
					{1 , 29279,},
					{1 , 28942,},
					{1 , 28998,},
					{1 , 29054,},
					{1 , 29110,},
					{1 , 29166,},
					{1 , 29222,},
					{1 , 29278,},
				},

			--2级防具师
			[2] = {
					{2 , 28403,},
					{2 , 28459,},
					{2 , 28515,},
					{2 , 28571,},
					{2 , 28627,},
					{2 , 28683,},
					{2 , 28739,},
					{2 , 28404,},
					{2 , 28460,},
					{2 , 28516,},
					{2 , 28572,},
					{2 , 28628,},
					{2 , 28684,},
					{2 , 28740,},
					{2 , 28406,},
					{2 , 28462,},
					{2 , 28518,},
					{2 , 28574,},
					{2 , 28630,},
					{2 , 28686,},
					{2 , 28742,},
					{1 , 28974,},
					{1 , 29030,},
					{1 , 29086,},
					{1 , 29142,},
					{1 , 29198,},
					{1 , 29254,},
					{1 , 29310,},
					{1 , 28975,},
					{1 , 29031,},
					{1 , 29087,},
					{1 , 29143,},
					{1 , 29199,},
					{1 , 29255,},
					{1 , 29311,},
					{1 , 28977,},
					{1 , 29033,},
					{1 , 29089,},
					{1 , 29145,},
					{1 , 29201,},
					{1 , 29257,},
					{1 , 29313,},
					{2 , 28377,},
					{2 , 28433,},
					{2 , 28489,},
					{2 , 28545,},
					{2 , 28601,},
					{2 , 28657,},
					{2 , 28713,},
					{2 , 28378,},
					{2 , 28434,},
					{2 , 28490,},
					{2 , 28546,},
					{2 , 28602,},
					{2 , 28658,},
					{2 , 28714,},
					{2 , 28405,},
					{2 , 28461,},
					{2 , 28517,},
					{2 , 28573,},
					{2 , 28629,},
					{2 , 28685,},
					{2 , 28741,},
					{1 , 28948,},
					{1 , 29004,},
					{1 , 29060,},
					{1 , 29116,},
					{1 , 29172,},
					{1 , 29228,},
					{1 , 29284,},
					{1 , 28949,},
					{1 , 29005,},
					{1 , 29061,},
					{1 , 29117,},
					{1 , 29173,},
					{1 , 29229,},
					{1 , 29285,},
					{1 , 28976,},
					{1 , 29032,},
					{1 , 29088,},
					{1 , 29144,},
					{1 , 29200,},
					{1 , 29256,},
					{1 , 29312,},
					{2 , 28376,},
					{2 , 28432,},
					{2 , 28488,},
					{2 , 28544,},
					{2 , 28600,},
					{2 , 28656,},
					{2 , 28712,},
					{2 , 28375,},
					{2 , 28431,},
					{2 , 28487,},
					{2 , 28543,},
					{2 , 28599,},
					{2 , 28655,},
					{2 , 28711,},
					{1 , 28947,},
					{1 , 29003,},
					{1 , 29059,},
					{1 , 29115,},
					{1 , 29171,},
					{1 , 29227,},
					{1 , 29283,},
					{1 , 28946,},
					{1 , 29002,},
					{1 , 29058,},
					{1 , 29114,},
					{1 , 29170,},
					{1 , 29226,},
					{1 , 29282,},
				},

			--3级防具师
			[3] = {
					{2 , 28407,},
					{2 , 28463,},
					{2 , 28519,},
					{2 , 28575,},
					{2 , 28631,},
					{2 , 28687,},
					{2 , 28743,},
					{2 , 28408,},
					{2 , 28464,},
					{2 , 28520,},
					{2 , 28576,},
					{2 , 28632,},
					{2 , 28688,},
					{2 , 28744,},
					{2 , 28410,},
					{2 , 28466,},
					{2 , 28522,},
					{2 , 28578,},
					{2 , 28634,},
					{2 , 28690,},
					{2 , 28746,},
					{1 , 28978,},
					{1 , 29034,},
					{1 , 29090,},
					{1 , 29146,},
					{1 , 29202,},
					{1 , 29258,},
					{1 , 29314,},
					{1 , 28979,},
					{1 , 29035,},
					{1 , 29091,},
					{1 , 29147,},
					{1 , 29203,},
					{1 , 29259,},
					{1 , 29315,},
					{1 , 28981,},
					{1 , 29037,},
					{1 , 29093,},
					{1 , 29149,},
					{1 , 29205,},
					{1 , 29261,},
					{1 , 29317,},
					{2 , 28381,},
					{2 , 28437,},
					{2 , 28493,},
					{2 , 28549,},
					{2 , 28605,},
					{2 , 28661,},
					{2 , 28717,},
					{2 , 28382,},
					{2 , 28438,},
					{2 , 28494,},
					{2 , 28550,},
					{2 , 28606,},
					{2 , 28662,},
					{2 , 28718,},
					{2 , 28409,},
					{2 , 28465,},
					{2 , 28521,},
					{2 , 28577,},
					{2 , 28633,},
					{2 , 28689,},
					{2 , 28745,},
					{1 , 28952,},
					{1 , 29008,},
					{1 , 29064,},
					{1 , 29120,},
					{1 , 29176,},
					{1 , 29232,},
					{1 , 29288,},
					{1 , 28953,},
					{1 , 29009,},
					{1 , 29065,},
					{1 , 29121,},
					{1 , 29177,},
					{1 , 29233,},
					{1 , 29289,},
					{1 , 28980,},
					{1 , 29036,},
					{1 , 29092,},
					{1 , 29148,},
					{1 , 29204,},
					{1 , 29260,},
					{1 , 29316,},
					{2 , 28380,},
					{2 , 28436,},
					{2 , 28492,},
					{2 , 28548,},
					{2 , 28604,},
					{2 , 28660,},
					{2 , 28716,},
					{2 , 28379,},
					{2 , 28435,},
					{2 , 28491,},
					{2 , 28547,},
					{2 , 28603,},
					{2 , 28659,},
					{2 , 28715,},
					{1 , 28951,},
					{1 , 29007,},
					{1 , 29063,},
					{1 , 29119,},
					{1 , 29175,},
					{1 , 29231,},
					{1 , 29287,},
					{1 , 28950,},
					{1 , 29006,},
					{1 , 29062,},
					{1 , 29118,},
					{1 , 29174,},
					{1 , 29230,},
					{1 , 29286,},
				},

			--4级防具师
			[4] = {
					{2 , 28411,},
					{2 , 28467,},
					{2 , 28523,},
					{2 , 28579,},
					{2 , 28635,},
					{2 , 28691,},
					{2 , 28747,},
					{2 , 28412,},
					{2 , 28468,},
					{2 , 28524,},
					{2 , 28580,},
					{2 , 28636,},
					{2 , 28692,},
					{2 , 28748,},
					{2 , 28414,},
					{2 , 28470,},
					{2 , 28526,},
					{2 , 28582,},
					{2 , 28638,},
					{2 , 28694,},
					{2 , 28750,},
					{1 , 28982,},
					{1 , 29038,},
					{1 , 29094,},
					{1 , 29150,},
					{1 , 29206,},
					{1 , 29262,},
					{1 , 29318,},
					{1 , 28983,},
					{1 , 29039,},
					{1 , 29095,},
					{1 , 29151,},
					{1 , 29207,},
					{1 , 29263,},
					{1 , 29319,},
					{1 , 28985,},
					{1 , 29041,},
					{1 , 29097,},
					{1 , 29153,},
					{1 , 29209,},
					{1 , 29265,},
					{1 , 29321,},
					{2 , 28385,},
					{2 , 28441,},
					{2 , 28497,},
					{2 , 28553,},
					{2 , 28609,},
					{2 , 28665,},
					{2 , 28721,},
					{2 , 28386,},
					{2 , 28442,},
					{2 , 28498,},
					{2 , 28554,},
					{2 , 28610,},
					{2 , 28666,},
					{2 , 28722,},
					{2 , 28413,},
					{2 , 28469,},
					{2 , 28525,},
					{2 , 28581,},
					{2 , 28637,},
					{2 , 28693,},
					{2 , 28749,},
					{1 , 28956,},
					{1 , 29012,},
					{1 , 29068,},
					{1 , 29124,},
					{1 , 29180,},
					{1 , 29236,},
					{1 , 29292,},
					{1 , 28957,},
					{1 , 29013,},
					{1 , 29069,},
					{1 , 29125,},
					{1 , 29181,},
					{1 , 29237,},
					{1 , 29293,},
					{1 , 28984,},
					{1 , 29040,},
					{1 , 29096,},
					{1 , 29152,},
					{1 , 29208,},
					{1 , 29264,},
					{1 , 29320,},
					{2 , 28384,},
					{2 , 28440,},
					{2 , 28496,},
					{2 , 28552,},
					{2 , 28608,},
					{2 , 28664,},
					{2 , 28720,},
					{2 , 28383,},
					{2 , 28439,},
					{2 , 28495,},
					{2 , 28551,},
					{2 , 28607,},
					{2 , 28663,},
					{2 , 28719,},
					{1 , 28955,},
					{1 , 29011,},
					{1 , 29067,},
					{1 , 29123,},
					{1 , 29179,},
					{1 , 29235,},
					{1 , 29291,},
					{1 , 28954,},
					{1 , 29010,},
					{1 , 29066,},
					{1 , 29122,},
					{1 , 29178,},
					{1 , 29234,},
					{1 , 29290,},
				},

			--5级防具师
			[5] = {
					{2 , 28415,},
					{2 , 28471,},
					{2 , 28527,},
					{2 , 28583,},
					{2 , 28639,},
					{2 , 28695,},
					{2 , 28751,},
					{2 , 28416,},
					{2 , 28472,},
					{2 , 28528,},
					{2 , 28584,},
					{2 , 28640,},
					{2 , 28696,},
					{2 , 28752,},
					{2 , 28418,},
					{2 , 28474,},
					{2 , 28530,},
					{2 , 28586,},
					{2 , 28642,},
					{2 , 28698,},
					{2 , 28754,},
					{1 , 28986,},
					{1 , 29042,},
					{1 , 29098,},
					{1 , 29154,},
					{1 , 29210,},
					{1 , 29266,},
					{1 , 29322,},
					{1 , 28987,},
					{1 , 29043,},
					{1 , 29099,},
					{1 , 29155,},
					{1 , 29211,},
					{1 , 29267,},
					{1 , 29323,},
					{1 , 28989,},
					{1 , 29045,},
					{1 , 29101,},
					{1 , 29157,},
					{1 , 29213,},
					{1 , 29269,},
					{1 , 29325,},
					{2 , 28389,},
					{2 , 28445,},
					{2 , 28501,},
					{2 , 28557,},
					{2 , 28613,},
					{2 , 28669,},
					{2 , 28725,},
					{2 , 28390,},
					{2 , 28446,},
					{2 , 28502,},
					{2 , 28558,},
					{2 , 28614,},
					{2 , 28670,},
					{2 , 28726,},
					{2 , 28417,},
					{2 , 28473,},
					{2 , 28529,},
					{2 , 28585,},
					{2 , 28641,},
					{2 , 28697,},
					{2 , 28753,},
					{1 , 28960,},
					{1 , 29016,},
					{1 , 29072,},
					{1 , 29128,},
					{1 , 29184,},
					{1 , 29240,},
					{1 , 29296,},
					{1 , 28961,},
					{1 , 29017,},
					{1 , 29073,},
					{1 , 29129,},
					{1 , 29185,},
					{1 , 29241,},
					{1 , 29297,},
					{1 , 28988,},
					{1 , 29044,},
					{1 , 29100,},
					{1 , 29156,},
					{1 , 29212,},
					{1 , 29268,},
					{1 , 29324,},
					{2 , 28388,},
					{2 , 28444,},
					{2 , 28500,},
					{2 , 28556,},
					{2 , 28612,},
					{2 , 28668,},
					{2 , 28724,},
					{2 , 28387,},
					{2 , 28443,},
					{2 , 28499,},
					{2 , 28555,},
					{2 , 28611,},
					{2 , 28667,},
					{2 , 28723,},
					{1 , 28959,},
					{1 , 29015,},
					{1 , 29071,},
					{1 , 29127,},
					{1 , 29183,},
					{1 , 29239,},
					{1 , 29295,},
					{1 , 28958,},
					{1 , 29014,},
					{1 , 29070,},
					{1 , 29126,},
					{1 , 29182,},
					{1 , 29238,},
					{1 , 29294,},
				},

			--6级防具师
			[6] = {
					{2 , 28419,},
					{2 , 28475,},
					{2 , 28531,},
					{2 , 28587,},
					{2 , 28643,},
					{2 , 28699,},
					{2 , 28755,},
					{2 , 28420,},
					{2 , 28476,},
					{2 , 28532,},
					{2 , 28588,},
					{2 , 28644,},
					{2 , 28700,},
					{2 , 28756,},
					{2 , 28422,},
					{2 , 28478,},
					{2 , 28534,},
					{2 , 28590,},
					{2 , 28646,},
					{2 , 28702,},
					{2 , 28758,},
					{1 , 28990,},
					{1 , 29046,},
					{1 , 29102,},
					{1 , 29158,},
					{1 , 29214,},
					{1 , 29270,},
					{1 , 29326,},
					{1 , 28991,},
					{1 , 29047,},
					{1 , 29103,},
					{1 , 29159,},
					{1 , 29215,},
					{1 , 29271,},
					{1 , 29327,},
					{1 , 28993,},
					{1 , 29049,},
					{1 , 29105,},
					{1 , 29161,},
					{1 , 29217,},
					{1 , 29273,},
					{1 , 29329,},
					{2 , 28393,},
					{2 , 28449,},
					{2 , 28505,},
					{2 , 28561,},
					{2 , 28617,},
					{2 , 28673,},
					{2 , 28729,},
					{2 , 28394,},
					{2 , 28450,},
					{2 , 28506,},
					{2 , 28562,},
					{2 , 28618,},
					{2 , 28674,},
					{2 , 28730,},
					{2 , 28421,},
					{2 , 28477,},
					{2 , 28533,},
					{2 , 28589,},
					{2 , 28645,},
					{2 , 28701,},
					{2 , 28757,},
					{1 , 28964,},
					{1 , 29020,},
					{1 , 29076,},
					{1 , 29132,},
					{1 , 29188,},
					{1 , 29244,},
					{1 , 29300,},
					{1 , 28965,},
					{1 , 29021,},
					{1 , 29077,},
					{1 , 29133,},
					{1 , 29189,},
					{1 , 29245,},
					{1 , 29301,},
					{1 , 28992,},
					{1 , 29048,},
					{1 , 29104,},
					{1 , 29160,},
					{1 , 29216,},
					{1 , 29272,},
					{1 , 29328,},
					{2 , 28392,},
					{2 , 28448,},
					{2 , 28504,},
					{2 , 28560,},
					{2 , 28616,},
					{2 , 28672,},
					{2 , 28728,},
					{2 , 28391,},
					{2 , 28447,},
					{2 , 28503,},
					{2 , 28559,},
					{2 , 28615,},
					{2 , 28671,},
					{2 , 28727,},
					{1 , 28963,},
					{1 , 29019,},
					{1 , 29075,},
					{1 , 29131,},
					{1 , 29187,},
					{1 , 29243,},
					{1 , 29299,},
					{1 , 28962,},
					{1 , 29018,},
					{1 , 29074,},
					{1 , 29130,},
					{1 , 29186,},
					{1 , 29242,},
					{1 , 29298,},
				},

			--7级防具师(未开放，80级装备生产）
			[7] = {
					{1 , 29298,},
				},

			},

		--2类为杀当前等级怪物，索引项为等级分段
		[2] = {
			--怪物id
			[40] = 50 , 	--狮鹫
			[45] = 44 , 	--幽魂纳迦
			[50] = 42 , 	--小魔女
			[55] = 53 , 	--多头蛇蜥
			[60] = 10464 , --食人雾
			[65] = 10463 , --丛林黑豹
			[70] = 10449 , --枯木杀手
			[75] = 10444 , --咬趾虫
			[80] = 10444 , --咬趾虫

			},

		--3类完成特定任务后完成，表内容为对应的任务id
		[3] = {
				[1] = {12936, 12932,},--引导任务，完成的任务条件
				[2] = {12933, 12935,},
				},

		--4类为需要物品,根据副职业等级收取的物品不同
		[4] = {
				--工艺
				[1] = 36876,--灵巧之能
				--宝石粉尘
				[2] = 33661,
			},
	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = true,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,
		iMaxFinishCount = 1,--最大完成次数为1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 副职业经验
		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			local tabSideOccupExp = {7,14,28,56,112,224,250,250}											--存放副职业经验奖励

			local iSideOccupId = 10 																		--防具师副职业id
			local iSideOccuplev = TaskCApi.GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) 		--获取玩家武器师等级

			soe = {
						SOE1 = {ID = iSideOccupId, EXP = tabSideOccupExp[iSideOccuplev]},--id为副职业id，exp为数值，exp为0显示？？？
				  }
			return soe
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iSideOccupIdhighlevel = 6 --当前满级防具师为6级

		local iSideOccupId = 10			 --防具师副职业id

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 40 then --等级需要高于40级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--检查是否学会防具
		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, iSideOccupId) then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

		--当前满级防具师为iSideOccupIdhighlevel级，所以iSideOccupIdhighlevel级以及iSideOccupIdhighlevel级以上将不会接到此任务
		if TaskCApi. GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) >= iSideOccupIdhighlevel then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

		--D库检查包裹空间1格

		--取得玩家角色创建时间
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)
		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--取flag任务12764完成次数，如果7<=x<=8则随机D类任务库
		local iflagtasktimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,12764) + 1

		local itaskmethodid = 1
		--3个数值都存在
		if RoleCreateTime and dayInYear and iflagtasktimes then
			if iflagtasktimes >=7 then
				itaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 3
			end
		end

		--测试用内容,4493控制itaskmethodid
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		if itaskmethodid == 4 then
			if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iflagtaskid = 12764		--防具师flag计数任务id
		local itaskmethodid = 1 		--随机到的任务类型，默认为1，避免空值
		local isubtaskmethodid = 1		--针对cd类任务库的子任务类型，默认为1

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--玩家等级

		--取得玩家角色创建时间
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)

		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--取flag任务完成次数，如果7<=x<=8则随机D类任务库
		local iflagtasktimes = 	TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iflagtaskid) + 1

		if iflagtasktimes ==7 then
			itaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 3

		elseif iflagtasktimes >= 8 then
		--如果第七天没发D库，那么第8天一定发d库

			itaskmethodid = 4

		else--flag计数为1-6时，仅在abc类内随机，通过时间和角色id加和取余数固定玩家当天的随机内容
			itaskmethodid = ( RoleCreateTime + dayInYear) % 3 + 1
		end

		--测试用内容,4493控制itaskmethodid
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		if itaskmethodid == 3 then --C类任务有2种类型
			isubtaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 1

			--测试用内容
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end

			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid][1])--发放分支任务

		elseif itaskmethodid == 4 then --D类任务有2种类型
			isubtaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 1

			--测试用内容
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end

			--子随机方式1需要额外发放任务道具
			if isubtaskmethodid == 1 then --发放任务随机发生器36875灵能碎粒
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 36875, 1, false)
			end

		end

		--测试用内容,4493和4495控制两个id
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)

			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end
		end

		--设置随机数以用于存储随机到的当前任务内容
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 1, itaskmethodid)		--任务类型（ABCD大类）
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 2, isubtaskmethodid)		--子任务类型（针对CD类任务库）
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 3, 100)					--给交纳物品用的随机数，防止取空，预存值100
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 4, iPlayerLev)			--存储玩家等级,给客户端显示追踪用

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local itaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 1)		--取出任务类型（ABCD大类）
		local isubtaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 2)	--取出子任务类型（针对CD类任务库）
		local iPlayerLev = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 4)			--取出玩家接受任务时的人物等级

		local iSideOccupId = 10 																		--防具师副职业id
		local iSideOccuplev = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,iSideOccupId) 		--获取玩家防具师等级

		if itaskmethodid == 1 then
			Method.SubmitItem = true--提交物品的完成方式

		elseif itaskmethodid == 2 then
			local iPlayerLev2 = math.floor(iPlayerLev /5)*5
			--杀怪

			Method.KillMonster = {
						Mons1={ID=TaskList[12763].Tabtaskmethod[itaskmethodid][iPlayerLev2], Num=3,},
						}

		elseif itaskmethodid == 3 then
			--cd库类任务都是通过完成特定任务的方式来实现
			local iTaskid = TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid][2]
			Method.CompleteTask = {TaskID = iTaskid , Num = 1}

		else
			local iItemID = TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid]
			Method.CollectItem = {Item1={ID=iItemID, Num=1, Common=true}, }
		end

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local itaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 1)		--取出任务类型（ABCD大类）
		local isubtaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 2)	--取出子任务类型（针对CD类任务库）
		local iPlayerLev = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 4)			--取出玩家接受任务时的人物等级						--玩家等级

		local iSideOccupId = 10 																		--防具师副职业id
		local iSideOccuplev = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,iSideOccupId) 				--获取玩家防具师等级

		if itaskmethodid == 1 then
		--提交物品的方式来实现
			--提交的物品id，提交的物品数量
			local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12763)

			if itemIDSubmitted and itemNumberSubmitted then

				for i,j in pairs(TaskList[12763].Tabtaskmethod[1][iSideOccuplev]) do
					if itemIDSubmitted == j[2] and  itemNumberSubmitted == 1 then
					--设置随机数以用于存储玩家交纳的物品索引
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 3, i)

					iRet = TASK_SUCC_FINISH

					return iRet

					elseif itemIDSubmitted == j[2] and itemNumberSubmitted > 1 then
					--数量不对
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12763, 29, 20001)
					end

					if i == 112 then --物品不对
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12763, 28, 20000)
					end
				end
			end

		elseif itaskmethodid == 2 then
		--杀怪
			if TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 12763, "Mons1") >= 3 then
   		        iRet = TASK_SUCC_FINISH
			    return iRet
   		    end


		elseif itaskmethodid == 3 then
		--C任务库通过完成任务的方式来实现
			local iTaskid = TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid][2]
			local TaskCompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskid)

			if TaskCompleteTimes >= 1 then
				iRet = TASK_SUCC_FINISH
				return iRet

			end

		elseif itaskmethodid == 4 then
		--D任务库寻物
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid], true)>= 1 then
				iRet = TASK_SUCC_FINISH
				return iRet
   		    end
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)

		local AwardMulti = 30																		--存放角色经验奖励系数
		local tabSideOccupExp = {7,14,28,56,112,224,250,250}										--存放副职业经验奖励

		local PlayerLevel = ucRandomNum4												 			--取得玩家接收任务时的等级，发奖励用
		local iSideOccupId = 10 																	--防具师副职业id
		local iSideOccuplev = TaskCApi.GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) 		--获取玩家防具师等级

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 											--玩家等级的修正经验

   		if bSuccess then

			if ucRandomNum1 == 1 then
				--[[
				--由于功能限制，此处物品不再收取
				local iItemsid = TaskList[12763].Tabtaskmethod[1][iSideOccuplev][ucRandomNum3][2]
				--收走物品
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemsid, 1)    					--收取武器 1个

				if TaskList[12763].Tabtaskmethod[1][iSideOccuplev][ucRandomNum3][1] == 2 then			--蓝色品质物品额外奖励小额人物经验
				--给玩家发放经验
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)
				end
				]]--
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12764)--发放flag任务以计数

			elseif ucRandomNum1 == 2 then

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12764)--发放flag任务以计数

			elseif ucRandomNum1 == 3 then

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12764)--发放flag任务以计数

				--清空辅助任务计数
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12932)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12933)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12935)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12936)


			elseif ucRandomNum1 == 4 then
				iItemsid = TaskList[12763].Tabtaskmethod[ucRandomNum1][ucRandomNum2]
				--收走任务物品
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemsid, 1)

				--D类任务完成，清除flag任务完成次数
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12764)
			end

			TaskCApi.DeliverSideOccupExp (TASKINTERFACE_POINTER, iSideOccupId, tabSideOccupExp[iSideOccuplev] )--发放副职业经验
		else
			--失败的话需要中止C库的引导任务
			if ucRandomNum1 == 3 then
				local iTaskID = TaskList[12763].Tabtaskmethod[ucRandomNum1][ucRandomNum2][1]
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iTaskID) then
				--如果存在，则中止
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskID, false)
				end

				local iTaskID2 = TaskList[12763].Tabtaskmethod[ucRandomNum1][ucRandomNum2][2]
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iTaskID2) then
				--如果存在，则中止
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskID2, false)
				end
			end

   		end

		--无论失败成功或者放弃清空C类任务的任务完成计数
		if ucRandomNum1 == 3 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12932)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12933)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12935)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12936)

		--D任务库子任务1中发放的物品如果存在就收回
		elseif ucRandomNum1 == 4 and ucRandomNum2 == 1 then
			local iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 36875, true)
			if iItemsnum > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,36875, 1)
			end

		end

   		return 0
   	end
}

TaskList[13520] = --飞行活动：暴风邪能入侵
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, --放弃任务发失败奖励

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 100,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 30									--存放奖励系数
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值


		end
		,

		-- 物品
		Items = function(TASKINTERFACE_POINTER)
			local items = {}

			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local ItemId1 = 38004	--碧蓝之翼奖章
			local ItemId2 = 41074   --邪能残辉

			if PlayerLevel>= 65 then
				items = {
							Item1 = {ID = ItemId1, NUM = 1},--0时为？？？，其他显示物品和数量
							Item2 = {ID = ItemId2, NUM = 1},
						}
			else
				items = {
							Item1 = {ID = ItemId1, NUM = 1},--0时为？？？，其他显示物品和数量
						}
			end

			return items
		end
		,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 25 then --等级需要高于25级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

		--和气球大赛13589当前互斥
		if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,13589) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		--活动计次，7号(id=6)活动计数>0
		if TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,6) == 0 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		--随机从20个定位器中选出一个
		math.randomseed(os.time())
		local iRandomMethod = math.random(1, 20) --玩家随到的任务种类

		local iItemID = 37774 + iRandomMethod  --定位器id从37775-37794

   		--发道具或奖励
		TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemID, 1, true)     --发 感应器37775-37794
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		Method.CollectItem = { Item1 = {ID=38037, Num = 3, Common= true},
				} --5个普通物品邪能核心 38037

		Method.iTimeLimit = 1800 --30min完成则任务失败

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 38037, true)   >= 3 then
			iRet = TASK_SUCC_FINISH
		end

		--超时则任务失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 13520)
   		if ulCurTime - ulDeliverTime > 1800 then
   		    iRet = TASK_FAIL_FINISH
   		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格

   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 30									--存放奖励系数
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验


   		if bSuccess then
			--收走所需任务物品37753邪能核心
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,38037, true)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 38037, num1)

			--收走玩家身上剩余的定位器
			for i = 37775, 37794 do
				local num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,i, true)
				if num2> 0 then
					TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, i, num2)
				end
			end

			--根据等级发放奖励38004飞行奖章，65级以上发非绑定
			if PlayerLevel >= 65 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38004, 1, false)
				--发放物品非绑定41074邪能残辉
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 41074, 1, false)
			else
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38004, 1, true)
			end

			--发放经验
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

			--发放物品绑定38363魂力碎片
			--TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38363, 1, true)

			--修改活动计次，7号活动计数
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,6, -1)

			--0.35概率发放1个37708
			math.randomseed(os.time())
			local iRandomnum = math.random(1, 100) --玩家随到的任务种类
			if iRandomnum <= 35 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 37708, 1, true)
			end

		else--失败清空任务

			--收走所需任务物品
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,38037, true)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 38037, num1)

			--收走玩家身上剩余的定位器
			for i = 37775, 37794 do
				local num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,i, true)
				if num2> 0 then
					TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, i, num2)
				end
			end

   		end

   		return 0
   	end
}

TaskList[13643] = --雷辛格不会告诉你
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, --放弃任务发失败奖励

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 200,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--存放奖励系数
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--返回0时为？？？，其他为显示的值


		end
		,

		FriendShips = function(TASKINTERFACE_POINTER)
			local friendships = {}
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级
			local iPrestige
			local TabPrestige = {
									[60] = 100,
									[65] = 600,
									[70] = 2400,
									[75] = 7200,
								}

			if PlayerLevel < 65 then
				iPrestige = TabPrestige[60]
			elseif PlayerLevel < 70 then
				iPrestige = TabPrestige[65]
			elseif PlayerLevel < 75 then
				iPrestige = TabPrestige[70]
			else
				iPrestige = TabPrestige[75]
			end

			friendships = {
								FS1 = {ID = 1, VAL = iPrestige},--id为声望id,val为数值；val=0 ,？？？（id=-1） 声望 ？？？（val=0）
						  }
			return friendships
		end	,

		Belief = function(TASKINTERFACE_POINTER)

			local iBelief = nil
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级
			if PlayerLevel >= 80 then
				iBelief= 9000
			end

			return iBelief--返回0时为？？？,其他为显示的值
		end	,

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 60 then --等级需要高于60级
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end

		--8号(id = 8)活动计数 > 0
		if TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,8) < 1 then
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end

		local taskIDs = { 13643,13765,13758,}
		for k,v in ipairs(taskIDs) do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,v) then
				return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iRandomNum = 3 --日常活动随机种类
		--1:NPC让玩家去大工匠那里拿一把螺丝刀38806，去酒馆偷酒38808
		--2:NPC给玩家一张白纸，告诉玩家去平民区一个废弃的轨道车下面找某人刻下的字，拓写后交给npc
		--3:NPC让玩家去学术区大树底下挖几条虫子，然后去喷泉里用特制的鱼竿钓鱼。

		--固定玩家每天随到的内容，当天奇偶数*玩家创建角色的时间 %#iPlayervacationid+1
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --取得玩家角色创建时间
		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		local iRandomMethod = (timePackage.yday + RoleCreateTime ) % iRandomNum + 1 --决定今天此玩家会发放的随机种类

		--测试用内容
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iRandomMethod = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		if iRandomMethod == 2 then
			--发道具或奖励
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38836, 1, true)     --发 道具 38836 空白的纸
		elseif iRandomMethod == 3 then
			--发道具或奖励
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38841, 1, true)     --发 道具 38841 小巧的鱼竿
		end

		--设置随机数
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 13643, 1, iRandomMethod)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13643, 1)

		local TabItem = {
						[1] = {38808 , 1},
						[2] = {38833 , 1},
						[3] = {38844 , 1},
						}

		Method.CollectItem = { Item1 = {ID=TabItem[iRandomMethod][1], Num = TabItem[iRandomMethod][2], Common= true},
				}

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13643, 1)

		local TabItem = {
						[1] = {38808 , 1},
						[2] = {38833 , 1},
						[3] = {38844 , 1},
						}

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TabItem[iRandomMethod][1], true) >= TabItem[iRandomMethod][2] then
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		--[[
   		if bSuccess then

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end
		]]--

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 60									--存放奖励系数
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用
		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

		local TabItem = {
						[1] = {38808 , 1},
						[2] = {38833 , 1},
						[3] = {38844 , 1},
						}

		--收走相关的物品
		--38806	雷辛格活动_螺丝刀	大工匠的螺丝刀
		--38808	雷辛格活动_葡萄酒	葡萄酒
		--38810	雷辛格活动_土堆里的虫子	土堆里的虫子
		--38833	雷辛格活动_旧日情书	旧日情书
		--38836	雷辛格活动_空白的纸	空白的纸
		--38841	雷辛格活动_特制鱼竿	小巧的鱼竿
		--38842	雷辛格活动_有鱼饵的鱼竿	有鱼饵的鱼竿
		--38843	雷辛格活动_喷泉硬币	喷泉硬币
		--38844	雷辛格活动_喷泉水晶鱼	喷泉晶骨鱼

		local TabItem = {	38806,
							38808,
							38810,
							38833,
							38836,
							38841,
							38842,
							38843,
							38844,
						}
		local num1

		for i,v in pairs(TabItem) do
			num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,v, true)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, v, num1)
		end

   		if bSuccess then
			--发放经验
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

			local iPrestige
			--发放雷辛格声望
			local TabPrestige = {
									[60] = 100,
									[65] = 600,
									[70] = 2400,
									[75] = 7200,
								}
			if PlayerLevel < 65 then
				iPrestige = TabPrestige[60]
			elseif PlayerLevel < 70 then
				iPrestige = TabPrestige[65]
			elseif PlayerLevel < 75 then
				iPrestige = TabPrestige[70]
			else
				iPrestige = TabPrestige[75]
			end

			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,1, iPrestige)

			--80级后获得信仰值（可以突破上限的方式）9000
			if PlayerLevel>= 80 then
				TaskCApi. DeliverBelief(TASKINTERFACE_POINTER,9000, true)
			end

			--增加活跃度 13122 +1
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 13122, 1)
			--修改幸运任务计次次数：13646 +1
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 13646, 1)

			--修改活动计次，9号活动计数
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,8, -1)

			--用于阶段性奖励，修改14007+1
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 14007, 1)
		end


   		return 0
   	end
}

TaskList[14094] = --七日谈收取计数
{
	--任务自定义表
	Tabtaskmethod =
	{
		--索引项为要交纳的书籍id

		[40876] = 14096, --紫晶之灵
		[40877] = 14097, --幽月之光
		[40878] = 14098, --天使之泪
		[40879] = 14099, --水晶陵墓
		[40880] = 14100, --法老之泪
		[40881] = 14101, --黄金诅咒
		[40882] = 14102, --童声笑语
	},

  	Property =
  	{
		bRecordFinish = true,			--记录完成结果
  		bCanRedo = true,				--成功后可重复完成
  		bCanRedoAfterFailure = true,	--失败后可重复完成

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--放弃任务发失败奖励

  		bRecordFinishCount = true,
		iMaxFinishCount = 7000,--最大完成次数为7

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- 成功时有效
	AwardPreview =
	{
	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		if iPlayerLev < 81 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

   		return 0

   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		Method.SubmitItem = true

   		return Method

   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local TabFlag = {} --建立表格，存储已经交纳书籍的状况

		--提交的物品id，提交的物品数量
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,14094)

		if itemIDSubmitted and itemNumberSubmitted then

			--构建tabflag表格存储玩家已经交纳的情况，索引项为标志任务id
			for i= 14096, 14102 do
				--14096-14102分别对应7个书籍的交纳结果
				if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, i ,true) then
					TabFlag[i] = 1
				else
					TabFlag[i] = 0
				end
			end

			local iTaskID = TaskList[14094].Tabtaskmethod[itemIDSubmitted] --玩家交纳的任务物品所对应的标志任务id

			if iTaskID then --标志任务id不为空，属于需要交纳内容
				if TabFlag[iTaskID] == 1 then
					TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14094, 28, 20002)
					--已经交纳过了
				elseif TabFlag[iTaskID] == 0 then

					--设置随机数以用于存储玩家交纳的物品
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 14094, 1, itemIDSubmitted)

					iRet = TASK_SUCC_FINISH

				end

			else
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14094, 28, 20000)
				--物品不对
			end

		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1)

		local AwardMulti = 30																		--存放角色经验奖励系数
		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 											--玩家等级的修正经验

   		if bSuccess then

			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,ucRandomNum1, 1)    					--收取玩家交纳的书籍1个

			local iTaskId =TaskList[14094].Tabtaskmethod[ucRandomNum1]--需要发放的标志任务
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskId)--发放flag任务以计数

   		end

   		return 0
   	end
}
