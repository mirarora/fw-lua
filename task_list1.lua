---------------------------------------------------------------
--  created:   2010.3.17
--  author:    ld
--
--  内容：任务脚本文件。
---------------------------------------------------------------
----	脚本任务列表：by xzy
----	TaskList[9445] = --	测试任务
----	TaskList[9619] = --	社交家：我在克兰蒙多的日子
----	TaskList[9928] = --	40级足迹卡片重复任务
----	TaskList[10631] = --个人幸运活动
----	TaskList[10763] = --日常-服务器幸运活动1
----	TaskList[10764] = --日常-服务器幸运活动2
----	TaskList[11417] = --试炼次数转补偿
----	TaskList[11712] = --幸运陀螺
----	TaskList[11757] = --公会基地商城物品快捷完成基地任务并捐资金

----	1st edition:	2010.6.8
---------------------------------------------------------------


TaskList[9445] = --xiaozhiyu测试任务，使用物品24181接到

{
	AllTasks=
	{	9706,	--自由港生活
		7978,	--学习
		7787,	--厨师练习
		7815,	--炼金练习
	}
	,
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local iRandomNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,9445, 1)
			return iRandomNum
		end
		,
	}
	,
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = true,
  		bCanSeekOut = false,

  		iType  = TaskType.SheJiaoJia,
  		iTopic = TaskTopic.YiBan,

		bFinishWhenDelvier = false,	--接受即完成！
  	}
   	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		local iRandomNum = math.random(1,table.getn(TaskList[9445].AllTasks))
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,9445, 1,iRandomNum)
		TaskCApi.Broadcast(TASKINTERFACE_POINTER ,9445, 2)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
		local iRandomNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,9445, 1)
   		local Method = {}
--    		Method.CompleteTask = {TaskID = TaskList[9445].AllTasks[iRandomNum], Num = 1}
--    		Method.iWaitTime = 0
		Method.SubmitItem = true
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
 		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,9445)
		if itemIDSubmitted == 4494 and itemNumberSubmitted >= 3 then
			iRet = TASK_SUCC_FINISH
		elseif  itemIDSubmitted == 4494 and itemNumberSubmitted < 3 then
			TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 9445, 29, 20001)
		else
			TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 9445, 29, 20000)
		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9627)
   		end

   		return 0
   	end
}



TaskList[9619] = --社交家：我在克兰蒙多的日子

{
  	iTaskAll =	--任务全列表，可扩充。id是任务id，lv是最低领取等级，lvmax是最高领取等级
	{
		{id = 9147, lv = 40, lvmax = 200,},
		{id = 9148, lv = 40, lvmax = 200,},
		{id = 9149, lv = 40, lvmax = 200,},
		{id = 9150, lv = 40, lvmax = 200,},
		{id = 9151, lv = 40, lvmax = 200,},
		{id = 9156, lv = 40, lvmax = 200,},
		{id = 9162, lv = 40, lvmax = 200,},
		{id = 9163, lv = 40, lvmax = 200,},
		{id = 9164, lv = 40, lvmax = 200,},
		{id = 9165, lv = 40, lvmax = 200,},
		{id = 9166, lv = 40, lvmax = 200,},
		{id = 9152, lv = 44, lvmax = 52,},
		{id = 9157, lv = 43, lvmax = 200,},
		{id = 9153, lv = 47, lvmax = 55,},
		{id = 9158, lv = 46, lvmax = 200,},
		{id = 9154, lv = 51, lvmax = 59,},
		{id = 9159, lv = 50, lvmax = 200,},
		{id = 9155, lv = 54, lvmax = 62,},
		{id = 9160, lv = 53, lvmax = 200,},
		{id = 9161, lv = 56, lvmax = 200,},
		{id = 9281, lv = 57, lvmax = 65,},
		{id = 11304, lv = 40, lvmax = 200,},
		{id = 11305, lv = 40, lvmax = 200,},
		{id = 11306, lv = 40, lvmax = 200,},
		{id = 11307, lv = 40, lvmax = 200,},
	}
	,
	AwardPreview = {}
	,
	Property =
  	{
		bHiddenTask = true,			--隐藏任务 2010.6.19 新增属性
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = true,
  		bFinishWhenDelvier = true,	--接受即完成！

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.SheJiaoJia,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 40 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--需要社交家等级至少为3级
		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, 32) then
			return TASK_PREREQU_FAIL_LUA_TASK
		elseif TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER, 32) < 3 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		--任务栏是否已满
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9147)
		if iRet ~= 0 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		--身上是否有互斥任务
		for i,v in ipairs( TaskList[9619].iTaskAll ) do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v.id) then
				return TASK_PREREQU_FAIL_LUA_TASK
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
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   	    	local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9147)
			if iRet ~= 0 then
			    return iRet
			end
   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)

		local iTaskToDeliver ={}	--根据等级筛选出的列表
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		for i,v in ipairs(TaskList[9619].iTaskAll) do
			if iPlayerLev >= v.lv and iPlayerLev <= v.lvmax then
				table.insert(iTaskToDeliver,v)
			end
		end

   		if bSuccess then

			--从筛选出的列表中随机一个任务发放
			math.randomseed(os.time())
			local iRandomNum = math.random(1, table.getn(iTaskToDeliver))
			local FinalTask = iTaskToDeliver[iRandomNum].id
			----------------debug模式--start--------------------------
			local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
			if item2053 ~= 0 then
				FinalTask = item2053
			end
			----------------debug模式--end----------------------------
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, FinalTask)

   		end

   		return 0
   	end
}

--[[---------------------------------------------------

神之试炼补偿任务，相关逻辑原件。本脚本任务是w。

－－－－－－－－－分割线－－－－－－－－－－－－－－－－
逻辑最终呈现

1）今天是周一，不能补。
2）今天是周二，如果周一我没做试炼，今天可以补1次。如果昨天我做了试炼，今天不能补。
3）今天是周三，补过的就不算缺的了。如果前两天我缺1次，可以补1次。如果缺2次，可以补2次。
4）今天是周四，补过的就不算缺的了。如果前三天我缺1次，可以补1次。如果缺2次，可以补2次。如果缺3次，可以补3次。
5）今天是周五，补过的就不算缺的了。如果前四天我缺1次，可以补1次。如果缺2次，可以补2次。如果缺3次，可以补3次。
6）今天是周六，补过的就不算缺的了。如果前五天我缺1次，可以补1次。如果缺2次，可以补2次。如果缺3次，可以补3次。
7）今天是周日，补过的就不算缺的了。如果前六天我缺1次，可以补1次。如果缺2次，可以补2次。如果缺3次，可以补3次。

逻辑过程

编辑器任务x，计数用，记录本周周一起，试炼了几次。每周日23：59清空。接到即完成。【9821 功能-副本-神之试炼-本周完成次数】
编辑器任务y，计数用，记录本周周一起，补偿了几次。每周日23：59清空。接到即完成。【9820 功能-副本-神之试炼-补偿总次数】
编辑器任务n1，被判断用，用于r1判断是否今日可做。每天清空。接到即完成。【9827 功能-副本-神之试炼补偿-n1】
编辑器任务n2，被判断用，用于r2判断是否今日可做。完成后发出n1。每天清空。接到即完成。【9828 功能-副本-神之试炼补偿-n2】
编辑器任务n3，被判断用，用于r3判断是否今日可做。完成后发出n2。每天清空。接到即完成。【9829 功能-副本-神之试炼补偿-n3】

脚本任务w，隐藏，试炼后发出，根据今天周几、x、y三个数据的情况，该补1次就发n1，该补2次就发n2，该补3次就发n3。【9826 功能-副本-神之试炼补偿主任务】
编辑器任务r1，实际补偿任务，每天1次，前提是n1已完成。每天清空。【9806 功能-副本-神之试炼补偿1次】
编辑器任务r2，实际补偿任务，每天1次，前提是n2已完成，且r1完成1次。每天清空。【9807 功能-副本-神之试炼补偿2次】
编辑器任务r3，实际补偿任务，每天1次，前提是n3已完成，且r2完成1次。每天清空。【9808 功能-副本-神之试炼补偿3次】

物品b1：小补丸。
物品b2：大补丸。

角色创建距今满24小时数量（向上取整）z。

根据周几、x、y、z四个数据，判断发放n1、n2、n3的逻辑
1）如果今天是周一，不做任何事情。
2）如果今天是周二，计算min(1,min(2,z)-x-y)，如果是0啥都不做，是1发任务n1
3）如果今天是周三，计算min(2,min(3,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2
4）如果今天是周四，计算min(3,min(4,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3
5）如果今天是周五，计算min(3,min(5,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3
6）如果今天是周六，计算min(3,min(6,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3
7）如果今天是周日，计算min(3,min(7,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3

--]]
TaskList[9826] = --  功能-副本-神之试炼补偿主任务（w）
{
	Params =
	{
		taskXID = 9821,				--任务x的id   功能-副本-神之试炼-本周完成次数
		taskYID = 9820,				--任务y的id   功能-副本-神之试炼-补偿总次数
		taskN1ID = 9827,			--任务n1的id  功能-副本-神之试炼补偿-n1
		taskN2ID = 9828,			--任务n2的id  功能-副本-神之试炼补偿-n1
		taskN3ID = 9829,			--任务n3的id  功能-副本-神之试炼补偿-n1
	}
	,

  	Property =
  	{
		bHiddenTask = true,			--隐藏任务 2010.6.19 新增属性
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = false,

  		bShowPrompt = false,		--不显示提示
  		bCanSeekOut = false,		--不能被追踪
  		bFinishWhenDelvier = true,	--接受即完成！

  		bRecordFinishCount = false, --不限完成次数

  		iType  = TaskType.GongNeng,	--是功能任务
  		iTopic = TaskTopic.YiBan,
  	}
   	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		--什么都不做，包括检查任务栏是否有空

		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		--什么都不做

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)

		--无条件

   		local Method = {}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)

		--无条件完成

   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

		--不判断是否够地方拿到任务n

   		return 0
   	end
   	,

   	--发放补偿次数n1－n3，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3
   	DeliveryTaskN = function(TASKINTERFACE_POINTER, canCompensateTimesToday)
		if canCompensateTimesToday == 1 then
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,TaskList[9826].Params.taskN1ID)
		end
		if canCompensateTimesToday == 2 then
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,TaskList[9826].Params.taskN2ID)
		end
		if canCompensateTimesToday == 3 then
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,TaskList[9826].Params.taskN3ID)
		end
		return nil
	end
	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)

		--取出星期几，放入dayInWeek中，周日是1，周一是2...
		local timePackage = os.date("*t", os.time());
		local dayInWeek = timePackage.wday;

		--本周已做试炼次数和本周已补次数
		local timesX = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[9826].Params.taskXID)
		local timesY = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[9826].Params.taskYID)

		--考虑角色创建时间，看今天能补几次
		local createUserSeconds = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)
		local nowSeconds = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
		local period = nowSeconds - createUserSeconds
		local timesOnCreate = math.ceil(period/86400)  -- 这就是z，本周最多做＋补次数，“次数”“基于”“创建时间”

--		--debug:start
--		--if TaskCApi.IsCaptain(TASKINTERFACE_POINTER) then
--			local t = timePackage.hour*10000+timePackage.min*100+timePackage.sec
--		    TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91999,t)
--		    TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91001,timesX)
--		    TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91002,timesY)
--		--end
--		--debug:end

