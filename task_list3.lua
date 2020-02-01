---------------------------------------------------------------
--  created:   2010.3.17
--  author:    liudong
--
--  内容：任务脚本文件。

--  说明：
------------------------------------------------------------------

TaskList[9927] = --马戏团第四关新的脚本任务发奖
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,

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

		Gold = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值

		end

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--高于15级
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数量
		--local timePackage = os.date("*t", os.time())
		--local dayInWeek = timePackage.wday
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 15 then
	   	  return TASK_PREREQU_FAIL_LUA_TASK
	   	end
		--[[
		if dayInWeek == 7 then
			if iPlayerLevel >= 55 then
				if iPacketEmptySolts < 2 then
					return TASK_PREREQU_FAIL_GIVEN_ITEM
				end
			else
				if iPacketEmptySolts < 1 then
					return TASK_PREREQU_FAIL_GIVEN_ITEM
				end
			end
		else
			if iPacketEmptySolts < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end
		]]
		if iPlayerLevel >= 55 then
			if iPacketEmptySolts < 2 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		else
			if iPacketEmptySolts < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
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
   		Method.iWaitTime = 0

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		iRet = TASK_SUCC_FINISH
		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 9927)
   		if ulCurTime - ulDeliverTime > 30 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数
		--local timePackage = os.date("*t", os.time())
		--local dayInWeek = timePackage.wday
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		if bSuccess then
		--[[
			if dayInWeek == 7 then
				if iPlayerLevel >= 55 then
					if iPacketEmptySolts < 2 then
						return TASK_PREREQU_FAIL_GIVEN_ITEM
					end
				else
					if iPacketEmptySolts < 1 then
						return TASK_PREREQU_FAIL_GIVEN_ITEM
					end
				end
			else
				if iPacketEmptySolts < 1 then
					return TASK_PREREQU_FAIL_GIVEN_ITEM
				end
			end
			]]
			if iPlayerLevel >= 55 then
					if iPacketEmptySolts < 2 then
						return TASK_PREREQU_FAIL_GIVEN_ITEM
					end
				else
					if iPacketEmptySolts < 1 then
						return TASK_PREREQU_FAIL_GIVEN_ITEM
					end
				end
			end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，数量为分线变量180015的数值乘2，修正等级80，非恒定等级
		--需求奖励2：给代币

		local iIndex = 180015
		local iValue = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex)

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local i246Award = 2									--改成2、4、6开放后，每天的奖励再提升一倍
		local iExpAwardMutli = math.floor(iValue * 2) * i246Award
		local iItemId = 28201
		local iItemNum = math.floor(iValue/TaskNightmareEarnings[iPlayerLevel][4]) * i246Award
		local timePackage = os.date("*t", os.time())
		local dayInWeek = timePackage.wday
		local iItemId_p = 31939
   		if bSuccess then
				if dayInWeek >=1 and dayInWeek<= 6 then
					iExpAwardMutli = math.floor(iValue * 2) * i246Award
					if iPlayerLevel <= 80 then
						iItemNum = math.floor(iValue/TaskNightmareEarnings[iPlayerLevel][4]) * i246Award
					else
						iItemNum = math.floor(iValue/TaskNightmareEarnings[80][4]) * i246Award
					end
				elseif dayInWeek ==7 then
					iExpAwardMutli = math.floor(iValue * 2 * 2) * i246Award
					if iPlayerLevel <= 80 then
						iItemNum = math.floor((iValue/TaskNightmareEarnings[iPlayerLevel][4]) * 2) * i246Award
					else
						iItemNum = math.floor((iValue/TaskNightmareEarnings[80][4]) * 2) * i246Award
					end
					if iPlayerLevel >= 55 then
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId_p, 1, false)	--等级大于55给一个牌子,只在周六给
					end
				end
				if iItemNum < 1 then
					iItemNum = 1
				end
				if iPlayerLevel < 70 then
					TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
				else
					TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[70])
				end
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId, iItemNum, true)
   		end
   		return 0
   	end
}

TaskList[10015] = --马戏团第一关新的脚本任务发奖
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bAbsoluteTime = true,
  		bShowPrompt = false,
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

		Gold = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值

		end

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--高于15级


	   	if iPlayerLev < 15 then
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

   		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，系数60，等级80
		--需求奖励2：给代币

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local i246Award = 2									--改成2、4、6开放后，每天的奖励再提升一倍
		local iExpAwardMutli = 60 * i246Award
		local iItemId = 28201
		local iItemNum = math.floor(TaskNightmareEarnings[iPlayerLevel][1]) * i246Award
		local timePackage = os.date("*t", os.time())
		local dayInWeek = timePackage.wday

   		if bSuccess then
			if dayInWeek >=1 and dayInWeek<= 6 then
				iExpAwardMutli = 60 * i246Award
				if iPlayerLevel <= 80 then
					iItemNum = math.floor(TaskNightmareEarnings[iPlayerLevel][1]) * i246Award
				else
					iItemNum = math.floor(TaskNightmareEarnings[80][1]) * i246Award
				end
			elseif dayInWeek ==7 then
				iExpAwardMutli = 60 * 2 * i246Award
				if iPlayerLevel <= 80 then
					iItemNum = math.floor((TaskNightmareEarnings[iPlayerLevel][1]) * 2) * i246Award
				else
					iItemNum = math.floor((iTaskNightmareEarnings[80][1]) * 2) * i246Award
				end
			end
			if iPlayerLevel < 70 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[70])
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId, iItemNum, true)
   		end
   		return 0
   	end
}


TaskList[10016] = --马戏团第二关新的脚本任务发奖
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bAbsoluteTime = true,
  		bShowPrompt = false,
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

		Gold = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值

		end

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--高于15级


	   	if iPlayerLev < 15 then
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

   		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，系数60，等级80
		--需求奖励2：给代币

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local i246Award = 2									--改成2、4、6开放后，每天的奖励再提升一倍
		local iExpAwardMutli = 60 * i246Award
		local iItemId = 28201
		local iItemNum = math.floor(TaskNightmareEarnings[iPlayerLevel][2]) * i246Award
		local timePackage = os.date("*t", os.time())
		local dayInWeek = timePackage.wday

   		if bSuccess then
			if dayInWeek >=1 and dayInWeek<= 6 then
				iExpAwardMutli = 60 * i246Award
				if iPlayerLevel <= 80 then
					iItemNum = math.floor(TaskNightmareEarnings[iPlayerLevel][2]) * i246Award
				else
					iItemNum = math.floor(TaskNightmareEarnings[80][2]) * i246Award
				end
			elseif dayInWeek ==7 then
				iExpAwardMutli = 60 * 2 * i246Award
				if iPlayerLevel <= 80 then
					iItemNum = math.floor((TaskNightmareEarnings[iPlayerLevel][2]) * 2) * i246Award
				else
					iItemNum = math.floor((iTaskNightmareEarnings[80][2]) * 2) * i246Award
				end
			end
			if iPlayerLevel < 70 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[70])
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId, iItemNum, true)
   		end
   		return 0
   	end
}

TaskList[10017] = --马戏团第三关新的脚本任务发奖
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bAbsoluteTime = true,
  		bShowPrompt = false,
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

		Gold = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值

		end

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--高于15级


	   	if iPlayerLev < 15 then
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

   		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，系数60，等级80
		--需求奖励2：给代币

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local i246Award = 2									--改成2、4、6开放后，每天的奖励再提升一倍
		local iExpAwardMutli = 60 * i246Award
		local iItemId = 28201
		local iItemNum = math.floor(TaskNightmareEarnings[iPlayerLevel][3]) * i246Award
		local timePackage = os.date("*t", os.time())
		local dayInWeek = timePackage.wday

   		if bSuccess then
			if dayInWeek >=1 and dayInWeek<= 6 then
				iExpAwardMutli = 60 * i246Award
				if iPlayerLevel <= 80 then
					iItemNum = math.floor(TaskNightmareEarnings[iPlayerLevel][3]) * i246Award
				else
					iItemNum = math.floor(TaskNightmareEarnings[80][3]) * i246Award
				end
			elseif dayInWeek ==7 then
				iExpAwardMutli = 60 * 2 * i246Award
				if iPlayerLevel <= 80 then
					iItemNum = math.floor((TaskNightmareEarnings[iPlayerLevel][3]) * 2) * i246Award
				else
					iItemNum = math.floor((iTaskNightmareEarnings[80][3]) * 2) * i246Award
				end
			end
			if iPlayerLevel < 70 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[70])
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId, iItemNum, true)
   		end
   		return 0
   	end
}