--		--debug:start
--		TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91001,createUserSeconds)
--		TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91002,nowSeconds)
--		TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91003,period)
--		TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91004,timesOnCreate)
--		TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91005,timesX)
--		TaskCApi.SetGlobalDataEx (TASKINTERFACE_POINTER,91006,timesY)
--		--debug:end

		--根据周几、x、y、z四个数据，判断发放n1、n2、n3的逻辑
		--1）如果今天是周一，不做任何事情。

		--2）如果今天是周二，计算min(1,min(2,z)-x-y)，如果是0啥都不做，是1发任务n1
		if dayInWeek == 3 then
		    local canDoAndComThisWeek = math.min(2,timesOnCreate)
			local canCompensateTimesToday = math.min(1,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

		--3）如果今天是周三，计算min(2,min(3,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2
		if dayInWeek == 4 then
		    local canDoAndComThisWeek = math.min(3,timesOnCreate)
			local canCompensateTimesToday = math.min(2,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

		--4）如果今天是周四，计算min(3,min(4,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3
		if dayInWeek == 5 then
		    local canDoAndComThisWeek = math.min(4,timesOnCreate)
			local canCompensateTimesToday = math.min(3,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end


		--5）如果今天是周五，计算min(3,min(5,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3
		if dayInWeek == 6 then
		    local canDoAndComThisWeek = math.min(5,timesOnCreate)
			local canCompensateTimesToday = math.min(3,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

		--6）如果今天是周六，计算min(3,min(6,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3
		if dayInWeek == 7 then
		    local canDoAndComThisWeek = math.min(6,timesOnCreate)
			local canCompensateTimesToday = math.min(3,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

		--7）如果今天是周日，计算min(3,min(7,z)-x-y)，如果是0啥都不做，是1发放任务n1，是2发放任务n2，是3发放任务n3
		if dayInWeek == 1 then
		    local canDoAndComThisWeek = math.min(7,timesOnCreate)
			local canCompensateTimesToday = math.min(3,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

   		return 0
   	end
   	,

}
-----------------------------------------------------

TaskList[9928] = --足迹-重复-40级

{
  	iTaskAll =	--任务全列表，可扩充。id是任务id，lv是最低领取等级，lvmax是最高领取等级
	{
		{id = 9749, lv = 40, lvmax = 200,},
		{id = 9750, lv = 40, lvmax = 200,},
		{id = 9751, lv = 40, lvmax = 200,},
		{id = 9752, lv = 40, lvmax = 200,},
		{id = 9753, lv = 40, lvmax = 200,},
		{id = 9768, lv = 43, lvmax = 200,},
		{id = 9769, lv = 43, lvmax = 200,},
		{id = 9770, lv = 43, lvmax = 200,},
		{id = 9771, lv = 43, lvmax = 200,},
		{id = 9772, lv = 43, lvmax = 200,},
		{id = 9792, lv = 46, lvmax = 200,},
		{id = 9793, lv = 46, lvmax = 200,},
		{id = 9794, lv = 46, lvmax = 200,},
		{id = 9809, lv = 50, lvmax = 200,},
		{id = 9810, lv = 50, lvmax = 53,},
		{id = 9811, lv = 50, lvmax = 200,},
		{id = 9849, lv = 56, lvmax = 200,},
		{id = 9850, lv = 56, lvmax = 200,},

	}
	,
	AwardPreview = {}
	,
	Property =
  	{
		bHiddenTask = true,			--隐藏任务 2010.6.19 新增属性
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bFinishWhenDelvier = true,	--接受即完成！

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.SheJiaoJia,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 40 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--任务栏是否已满
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9749)
		if iRet ~= 0 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		--身上是否有互斥任务
		for i,v in ipairs( TaskList[9928].iTaskAll ) do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v.id) then
				return TASK_PREREQU_FAIL_LUA_TASK
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
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   	    	local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9749)
			if iRet ~= 0 then
			    return iRet
			end
   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)

		local iTaskToDeliver ={}	--根据等级筛选出的列表
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		for i,v in ipairs(TaskList[9928].iTaskAll) do
			if iPlayerLev >= v.lv and iPlayerLev <= v.lvmax then
				table.insert(iTaskToDeliver,v)
			end
		end

   		if bSuccess then

			--从筛选出的列表中随机一个任务发放
			math.randomseed(os.time())
			local iRandomNum = math.random(1, table.getn(iTaskToDeliver))
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iTaskToDeliver[iRandomNum].id)

   		end

   		return 0
   	end
}

TaskList[10631] = --日常-每日幸运活动

{
	AllTasks=
    {
     [1]={order=1,task=9702,count=10,lvmin=1,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="stay",wt=1,sug=0,wtsug=1,},
     [2]={order=2,task=6026,count=5,lvmin=20,lvmax=30,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [3]={order=3,task=5976,count=5,lvmin=23,lvmax=30,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [4]={order=4,task=6040,count=5,lvmin=26,lvmax=30,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [5]={order=5,task=6058,count=3,lvmin=30,lvmax=40,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [6]={order=6,task=6203,count=5,lvmin=33,lvmax=40,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [7]={order=7,task=6162,count=3,lvmin=36,lvmax=40,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [8]={order=8,task=5557,count=5,lvmin=40,lvmax=50,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [9]={order=9,task=5290,count=5,lvmin=43,lvmax=50,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [10]={order=10,task=5245,count=5,lvmin=46,lvmax=50,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [11]={order=11,task=5061,count=5,lvmin=50,lvmax=60,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [12]={order=12,task=5370,count=5,lvmin=53,lvmax=60,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [13]={order=13,task=5256,count=5,lvmin=56,lvmax=60,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="bind",wt=5,sug=1,wtsug=100,},
     [14]={order=14,task=8640,count=1,lvmin=40,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=1,wtsug=100,},
     [15]={order=15,task=9706,count=10,lvmin=10,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="life",wt=1,sug=2,wtsug=20,},
     [16]={order=16,task=8204,count=3,lvmin=35,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=2,wtsug=100,},
     [17]={order=17,task=8143,count=1,lvmin=20,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=2,sug=2,wtsug=40,},
     [18]={order=18,task=6866,count=1,lvmin=20,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="god",wt=1,sug=3,wtsug=20,},
     [19]={order=19,task=9927,count=1,lvmin=15,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=3,class="item",wt=2,sug=3,wtsug=40,},
     [20]={order=20,task=8361,count=1,lvmin=20,lvmax=34,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [21]={order=21,task=8362,count=1,lvmin=35,lvmax=44,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [22]={order=22,task=8363,count=1,lvmin=45,lvmax=54,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [23]={order=23,task=8364,count=1,lvmin=55,lvmax=64,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [24]={order=24,task=9873,count=1,lvmin=63,lvmax=67,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [25]={order=25,task=9874,count=1,lvmin=68,lvmax=80,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [26]={order=26,task=7897,count=1,lvmin=20,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=5,wtsug=100,},
     [27]={order=27,task=9926,count=1,lvmin=40,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=5,wtsug=100,},
     [28]={order=28,task=9927,count=1,lvmin=15,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=5,class="item",wt=2,sug=5,wtsug=40,},
     [29]={order=29,task=8153,count=1,lvmin=25,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="luola",wt=5,sug=6,wtsug=100,},
     [30]={order=30,task=10417,count=1,lvmin=30,lvmax=39,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [31]={order=31,task=10418,count=1,lvmin=40,lvmax=49,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [32]={order=32,task=10419,count=1,lvmin=50,lvmax=59,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [33]={order=33,task=10420,count=1,lvmin=60,lvmax=64,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [34]={order=34,task=10421,count=1,lvmin=65,lvmax=69,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [35]={order=35,task=9745,count=1,lvmin=71,lvmax=74,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [36]={order=36,task=9747,count=1,lvmin=75,lvmax=79,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [37]={order=37,task=8147,count=1,lvmin=25,lvmax=49,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=2,sug=6,wtsug=40,},
     [38]={order=38,task=8640,count=1,lvmin=40,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=6,class="item",wt=5,sug=6,wtsug=100,},
     [39]={order=39,task=9927,count=1,lvmin=15,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=7,class="money",wt=5,sug=7,wtsug=200,},
     [40]={order=40,task=7692,count=1,lvmin=30,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="pet",wt=5,sug=7,wtsug=100,},
     [41]={order=41,task=9966,count=1,lvmin=35,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=7,wtsug=100,},
     [42]={order=42,task=10101,count=1,lvmin=40,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=0,wtsug=100,},
     [43]={order=43,task=5340,count=3,lvmin=30,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [44]={order=44,task=5999,count=5,lvmin=30,lvmax=38,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [45]={order=45,task=5871,count=5,lvmin=40,lvmax=59,subid=33,sublvmin=1,sublvmax=1,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [46]={order=46,task=5998,count=5,lvmin=40,lvmax=59,subid=33,sublvmin=2,sublvmax=50,weekday=0,class="item",wt=20,sug=0,wtsug=20,},
     [47]={order=47,task=9966,count=1,lvmin=35,lvmax=200,subid=35,sublvmin=2,sublvmax=50,weekday=0,class="item",wt=20,sug=0,wtsug=20,},
     [48]={order=48,task=7787,count=1,lvmin=20,lvmax=200,subid=1,sublvmin=5,sublvmax=50,weekday=0,class="item",wt=20,sug=0,wtsug=20,},
     [49]={order=49,task=7815,count=1,lvmin=20,lvmax=200,subid=0,sublvmin=5,sublvmax=50,weekday=0,class="item",wt=20,sug=0,wtsug=20,},
     [50]={order=50,task=7995,count=3,lvmin=20,lvmax=200,subid=32,sublvmin=3,sublvmax=50,weekday=0,class="item",wt=30,sug=0,wtsug=30,},
     [51]={order=51,task=10615,count=2,lvmin=30,lvmax=34,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [52]={order=52,task=10616,count=2,lvmin=35,lvmax=39,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [53]={order=53,task=10617,count=2,lvmin=40,lvmax=44,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [54]={order=54,task=10618,count=2,lvmin=45,lvmax=49,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [55]={order=55,task=10619,count=2,lvmin=50,lvmax=54,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [56]={order=56,task=10621,count=2,lvmin=55,lvmax=59,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [57]={order=57,task=10622,count=2,lvmin=60,lvmax=64,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [58]={order=58,task=10623,count=2,lvmin=65,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [59]={order=59,task=11316,count=1,lvmin=50,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=1,sug=6,wtsug=100,},
     [60]={order=60,task=11421,count=1,lvmin=200,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="OnlyOnce",wt=5,sug=2,wtsug=100,},
     [61]={order=61,task=11520,count=1,lvmin=45,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=1,class="PVP",wt=0,sug=1,wtsug=100,},
    },

	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			--基础经验数据
			local baseExp = 150 	--本体经验
			local expMulti = 1		--对本体经验的加成系数初始值
			local greenPlus = 0.2	--绿色幸运任务的经验加成
			local bluePlus = 0.6	--蓝色幸运任务的经验加成
			local strugglePlus = 0	--社交家挑战的经验加成初始值
			--取得幸运陀螺任务、绿幸运任务引子、蓝幸运任务引子的完成次数
			local dice_count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11712)
			local green_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
			local blue_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11760)
			--取得玩家等级数据
			local player={}
			player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--根据玩家等级，从全局表里找到对应的等级经验系数
			local iExperience = TaskExpAdjust[player.level]

			--计算最终的经验
			if green_luck >= 1 then
				expMulti = expMulti + greenPlus
			elseif blue_luck >=1 then
				expMulti = expMulti + bluePlus
			end
			return math.floor(iExperience * baseExp * expMulti)
		end
		,
	}
	,
	Property =
  	{
		bUIButtonTask = true,
		bHiddenTask = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false,
		bAbsoluteTime = true,	--是否是绝对时间（用于任务时限，线下时间是否计入任务时间）

		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iTaskID = 11711	--个人幸运任务的互斥任务的id
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
	   	if iPlayerLev < 30 then
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
	   	end
		if iCount >= 1 then	--互斥任务完成过1次（幸运任务失败时会发互斥任务）
			return TASK_PREREQU_FAIL_LUA_TASK
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		--取得玩家等级&副职业等级数据
		local subprof_available = {0,1,2,3,4,5,6,7,9,10,11,32,33,34,35}		--开放的副职业，id从0开始
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		player.sublevel = {}
		for i,v in ipairs(subprof_available) do
			if TaskCApi.HasSideOccup(TASKINTERFACE_POINTER,v) then
				player.sublevel[v+1] = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,v)
			else
				player.sublevel[v+1] = 0
			end
		end

		--取出星期几，放入dayInWeek中，周日是1，周一是2, 周二是3，周三是4, 周四是5，周五是6, 周六是7
		local timePackage = os.date("*t", os.time())
		local dayInWeek = timePackage.wday
		local monthNum,dayNum = timePackage.month,timePackage.day
		--定义基本库
		local iTaskToDeliver = {}
		--定义权重合计值变量，初始值为0
		local wtTotal = 0
		--取得幸运陀螺任务、绿幸运任务引子、蓝幸运任务引子的完成次数
		local dice_count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11712)
		local green_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
		local blue_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11760)

		--遍历原始表，按条件筛选数据，并压进基本库
		for i,v in ipairs(TaskList[10631].AllTasks) do
			--如果是今日推荐活动，且，没有使用过幸运陀螺，那么采用推荐权重替换平时权重
			if v.sug == dayInWeek and (dice_count == 0 or dice_count == nil) then
				v.wt = v.wtsug
			end
			--进行筛选，并压进基本库（需要对OnlyOnce的任务进行特殊处理，使得每周只能随到1次）
			if v.class ~= "OnlyOnce" or TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,v.task) < 1 then	--本周只能随一次的任务没有被做过
				if v.weekday == dayInWeek or v.weekday == 0 then	--是本日才能做的 或者 全周都能做的
					if player.level >= v.lvmin and player.level <= v.lvmax	then	--满足等级要求
						if not v.subid or v.subid == -1 then	--没有副职业需求的
							table.insert(iTaskToDeliver,v)
							wtTotal = wtTotal + v.wt	--累计权重
						elseif player.sublevel[v.subid + 1] >= v.sublvmin and player.sublevel[v.subid + 1] <= v.sublvmax	then --满足副职业等级要求
							table.insert(iTaskToDeliver,v)
							wtTotal = wtTotal + v.wt	--累计权重
						end
					end
				end
			end
		end
		--保护措施
		if 	not iTaskToDeliver[1] then
			iTaskToDeliver[1] = TaskList[10631].AllTasks[1]
			wtTotal = 1
		end

		--进行随机，把order存入任务变量1
		local iRandomNum = math.random( 1 , wtTotal)
		local wtFloor = 0
		local orderToSet = 1	--缺省的order
		for i,v in ipairs(iTaskToDeliver) do
			if iRandomNum > wtFloor and iRandomNum <= wtFloor + v.wt then
				orderToSet = v.order
				break
			end
			wtFloor = wtFloor + v.wt
		end
		--把是否绿色或蓝色幸运，存入任务变量2
		local luckColor = 0		--普通0，绿色1，蓝色2
		if green_luck >= 1 then
			luckColor = 1
		elseif blue_luck >= 1 then
			luckColor = 2
		end

		--------------------------------------------------测试gm:start-----------------------------------------------------
		local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
		if item2053 ~= 0 then
			orderToSet = item2053
		end
		--------------------------------------------------测试over---------------------------------------------------------

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10631, 1,orderToSet)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10631, 2,luckColor)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10631, 3,monthNum)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10631, 4,dayNum)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
		local orderNow = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10631, 1)
   		local Method = {}
   		Method.CompleteTask = {TaskID = TaskList[10631].AllTasks[orderNow].task, Num = TaskList[10631].AllTasks[orderNow].count}
   		Method.iTimeLimit = 79200
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local orderNow = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10631, 1)
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[10631].AllTasks[orderNow].task)
		if iCount >= TaskList[10631].AllTasks[orderNow].count then
			iRet = TASK_SUCC_FINISH
		end
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 10631)
   		if ulCurTime - ulDeliverTime > 79200 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		math.randomseed(os.time())
		--基础经验数据
		local baseExp = 150 	--本体经验
		local expMulti = 1		--对本体经验的加成系数初始值
		local greenPlus = 0.2	--绿色幸运任务的经验加成
		local bluePlus = 0.6	--蓝色幸运任务的经验加成
		local strugglePlus = 0	--社交家挑战的经验加成初始值
		--取得幸运陀螺任务、绿幸运任务引子、蓝幸运任务引子的完成次数
		local dice_count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11712)
		local green_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
		local blue_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11760)

		--取得玩家等级数据
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--根据玩家等级，从全局表里找到对应的等级经验系数
		local iExperience = TaskExpAdjust[player.level]

		--计算最终的经验
		if green_luck >= 1 then
			expMulti = expMulti + greenPlus
		elseif blue_luck >=1 then
			expMulti = expMulti + bluePlus
		end

   		if bSuccess then
			if player.level >= 35 then	--等级大于35级才有可能获得更高的经验档位
				local iRand = math.random(1,4000)
				if iRand == 1 then
					expMulti = expMulti + 3
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10631,8)
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,10633)--10633幸运之星任务
				elseif iRand <= 11 then
					expMulti = expMulti + 2
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10631, 8)
				elseif iRand <= 51 then
					expMulti = expMulti + 1
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10631, 0)
				end
			end
			--如果发放任务日期和当天是同一天，那么失败后就发放互斥任务

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,math.floor(iExperience * baseExp * expMulti))
			--清除绿色蓝色幸运任务引子的完成次数
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,11760)
		else
			--如果发放任务日期和当天是同一天，那么失败后就发放互斥任务
			local timePackage = os.date("*t", os.time())
			local monthNum,dayNum = timePackage.month,timePackage.day
			if monthNum == ucRandomNum3 and dayNum == ucRandomNum4 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,11711)	--互斥任务
			end
			--清除绿色蓝色幸运任务引子的完成次数
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,11760)
   		end

   		return 0
   	end
}

TaskList[10763] = --日常-服务器幸运活动1

{
	ServerLuck1=
    {
        [1] = {keyID1 = 110,lv = 15,Date = "20110101",},
        [2] = {keyID1 = 3,lv = 30,Date = "20110102",},
        [3] = {keyID1 = 7,lv = 20,Date = "20110103",},
        [4] = {keyID1 = 1,lv = 20,Date = "20110104",},
        [5] = {keyID1 = 5,lv = 15,Date = "20110105",},
        [6] = {keyID1 = 4,lv = 40,Date = "20110106",},
        [7] = {keyID1 = 100,lv = 30,Date = "20110107",},
        [8] = {keyID1 = 3,lv = 30,Date = "20110108",},
        [9] = {keyID1 = 6,lv = 20,Date = "20110109",},
        [10] = {keyID1 = 11,lv = 35,Date = "20110110",},
        [11] = {keyID1 = 5,lv = 15,Date = "20110111",},
        [12] = {keyID1 = 2,lv = 25,Date = "20110112",},
        [13] = {keyID1 = 1,lv = 20,Date = "20110113",},
        [14] = {keyID1 = 100,lv = 30,Date = "20110114",},
        [15] = {keyID1 = 10,lv = 25,Date = "20110115",},
        [16] = {keyID1 = 9,lv = 25,Date = "20110116",},
        [17] = {keyID1 = 7,lv = 20,Date = "20110117",},
        [18] = {keyID1 = 4,lv = 40,Date = "20110118",},
        [19] = {keyID1 = 110,lv = 15,Date = "20110119",},
        [20] = {keyID1 = 130,lv = 25,Date = "20110120",},
        [21] = {keyID1 = 8,lv = 25,Date = "20110121",},
        [22] = {keyID1 = 3,lv = 30,Date = "20110122",},
        [23] = {keyID1 = 6,lv = 20,Date = "20110123",},
        [24] = {keyID1 = 11,lv = 35,Date = "20110124",},
        [25] = {keyID1 = 5,lv = 15,Date = "20110125",},
        [26] = {keyID1 = 2,lv = 25,Date = "20110126",},
        [27] = {keyID1 = 1,lv = 20,Date = "20110127",},
        [28] = {keyID1 = 100,lv = 30,Date = "20110128",},
        [29] = {keyID1 = 5,lv = 15,Date = "20110129",},
        [30] = {keyID1 = 9,lv = 25,Date = "20110130",},
        [31] = {keyID1 = 7,lv = 20,Date = "20110131",},
        [32] = {keyID1 = 4,lv = 40,Date = "20110201",},
        [33] = {keyID1 = 110,lv = 15,Date = "20110202",},
        [34] = {keyID1 = 130,lv = 25,Date = "20110203",},
        [35] = {keyID1 = 8,lv = 25,Date = "20110204",},
        [36] = {keyID1 = 110,lv = 15,Date = "20110205",},
        [37] = {keyID1 = 13,lv = 45,Date = "20110206",},
        [38] = {keyID1 = 7,lv = 20,Date = "20110207",},
        [39] = {keyID1 = 1,lv = 20,Date = "20110208",},
        [40] = {keyID1 = 10,lv = 25,Date = "20110209",},
        [41] = {keyID1 = 4,lv = 40,Date = "20110210",},
        [42] = {keyID1 = 100,lv = 30,Date = "20110211",},
        [43] = {keyID1 = 10,lv = 25,Date = "20110212",},
        [44] = {keyID1 = 9,lv = 25,Date = "20110213",},
        [45] = {keyID1 = 7,lv = 20,Date = "20110214",},
        [46] = {keyID1 = 4,lv = 40,Date = "20110215",},
        [47] = {keyID1 = 110,lv = 15,Date = "20110216",},
        [48] = {keyID1 = 130,lv = 25,Date = "20110217",},
        [49] = {keyID1 = 8,lv = 25,Date = "20110218",},
        [50] = {keyID1 = 2,lv = 25,Date = "20110219",},
        [51] = {keyID1 = 6,lv = 20,Date = "20110220",},
        [52] = {keyID1 = 11,lv = 35,Date = "20110221",},
        [53] = {keyID1 = 5,lv = 15,Date = "20110222",},
        [54] = {keyID1 = 4,lv = 40,Date = "20110223",},
        [55] = {keyID1 = 1,lv = 20,Date = "20110224",},
        [56] = {keyID1 = 100,lv = 30,Date = "20110225",},
        [57] = {keyID1 = 110,lv = 15,Date = "20110226",},
        [58] = {keyID1 = 1,lv = 20,Date = "20110227",},
        [59] = {keyID1 = 7,lv = 20,Date = "20110228",},
        [60] = {keyID1 = 130,lv = 25,Date = "20110301",},
        [61] = {keyID1 = 5,lv = 15,Date = "20110302",},
        [62] = {keyID1 = 4,lv = 40,Date = "20110303",},
        [63] = {keyID1 = 100,lv = 30,Date = "20110304",},
        [64] = {keyID1 = 110,lv = 15,Date = "20110305",},
        [65] = {keyID1 = 13,lv = 45,Date = "20110306",},
        [66] = {keyID1 = 7,lv = 20,Date = "20110307",},
        [67] = {keyID1 = 1,lv = 20,Date = "20110308",},
        [68] = {keyID1 = 5,lv = 15,Date = "20110309",},
        [69] = {keyID1 = 4,lv = 40,Date = "20110310",},
        [70] = {keyID1 = 100,lv = 30,Date = "20110311",},
        [71] = {keyID1 = 3,lv = 30,Date = "20110312",},
        [72] = {keyID1 = 6,lv = 20,Date = "20110313",},
        [73] = {keyID1 = 11,lv = 35,Date = "20110314",},
        [74] = {keyID1 = 5,lv = 15,Date = "20110315",},
        [75] = {keyID1 = 2,lv = 25,Date = "20110316",},
        [76] = {keyID1 = 1,lv = 20,Date = "20110317",},
        [77] = {keyID1 = 100,lv = 30,Date = "20110318",},
        [78] = {keyID1 = 10,lv = 25,Date = "20110319",},
        [79] = {keyID1 = 9,lv = 25,Date = "20110320",},
        [80] = {keyID1 = 7,lv = 20,Date = "20110321",},
        [81] = {keyID1 = 4,lv = 40,Date = "20110322",},
        [82] = {keyID1 = 110,lv = 15,Date = "20110323",},
        [83] = {keyID1 = 130,lv = 25,Date = "20110324",},
        [84] = {keyID1 = 8,lv = 25,Date = "20110325",},
        [85] = {keyID1 = 110,lv = 15,Date = "20110326",},
        [86] = {keyID1 = 13,lv = 45,Date = "20110327",},
        [87] = {keyID1 = 7,lv = 20,Date = "20110328",},
        [88] = {keyID1 = 1,lv = 20,Date = "20110329",},
        [89] = {keyID1 = 5,lv = 15,Date = "20110330",},
        [90] = {keyID1 = 4,lv = 40,Date = "20110331",},
        [91] = {keyID1 = 8,lv = 25,Date = "20110401",},
        [92] = {keyID1 = 110,lv = 15,Date = "20110402",},
        [93] = {keyID1 = 13,lv = 45,Date = "20110403",},
        [94] = {keyID1 = 7,lv = 20,Date = "20110404",},
        [95] = {keyID1 = 1,lv = 20,Date = "20110405",},
        [96] = {keyID1 = 10,lv = 25,Date = "20110406",},
        [97] = {keyID1 = 4,lv = 40,Date = "20110407",},
        [98] = {keyID1 = 100,lv = 30,Date = "20110408",},
        [99] = {keyID1 = 10,lv = 25,Date = "20110409",},
        [100] = {keyID1 = 9,lv = 25,Date = "20110410",},
        [101] = {keyID1 = 7,lv = 20,Date = "20110411",},
        [102] = {keyID1 = 4,lv = 40,Date = "20110412",},
        [103] = {keyID1 = 110,lv = 15,Date = "20110413",},
        [104] = {keyID1 = 130,lv = 25,Date = "20110414",},
        [105] = {keyID1 = 8,lv = 25,Date = "20110415",},
        [106] = {keyID1 = 2,lv = 25,Date = "20110416",},
        [107] = {keyID1 = 6,lv = 20,Date = "20110417",},
        [108] = {keyID1 = 11,lv = 35,Date = "20110418",},
        [109] = {keyID1 = 5,lv = 15,Date = "20110419",},
        [110] = {keyID1 = 4,lv = 40,Date = "20110420",},
        [111] = {keyID1 = 1,lv = 20,Date = "20110421",},
        [112] = {keyID1 = 100,lv = 30,Date = "20110422",},
        [113] = {keyID1 = 110,lv = 15,Date = "20110423",},
        [114] = {keyID1 = 1,lv = 20,Date = "20110424",},
        [115] = {keyID1 = 7,lv = 20,Date = "20110425",},
        [116] = {keyID1 = 130,lv = 25,Date = "20110426",},
        [117] = {keyID1 = 5,lv = 15,Date = "20110427",},
        [118] = {keyID1 = 4,lv = 40,Date = "20110428",},
        [119] = {keyID1 = 100,lv = 30,Date = "20110429",},
        [120] = {keyID1 = 110,lv = 15,Date = "20110430",},
        [121] = {keyID1 = 13,lv = 45,Date = "20110501",},
        [122] = {keyID1 = 7,lv = 20,Date = "20110502",},
        [123] = {keyID1 = 1,lv = 20,Date = "20110503",},
        [124] = {keyID1 = 5,lv = 15,Date = "20110504",},
        [125] = {keyID1 = 4,lv = 40,Date = "20110505",},
        [126] = {keyID1 = 100,lv = 30,Date = "20110506",},
        [127] = {keyID1 = 3,lv = 30,Date = "20110507",},
        [128] = {keyID1 = 6,lv = 20,Date = "20110508",},
        [129] = {keyID1 = 11,lv = 35,Date = "20110509",},
        [130] = {keyID1 = 5,lv = 15,Date = "20110510",},
        [131] = {keyID1 = 2,lv = 25,Date = "20110511",},
        [132] = {keyID1 = 1,lv = 20,Date = "20110512",},
        [133] = {keyID1 = 100,lv = 30,Date = "20110513",},
        [134] = {keyID1 = 10,lv = 25,Date = "20110514",},
        [135] = {keyID1 = 9,lv = 25,Date = "20110515",},
        [136] = {keyID1 = 7,lv = 20,Date = "20110516",},
        [137] = {keyID1 = 4,lv = 40,Date = "20110517",},
        [138] = {keyID1 = 110,lv = 15,Date = "20110518",},
        [139] = {keyID1 = 130,lv = 25,Date = "20110519",},
        [140] = {keyID1 = 8,lv = 25,Date = "20110520",},
        [141] = {keyID1 = 110,lv = 15,Date = "20110521",},
        [142] = {keyID1 = 13,lv = 45,Date = "20110522",},
        [143] = {keyID1 = 7,lv = 20,Date = "20110523",},
        [144] = {keyID1 = 1,lv = 20,Date = "20110524",},
        [145] = {keyID1 = 5,lv = 15,Date = "20110525",},
        [146] = {keyID1 = 4,lv = 40,Date = "20110526",},
        [147] = {keyID1 = 8,lv = 25,Date = "20110527",},
        [148] = {keyID1 = 2,lv = 25,Date = "20110528",},
        [149] = {keyID1 = 6,lv = 20,Date = "20110529",},
        [150] = {keyID1 = 11,lv = 35,Date = "20110530",},
        [151] = {keyID1 = 5,lv = 15,Date = "20110531",},
        [152] = {keyID1 = 4,lv = 40,Date = "20110601",},
        [153] = {keyID1 = 1,lv = 20,Date = "20110602",},
        [154] = {keyID1 = 100,lv = 30,Date = "20110603",},
        [155] = {keyID1 = 110,lv = 15,Date = "20110604",},
        [156] = {keyID1 = 1,lv = 20,Date = "20110605",},
        [157] = {keyID1 = 7,lv = 20,Date = "20110606",},
        [158] = {keyID1 = 130,lv = 25,Date = "20110607",},
        [159] = {keyID1 = 5,lv = 15,Date = "20110608",},
        [160] = {keyID1 = 4,lv = 40,Date = "20110609",},
        [161] = {keyID1 = 100,lv = 30,Date = "20110610",},
        [162] = {keyID1 = 110,lv = 15,Date = "20110611",},
        [163] = {keyID1 = 13,lv = 45,Date = "20110612",},
        [164] = {keyID1 = 7,lv = 20,Date = "20110613",},
        [165] = {keyID1 = 1,lv = 20,Date = "20110614",},
        [166] = {keyID1 = 5,lv = 15,Date = "20110615",},
        [167] = {keyID1 = 4,lv = 40,Date = "20110616",},
        [168] = {keyID1 = 100,lv = 30,Date = "20110617",},
        [169] = {keyID1 = 3,lv = 30,Date = "20110618",},
        [170] = {keyID1 = 6,lv = 20,Date = "20110619",},
        [171] = {keyID1 = 11,lv = 35,Date = "20110620",},
        [172] = {keyID1 = 5,lv = 15,Date = "20110621",},
        [173] = {keyID1 = 2,lv = 25,Date = "20110622",},
        [174] = {keyID1 = 1,lv = 20,Date = "20110623",},
        [175] = {keyID1 = 100,lv = 30,Date = "20110624",},
        [176] = {keyID1 = 10,lv = 25,Date = "20110625",},
        [177] = {keyID1 = 9,lv = 25,Date = "20110626",},
        [178] = {keyID1 = 7,lv = 20,Date = "20110627",},
        [179] = {keyID1 = 4,lv = 40,Date = "20110628",},
        [180] = {keyID1 = 110,lv = 15,Date = "20110629",},
        [181] = {keyID1 = 130,lv = 25,Date = "20110630",},
        [182] = {keyID1 = 8,lv = 25,Date = "20110701",},
        [183] = {keyID1 = 110,lv = 15,Date = "20110702",},
        [184] = {keyID1 = 13,lv = 45,Date = "20110703",},
        [185] = {keyID1 = 7,lv = 20,Date = "20110704",},
        [186] = {keyID1 = 1,lv = 20,Date = "20110705",},
        [187] = {keyID1 = 5,lv = 15,Date = "20110706",},
        [188] = {keyID1 = 4,lv = 40,Date = "20110707",},
        [189] = {keyID1 = 100,lv = 30,Date = "20110708",},
        [190] = {keyID1 = 3,lv = 30,Date = "20110709",},
        [191] = {keyID1 = 6,lv = 20,Date = "20110710",},
        [192] = {keyID1 = 11,lv = 35,Date = "20110711",},
        [193] = {keyID1 = 5,lv = 15,Date = "20110712",},
        [194] = {keyID1 = 2,lv = 25,Date = "20110713",},
        [195] = {keyID1 = 1,lv = 20,Date = "20110714",},
        [196] = {keyID1 = 100,lv = 30,Date = "20110715",},
        [197] = {keyID1 = 10,lv = 25,Date = "20110716",},
        [198] = {keyID1 = 9,lv = 25,Date = "20110717",},
        [199] = {keyID1 = 7,lv = 20,Date = "20110718",},
        [200] = {keyID1 = 4,lv = 40,Date = "20110719",},
        [201] = {keyID1 = 110,lv = 15,Date = "20110720",},
        [202] = {keyID1 = 130,lv = 25,Date = "20110721",},
        [203] = {keyID1 = 8,lv = 25,Date = "20110722",},
        [204] = {keyID1 = 110,lv = 15,Date = "20110723",},
        [205] = {keyID1 = 13,lv = 45,Date = "20110724",},
        [206] = {keyID1 = 7,lv = 20,Date = "20110725",},
        [207] = {keyID1 = 1,lv = 20,Date = "20110726",},
        [208] = {keyID1 = 5,lv = 15,Date = "20110727",},
        [209] = {keyID1 = 4,lv = 40,Date = "20110728",},
        [210] = {keyID1 = 8,lv = 25,Date = "20110729",},
        [211] = {keyID1 = 2,lv = 25,Date = "20110730",},
        [212] = {keyID1 = 6,lv = 20,Date = "20110731",},
        [213] = {keyID1 = 11,lv = 35,Date = "20110801",},
        [214] = {keyID1 = 5,lv = 15,Date = "20110802",},
        [215] = {keyID1 = 4,lv = 40,Date = "20110803",},
        [216] = {keyID1 = 1,lv = 20,Date = "20110804",},
        [217] = {keyID1 = 100,lv = 30,Date = "20110805",},
        [218] = {keyID1 = 110,lv = 15,Date = "20110806",},
        [219] = {keyID1 = 1,lv = 20,Date = "20110807",},
        [220] = {keyID1 = 7,lv = 20,Date = "20110808",},
        [221] = {keyID1 = 130,lv = 25,Date = "20110809",},
        [222] = {keyID1 = 5,lv = 15,Date = "20110810",},
        [223] = {keyID1 = 4,lv = 40,Date = "20110811",},
        [224] = {keyID1 = 100,lv = 30,Date = "20110812",},
        [225] = {keyID1 = 110,lv = 15,Date = "20110813",},
        [226] = {keyID1 = 13,lv = 45,Date = "20110814",},
        [227] = {keyID1 = 7,lv = 20,Date = "20110815",},
        [228] = {keyID1 = 1,lv = 20,Date = "20110816",},
        [229] = {keyID1 = 5,lv = 15,Date = "20110817",},
        [230] = {keyID1 = 4,lv = 40,Date = "20110818",},
        [231] = {keyID1 = 100,lv = 30,Date = "20110819",},
        [232] = {keyID1 = 3,lv = 30,Date = "20110820",},
        [233] = {keyID1 = 6,lv = 20,Date = "20110821",},
        [234] = {keyID1 = 11,lv = 35,Date = "20110822",},
        [235] = {keyID1 = 5,lv = 15,Date = "20110823",},
        [236] = {keyID1 = 2,lv = 25,Date = "20110824",},
        [237] = {keyID1 = 1,lv = 20,Date = "20110825",},
        [238] = {keyID1 = 100,lv = 30,Date = "20110826",},
        [239] = {keyID1 = 10,lv = 25,Date = "20110827",},
        [240] = {keyID1 = 9,lv = 25,Date = "20110828",},
        [241] = {keyID1 = 7,lv = 20,Date = "20110829",},
        [242] = {keyID1 = 4,lv = 40,Date = "20110830",},
        [243] = {keyID1 = 110,lv = 15,Date = "20110831",},
        [254] = {keyID1 = 110,lv = 15,Date = "20100911",},
        [255] = {keyID1 = 7,lv = 20,Date = "20100912",},
        [256] = {keyID1 = 10,lv = 25,Date = "20100913",},
        [257] = {keyID1 = 2,lv = 25,Date = "20100914",},
        [258] = {keyID1 = 3,lv = 30,Date = "20100915",},
        [259] = {keyID1 = 8,lv = 25,Date = "20100916",},
        [260] = {keyID1 = 2,lv = 25,Date = "20100917",},
        [261] = {keyID1 = 4,lv = 40,Date = "20100918",},
        [262] = {keyID1 = 3,lv = 30,Date = "20100919",},
        [263] = {keyID1 = 1,lv = 20,Date = "20100920",},
        [264] = {keyID1 = 2,lv = 25,Date = "20100921",},
        [265] = {keyID1 = 6,lv = 20,Date = "20100922",},
        [266] = {keyID1 = 4,lv = 40,Date = "20100923",},
        [267] = {keyID1 = 2,lv = 25,Date = "20100924",},
        [268] = {keyID1 = 110,lv = 15,Date = "20100925",},
        [269] = {keyID1 = 7,lv = 20,Date = "20100926",},
        [270] = {keyID1 = 10,lv = 25,Date = "20100927",},
        [271] = {keyID1 = 2,lv = 25,Date = "20100928",},
        [272] = {keyID1 = 3,lv = 30,Date = "20100929",},
        [273] = {keyID1 = 8,lv = 25,Date = "20100930",},
        [274] = {keyID1 = 2,lv = 25,Date = "20101001",},
        [275] = {keyID1 = 4,lv = 40,Date = "20101002",},
        [276] = {keyID1 = 3,lv = 30,Date = "20101003",},
        [277] = {keyID1 = 1,lv = 20,Date = "20101004",},
        [278] = {keyID1 = 2,lv = 25,Date = "20101005",},
        [279] = {keyID1 = 6,lv = 20,Date = "20101006",},
        [280] = {keyID1 = 4,lv = 40,Date = "20101007",},
        [281] = {keyID1 = 2,lv = 25,Date = "20101008",},
        [282] = {keyID1 = 7,lv = 20,Date = "20101009",},
        [283] = {keyID1 = 110,lv = 15,Date = "20101010",},
        [284] = {keyID1 = 6,lv = 20,Date = "20101011",},
        [285] = {keyID1 = 2,lv = 25,Date = "20101012",},
        [286] = {keyID1 = 8,lv = 25,Date = "20101013",},
        [287] = {keyID1 = 5,lv = 15,Date = "20101014",},
        [288] = {keyID1 = 100,lv = 30,Date = "20101015",},
        [289] = {keyID1 = 100,lv = 30,Date = "20101016",},
        [290] = {keyID1 = 7,lv = 20,Date = "20101017",},
        [291] = {keyID1 = 7,lv = 20,Date = "20101018",},
        [292] = {keyID1 = 100,lv = 30,Date = "20101019",},
        [293] = {keyID1 = 1,lv = 20,Date = "20101020",},
        [294] = {keyID1 = 5,lv = 15,Date = "20101021",},
        [295] = {keyID1 = 1,lv = 20,Date = "20101022",},
        [296] = {keyID1 = 110,lv = 15,Date = "20101023",},
        [297] = {keyID1 = 3,lv = 30,Date = "20101024",},
        [298] = {keyID1 = 10,lv = 25,Date = "20101025",},
        [299] = {keyID1 = 11,lv = 35,Date = "20101026",},
        [300] = {keyID1 = 8,lv = 25,Date = "20101027",},
        [301] = {keyID1 = 1,lv = 20,Date = "20101028",},
        [302] = {keyID1 = 100,lv = 30,Date = "20101029",},
        [303] = {keyID1 = 4,lv = 40,Date = "20101030",},
        [304] = {keyID1 = 7,lv = 20,Date = "20101031",},
        [305] = {keyID1 = 6,lv = 20,Date = "20101101",},
        [306] = {keyID1 = 8,lv = 25,Date = "20101102",},
        [307] = {keyID1 = 9,lv = 25,Date = "20101103",},
        [308] = {keyID1 = 110,lv = 15,Date = "20101104",},
        [309] = {keyID1 = 3,lv = 30,Date = "20101105",},
        [310] = {keyID1 = 4,lv = 40,Date = "20101106",},
        [311] = {keyID1 = 110,lv = 15,Date = "20101107",},
        [312] = {keyID1 = 5,lv = 15,Date = "20101108",},
        [313] = {keyID1 = 100,lv = 30,Date = "20101109",},
        [314] = {keyID1 = 5,lv = 15,Date = "20101110",},
        [315] = {keyID1 = 1,lv = 20,Date = "20101111",},
        [316] = {keyID1 = 10,lv = 25,Date = "20101112",},
        [317] = {keyID1 = 8,lv = 25,Date = "20101113",},
        [318] = {keyID1 = 3,lv = 30,Date = "20101114",},
        [319] = {keyID1 = 3,lv = 30,Date = "20101115",},
        [320] = {keyID1 = 5,lv = 15,Date = "20101116",},
        [321] = {keyID1 = 100,lv = 30,Date = "20101117",},
        [322] = {keyID1 = 3,lv = 30,Date = "20101118",},
        [323] = {keyID1 = 8,lv = 25,Date = "20101119",},
        [324] = {keyID1 = 100,lv = 30,Date = "20101120",},
        [325] = {keyID1 = 7,lv = 20,Date = "20101121",},
        [326] = {keyID1 = 11,lv = 35,Date = "20101122",},
        [327] = {keyID1 = 110,lv = 15,Date = "20101123",},
        [328] = {keyID1 = 5,lv = 15,Date = "20101124",},
        [329] = {keyID1 = 3,lv = 30,Date = "20101125",},
        [330] = {keyID1 = 11,lv = 35,Date = "20101126",},
        [331] = {keyID1 = 8,lv = 25,Date = "20101127",},
        [332] = {keyID1 = 4,lv = 40,Date = "20101128",},
        [333] = {keyID1 = 110,lv = 15,Date = "20101129",},
        [334] = {keyID1 = 2,lv = 25,Date = "20101130",},
        [335] = {keyID1 = 6,lv = 20,Date = "20101201",},
        [336] = {keyID1 = 6,lv = 20,Date = "20101202",},
        [337] = {keyID1 = 110,lv = 15,Date = "20101203",},
        [338] = {keyID1 = 11,lv = 35,Date = "20101204",},
        [339] = {keyID1 = 4,lv = 40,Date = "20101205",},
        [340] = {keyID1 = 5,lv = 15,Date = "20101206",},
        [341] = {keyID1 = 8,lv = 25,Date = "20101207",},
        [342] = {keyID1 = 9,lv = 25,Date = "20101208",},
        [343] = {keyID1 = 1,lv = 20,Date = "20101209",},
        [344] = {keyID1 = 100,lv = 30,Date = "20101210",},
        [345] = {keyID1 = 110,lv = 15,Date = "20101211",},
        [346] = {keyID1 = 10,lv = 25,Date = "20101212",},
        [347] = {keyID1 = 1,lv = 20,Date = "20101213",},
        [348] = {keyID1 = 5,lv = 15,Date = "20101214",},
        [349] = {keyID1 = 7,lv = 20,Date = "20101215",},
        [350] = {keyID1 = 10,lv = 25,Date = "20101216",},
        [351] = {keyID1 = 100,lv = 30,Date = "20101217",},
        [352] = {keyID1 = 8,lv = 25,Date = "20101218",},
        [353] = {keyID1 = 100,lv = 30,Date = "20101219",},
        [354] = {keyID1 = 8,lv = 25,Date = "20101220",},
        [355] = {keyID1 = 4,lv = 40,Date = "20101221",},
        [356] = {keyID1 = 1,lv = 20,Date = "20101222",},
        [357] = {keyID1 = 10,lv = 25,Date = "20101223",},
        [358] = {keyID1 = 1,lv = 20,Date = "20101224",},
        [359] = {keyID1 = 4,lv = 40,Date = "20101225",},
        [360] = {keyID1 = 3,lv = 30,Date = "20101226",},
        [361] = {keyID1 = 10,lv = 25,Date = "20101227",},
        [362] = {keyID1 = 4,lv = 40,Date = "20101228",},
        [363] = {keyID1 = 100,lv = 30,Date = "20101229",},
        [364] = {keyID1 = 11,lv = 35,Date = "20101230",},
        [365] = {keyID1 = 1,lv = 20,Date = "20101231",},
    },

	AllTasks =
    {
     [1] = {lvmin = 20,task = 10746,num = 1,},
     [2] = {lvmin = 25,task = 7680,num = 1,},
     [3] = {lvmin = 30,task = 7692,num = 1,},
     [4] = {lvmin = 40,task = 8640,num = 1,},
     [5] = {lvmin = 15,task = 7787,num = 1,},
     [6] = {lvmin = 20,task = 7815,num = 1,},
     [7] = {lvmin = 20,task = 8143,num = 1,},
     [8] = {lvmin = 25,lvmax = 49,group = "WJSF",task = 8147,num = 1,},
     [9] = {lvmin = 25,task = 7897,num = 1,},
     [10] = {lvmin = 25,task = 7869,num = 2,},
     [11] = {lvmin = 35,task = 9966,num = 1,},
     [12] = {lvmin = 50,lvmax = 200,group = "WJSF",task = 11316,num = 1,},
     [13] = {lvmin = 45,task = 11520,num = 1,},
     [100] = {lvmin = 30,lvmax = 39,group = "LX",task = 10417,num = 1,},
     [101] = {lvmin = 40,lvmax = 49,group = "LX",task = 10418,num = 1,},
     [102] = {lvmin = 50,lvmax = 59,group = "LX",task = 10419,num = 1,},
     [103] = {lvmin = 60,lvmax = 64,group = "LX",task = 10420,num = 1,},
     [104] = {lvmin = 65,lvmax = 200,group = "LX",task = 10421,num = 1,},
     [110] = {lvmin = 15,lvmax = 19,group = "ZB",task = 8360,num = 1,},
     [111] = {lvmin = 20,lvmax = 29,group = "ZB",task = 8361,num = 1,},
     [112] = {lvmin = 30,lvmax = 39,group = "ZB",task = 8362,num = 1,},
     [113] = {lvmin = 40,lvmax = 49,group = "ZB",task = 8363,num = 1,},
     [114] = {lvmin = 50,lvmax = 59,group = "ZB",task = 8364,num = 1,},
     [115] = {lvmin = 60,lvmax = 64,group = "ZB",task = 9873,num = 1,},
     [116] = {lvmin = 65,lvmax = 200,group = "ZB",task = 9874,num = 1,},
     [130] = {lvmin = 25,lvmax = 29,group = "ZJL",task = 10614,num = 2,},
     [131] = {lvmin = 30,lvmax = 34,group = "ZJL",task = 10615,num = 2,},
     [132] = {lvmin = 35,lvmax = 39,group = "ZJL",task = 10616,num = 2,},
     [133] = {lvmin = 40,lvmax = 44,group = "ZJL",task = 10617,num = 2,},
     [134] = {lvmin = 45,lvmax = 49,group = "ZJL",task = 10618,num = 2,},
     [135] = {lvmin = 50,lvmax = 54,group = "ZJL",task = 10619,num = 2,},
     [136] = {lvmin = 55,lvmax = 59,group = "ZJL",task = 10621,num = 2,},
     [137] = {lvmin = 60,lvmax = 64,group = "ZJL",task = 10622,num = 2,},
     [138] = {lvmin = 65,lvmax = 200,group = "ZJL",task = 10623,num = 2,},
    },

	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			--基础经验系数
			local baseExp = 180
			local expMulti = 1
			--取得玩家等级数据
			local player={}
			player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--根据玩家等级，从全局表里找到对应的等级经验系数
			local iExperience = TaskExpAdjust[player.level]

			return math.floor(iExperience * baseExp * expMulti)
		end
		,
	}
	,
	Property =
  	{
		bUIButtonTask = true,
		bHiddenTask = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false,
		bAbsoluteTime = true,	--是否是绝对时间（用于任务时限，线下时间是否计入任务时间）

  		--iAvailFrequency  = 2,	--	发放间隔每天
		--iTimeInterval = 36,
		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--定义关键索引，根据今天的日期找到关键索引的值
		local keyLv = 20
		keyLv = TaskList[10763].ServerLuck1[dayInYear].lv
		--------------------------------------------------测试gm-----------------------------------------------------
		local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
		if item2053 ~= 0 then
			keyLv = TaskList[10763].AllTasks[item2053].lvmin
		end
		-------------------------------------------------测试over----------------------------------------------------


	   	if iPlayerLev < keyLv then
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
	   	end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		--取得玩家等级
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--定义关键索引，根据今天的日期找到关键索引的值
		local keyID = 1
		keyID = TaskList[10763].ServerLuck1[dayInYear].keyID1

		--------------------------------------------------测试gm-----------------------------------------------------
		local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
		if item2053 ~= 0 then
			keyID = item2053
		end
		-------------------------------------------------测试over----------------------------------------------------


		--对按等级进行随机的Group活动进行处理
		--裂隙	LX	100
		--装备	ZB	110
		--危机四伏	WJSF	8
		--追剿令	ZJL		130

		if keyID == 100 then
			for i,v in pairs(TaskList[10763].AllTasks) do
				if v.group == "LX" then
					if player.level >= v.lvmin and player.level <= v.lvmax then
						keyID = i
						break
					end
				end
			end
		elseif keyID == 110 then
			for i,v in pairs(TaskList[10763].AllTasks) do
				if v.group == "ZB" then
					if player.level >= v.lvmin and player.level <= v.lvmax then
						keyID = i
						break
					end
				end
			end
		elseif keyID == 8 then
			for i,v in pairs(TaskList[10763].AllTasks) do
				if v.group == "WJSF" then
					if player.level >= v.lvmin and player.level <= v.lvmax then
						keyID = i
						break
					end
				end
			end
		elseif keyID == 130 then
			for i,v in pairs(TaskList[10763].AllTasks) do
				if v.group == "ZJL" then
					if player.level >= v.lvmin and player.level <= v.lvmax then
						keyID = i
						break
					end
				end
			end
		end

		--把keyID存入变量1，变量2
		local x,y = math.floor(keyID / 200), keyID % 200				--把keyID拆成两个整数: keyID = 200*x + y
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10763, 1,x)	--x，y分别存入任务变量1和2
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10763, 2,y)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}

		local x = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 1)
		local y = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 2)
		local ordernow = 200 * x + y

   		Method.CompleteTask = {TaskID = TaskList[10763].AllTasks[ordernow].task, Num = TaskList[10763].AllTasks[ordernow].num}
   		Method.iTimeLimit = 72000
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local x = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 1)
		local y = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 2)
		local ordernow = 200 * x + y

		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[10763].AllTasks[ordernow].task)
		if iCount >= TaskList[10763].AllTasks[ordernow].num then
			iRet = TASK_SUCC_FINISH
		end
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 10763)
   		if ulCurTime - ulDeliverTime > 72000 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1)
		math.randomseed(os.time())
		--基础经验系数和经验档位
		local baseExp = 180
		local expMulti = 1
		--取得玩家等级数据
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--根据玩家等级，从全局表里找到对应的等级经验系数
		local iExperience = TaskExpAdjust[player.level]

   		if bSuccess then
			if player.level >= 35 then	--等级大于35级才有可能获得更高的经验档位
				local iRand = math.random(1,4000)
				if iRand == 1 then
					expMulti = 4
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10763,8)
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,10633)--10633幸运之星任务
				elseif iRand <= 11 then
					expMulti = 3
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10763, 8)
				elseif iRand <= 51 then
					expMulti = 2
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10763, 0)
				else
					expMulti = 1
				end
			end
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,math.floor(iExperience * baseExp * expMulti))
   		end

   		return 0
   	end
}

TaskList[10764] = --日常-服务器幸运活动2

{
	ServerLuck2=
    {
        [1] = {keyID2 = 8,lv = 25,Date = "20110101",},
        [2] = {keyID2 = 1,lv = 20,Date = "20110102",},
        [3] = {keyID2 = 11,lv = 35,Date = "20110103",},
        [4] = {keyID2 = 130,lv = 25,Date = "20110104",},
        [5] = {keyID2 = 3,lv = 30,Date = "20110105",},
        [6] = {keyID2 = 9,lv = 25,Date = "20110106",},
        [7] = {keyID2 = 4,lv = 40,Date = "20110107",},
        [8] = {keyID2 = 10,lv = 25,Date = "20110108",},
        [9] = {keyID2 = 8,lv = 25,Date = "20110109",},
        [10] = {keyID2 = 2,lv = 25,Date = "20110110",},
        [11] = {keyID2 = 130,lv = 25,Date = "20110111",},
        [12] = {keyID2 = 110,lv = 15,Date = "20110112",},
        [13] = {keyID2 = 9,lv = 25,Date = "20110113",},
        [14] = {keyID2 = 4,lv = 40,Date = "20110114",},
        [15] = {keyID2 = 3,lv = 30,Date = "20110115",},
        [16] = {keyID2 = 5,lv = 15,Date = "20110116",},
        [17] = {keyID2 = 1,lv = 20,Date = "20110117",},
        [18] = {keyID2 = 130,lv = 25,Date = "20110118",},
        [19] = {keyID2 = 11,lv = 35,Date = "20110119",},
        [20] = {keyID2 = 6,lv = 20,Date = "20110120",},
        [21] = {keyID2 = 100,lv = 30,Date = "20110121",},
        [22] = {keyID2 = 10,lv = 25,Date = "20110122",},
        [23] = {keyID2 = 8,lv = 25,Date = "20110123",},
        [24] = {keyID2 = 2,lv = 25,Date = "20110124",},
        [25] = {keyID2 = 130,lv = 25,Date = "20110125",},
        [26] = {keyID2 = 110,lv = 15,Date = "20110126",},
        [27] = {keyID2 = 9,lv = 25,Date = "20110127",},
        [28] = {keyID2 = 13,lv = 45,Date = "20110128",},
        [29] = {keyID2 = 3,lv = 30,Date = "20110129",},
        [30] = {keyID2 = 5,lv = 15,Date = "20110130",},
        [31] = {keyID2 = 1,lv = 20,Date = "20110131",},
        [32] = {keyID2 = 130,lv = 25,Date = "20110201",},
        [33] = {keyID2 = 11,lv = 35,Date = "20110202",},
        [34] = {keyID2 = 4,lv = 40,Date = "20110203",},
        [35] = {keyID2 = 100,lv = 30,Date = "20110204",},
        [36] = {keyID2 = 8,lv = 25,Date = "20110205",},
        [37] = {keyID2 = 1,lv = 20,Date = "20110206",},
        [38] = {keyID2 = 9,lv = 25,Date = "20110207",},
        [39] = {keyID2 = 130,lv = 25,Date = "20110208",},
        [40] = {keyID2 = 3,lv = 30,Date = "20110209",},
        [41] = {keyID2 = 11,lv = 35,Date = "20110210",},
        [42] = {keyID2 = 6,lv = 20,Date = "20110211",},
        [43] = {keyID2 = 3,lv = 30,Date = "20110212",},
        [44] = {keyID2 = 5,lv = 15,Date = "20110213",},
        [45] = {keyID2 = 1,lv = 20,Date = "20110214",},
        [46] = {keyID2 = 130,lv = 25,Date = "20110215",},
        [47] = {keyID2 = 11,lv = 35,Date = "20110216",},
        [48] = {keyID2 = 6,lv = 20,Date = "20110217",},
        [49] = {keyID2 = 100,lv = 30,Date = "20110218",},
        [50] = {keyID2 = 10,lv = 25,Date = "20110219",},
        [51] = {keyID2 = 8,lv = 25,Date = "20110220",},
        [52] = {keyID2 = 13,lv = 45,Date = "20110221",},
        [53] = {keyID2 = 130,lv = 25,Date = "20110222",},
        [54] = {keyID2 = 110,lv = 15,Date = "20110223",},
        [55] = {keyID2 = 9,lv = 25,Date = "20110224",},
        [56] = {keyID2 = 4,lv = 40,Date = "20110225",},
        [57] = {keyID2 = 8,lv = 25,Date = "20110226",},
        [58] = {keyID2 = 3,lv = 30,Date = "20110227",},
        [59] = {keyID2 = 11,lv = 35,Date = "20110228",},
        [60] = {keyID2 = 1,lv = 20,Date = "20110301",},
        [61] = {keyID2 = 3,lv = 30,Date = "20110302",},
        [62] = {keyID2 = 9,lv = 25,Date = "20110303",},
        [63] = {keyID2 = 2,lv = 25,Date = "20110304",},
        [64] = {keyID2 = 8,lv = 25,Date = "20110305",},
        [65] = {keyID2 = 1,lv = 20,Date = "20110306",},
        [66] = {keyID2 = 11,lv = 35,Date = "20110307",},
        [67] = {keyID2 = 130,lv = 25,Date = "20110308",},
        [68] = {keyID2 = 3,lv = 30,Date = "20110309",},
        [69] = {keyID2 = 9,lv = 25,Date = "20110310",},
        [70] = {keyID2 = 4,lv = 40,Date = "20110311",},
        [71] = {keyID2 = 10,lv = 25,Date = "20110312",},
        [72] = {keyID2 = 8,lv = 25,Date = "20110313",},
        [73] = {keyID2 = 2,lv = 25,Date = "20110314",},
        [74] = {keyID2 = 130,lv = 25,Date = "20110315",},
        [75] = {keyID2 = 110,lv = 15,Date = "20110316",},
        [76] = {keyID2 = 9,lv = 25,Date = "20110317",},
        [77] = {keyID2 = 13,lv = 45,Date = "20110318",},
        [78] = {keyID2 = 3,lv = 30,Date = "20110319",},
        [79] = {keyID2 = 5,lv = 15,Date = "20110320",},
        [80] = {keyID2 = 1,lv = 20,Date = "20110321",},
        [81] = {keyID2 = 130,lv = 25,Date = "20110322",},
        [82] = {keyID2 = 11,lv = 35,Date = "20110323",},
        [83] = {keyID2 = 6,lv = 20,Date = "20110324",},
        [84] = {keyID2 = 100,lv = 30,Date = "20110325",},
        [85] = {keyID2 = 8,lv = 25,Date = "20110326",},
        [86] = {keyID2 = 1,lv = 20,Date = "20110327",},
        [87] = {keyID2 = 11,lv = 35,Date = "20110328",},
        [88] = {keyID2 = 130,lv = 25,Date = "20110329",},
        [89] = {keyID2 = 3,lv = 30,Date = "20110330",},
        [90] = {keyID2 = 9,lv = 25,Date = "20110331",},
        [91] = {keyID2 = 100,lv = 30,Date = "20110401",},
        [92] = {keyID2 = 8,lv = 25,Date = "20110402",},
        [93] = {keyID2 = 1,lv = 20,Date = "20110403",},
        [94] = {keyID2 = 9,lv = 25,Date = "20110404",},
        [95] = {keyID2 = 130,lv = 25,Date = "20110405",},
        [96] = {keyID2 = 3,lv = 30,Date = "20110406",},
        [97] = {keyID2 = 11,lv = 35,Date = "20110407",},
        [98] = {keyID2 = 6,lv = 20,Date = "20110408",},
        [99] = {keyID2 = 3,lv = 30,Date = "20110409",},
        [100] = {keyID2 = 5,lv = 15,Date = "20110410",},
        [101] = {keyID2 = 1,lv = 20,Date = "20110411",},
        [102] = {keyID2 = 130,lv = 25,Date = "20110412",},
        [103] = {keyID2 = 11,lv = 35,Date = "20110413",},
        [104] = {keyID2 = 6,lv = 20,Date = "20110414",},
        [105] = {keyID2 = 100,lv = 30,Date = "20110415",},
        [106] = {keyID2 = 10,lv = 25,Date = "20110416",},
        [107] = {keyID2 = 8,lv = 25,Date = "20110417",},
        [108] = {keyID2 = 13,lv = 45,Date = "20110418",},
        [109] = {keyID2 = 130,lv = 25,Date = "20110419",},
        [110] = {keyID2 = 110,lv = 15,Date = "20110420",},
        [111] = {keyID2 = 9,lv = 25,Date = "20110421",},
        [112] = {keyID2 = 4,lv = 40,Date = "20110422",},
        [113] = {keyID2 = 8,lv = 25,Date = "20110423",},
        [114] = {keyID2 = 3,lv = 30,Date = "20110424",},
        [115] = {keyID2 = 11,lv = 35,Date = "20110425",},
        [116] = {keyID2 = 1,lv = 20,Date = "20110426",},
        [117] = {keyID2 = 3,lv = 30,Date = "20110427",},
        [118] = {keyID2 = 9,lv = 25,Date = "20110428",},
        [119] = {keyID2 = 2,lv = 25,Date = "20110429",},
        [120] = {keyID2 = 8,lv = 25,Date = "20110430",},
        [121] = {keyID2 = 1,lv = 20,Date = "20110501",},
        [122] = {keyID2 = 11,lv = 35,Date = "20110502",},
        [123] = {keyID2 = 130,lv = 25,Date = "20110503",},
        [124] = {keyID2 = 3,lv = 30,Date = "20110504",},
        [125] = {keyID2 = 9,lv = 25,Date = "20110505",},
        [126] = {keyID2 = 4,lv = 40,Date = "20110506",},
        [127] = {keyID2 = 10,lv = 25,Date = "20110507",},
        [128] = {keyID2 = 8,lv = 25,Date = "20110508",},
        [129] = {keyID2 = 2,lv = 25,Date = "20110509",},
        [130] = {keyID2 = 130,lv = 25,Date = "20110510",},
        [131] = {keyID2 = 110,lv = 15,Date = "20110511",},
        [132] = {keyID2 = 9,lv = 25,Date = "20110512",},
        [133] = {keyID2 = 13,lv = 45,Date = "20110513",},
        [134] = {keyID2 = 3,lv = 30,Date = "20110514",},
        [135] = {keyID2 = 5,lv = 15,Date = "20110515",},
        [136] = {keyID2 = 1,lv = 20,Date = "20110516",},
        [137] = {keyID2 = 130,lv = 25,Date = "20110517",},
        [138] = {keyID2 = 11,lv = 35,Date = "20110518",},
        [139] = {keyID2 = 6,lv = 20,Date = "20110519",},
        [140] = {keyID2 = 100,lv = 30,Date = "20110520",},
        [141] = {keyID2 = 8,lv = 25,Date = "20110521",},
        [142] = {keyID2 = 1,lv = 20,Date = "20110522",},
        [143] = {keyID2 = 11,lv = 35,Date = "20110523",},
        [144] = {keyID2 = 130,lv = 25,Date = "20110524",},
        [145] = {keyID2 = 3,lv = 30,Date = "20110525",},
        [146] = {keyID2 = 9,lv = 25,Date = "20110526",},
        [147] = {keyID2 = 100,lv = 30,Date = "20110527",},
        [148] = {keyID2 = 10,lv = 25,Date = "20110528",},
        [149] = {keyID2 = 8,lv = 25,Date = "20110529",},
        [150] = {keyID2 = 13,lv = 45,Date = "20110530",},
        [151] = {keyID2 = 130,lv = 25,Date = "20110531",},
        [152] = {keyID2 = 110,lv = 15,Date = "20110601",},
        [153] = {keyID2 = 9,lv = 25,Date = "20110602",},
        [154] = {keyID2 = 4,lv = 40,Date = "20110603",},
        [155] = {keyID2 = 8,lv = 25,Date = "20110604",},
        [156] = {keyID2 = 3,lv = 30,Date = "20110605",},
        [157] = {keyID2 = 11,lv = 35,Date = "20110606",},
        [158] = {keyID2 = 1,lv = 20,Date = "20110607",},
        [159] = {keyID2 = 3,lv = 30,Date = "20110608",},
        [160] = {keyID2 = 9,lv = 25,Date = "20110609",},
        [161] = {keyID2 = 2,lv = 25,Date = "20110610",},
        [162] = {keyID2 = 8,lv = 25,Date = "20110611",},
        [163] = {keyID2 = 1,lv = 20,Date = "20110612",},
        [164] = {keyID2 = 11,lv = 35,Date = "20110613",},
        [165] = {keyID2 = 130,lv = 25,Date = "20110614",},
        [166] = {keyID2 = 3,lv = 30,Date = "20110615",},
        [167] = {keyID2 = 9,lv = 25,Date = "20110616",},
        [168] = {keyID2 = 4,lv = 40,Date = "20110617",},
        [169] = {keyID2 = 10,lv = 25,Date = "20110618",},
        [170] = {keyID2 = 8,lv = 25,Date = "20110619",},
        [171] = {keyID2 = 2,lv = 25,Date = "20110620",},
        [172] = {keyID2 = 130,lv = 25,Date = "20110621",},
        [173] = {keyID2 = 110,lv = 15,Date = "20110622",},
        [174] = {keyID2 = 9,lv = 25,Date = "20110623",},
        [175] = {keyID2 = 13,lv = 45,Date = "20110624",},
        [176] = {keyID2 = 3,lv = 30,Date = "20110625",},
        [177] = {keyID2 = 5,lv = 15,Date = "20110626",},
        [178] = {keyID2 = 1,lv = 20,Date = "20110627",},
        [179] = {keyID2 = 130,lv = 25,Date = "20110628",},
        [180] = {keyID2 = 11,lv = 35,Date = "20110629",},
        [181] = {keyID2 = 6,lv = 20,Date = "20110630",},
        [182] = {keyID2 = 100,lv = 30,Date = "20110701",},
        [183] = {keyID2 = 8,lv = 25,Date = "20110702",},
        [184] = {keyID2 = 1,lv = 20,Date = "20110703",},
        [185] = {keyID2 = 11,lv = 35,Date = "20110704",},
        [186] = {keyID2 = 130,lv = 25,Date = "20110705",},
        [187] = {keyID2 = 3,lv = 30,Date = "20110706",},
        [188] = {keyID2 = 9,lv = 25,Date = "20110707",},
        [189] = {keyID2 = 4,lv = 40,Date = "20110708",},
        [190] = {keyID2 = 10,lv = 25,Date = "20110709",},
        [191] = {keyID2 = 8,lv = 25,Date = "20110710",},
        [192] = {keyID2 = 2,lv = 25,Date = "20110711",},
        [193] = {keyID2 = 130,lv = 25,Date = "20110712",},
        [194] = {keyID2 = 110,lv = 15,Date = "20110713",},
        [195] = {keyID2 = 9,lv = 25,Date = "20110714",},
        [196] = {keyID2 = 13,lv = 45,Date = "20110715",},
        [197] = {keyID2 = 3,lv = 30,Date = "20110716",},
        [198] = {keyID2 = 5,lv = 15,Date = "20110717",},
        [199] = {keyID2 = 1,lv = 20,Date = "20110718",},
        [200] = {keyID2 = 130,lv = 25,Date = "20110719",},
        [201] = {keyID2 = 11,lv = 35,Date = "20110720",},
        [202] = {keyID2 = 6,lv = 20,Date = "20110721",},
        [203] = {keyID2 = 100,lv = 30,Date = "20110722",},
        [204] = {keyID2 = 8,lv = 25,Date = "20110723",},
        [205] = {keyID2 = 1,lv = 20,Date = "20110724",},
        [206] = {keyID2 = 11,lv = 35,Date = "20110725",},
        [207] = {keyID2 = 130,lv = 25,Date = "20110726",},
        [208] = {keyID2 = 3,lv = 30,Date = "20110727",},
        [209] = {keyID2 = 9,lv = 25,Date = "20110728",},
        [210] = {keyID2 = 100,lv = 30,Date = "20110729",},
        [211] = {keyID2 = 10,lv = 25,Date = "20110730",},
        [212] = {keyID2 = 8,lv = 25,Date = "20110731",},
        [213] = {keyID2 = 13,lv = 45,Date = "20110801",},
        [214] = {keyID2 = 130,lv = 25,Date = "20110802",},
        [215] = {keyID2 = 110,lv = 15,Date = "20110803",},
        [216] = {keyID2 = 9,lv = 25,Date = "20110804",},
        [217] = {keyID2 = 4,lv = 40,Date = "20110805",},
        [218] = {keyID2 = 8,lv = 25,Date = "20110806",},
        [219] = {keyID2 = 3,lv = 30,Date = "20110807",},
        [220] = {keyID2 = 11,lv = 35,Date = "20110808",},
        [221] = {keyID2 = 1,lv = 20,Date = "20110809",},
        [222] = {keyID2 = 3,lv = 30,Date = "20110810",},
        [223] = {keyID2 = 9,lv = 25,Date = "20110811",},
        [224] = {keyID2 = 2,lv = 25,Date = "20110812",},
        [225] = {keyID2 = 8,lv = 25,Date = "20110813",},
        [226] = {keyID2 = 1,lv = 20,Date = "20110814",},
        [227] = {keyID2 = 11,lv = 35,Date = "20110815",},
        [228] = {keyID2 = 130,lv = 25,Date = "20110816",},
        [229] = {keyID2 = 3,lv = 30,Date = "20110817",},
        [230] = {keyID2 = 9,lv = 25,Date = "20110818",},
        [231] = {keyID2 = 4,lv = 40,Date = "20110819",},
        [232] = {keyID2 = 10,lv = 25,Date = "20110820",},
        [233] = {keyID2 = 8,lv = 25,Date = "20110821",},
        [234] = {keyID2 = 2,lv = 25,Date = "20110822",},
        [235] = {keyID2 = 130,lv = 25,Date = "20110823",},
        [236] = {keyID2 = 110,lv = 15,Date = "20110824",},
        [237] = {keyID2 = 9,lv = 25,Date = "20110825",},
        [238] = {keyID2 = 13,lv = 45,Date = "20110826",},
        [239] = {keyID2 = 3,lv = 30,Date = "20110827",},
        [240] = {keyID2 = 5,lv = 15,Date = "20110828",},
        [241] = {keyID2 = 1,lv = 20,Date = "20110829",},
        [242] = {keyID2 = 130,lv = 25,Date = "20110830",},
        [243] = {keyID2 = 11,lv = 35,Date = "20110831",},
        [254] = {keyID2 = 3,lv = 30,Date = "20100911",},
        [255] = {keyID2 = 4,lv = 40,Date = "20100912",},
        [256] = {keyID2 = 6,lv = 20,Date = "20100913",},
        [257] = {keyID2 = 10,lv = 25,Date = "20100914",},
        [258] = {keyID2 = 6,lv = 20,Date = "20100915",},
        [259] = {keyID2 = 9,lv = 25,Date = "20100916",},
        [260] = {keyID2 = 6,lv = 20,Date = "20100917",},
        [261] = {keyID2 = 8,lv = 25,Date = "20100918",},
        [262] = {keyID2 = 100,lv = 30,Date = "20100919",},
        [263] = {keyID2 = 6,lv = 20,Date = "20100920",},
        [264] = {keyID2 = 10,lv = 25,Date = "20100921",},
        [265] = {keyID2 = 100,lv = 30,Date = "20100922",},
        [266] = {keyID2 = 5,lv = 15,Date = "20100923",},
        [267] = {keyID2 = 10,lv = 25,Date = "20100924",},
        [268] = {keyID2 = 3,lv = 30,Date = "20100925",},
        [269] = {keyID2 = 4,lv = 40,Date = "20100926",},
        [270] = {keyID2 = 6,lv = 20,Date = "20100927",},
        [271] = {keyID2 = 10,lv = 25,Date = "20100928",},
        [272] = {keyID2 = 6,lv = 20,Date = "20100929",},
        [273] = {keyID2 = 9,lv = 25,Date = "20100930",},
        [274] = {keyID2 = 6,lv = 20,Date = "20101001",},
        [275] = {keyID2 = 8,lv = 25,Date = "20101002",},
        [276] = {keyID2 = 100,lv = 30,Date = "20101003",},
        [277] = {keyID2 = 6,lv = 20,Date = "20101004",},
        [278] = {keyID2 = 10,lv = 25,Date = "20101005",},
        [279] = {keyID2 = 100,lv = 30,Date = "20101006",},
        [280] = {keyID2 = 5,lv = 15,Date = "20101007",},
        [281] = {keyID2 = 10,lv = 25,Date = "20101008",},
        [282] = {keyID2 = 110,lv = 15,Date = "20101009",},
        [283] = {keyID2 = 8,lv = 25,Date = "20101010",},
        [284] = {keyID2 = 11,lv = 35,Date = "20101011",},
        [285] = {keyID2 = 100,lv = 30,Date = "20101012",},
        [286] = {keyID2 = 6,lv = 20,Date = "20101013",},
        [287] = {keyID2 = 110,lv = 15,Date = "20101014",},
        [288] = {keyID2 = 1,lv = 20,Date = "20101015",},
        [289] = {keyID2 = 4,lv = 40,Date = "20101016",},
        [290] = {keyID2 = 110,lv = 15,Date = "20101017",},
        [291] = {keyID2 = 1,lv = 20,Date = "20101018",},
        [292] = {keyID2 = 2,lv = 25,Date = "20101019",},
        [293] = {keyID2 = 4,lv = 40,Date = "20101020",},
        [294] = {keyID2 = 10,lv = 25,Date = "20101021",},
        [295] = {keyID2 = 110,lv = 15,Date = "20101022",},
        [296] = {keyID2 = 7,lv = 20,Date = "20101023",},
        [297] = {keyID2 = 100,lv = 30,Date = "20101024",},
        [298] = {keyID2 = 3,lv = 30,Date = "20101025",},
        [299] = {keyID2 = 6,lv = 20,Date = "20101026",},
        [300] = {keyID2 = 9,lv = 25,Date = "20101027",},
        [301] = {keyID2 = 110,lv = 15,Date = "20101028",},
        [302] = {keyID2 = 10,lv = 25,Date = "20101029",},
        [303] = {keyID2 = 100,lv = 30,Date = "20101030",},
        [304] = {keyID2 = 110,lv = 15,Date = "20101031",},
        [305] = {keyID2 = 100,lv = 30,Date = "20101101",},
        [306] = {keyID2 = 5,lv = 15,Date = "20101102",},
        [307] = {keyID2 = 3,lv = 30,Date = "20101103",},
        [308] = {keyID2 = 2,lv = 25,Date = "20101104",},
        [309] = {keyID2 = 1,lv = 20,Date = "20101105",},
        [310] = {keyID2 = 100,lv = 30,Date = "20101106",},
        [311] = {keyID2 = 7,lv = 20,Date = "20101107",},
        [312] = {keyID2 = 10,lv = 25,Date = "20101108",},
        [313] = {keyID2 = 9,lv = 25,Date = "20101109",},
        [314] = {keyID2 = 6,lv = 20,Date = "20101110",},
        [315] = {keyID2 = 110,lv = 15,Date = "20101111",},
        [316] = {keyID2 = 2,lv = 25,Date = "20101112",},
        [317] = {keyID2 = 110,lv = 15,Date = "20101113",},
        [318] = {keyID2 = 7,lv = 20,Date = "20101114",},
        [319] = {keyID2 = 10,lv = 25,Date = "20101115",},
        [320] = {keyID2 = 2,lv = 25,Date = "20101116",},
        [321] = {keyID2 = 11,lv = 35,Date = "20101117",},
        [322] = {keyID2 = 1,lv = 20,Date = "20101118",},
        [323] = {keyID2 = 11,lv = 35,Date = "20101119",},
        [324] = {keyID2 = 3,lv = 30,Date = "20101120",},
        [325] = {keyID2 = 110,lv = 15,Date = "20101121",},
        [326] = {keyID2 = 6,lv = 20,Date = "20101122",},
        [327] = {keyID2 = 9,lv = 25,Date = "20101123",},
        [328] = {keyID2 = 3,lv = 30,Date = "20101124",},
        [329] = {keyID2 = 11,lv = 35,Date = "20101125",},
        [330] = {keyID2 = 5,lv = 15,Date = "20101126",},
        [331] = {keyID2 = 3,lv = 30,Date = "20101127",},
        [332] = {keyID2 = 100,lv = 30,Date = "20101128",},
        [333] = {keyID2 = 5,lv = 15,Date = "20101129",},
        [334] = {keyID2 = 1,lv = 20,Date = "20101130",},
        [335] = {keyID2 = 5,lv = 15,Date = "20101201",},
        [336] = {keyID2 = 10,lv = 25,Date = "20101202",},
        [337] = {keyID2 = 2,lv = 25,Date = "20101203",},
        [338] = {keyID2 = 8,lv = 25,Date = "20101204",},
        [339] = {keyID2 = 110,lv = 15,Date = "20101205",},
        [340] = {keyID2 = 3,lv = 30,Date = "20101206",},
        [341] = {keyID2 = 3,lv = 30,Date = "20101207",},
        [342] = {keyID2 = 110,lv = 15,Date = "20101208",},
        [343] = {keyID2 = 100,lv = 30,Date = "20101209",},
        [344] = {keyID2 = 10,lv = 25,Date = "20101210",},
        [345] = {keyID2 = 100,lv = 30,Date = "20101211",},
        [346] = {keyID2 = 100,lv = 30,Date = "20101212",},
        [347] = {keyID2 = 2,lv = 25,Date = "20101213",},
        [348] = {keyID2 = 3,lv = 30,Date = "20101214",},
        [349] = {keyID2 = 2,lv = 25,Date = "20101215",},
        [350] = {keyID2 = 100,lv = 30,Date = "20101216",},
        [351] = {keyID2 = 2,lv = 25,Date = "20101217",},
        [352] = {keyID2 = 7,lv = 20,Date = "20101218",},
        [353] = {keyID2 = 4,lv = 40,Date = "20101219",},
        [354] = {keyID2 = 11,lv = 35,Date = "20101220",},
        [355] = {keyID2 = 3,lv = 30,Date = "20101221",},
        [356] = {keyID2 = 7,lv = 20,Date = "20101222",},
        [357] = {keyID2 = 1,lv = 20,Date = "20101223",},
        [358] = {keyID2 = 2,lv = 25,Date = "20101224",},
        [359] = {keyID2 = 110,lv = 15,Date = "20101225",},
        [360] = {keyID2 = 100,lv = 30,Date = "20101226",},
        [361] = {keyID2 = 4,lv = 40,Date = "20101227",},
        [362] = {keyID2 = 9,lv = 25,Date = "20101228",},
        [363] = {keyID2 = 9,lv = 25,Date = "20101229",},
        [364] = {keyID2 = 6,lv = 20,Date = "20101230",},
        [365] = {keyID2 = 3,lv = 30,Date = "20101231",},
    },

	AllTasks =
    {
     [1] = {lvmin = 20,task = 10746,num = 1,},
     [2] = {lvmin = 25,task = 7680,num = 1,},
     [3] = {lvmin = 30,task = 7692,num = 1,},
     [4] = {lvmin = 40,task = 8640,num = 1,},
     [5] = {lvmin = 15,task = 7787,num = 1,},
     [6] = {lvmin = 20,task = 7815,num = 1,},
     [7] = {lvmin = 20,task = 8143,num = 1,},
     [8] = {lvmin = 25,lvmax = 49,group = "WJSF",task = 8147,num = 1,},
     [9] = {lvmin = 25,task = 7897,num = 1,},
     [10] = {lvmin = 25,task = 7869,num = 2,},
     [11] = {lvmin = 35,task = 9966,num = 1,},
     [12] = {lvmin = 50,lvmax = 200,group = "WJSF",task = 11316,num = 1,},
     [13] = {lvmin = 45,task = 11520,num = 1,},
     [100] = {lvmin = 30,lvmax = 39,group = "LX",task = 10417,num = 1,},
     [101] = {lvmin = 40,lvmax = 49,group = "LX",task = 10418,num = 1,},
     [102] = {lvmin = 50,lvmax = 59,group = "LX",task = 10419,num = 1,},
     [103] = {lvmin = 60,lvmax = 64,group = "LX",task = 10420,num = 1,},
     [104] = {lvmin = 65,lvmax = 200,group = "LX",task = 10421,num = 1,},
     [110] = {lvmin = 15,lvmax = 19,group = "ZB",task = 8360,num = 1,},
     [111] = {lvmin = 20,lvmax = 29,group = "ZB",task = 8361,num = 1,},
     [112] = {lvmin = 30,lvmax = 39,group = "ZB",task = 8362,num = 1,},
     [113] = {lvmin = 40,lvmax = 49,group = "ZB",task = 8363,num = 1,},
     [114] = {lvmin = 50,lvmax = 59,group = "ZB",task = 8364,num = 1,},
     [115] = {lvmin = 60,lvmax = 64,group = "ZB",task = 9873,num = 1,},
     [116] = {lvmin = 65,lvmax = 200,group = "ZB",task = 9874,num = 1,},
     [130] = {lvmin = 25,lvmax = 29,group = "ZJL",task = 10614,num = 2,},
     [131] = {lvmin = 30,lvmax = 34,group = "ZJL",task = 10615,num = 2,},
     [132] = {lvmin = 35,lvmax = 39,group = "ZJL",task = 10616,num = 2,},
     [133] = {lvmin = 40,lvmax = 44,group = "ZJL",task = 10617,num = 2,},
     [134] = {lvmin = 45,lvmax = 49,group = "ZJL",task = 10618,num = 2,},
     [135] = {lvmin = 50,lvmax = 54,group = "ZJL",task = 10619,num = 2,},
     [136] = {lvmin = 55,lvmax = 59,group = "ZJL",task = 10621,num = 2,},
     [137] = {lvmin = 60,lvmax = 64,group = "ZJL",task = 10622,num = 2,},
     [138] = {lvmin = 65,lvmax = 200,group = "ZJL",task = 10623,num = 2,},
    },

	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			--基础经验系数
			local baseExp = 180
			local expMulti = 1
			--取得玩家等级数据
			local player={}
			player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--根据玩家等级，从全局表里找到对应的等级经验系数
			local iExperience = TaskExpAdjust[player.level]

			return math.floor(iExperience * baseExp * expMulti)
		end
		,
	}
	,
	Property =
  	{
		bUIButtonTask = true,
		bHiddenTask = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false,
		bAbsoluteTime = true,	--是否是绝对时间（用于任务时限，线下时间是否计入任务时间）

  		--iAvailFrequency  = 2,	--	发放间隔每天
		--iTimeInterval = 36,
		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--定义关键索引，根据今天的日期找到关键索引的值
		local keyLv = 20
		keyLv = TaskList[10764].ServerLuck2[dayInYear].lv
		--------------------------------------------------测试gm-----------------------------------------------------
		local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
		if item2053 ~= 0 then
			keyLv = TaskList[10764].AllTasks[item2053].lvmin
		end
		-------------------------------------------------测试over----------------------------------------------------

	   	if iPlayerLev < keyLv then
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
	   	end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		--取得玩家等级
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		--取出今天是一年内的第几天，放入dayInYear中，1月1日是1，12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--定义关键索引，根据今天的日期找到关键索引的值
		local keyID = 1
		keyID = TaskList[10764].ServerLuck2[dayInYear].keyID2

		--------------------------------------------------测试gm-----------------------------------------------------
		local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
		if item2053 ~= 0 then
			keyID = item2053
		end
		-------------------------------------------------测试over----------------------------------------------------


		--对按等级进行随机的Group活动进行处理
		--裂隙	LX	100
		--装备	ZB	110
		--危机四伏	WJSF	8
		--追剿令	ZJL		130

		if keyID == 100 then
			for i,v in pairs(TaskList[10764].AllTasks) do
				if v.group == "LX" then
					if player.level >= v.lvmin and player.level <= v.lvmax then
						keyID = i
						break
					end
				end
			end
		elseif keyID == 110 then
			for i,v in pairs(TaskList[10764].AllTasks) do
				if v.group == "ZB" then
					if player.level >= v.lvmin and player.level <= v.lvmax then
						keyID = i
						break
					end
				end
			end
		elseif keyID == 8 then
			for i,v in pairs(TaskList[10764].AllTasks) do
				if v.group == "WJSF" then
					if player.level >= v.lvmin and player.level <= v.lvmax then
						keyID = i
						break
					end
				end
			end
		elseif keyID == 130 then
			for i,v in pairs(TaskList[10764].AllTasks) do
				if v.group == "ZJL" then
					if player.level >= v.lvmin and player.level <= v.lvmax then
						keyID = i
						break
					end
				end
			end
		end



		--把keyID存入变量1，变量2
		local x,y = math.floor(keyID / 200), keyID % 200				--把keyID拆成两个整数: keyID = 200*x + y
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10764, 1,x)	--x，y分别存入任务变量1和2
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10764, 2,y)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}

		local x = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 1)
		local y = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 2)
		local ordernow = 200 * x + y

   		Method.CompleteTask = {TaskID = TaskList[10764].AllTasks[ordernow].task, Num = TaskList[10764].AllTasks[ordernow].num}
   		Method.iTimeLimit = 72000
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local x = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 1)
		local y = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 2)
		local ordernow = 200 * x + y

		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[10764].AllTasks[ordernow].task)
		if iCount >= TaskList[10764].AllTasks[ordernow].num then
			iRet = TASK_SUCC_FINISH
		end
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 10764)
   		if ulCurTime - ulDeliverTime > 72000 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,ucRandomNum1)
		math.randomseed(os.time())
		--基础经验系数和经验档位
		local baseExp = 180
		local expMulti = 1
		--取得玩家等级数据
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--根据玩家等级，从全局表里找到对应的等级经验系数
		local iExperience = TaskExpAdjust[player.level]

   		if bSuccess then
			if player.level >= 35 then	--等级大于35级才有可能获得更高的经验档位
				local iRand = math.random(1,4000)
------------------------------------------------------------测试gm----------------------------------------------
		local item20049 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,20049, true)
		if item20049 ~= 0 then
			iRand = 1
		end
------------------------------------------------------------测试over---------------------------------------------
				if iRand == 1 then
					expMulti = 4
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10764,8)
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,10633)--10633幸运之星任务
				elseif iRand <= 11 then
					expMulti = 3
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10764, 8)
				elseif iRand <= 51 then
					expMulti = 2
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10764, 0)
				else
					expMulti = 1
				end
			end
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,math.floor(iExperience * baseExp * expMulti))
   		end

   		return 0
   	end
}

TaskList[11417] = --试炼次数转补偿
{
	Property =
  	{
		bUIButtonTask = true,	--经验补偿界面按钮
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,	--接受即完成！

		bRecordFinishCount = true,
  		iMaxFinishCount = 100,		--每天最多可完成的次数：3
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iMoney = TaskCApi.GetGoldAmount(TASKINTERFACE_POINTER)
		local idx = 0	--活动计数的编号：神之试炼
		local iCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--取得计次数值

		--计数值转化成待补偿经验，需要耗费金币！
		--所需金币数 == 等级系数 * 全局变量TaskMoneyAdjust[等级]
		local iCostMoneyRatio = 216	--所需耗费的金币的等级系数
		local iCostMoney = math.max(1,math.floor(TaskMoneyAdjust[iPlayerLev])) * iCostMoneyRatio or iCostMoneyRatio	--所需耗费的金币(缺省值216）

	   	if iPlayerLev < 20 then	--神之试炼的参与等级：20级
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
	   	end
		if iCount <= 1 then	--计次数值小于或等于1次时，不能转换
	   	    return TASK_PREREQU_FAIL_LUA_TASK
		end
		if iMoney < iCostMoney	then --金币不足
			return TASK_PREREQU_FAIL_NO_MONEY
		end

		--debug start --
-- 		TaskCApi. SetGlobalDataEx (TASKINTERFACE_POINTER,30,iCount)
		--debug end --

		--把iCount存入变量1
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,11417, 1,iCount)	--iCount存入任务变量1

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
   		Method.iTimeLimit = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		--无条件完成

   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

   		end

   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iMoney = TaskCApi.GetGoldAmount(TASKINTERFACE_POINTER)
		local idx = 0	--活动计数的编号：神之试炼
		local iCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--取得计次数值

		--计数值转化成待补偿经验，需要耗费金币！
		--所需金币数 == 等级系数 * 全局变量TaskMoneyAdjust[等级]
		local iCostMoneyRatio = 216	--所需耗费的金币的等级系数
		local iCostMoney = math.max(1,math.floor(TaskMoneyAdjust[iPlayerLev])) * iCostMoneyRatio or iCostMoneyRatio	--所需耗费的金币(缺省值216）

		--根据等级给予待补偿经验
		--应转化的待补偿经验 == 等级系数 * 全局变量TaskExpAdjust[等级]
		local iMakeupExpRatio = 1350	--应转化的待补偿经验的等级系数
		local iMakeupExp = iMakeupExpRatio * (math.floor(TaskExpAdjust[iPlayerLev]) or TaskExpAdjust[20])--应转化的待补偿经验(缺省值是20级的）

   		if bSuccess then
			TaskCApi.TakeAwayGold(TASKINTERFACE_POINTER,iCostMoney)	--收钱
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, -1)	--把活动计数减去1次
			TaskCApi.DeliverMakeupExp(TASKINTERFACE_POINTER,iMakeupExp)	--转化成补偿经验
--			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,11417, 0)
		--debug start --
-- 		TaskCApi. SetGlobalDataEx (TASKINTERFACE_POINTER,31,iCount)
		--debug end --
			return 0
		end
   	end
}

TaskList[11465] = --补充试炼次数临时任务
{
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,	--接受即完成！

		bRecordFinishCount = true,
  		iMaxFinishCount = 100,		--每天最多可完成的次数：100
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview = { }
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
   		Method.iTimeLimit = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local idx = 0	--活动计数的编号：神之试炼
		local iCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--取得计次数值
   		if bSuccess then
			if iCount == 0 then
				TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 1)	--把活动计数+1次
			end
		--debug start --
		iCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
		TaskCApi. SetGlobalDataEx (TASKINTERFACE_POINTER,31,iCount)
		--debug end --
			return 0
		end
   	end
}