TaskList[11418] = --嘉年华第一关脚本任务发奖，关联全局变量180022
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bAbsoluteTime = true,
  		bShowPrompt = false,
  		bFinishWhenDelvier = true,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,
		iClearFinishCountDay=7,
		iClearFinishCountHour=0,
		iClearFinishCountMin=1,

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

		Gold = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值

		end

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--获取玩家等级
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数量

	   	if iPlayerLev < 40 then
	   	  return TASK_PREREQU_FAIL_LUA_TASK
	   	end
		if iPacketEmptySolts < 1 then
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
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数
		if bSuccess then
			if iPacketEmptySolts < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end
		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，系数60，等级80
		--需求奖励2：给代币

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iFestivalAward = 2									--节日奖励系数加成
		local iExpAwardMutli = 60
		local iItemId = 32627
		local iIndex = 180022										--根据全局变量的值给予奖励
		local iItemNum = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex)
		if iItemNum < 1 then
			iItemNum = 1
		end
   		if bSuccess then
			if iPlayerLevel < 80 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[80])
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId, iItemNum, true)
			if iItemNum >=20 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 11489)	--如果完成S级评价，道具数才能是20，此时发成就任务11489
			end
   		end
   		return 0
   	end
}

TaskList[11419] = --嘉年华第二关脚本任务发奖，关联全局变量180021
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bAbsoluteTime = true,
  		bShowPrompt = false,
  		bFinishWhenDelvier = true,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,
		iClearFinishCountDay=7,
		iClearFinishCountHour=0,
		iClearFinishCountMin=1,


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

		Gold = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值

		end

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--获取玩家等级
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数量

	   	if iPlayerLev < 40 then
	   	  return TASK_PREREQU_FAIL_LUA_TASK
	   	end
		if iPacketEmptySolts < 1 then
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
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数
		if bSuccess then
			if iPacketEmptySolts < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end
		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，系数70，等级80
		--需求奖励2：给代币

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iFestivalAward = 2									--节日奖励系数加成
		local iExpAwardMutli = 70
		local iItemId = 32627
		local iIndex = 180021										--根据全局变量的值给予奖励
		local iValue = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex)
		local iItemNum = math.floor(iValue/10)						--给予道具数量为变量数值除以10
		if iItemNum < 1 then
			iItemNum = 1
		end
   		if bSuccess then
			if iPlayerLevel < 80 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[80])
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId, iItemNum, true)
			if iValue <= -100 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 11490)	--如果总分小于-100分，给予成就任务11490
			end
   		end
   		return 0
   	end
}

TaskList[11420] = --嘉年华第三关脚本任务发奖，关联全局变量180023
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bAbsoluteTime = true,
  		bShowPrompt = false,
  		bFinishWhenDelvier = true,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,
		iClearFinishCountDay=7,
		iClearFinishCountHour=0,
		iClearFinishCountMin=1,

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

		Gold = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值

		end

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--获取玩家等级
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数量

	   	if iPlayerLev < 40 then
	   	  return TASK_PREREQU_FAIL_LUA_TASK
	   	end
		if iPacketEmptySolts < 1 then
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
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数
		if bSuccess then
			if iPacketEmptySolts < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end
		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，系数80，等级80
		--需求奖励2：给代币

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iFestivalAward = 2									--节日奖励系数加成
		local iExpAwardMutli = 80
		local iItemId = 32627
		local iIndex = 180023										--根据全局变量的值给予奖励
		local iValue = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex)
		local iItemNum = math.floor(iValue/3)						--给予道具数量为变量数值除以3
		if iItemNum < 1 then
			iItemNum = 1
		end
   		if bSuccess then
			if iPlayerLevel < 80 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[80])
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId, iItemNum, true)
   		end
   		return 0
   	end
}

TaskList[11421] = --嘉年华第四关脚本任务发奖，关联全局变量180031到180036
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bAbsoluteTime = true,
  		bShowPrompt = false,
  		bFinishWhenDelvier = true,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,
		iClearFinishCountDay=7,
		iClearFinishCountHour=0,
		iClearFinishCountMin=1,

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

		Gold = function(TASKINTERFACE_POINTER)
			return 0--返回0时为？？？，其他为显示的值

		end

	}
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--获取玩家等级
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数量

	   	if iPlayerLev < 40 then
	   	  return TASK_PREREQU_FAIL_LUA_TASK
	   	end
		if iPacketEmptySolts < 1 then
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
		local iPacketEmptySolts =TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)	--获取包的空格数
		if bSuccess then
			if iPacketEmptySolts < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end
		return 0
   	end
   	,

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--需求奖励1：给经验，系数60加系数（系数最高30，最低0），等级80
		--需求奖励2：给代币
		local tTaskCorresGlobal = {[1]={task=11448,num=180031},
									[2]={task=11449,num=180032},
									[3]={task=11450,num=180033},
									[4]={task=11451,num=180034},
									[5]={task=11452,num=180035},
									[6]={task=11453,num=180036},}
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iFestivalAward = 2									--节日奖励系数加成
		local iExpAwardMutli = 60
		local iItemId = 32627
		local iItemNum = 0
		--检查玩家哪个任务完成过，任务与变量一一对应
		for key,value in pairs(tTaskCorresGlobal) do
			local finish_num = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,tTaskCorresGlobal[key].task)
			if finish_num == 1 then
				local iValue = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, tTaskCorresGlobal[key].num)
				local tmp_num = math.floor((600 - iValue)/20)		--系数是完成10分钟与完成时间的差，完成越快系数越高
				if tmp_num <= 0 then
					tmp_num = 0
				end
				iItemNum = iItemNum + tmp_num
				iExpAwardMutli = iExpAwardMutli + tmp_num
				break
			end
		end
		if iItemNum < 1 then
			iItemNum = 1
		end
   		if bSuccess then
			if iPlayerLevel < 80 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[80])
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemId, iItemNum, true)
   		end
   		return 0
   	end
}
TaskList[13387] = --高手征集令小号额外奖励任务第二步脚本任务
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		--bCanGiveUp = true,
		bHiddenTask = true,
  		bAbsoluteTime = true,
  		bShowPrompt = false,
  		bFinishWhenDelvier = true,

  		--bRecordFinishCount = true,
  		--iMaxFinishCount = 1,
  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.FuBen,
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

   		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--奖励:根据玩家所在世界ID给予经验
		local CurSiteAward = {
							[1]={Map=201,Exp=150,Level=20},
							[2]={Map=202,Exp=200,Level=39},
							[3]={Map=203,Exp=480,Level=49},
							[4]={Map=204,Exp=400,Level=59},
							[5]={Map=216,Exp=270,Level=39},
							[6]={Map=217,Exp=340,Level=49},
							[7]={Map=205,Exp=500,Level=59},
							[8]={Map=206,Exp=550,Level=64},
							[9]={Map=207,Exp=600,Level=69},
							}
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iPlayerMap = TaskCApi.GetPlayerCurSite(TASKINTERFACE_POINTER)
		local iPlayerVip = TaskCApi.HasBuff(TASKINTERFACE_POINTER,2164)
		local iExpAwardLevel = 0
		local iExpAwardMutli = 0

   		if bSuccess then
			for i= 1, #CurSiteAward do
				if iPlayerMap == CurSiteAward[i].Map then
					if iPlayerVip == true then
						iExpAwardMutli = CurSiteAward[i].Exp * 3
					else
						iExpAwardMutli = CurSiteAward[i].Exp
					end
					if iPlayerLevel <= CurSiteAward[i].Level then
						iExpAwardLevel = iPlayerLevel
					else
						iExpAwardLevel = CurSiteAward[i].Level
					end
					TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iExpAwardLevel])
					break
				end
			end
   		end
   		return 0
   	end
}
TaskList[13388] = --高手征集令大号奖励脚本任务
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		--bCanGiveUp = true,
		bHiddenTask = true,
  		bAbsoluteTime = true,
  		bShowPrompt = false,
  		bFinishWhenDelvier = true,

  		--bRecordFinishCount = true,
  		--iMaxFinishCount = 1,
  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.FuBen,
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

   		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--奖励:根据玩家所在世界ID给予经验
		local CurSiteAward = {
							[1]={Map=201,Exp=30,Level=70,Reputation=50,LimitTaskNum=1},
							[2]={Map=202,Exp=90,Level=70,Reputation=150,LimitTaskNum=3},
							[3]={Map=203,Exp=120,Level=70,Reputation=250,LimitTaskNum=5},
							[4]={Map=204,Exp=120,Level=70,Reputation=300,LimitTaskNum=6},
							[5]={Map=216,Exp=120,Level=70,Reputation=200,LimitTaskNum=4},
							[6]={Map=217,Exp=120,Level=70,Reputation=250,LimitTaskNum=5},
							[7]={Map=205,Exp=150,Level=80,Reputation=350,LimitTaskNum=7},
							[8]={Map=206,Exp=150,Level=80,Reputation=400,LimitTaskNum=8},
							[9]={Map=207,Exp=150,Level=80,Reputation=500,LimitTaskNum=10},
							}
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iPlayerMap = TaskCApi.GetPlayerCurSite(TASKINTERFACE_POINTER)
		local iPlayerLimitTask = 12961			--计次任务ID
		local iPlayerLimitTaskFinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iPlayerLimitTask)	--计次任务完成次数
		local iPlayerReputa = 11				--恩德值的声望编号
		local iExpAwardLevel = 0
		local iExpAwardMutli = 0

   		if bSuccess then
			if iPlayerLimitTaskFinishTime < 50 then
				for i= 1, #CurSiteAward do
					if iPlayerMap == CurSiteAward[i].Map then
						if iPlayerLevel <= CurSiteAward[i].Level then
							iExpAwardLevel = iPlayerLevel
						else
							iExpAwardLevel = CurSiteAward[i].Level
						end
						iExpAwardMutli = CurSiteAward[i].Exp
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iExpAwardLevel])
						TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,iPlayerReputa, CurSiteAward[i].Reputation)
						TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, iPlayerLimitTask, CurSiteAward[i].LimitTaskNum)
						TaskCApi.Broadcast(TASKINTERFACE_POINTER ,13388, TaskBroadcastChannel.Trade)
						break
					end
				end
			end
   		end
   		return 0
   	end
}
TaskList[14276] = --春节礼物脚本任务
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		--bCanGiveUp = true,
		bHiddenTask = true,
  		bAbsoluteTime = true,
  		bShowPrompt = false,
  		bFinishWhenDelvier = true,

  		--bRecordFinishCount = true,
  		--iMaxFinishCount = 1,
  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

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

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--奖励:50级以下经验，50级以上额外召唤宠物灵魂一个
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		if iPlayerLevel >= 50 then
			math.randomseed(os.time())
			local tmp_random_num = math.random(1,1000)
			if tmp_random_num == 1 or tmp_random_num == 2 then									--陵寝守护兽
				TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14276, 1, 1)
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4019, 1)
			elseif tmp_random_num == 3 or tmp_random_num == 4 then								--霸王龙骨
				TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14276, 1, 2)
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4018, 1)
			elseif tmp_random_num == 5 or tmp_random_num == 6 or tmp_random_num == 7 then		--纳迦公主
				TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14276, 1, 3)
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4017, 1)
			elseif tmp_random_num == 8 or tmp_random_num == 9 or tmp_random_num == 10 then	--暴风雏龙
				TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14276, 1, 4)
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4016, 1)
			elseif tmp_random_num > 10 and tmp_random_num <=60 then							--阿波菲斯
				TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14276, 1, 5)
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4015, 1)
			elseif tmp_random_num > 60 and tmp_random_num <=110 then							--花妖
				TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14276, 1, 6)
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4014, 1)
			elseif tmp_random_num > 110 and tmp_random_num <=340 then							--螃蟹
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4013, 1)
			elseif tmp_random_num > 340 and tmp_random_num <=560 then							--蜘蛛
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4012, 1)
			elseif tmp_random_num > 560 and tmp_random_num <=780 then							--密林之友
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4011, 1)
			elseif tmp_random_num > 780 and tmp_random_num <=1000 then							--熊
				TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 4010, 1)
			end
		end
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
		--获取随机数据，1到6之间世界公告
		if bSuccess then
			local random_num = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14276,1)
			if random_num >=1 or random_num <= 6 then
				TaskCApi.Broadcast(TASKINTERFACE_POINTER ,14276, TaskBroadcastChannel.System)
			end
		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用


   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--奖励:50级以下经验，50级以上额外召唤宠物灵魂一个，经验修正等级只到40

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iExpAwardMutli = 2700

   		if bSuccess then
			if iPlayerLevel < 40 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[40])
			end
   		end
   		return 0
   	end
}