TaskList[11712] = --幸运陀螺
{
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,	--接受即完成！

		bRecordFinishCount = true,
  		iMaxFinishCount = 9999,		--每天最多可完成的次数：9999
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iTaskID = 10631	--个人幸运任务的id
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if iCount >= 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES	--错误码41
		end
		if iPlayerLev < 30 then	--个人幸运的参与等级：30级
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
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
   		Method.iTimeLimit = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		local greenWeight = 0.1	--绿幸运任务的概率
		local blueWeight = 0.02	--蓝幸运任务的概率
		local iTaskIDMain = 10631	--个人幸运任务的id
		local iTaskIDExclusive = 11711	--个人幸运任务的互斥任务的id
		local iTaskIDGreen = 11759	--绿色幸运任务的id
		local iTaskIDBlue = 11760	--蓝色幸运任务的id

		math.randomseed(os.time())
		local iRandomNum = math.random()
		--取得绿幸运任务引子、蓝幸运任务引子的完成次数
		local greenLuck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskIDGreen)
		local blueLuck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskIDBlue)

   		if bSuccess then
			TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskIDMain, false)		--中止个人幸运任务，不发失败奖励
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskIDExclusive) 	--清除个人幸运的互斥任务的次数
			if greenLuck >= 1 then
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskIDGreen) 	--清除绿色幸运的次数
			elseif blueLuck >= 1 then
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskIDBlue) 	--清除蓝色幸运的次数
			elseif iRandomNum <= blueWeight then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskIDBlue)	--发放蓝色幸运
			elseif iRandomNum <= greenWeight then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskIDGreen)	--发放绿色幸运
			end
		end
		return 0
   	end
}

TaskList[11757] = --公会基地商城物品快捷完成基地任务并捐资金
{
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,	--接受即完成！

		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.GongHui,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查，客户端在NPC显示、玩家确认接受时调用，服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iItemID1 = 34314	--龙纹珠贝的物品id
		local iItemID2 = 23911	--公会基地建设令id
		local iCount1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID1, true)
		local iCount2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID2, true)
		if iCount1 < 1 or iCount2 < 1 then
			return TASK_PREREQU_FAIL_NO_ITEM
		end

		local iTaskID = 11758	--前提任务（完成过至少1次对踊跃者的奖赏）
		local iTaskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if iTaskCount < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES	--错误码41
		end

		local iTaskID2 = 8554	--互斥任务（踊跃者奖赏）
		local iTaskCount2 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID2)
		if iTaskCount2 >= 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iItemID1 = 34314	--龙纹珠贝的物品id
		local iItemID2 = 23911	--公会基地建设令id
		TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID1, 1)
		TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID2, 1)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用，客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iTimeLimit = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iFactionLev = TaskCApi.GetFactionLev(TASKINTERFACE_POINTER)	--玩家所在公会等级
		local iTaskID = 9286	--首轮特别奖励任务id
		local tFactionResources = 	--公会资源值
		{
			[1] = --4级公会
			{
				{0,0,2,2,0},{0,0,3,3,0},{0,0,4,4,0},{0,0,5,5,0},--第1/2/3/4次基地任务奖励，资源值0#武装，1#魔法，2#经济，3#文明，4#信仰
			},
			[2] = --5级公会
			{
				{0,1,1,1,1},{0,1,1,1,1},{0,2,2,2,2},{0,3,3,3,3},
			},
		}

   		if bSuccess then
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskID)
			--公会资金奖励
			if iPlayerLev <= 39 then
				TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER,5000)
			elseif iPlayerLev <= 59 then
				TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER,10000)
			elseif iPlayerLev <= 79 then
				TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER,16000)
			else
				TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER,20000)
			end
			--公会资源值奖励
			local tFactionResTotal = { 0,0,0,0,0}	--前4次即1轮的合计
			if iFactionLev == 4 then
				for k,v in ipairs(tFactionResources[1]) do
					for k1,v1 in ipairs(v) do
						tFactionResTotal[k1] = tFactionResTotal[k1] + v1
					end
				end
			elseif iFactionLev > 4 then
				for k,v in ipairs(tFactionResources[2]) do
					for k1,v1 in ipairs(v) do
						tFactionResTotal[k1] = tFactionResTotal[k1] + v1
					end
				end
			end
			for kk,vv in ipairs(tFactionResTotal) do
 				if vv ~= 0 then
 					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, kk-1 ,vv)	--发放(kk-1)#资源值
 				end
			end
		end
		return 0
   	end
}
