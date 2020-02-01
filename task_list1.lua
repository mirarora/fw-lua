---------------------------------------------------------------
--  created:   2010.3.17
--  author:    ld
--
--  内容：任务脚本文件。..
---------------------------------------------------------------
----	脚本任务列表：by xzy
----	TaskList[9445] = --	测试任务
----	TaskList[9619] = --	社交家：我在克兰蒙多的日子
----	TaskList[9928] = --	40级足迹卡片重复任务
----	TaskList[10631] = --个人幸运活动
----	TaskList[10763] = --日常-服务器幸运活动1
----	TaskList[10764] = --日常-服务器幸运活动2
----	TaskList[11417] = --试炼次数转补偿
----	TaskList[11712] = --幸运陀螺,
----	TaskList[11757] = --公会基地商城物品快捷完成基地任务并捐资金
----	TaskList[12244] = --沉睡丛林探险家主任务：伟大的旅程
----	TaskList[12635] = --四季合唱团-嘉铭,
----	TaskList[12634] = --四季合唱团-真真,
----	TaskList[12636] = --四季合唱团-炀羽,
----	TaskList[13008] = --初次领取历练精华,
----	TaskList[13012] = --魔方百层塔队长选关,
----	TaskList[13217] = --连续登陆3天奖励,
----	TaskList[13222] = --宝石重铸-免费,
----	TaskList[13579] = --纪元每周领经验,
----	TaskList[13580] = --纪元额外领补偿经验,
----	TaskList[13588] = --【废弃】凤凰令1级
----	TaskList[13637] = --【废弃】辉光令1级
----	TaskList[13642] = --装备本随机周常主任务（英雄主义的呐喊）
----	TaskList[13214] = --累计登录180之后的经验嘉奖
----	TaskList[13758] = --【雷辛格日常】换防令
----	TaskList[13765] = --【雷辛格日常】阿敢快跑
----	TaskList[13780] = --【竞技场热身赛奖励】根据积分发称号
----	TaskList[13915] = --【体验服发奖】活跃度
----	TaskList[14160] = --凤凰令·真	--使用 38000 接到
----	TaskList[14173] = --辉光令·真	--使用 38375 接到
----	TaskList[14572] = --宝石重铸-恩德值
----	TaskList[14573] = --宝石副本次数重置
----	TaskList[14581] = --运营声望清空及转化魂币
----	TaskList[14630] = --悬赏信刷新
----	TaskList[14631] = --悬赏信高级刷新
----	TaskList[14723] = --悬赏信声望换高级符文方式1
----	TaskList[14724] = --悬赏信声望换高级符文方式2
----	TaskList[14881] = --2012欧洲杯竞猜
----	TaskList[14927] = --地狱之路蔷薇公主属性1加点
----	TaskList[14928] = --地狱之路蔷薇公主属性1加点
----	TaskList[14929] = --地狱之路蔷薇公主属性1加点
----	TaskList[15106] = --推广员奖励经验
----	TaskList[15369] = --装备副本日常首次大额经验&前4次活跃
----	TaskList[15370] = --装备副本日常前4次完成后领取魂器食物奖励
----	TaskList[15388] = --每周活跃度向导140点以上
----	TaskList[15371] = --消耗幸运值冲幸运等级任务
----	TaskList[15420] = --喊话报告幸运等级的脚本任务
----	TaskList[15703] = --解锁战备大礼
----	TaskList[15706] = --北美专属任务：签到
----	TaskList[15785] = --获得更多魔石牌子的解锁任务
----	TaskList[15852] = --地狱之路获得活跃度
----	TaskList[15956] = --【竞技场第一赛季奖励】根据积分发称号和时装包、坐骑包等
----	TaskList[15974] = --神之试炼二章代工额外奖励
----	TaskList[15975] = --神之试炼二章代工额外奖励++
----	TaskList[16106] = --根据累计活跃度发金镶玉
----	TaskList[16376] = --装备本幸运任务
----	TaskList[16388] = --无限追缴令
----	TaskList[16635] = --封印技能书重铸-魂币
----	TaskList[17062] = --地狱之路过关奖励技能封印之卷
----	TaskList[17130] = --201311回流礼包
----	TaskList[17196] = --远古入侵经验书礼盒
----	TaskList[17197] = --远古入侵信仰书礼盒
----	TaskList[17198] = --远古入侵物资礼盒

----	1st edition:	2010.6.8
---------------------------------------------------------------

TaskList[9445] = --xiaozhiyu测试任务,使用物品24181接到
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
-- 		Exp = function(TASKINTERFACE_POINTER)
-- 			local godBeliefCost,evilBeliefCost = TaskCApi.GetBeliefConsume(TASKINTERFACE_POINTER)
-- 			return math.min(20*10000*10000,godBeliefCost)
-- 		end
-- 		,
-- 		BindMoney = function(TASKINTERFACE_POINTER)
-- 			local godBeliefCost,evilBeliefCost = TaskCApi.GetBeliefConsume(TASKINTERFACE_POINTER)
-- 			return math.min(20*10000*10000,evilBeliefCost)
-- 		end
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
		bRecordFinishCount = true,
  	}
   	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
   		return 0
   	end
   	,
	OnAIEvent = function(TASKINTERFACE_POINTER, who, param1, param2)
		if param1 == 10000 and param2 == 9445 then
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,9445, 7,2);
--			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,9445, 1)
		end
		return 0
	end
	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		local iRandomNum = math.random(1,table.getn(TaskList[9445].AllTasks) - 2)

		local godBeliefCost,evilBeliefCost = TaskCApi.GetBeliefConsume(TASKINTERFACE_POINTER)
		local amount = TaskCApi.GetMonsterKillAmount(TASKINTERFACE_POINTER)
		TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,math.min(20*10000*10000,godBeliefCost))
		TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,math.min(20*10000*10000,amount))
		TaskCApi.Broadcast(TASKINTERFACE_POINTER ,9445, TaskBroadcastChannel.Secret)

		local target = 3627700;
		local param1 = 10000;
		local param2 = 9445;	--任务id
		TaskCApi.SendAIEvent (TASKINTERFACE_POINTER, target, param1, param2);
--		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,13580)
--		TaskCApi.AddSelfBuff(TASKINTERFACE_POINTER, 3600, 1)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
		local iRandomNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,9445, 1)
   		local Method = {}
		Method.iWaitTime = 120
		Method.iTimeLimit = 120
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local monsterKilled = TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER,9445, "Mons1")
		if monsterKilled >= 10 then
			iRet = TASK_SUCC_FINISH
		end
		local curTime = TaskCApi.GetCurTime(TASKINTERFACE_POINTER) --获取系统当前时间,单位秒。
		local deliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER ,9445) --获取玩家接收到任务iTaskID的时间,单位秒。
		if curTime - deliverTime >= 120 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5)

   		if bSuccess then
			local side1 = 100
			local side2 = 200
			local bCrossServer = TaskCApi.IsCrossServer(TASKINTERFACE_POINTER)
			if bCrossServer then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,side1)
			else
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,side2)
			end
--			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 13648)
   		end

   		return 0
   	end
}



TaskList[9619] = --社交家：我在克兰蒙多的日子
{
  	iTaskAll =	--任务全列表,可扩充。id是任务id,lv是最低领取等级,lvmax是最高领取等级
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

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 40 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--需要社交家等级至少为1级
		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, 32) then
			return TASK_PREREQU_FAIL_LUA_TASK
		elseif TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER, 32) < 1 then
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

神之试炼补偿任务,相关逻辑原件。本脚本任务是w。

－－－－－－－－－分割线－－－－－－－－－－－－－－－－
逻辑最终呈现

1）今天是周一,不能补。
2）今天是周二,如果周一我没做试炼,今天可以补1次。如果昨天我做了试炼,今天不能补。
3）今天是周三,补过的就不算缺的了。如果前两天我缺1次,可以补1次。如果缺2次,可以补2次。
4）今天是周四,补过的就不算缺的了。如果前三天我缺1次,可以补1次。如果缺2次,可以补2次。如果缺3次,可以补3次。
5）今天是周五,补过的就不算缺的了。如果前四天我缺1次,可以补1次。如果缺2次,可以补2次。如果缺3次,可以补3次。
6）今天是周六,补过的就不算缺的了。如果前五天我缺1次,可以补1次。如果缺2次,可以补2次。如果缺3次,可以补3次。
7）今天是周日,补过的就不算缺的了。如果前六天我缺1次,可以补1次。如果缺2次,可以补2次。如果缺3次,可以补3次。

逻辑过程

编辑器任务x,计数用,记录本周周一起,试炼了几次。每周日23：59清空。接到即完成。【9821 功能-副本-神之试炼-本周完成次数】
编辑器任务y,计数用,记录本周周一起,补偿了几次。每周日23：59清空。接到即完成。【9820 功能-副本-神之试炼-补偿总次数】
编辑器任务n1,被判断用,用于r1判断是否今日可做。每天清空。接到即完成。【9827 功能-副本-神之试炼补偿-n1】
编辑器任务n2,被判断用,用于r2判断是否今日可做。完成后发出n1。每天清空。接到即完成。【9828 功能-副本-神之试炼补偿-n2】
编辑器任务n3,被判断用,用于r3判断是否今日可做。完成后发出n2。每天清空。接到即完成。【9829 功能-副本-神之试炼补偿-n3】

脚本任务w,隐藏,试炼后发出,根据今天周几、x、y三个数据的情况,该补1次就发n1,该补2次就发n2,该补3次就发n3。【9826 功能-副本-神之试炼补偿主任务】
编辑器任务r1,实际补偿任务,每天1次,前提是n1已完成。每天清空。【9806 功能-副本-神之试炼补偿1次】
编辑器任务r2,实际补偿任务,每天1次,前提是n2已完成,且r1完成1次。每天清空。【9807 功能-副本-神之试炼补偿2次】
编辑器任务r3,实际补偿任务,每天1次,前提是n3已完成,且r2完成1次。每天清空。【9808 功能-副本-神之试炼补偿3次】

物品b1：小补丸。
物品b2：大补丸。

角色创建距今满24小时数量（向上取整）z。

根据周几、x、y、z四个数据,判断发放n1、n2、n3的逻辑
1）如果今天是周一,不做任何事情。
2）如果今天是周二,计算min(1,min(2,z)-x-y),如果是0啥都不做,是1发任务n1
3）如果今天是周三,计算min(2,min(3,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2
4）如果今天是周四,计算min(3,min(4,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3
5）如果今天是周五,计算min(3,min(5,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3
6）如果今天是周六,计算min(3,min(6,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3
7）如果今天是周日,计算min(3,min(7,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3

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

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		--什么都不做,包括检查任务栏是否有空

		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)

		--什么都不做

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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

   	--发放补偿次数n1－n3,如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3
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

		--取出星期几,放入dayInWeek中,周日是1,周一是2...
		local timePackage = os.date("*t", os.time());
		local dayInWeek = timePackage.wday;

		--本周已做试炼次数和本周已补次数
		local timesX = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[9826].Params.taskXID)
		local timesY = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[9826].Params.taskYID)

		--考虑角色创建时间,看今天能补几次
		local createUserSeconds = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)
		local nowSeconds = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
		local period = nowSeconds - createUserSeconds
		local timesOnCreate = math.ceil(period/86400)  -- 这就是z,本周最多做＋补次数,“次数”“基于”“创建时间”

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

		--根据周几、x、y、z四个数据,判断发放n1、n2、n3的逻辑
		--1）如果今天是周一,不做任何事情。

		--2）如果今天是周二,计算min(1,min(2,z)-x-y),如果是0啥都不做,是1发任务n1
		if dayInWeek == 3 then
		    local canDoAndComThisWeek = math.min(2,timesOnCreate)
			local canCompensateTimesToday = math.min(1,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

		--3）如果今天是周三,计算min(2,min(3,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2
		if dayInWeek == 4 then
		    local canDoAndComThisWeek = math.min(3,timesOnCreate)
			local canCompensateTimesToday = math.min(2,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

		--4）如果今天是周四,计算min(3,min(4,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3
		if dayInWeek == 5 then
		    local canDoAndComThisWeek = math.min(4,timesOnCreate)
			local canCompensateTimesToday = math.min(3,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end


		--5）如果今天是周五,计算min(3,min(5,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3
		if dayInWeek == 6 then
		    local canDoAndComThisWeek = math.min(5,timesOnCreate)
			local canCompensateTimesToday = math.min(3,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

		--6）如果今天是周六,计算min(3,min(6,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3
		if dayInWeek == 7 then
		    local canDoAndComThisWeek = math.min(6,timesOnCreate)
			local canCompensateTimesToday = math.min(3,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

		--7）如果今天是周日,计算min(3,min(7,z)-x-y),如果是0啥都不做,是1发放任务n1,是2发放任务n2,是3发放任务n3
		if dayInWeek == 1 then
		    local canDoAndComThisWeek = math.min(7,timesOnCreate)
			local canCompensateTimesToday = math.min(3,canDoAndComThisWeek-timesX-timesY)
			TaskList[9826].DeliveryTaskN(TASKINTERFACE_POINTER,canCompensateTimesToday)
		end

   		return 0
   	end
   	,

}
TaskList[9928] = --足迹-重复-40级
{
  	iTaskAll =	--任务全列表,可扩充。id是任务id,lv是最低领取等级,lvmax是最高领取等级
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

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
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
     [1]={order=1,task=9702,count=10,lvmin=1,lvmax=39,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="stay",wt=1,sug=0,wtsug=1,},
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
     [15]={order=15,task=9706,count=10,lvmin=10,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="life",wt=5,sug=2,wtsug=50,},
     [16]={order=16,task=8204,count=3,lvmin=35,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=1,sug=2,wtsug=10,},
     [17]={order=17,task=8143,count=1,lvmin=20,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=2,sug=2,wtsug=20,},
     [18]={order=18,task=6911,count=1,lvmin=20,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="god",wt=5,sug=3,wtsug=100,},
     [19]={order=19,task=9927,count=1,lvmin=15,lvmax=69,subid=-1,sublvmin=0,sublvmax=0,weekday=3,class="item",wt=1,sug=3,wtsug=20,},
     [20]={order=20,task=8361,count=1,lvmin=20,lvmax=34,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [21]={order=21,task=8362,count=1,lvmin=35,lvmax=44,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [22]={order=22,task=8363,count=1,lvmin=45,lvmax=54,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [23]={order=23,task=8364,count=1,lvmin=55,lvmax=64,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [24]={order=24,task=9873,count=1,lvmin=63,lvmax=67,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [25]={order=25,task=9874,count=1,lvmin=68,lvmax=72,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [26]={order=26,task=7897,count=1,lvmin=20,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=5,wtsug=100,},
     [27]={order=27,task=9926,count=1,lvmin=40,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=5,wtsug=100,},
     [28]={order=28,task=9927,count=1,lvmin=15,lvmax=69,subid=-1,sublvmin=0,sublvmax=0,weekday=5,class="item",wt=1,sug=5,wtsug=20,},
     [29]={order=29,task=8153,count=1,lvmin=25,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="luola",wt=5,sug=6,wtsug=100,},
     [30]={order=30,task=10417,count=1,lvmin=30,lvmax=39,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [31]={order=31,task=10418,count=1,lvmin=40,lvmax=49,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [32]={order=32,task=10419,count=1,lvmin=50,lvmax=59,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [33]={order=33,task=10420,count=1,lvmin=60,lvmax=64,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [34]={order=34,task=10421,count=1,lvmin=65,lvmax=69,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [35]={order=35,task=11689,count=1,lvmin=70,lvmax=74,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [36]={order=36,task=11690,count=1,lvmin=75,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=6,wtsug=100,},
     [37]={order=37,task=8147,count=1,lvmin=25,lvmax=49,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=2,sug=6,wtsug=40,},
     [38]={order=38,task=8640,count=1,lvmin=40,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=6,class="item",wt=5,sug=6,wtsug=100,},
     [39]={order=39,task=9927,count=1,lvmin=15,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=7,class="money",wt=5,sug=7,wtsug=200,},
     [40]={order=40,task=7692,count=1,lvmin=30,lvmax=69,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="pet",wt=5,sug=7,wtsug=50,},
     [41]={order=41,task=9966,count=1,lvmin=35,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=7,wtsug=50,},
     [42]={order=42,task=10101,count=1,lvmin=40,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=5,sug=0,wtsug=5,},
     [43]={order=43,task=5340,count=3,lvmin=30,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [44]={order=44,task=5999,count=5,lvmin=30,lvmax=38,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [45]={order=45,task=5871,count=5,lvmin=40,lvmax=59,subid=33,sublvmin=1,sublvmax=1,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [46]={order=46,task=5998,count=5,lvmin=40,lvmax=59,subid=33,sublvmin=2,sublvmax=50,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [47]={order=47,task=9966,count=1,lvmin=35,lvmax=200,subid=35,sublvmin=2,sublvmax=50,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [48]={order=48,task=7787,count=1,lvmin=20,lvmax=200,subid=1,sublvmin=5,sublvmax=50,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [49]={order=49,task=7815,count=1,lvmin=20,lvmax=200,subid=0,sublvmin=5,sublvmax=50,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [50]={order=50,task=7995,count=3,lvmin=20,lvmax=200,subid=32,sublvmin=3,sublvmax=50,weekday=0,class="item",wt=10,sug=0,wtsug=10,},
     [51]={order=51,task=10615,count=2,lvmin=30,lvmax=34,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [52]={order=52,task=10616,count=2,lvmin=35,lvmax=39,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [53]={order=53,task=10617,count=2,lvmin=40,lvmax=44,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [54]={order=54,task=10618,count=2,lvmin=45,lvmax=49,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [55]={order=55,task=10619,count=2,lvmin=50,lvmax=54,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [56]={order=56,task=10621,count=2,lvmin=55,lvmax=59,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [57]={order=57,task=10622,count=2,lvmin=60,lvmax=64,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [58]={order=58,task=10623,count=2,lvmin=65,lvmax=69,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [59]={order=59,task=11316,count=1,lvmin=50,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="item",wt=1,sug=6,wtsug=100,},
     [60]={order=60,task=11421,count=1,lvmin=40,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="OnlyOnce",wt=5,sug=2,wtsug=100,},
     [61]={order=61,task=11520,count=1,lvmin=45,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=1,class="PVP",wt=0,sug=1,wtsug=100,},
     [62]={order=62,task=12337,count=1,lvmin=70,lvmax=90,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="pet",wt=5,sug=7,wtsug=100,},
     [63]={order=63,task=12207,count=2,lvmin=70,lvmax=74,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [64]={order=64,task=12208,count=2,lvmin=75,lvmax=79,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [65]={order=65,task=11754,count=1,lvmin=73,lvmax=74,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
     [66]={order=66,task=13647,count=2,lvmin=80,lvmax=84,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [67]={order=67,task=16337,count=1,lvmin=200,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=1,wtsug=100,},
     [68]={order=68,task=12454,count=1,lvmin=75,lvmax=80,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="Rand1",wt=5,sug=4,wtsug=100,},
     [69]={order=69,task=16343,count=1,lvmin=75,lvmax=80,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="Rand2",wt=5,sug=4,wtsug=100,},
     [70]={order=70,task=16341,count=1,lvmin=75,lvmax=80,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="Rand3",wt=5,sug=4,wtsug=100,},
     [71]={order=71,task=16183,count=1,lvmin=65,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=6,wtsug=100,},
     [72]={order=72,task=16976,count=2,lvmin=85,lvmax=89,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [73]={order=73,task=16977,count=2,lvmin=90,lvmax=90,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="exp",wt=5,sug=3,wtsug=100,},
     [74]={order=74,task=17055,count=1,lvmin=81,lvmax=200,subid=-1,sublvmin=0,sublvmax=0,weekday=0,class="equip",wt=5,sug=4,wtsug=100,},
    },

	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			--基础经验数据
			local baseExp = 150 	--本体经验
			local expMulti = 1		--对本体经验的加成系数初始值
			local greenPlus = 0.3	--绿色幸运任务的经验加成
			local bluePlus = 0.6	--蓝色幸运任务的经验加成
			local luckGradePlus = 0	--【幸运等级】的经验加成初始值
			--取得幸运陀螺任务、绿幸运任务引子、蓝幸运任务引子的完成次数
			local dice_count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11712)
			local green_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
			local blue_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11760)
			--取得玩家等级数据
			local player={}
			player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--根据玩家等级,从全局表里找到对应的等级经验系数
			local iExperience = TaskExpAdjust[player.level]
			--如果是噩梦嘉年华（order=60），本体经验+100%
			local ucRandomNum1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10631, 1)
			if ucRandomNum1 == 60 then
				expMulti = expMulti + 1
			end
			--计算绿色和蓝色幸运
			if green_luck >= 1 then
				expMulti = expMulti + greenPlus
			elseif blue_luck >=1 then
				expMulti = expMulti + bluePlus
			end
			-- 取得幸运等级
			local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)

			return math.floor(iExperience * baseExp * expMulti * (1+luckGrade))
		end
		,
		Items = function(TASKINTERFACE_POINTER)
			-- 60级以上发信仰双倍道具
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local items = {}
			if iPlayerLev >= 60 then
				items =
				{
					Item1 = {ID = 44039, NUM = 1},
				}
			end
			return items
		end
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
		bAbsoluteTime = true,	--是否是绝对时间（用于任务时限,线下时间是否计入任务时间）

		bRecordFinishCount = true,
  		iMaxFinishCount = 9999,		--每天最多可完成的次数：9999
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iTaskID = 11711	--个人幸运任务的互斥任务的id
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		--计算今天可以做的个人幸运次数 == max (3,可补偿次数)
		local idx = 2			--幸运计次占用的活动计数编号
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
		local xx = math.floor(commonCount / 10)										--百位和十位：幸运积累次数
		local yy = commonCount % 10													--个位：可补偿次数
		local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,10631)
		if selfCount >= 3 or yy < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
	   	--等级30级以上
		if iPlayerLev < 30 then
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
	   	end
		--互斥任务完成过1次就不能接了（幸运任务失败时会发互斥任务）
		if iCount >= 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		--取得玩家等级&副职业等级数据
		local subprof_available = {0,1,2,3,4,5,6,7,9,10,11,32,33,34,35}		--开放的副职业,id从0开始
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

		--取出星期几,放入dayInWeek中,周日是1,周一是2, 周二是3,周三是4, 周四是5,周五是6, 周六是7
		local timePackage = os.date("*t", os.time())
		local dayInWeek = timePackage.wday
		local monthNum,dayNum = timePackage.month,timePackage.day
		--定义基本库
		local iTaskToDeliver = {}
		--定义权重合计值变量,初始值为0
		local wtTotal = 0
		--取得幸运陀螺任务、绿幸运任务引子、蓝幸运任务引子的完成次数
		local dice_count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11712)
		local green_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
		local blue_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11760)

		-- 2013.03.19 读取全局变量，用于对75级装备副本的随机处理
		local GlobalIndex = 110119
		local GlobalVar = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER,GlobalIndex)

		--遍历原始表,按条件筛选数据,并压进基本库
		for i,v in ipairs(TaskList[10631].AllTasks) do
			--如果是今日推荐活动,且,没有使用过幸运陀螺,那么采用推荐权重替换平时权重
			if v.sug == dayInWeek and (dice_count == 0 or dice_count == nil) then
				v.wt = v.wtsug
			end

			-- 2013.03.19 设定全局变量值和配置表class项的对应关系
			local bLucky = false
			if v.class == "Rand1" then
				if GlobalVar == 1 then
					bLucky = true
				end
			elseif v.class == "Rand2" then
				if GlobalVar == 2 then
					bLucky = true
				end
			elseif v.class == "Rand3" then
				if GlobalVar == 3 then
					bLucky = true
				end
			else
				bLucky = true
			end

			-- 进行筛选,并压进基本库
			-- 需要对OnlyOnce的任务进行特殊处理,使得每周只能随到1次）
			if v.class ~= "OnlyOnce" or TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,v.task) < 1 then
				-- 是本日才能做的 或者 全周都能做的
				if v.weekday == dayInWeek or v.weekday == 0 then
					-- 按照等级要求进行筛选
					if player.level >= v.lvmin and player.level <= v.lvmax	then
						-- 2013.03.19 处理75级随机副本
						if bLucky == true then
							-- 按照副职业等级进行要求筛选
							if not v.subid or v.subid == -1 then	--没有副职业需求的
								table.insert(iTaskToDeliver,v)
								wtTotal = wtTotal + v.wt	--累计权重
							elseif player.sublevel[v.subid + 1] >= v.sublvmin
								and player.sublevel[v.subid + 1] <= v.sublvmax	then --满足副职业等级要求
								table.insert(iTaskToDeliver,v)
								wtTotal = wtTotal + v.wt	--累计权重
							end
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

		--进行随机,把order存入任务变量1
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
		--把是否绿色或蓝色幸运,存入任务变量2
		local luckColor = 0		--普通0,绿色1,蓝色2
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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
			-- 普通包裹栏需要1格
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		math.randomseed(os.time())
		--基础经验数据
		local baseExp = 150 	--本体经验
		local baseLuck = 100	--幸运值
		local expMulti = 1		--对本体经验的加成系数初始值
		local greenPlus = 0.3	--绿色幸运任务的经验加成
		local bluePlus = 0.6	--蓝色幸运任务的经验加成
		local godPlus = 0		--幸运任务暴击经验加成初始值
		local luckGradePlus = 0	--【幸运等级】的经验加成初始值
		local PlayerReturnPlus = 0.5	--老玩家回归buff加成
		--取得幸运陀螺任务、绿幸运任务引子、蓝幸运任务引子的完成次数
		local dice_count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11712)
		local green_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
		local blue_luck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11760)
		--取得玩家等级数据
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--根据玩家等级,从全局表里找到对应的等级经验系数
		local iExperience = TaskExpAdjust[player.level]
		-- 取得幸运等级
		local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)

		-----------------------------------------------------------------------
		-- 幸运值 = 基础100点 *（ 1 + 绿色或蓝色幸运加成 + 嘉年华加成 ）
		-- 个人幸运任务经验 = 基础经验系数150 *（1 + 绿色或蓝色幸运加成 + 嘉年华幸运加成 + 老玩家回归buff加成）*（1 + 幸运等级 + 随机暴击倍率）
		-----------------------------------------------------------------------

   		if bSuccess then
			--如果是噩梦嘉年华（order=60），本体经验+100%
			if ucRandomNum1 == 60 then
				expMulti = expMulti + 1
			end
			--计算绿色或蓝色幸运的加成经验
			if green_luck >= 1 then
				expMulti = expMulti + greenPlus
				if luckGrade < 6 then
					TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 15372, 1)		--幸运等级+1
					luckGrade = luckGrade + 1
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15420)				--仅用于喊话的任务
				end
			elseif blue_luck >= 1 then
				expMulti = expMulti + bluePlus
				if luckGrade < 6 then
					TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 15372, 2)		--幸运等级+2
					luckGrade = luckGrade + 2
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15420)				--仅用于喊话的任务
				end
			end
			-- 如果有老玩家回归buff，则经验加成
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,2895) then
				expMulti = expMulti + PlayerReturnPlus
			end
			-- 计算随机暴击倍率	等级大于35级才有可能获得暴击
			if player.level >= 35 then
				local iRand = math.random(1,4000)	--随机经验暴击的几率
				--------------------------------------------------测试gm-----------------------------------------------------
				local item20049 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,20049, true)
				if item20049 ~= 0 then
					if item20049 == 1 then iRand = 51
					elseif  item20049 == 2 then iRand = 11
					elseif item20049 == 3 then iRand = 1
					end
				end
				-------------------------------------------------测试over----------------------------------------------------

				if iRand == 1 then
					godPlus = 3
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10631,TaskBroadcastChannel.System)
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,10633)--10633幸运之星任务
				elseif iRand <= 11 then
					godPlus = 2
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10631, TaskBroadcastChannel.System)
				elseif iRand <= 51 then
					godPlus = 1
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10631, TaskBroadcastChannel.Local)
				else
					godPlus = 0
				end
			end
			-- 计算幸运等级的经验加成
			luckGradePlus = math.min(6,luckGrade)


			--奖励经验和幸运值
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iExperience * baseExp * expMulti * (1 + luckGradePlus + godPlus)) 	--经验
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,10, baseLuck * expMulti )		--发幸运值,声望id=10

			--清除绿色蓝色幸运任务引子的完成次数
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,11759)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,11760)

			--计算 幸运积累次数和今日个人幸运次数
			local idx = 2				--幸运计次占用活动计数编号：2
			local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
			local xx = math.floor(commonCount / 10)										--百位和十位：幸运积累次数
			local yy = commonCount % 10													--个位：今日个人幸运次数
			xx = math.max(0,xx - 1)
			yy = math.max(0,yy - 1)														--yy减少1，最小到0。
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 10 * xx + yy - commonCount)		--设置成 10 * xx + yy

			--每周活跃度
			local WeeklyActivityTaskID = 13122
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, WeeklyActivityTaskID, 2)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,2)

			--发放信仰双倍道具
			if player.level >= 60 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,44039, 1,true)	--绑定
			end
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
        [1] = {keyID1 = 110,lv = 15,Date = "20130101",},
        [2] = {keyID1 = 3,lv = 30,Date = "20130102",},
        [3] = {keyID1 = 7,lv = 20,Date = "20130103",},
        [4] = {keyID1 = 1,lv = 20,Date = "20130104",},
        [5] = {keyID1 = 5,lv = 15,Date = "20130105",},
        [6] = {keyID1 = 4,lv = 40,Date = "20130106",},
        [7] = {keyID1 = 100,lv = 30,Date = "20130107",},
        [8] = {keyID1 = 3,lv = 30,Date = "20130108",},
        [9] = {keyID1 = 6,lv = 20,Date = "20130109",},
        [10] = {keyID1 = 11,lv = 35,Date = "20130110",},
        [11] = {keyID1 = 5,lv = 15,Date = "20130111",},
        [12] = {keyID1 = 2,lv = 25,Date = "20130112",},
        [13] = {keyID1 = 1,lv = 20,Date = "20130113",},
        [14] = {keyID1 = 100,lv = 30,Date = "20130114",},
        [15] = {keyID1 = 10,lv = 25,Date = "20130115",},
        [16] = {keyID1 = 9,lv = 25,Date = "20130116",},
        [17] = {keyID1 = 7,lv = 20,Date = "20130117",},
        [18] = {keyID1 = 4,lv = 40,Date = "20130118",},
        [19] = {keyID1 = 110,lv = 15,Date = "20130119",},
        [20] = {keyID1 = 130,lv = 25,Date = "20130120",},
        [21] = {keyID1 = 8,lv = 25,Date = "20130121",},
        [22] = {keyID1 = 3,lv = 30,Date = "20130122",},
        [23] = {keyID1 = 6,lv = 20,Date = "20130123",},
        [24] = {keyID1 = 11,lv = 35,Date = "20130124",},
        [25] = {keyID1 = 5,lv = 15,Date = "20130125",},
        [26] = {keyID1 = 2,lv = 25,Date = "20130126",},
        [27] = {keyID1 = 1,lv = 20,Date = "20130127",},
        [28] = {keyID1 = 100,lv = 30,Date = "20130128",},
        [29] = {keyID1 = 5,lv = 15,Date = "20130129",},
        [30] = {keyID1 = 9,lv = 25,Date = "20130130",},
        [31] = {keyID1 = 7,lv = 20,Date = "20130131",},
        [32] = {keyID1 = 4,lv = 40,Date = "20130201",},
        [33] = {keyID1 = 110,lv = 15,Date = "20130202",},
        [34] = {keyID1 = 130,lv = 25,Date = "20130203",},
        [35] = {keyID1 = 8,lv = 25,Date = "20130204",},
        [36] = {keyID1 = 110,lv = 15,Date = "20130205",},
        [37] = {keyID1 = 6,lv = 20,Date = "20130206",},
        [38] = {keyID1 = 7,lv = 20,Date = "20130207",},
        [39] = {keyID1 = 1,lv = 20,Date = "20130208",},
        [40] = {keyID1 = 10,lv = 25,Date = "20130209",},
        [41] = {keyID1 = 4,lv = 40,Date = "20130210",},
        [42] = {keyID1 = 100,lv = 30,Date = "20130211",},
        [43] = {keyID1 = 10,lv = 25,Date = "20130212",},
        [44] = {keyID1 = 9,lv = 25,Date = "20130213",},
        [45] = {keyID1 = 7,lv = 20,Date = "20130214",},
        [46] = {keyID1 = 4,lv = 40,Date = "20130215",},
        [47] = {keyID1 = 110,lv = 15,Date = "20130216",},
        [48] = {keyID1 = 130,lv = 25,Date = "20130217",},
        [49] = {keyID1 = 8,lv = 25,Date = "20130218",},
        [50] = {keyID1 = 2,lv = 25,Date = "20130219",},
        [51] = {keyID1 = 6,lv = 20,Date = "20130220",},
        [52] = {keyID1 = 11,lv = 35,Date = "20130221",},
        [53] = {keyID1 = 5,lv = 15,Date = "20130222",},
        [54] = {keyID1 = 4,lv = 40,Date = "20130223",},
        [55] = {keyID1 = 1,lv = 20,Date = "20130224",},
        [56] = {keyID1 = 100,lv = 30,Date = "20130225",},
        [57] = {keyID1 = 110,lv = 15,Date = "20130226",},
        [58] = {keyID1 = 1,lv = 20,Date = "20130227",},
        [59] = {keyID1 = 7,lv = 20,Date = "20130228",},
        [60] = {keyID1 = 130,lv = 25,Date = "20130301",},
        [61] = {keyID1 = 5,lv = 15,Date = "20130302",},
        [62] = {keyID1 = 4,lv = 40,Date = "20130303",},
        [63] = {keyID1 = 100,lv = 30,Date = "20130304",},
        [64] = {keyID1 = 110,lv = 15,Date = "20130305",},
        [65] = {keyID1 = 6,lv = 20,Date = "20130306",},
        [66] = {keyID1 = 7,lv = 20,Date = "20130307",},
        [67] = {keyID1 = 1,lv = 20,Date = "20130308",},
        [68] = {keyID1 = 5,lv = 15,Date = "20130309",},
        [69] = {keyID1 = 4,lv = 40,Date = "20130310",},
        [70] = {keyID1 = 100,lv = 30,Date = "20130311",},
        [71] = {keyID1 = 3,lv = 30,Date = "20130312",},
        [72] = {keyID1 = 6,lv = 20,Date = "20130313",},
        [73] = {keyID1 = 11,lv = 35,Date = "20130314",},
        [74] = {keyID1 = 5,lv = 15,Date = "20130315",},
        [75] = {keyID1 = 2,lv = 25,Date = "20130316",},
        [76] = {keyID1 = 1,lv = 20,Date = "20130317",},
        [77] = {keyID1 = 100,lv = 30,Date = "20130318",},
        [78] = {keyID1 = 10,lv = 25,Date = "20130319",},
        [79] = {keyID1 = 9,lv = 25,Date = "20130320",},
        [80] = {keyID1 = 7,lv = 20,Date = "20130321",},
        [81] = {keyID1 = 4,lv = 40,Date = "20130322",},
        [82] = {keyID1 = 110,lv = 15,Date = "20130323",},
        [83] = {keyID1 = 130,lv = 25,Date = "20130324",},
        [84] = {keyID1 = 8,lv = 25,Date = "20130325",},
        [85] = {keyID1 = 110,lv = 15,Date = "20130326",},
        [86] = {keyID1 = 6,lv = 20,Date = "20130327",},
        [87] = {keyID1 = 7,lv = 20,Date = "20130328",},
        [88] = {keyID1 = 1,lv = 20,Date = "20130329",},
        [89] = {keyID1 = 5,lv = 15,Date = "20130330",},
        [90] = {keyID1 = 4,lv = 40,Date = "20130331",},
        [91] = {keyID1 = 8,lv = 25,Date = "20130401",},
        [92] = {keyID1 = 110,lv = 15,Date = "20130402",},
        [93] = {keyID1 = 6,lv = 20,Date = "20130403",},
        [94] = {keyID1 = 7,lv = 20,Date = "20130404",},
        [95] = {keyID1 = 1,lv = 20,Date = "20130405",},
        [96] = {keyID1 = 10,lv = 25,Date = "20130406",},
        [97] = {keyID1 = 4,lv = 40,Date = "20130407",},
        [98] = {keyID1 = 100,lv = 30,Date = "20130408",},
        [99] = {keyID1 = 10,lv = 25,Date = "20130409",},
        [100] = {keyID1 = 9,lv = 25,Date = "20130410",},
        [101] = {keyID1 = 7,lv = 20,Date = "20130411",},
        [102] = {keyID1 = 4,lv = 40,Date = "20130412",},
        [103] = {keyID1 = 110,lv = 15,Date = "20130413",},
        [104] = {keyID1 = 130,lv = 25,Date = "20130414",},
        [105] = {keyID1 = 8,lv = 25,Date = "20130415",},
        [106] = {keyID1 = 2,lv = 25,Date = "20130416",},
        [107] = {keyID1 = 6,lv = 20,Date = "20130417",},
        [108] = {keyID1 = 11,lv = 35,Date = "20130418",},
        [109] = {keyID1 = 5,lv = 15,Date = "20130419",},
        [110] = {keyID1 = 4,lv = 40,Date = "20130420",},
        [111] = {keyID1 = 1,lv = 20,Date = "20130421",},
        [112] = {keyID1 = 100,lv = 30,Date = "20130422",},
        [113] = {keyID1 = 110,lv = 15,Date = "20130423",},
        [114] = {keyID1 = 1,lv = 20,Date = "20130424",},
        [115] = {keyID1 = 7,lv = 20,Date = "20130425",},
        [116] = {keyID1 = 130,lv = 25,Date = "20130426",},
        [117] = {keyID1 = 5,lv = 15,Date = "20130427",},
        [118] = {keyID1 = 4,lv = 40,Date = "20130428",},
        [119] = {keyID1 = 100,lv = 30,Date = "20130429",},
        [120] = {keyID1 = 110,lv = 15,Date = "20130430",},
        [121] = {keyID1 = 6,lv = 20,Date = "20130501",},
        [122] = {keyID1 = 7,lv = 20,Date = "20130502",},
        [123] = {keyID1 = 1,lv = 20,Date = "20130503",},
        [124] = {keyID1 = 5,lv = 15,Date = "20130504",},
        [125] = {keyID1 = 4,lv = 40,Date = "20130505",},
        [126] = {keyID1 = 100,lv = 30,Date = "20130506",},
        [127] = {keyID1 = 3,lv = 30,Date = "20130507",},
        [128] = {keyID1 = 6,lv = 20,Date = "20130508",},
        [129] = {keyID1 = 11,lv = 35,Date = "20130509",},
        [130] = {keyID1 = 5,lv = 15,Date = "20130510",},
        [131] = {keyID1 = 2,lv = 25,Date = "20130511",},
        [132] = {keyID1 = 1,lv = 20,Date = "20130512",},
        [133] = {keyID1 = 100,lv = 30,Date = "20130513",},
        [134] = {keyID1 = 10,lv = 25,Date = "20130514",},
        [135] = {keyID1 = 9,lv = 25,Date = "20130515",},
        [136] = {keyID1 = 7,lv = 20,Date = "20130516",},
        [137] = {keyID1 = 4,lv = 40,Date = "20130517",},
        [138] = {keyID1 = 110,lv = 15,Date = "20130518",},
        [139] = {keyID1 = 130,lv = 25,Date = "20130519",},
        [140] = {keyID1 = 8,lv = 25,Date = "20130520",},
        [141] = {keyID1 = 110,lv = 15,Date = "20130521",},
        [142] = {keyID1 = 6,lv = 20,Date = "20130522",},
        [143] = {keyID1 = 7,lv = 20,Date = "20130523",},
        [144] = {keyID1 = 1,lv = 20,Date = "20130524",},
        [145] = {keyID1 = 5,lv = 15,Date = "20130525",},
        [146] = {keyID1 = 4,lv = 40,Date = "20130526",},
        [147] = {keyID1 = 8,lv = 25,Date = "20130527",},
        [148] = {keyID1 = 2,lv = 25,Date = "20130528",},
        [149] = {keyID1 = 6,lv = 20,Date = "20130529",},
        [150] = {keyID1 = 11,lv = 35,Date = "20130530",},
        [151] = {keyID1 = 5,lv = 15,Date = "20130531",},
        [152] = {keyID1 = 4,lv = 40,Date = "20130601",},
        [153] = {keyID1 = 1,lv = 20,Date = "20130602",},
        [154] = {keyID1 = 100,lv = 30,Date = "20130603",},
        [155] = {keyID1 = 110,lv = 15,Date = "20130604",},
        [156] = {keyID1 = 1,lv = 20,Date = "20130605",},
        [157] = {keyID1 = 7,lv = 20,Date = "20130606",},
        [158] = {keyID1 = 130,lv = 25,Date = "20130607",},
        [159] = {keyID1 = 5,lv = 15,Date = "20130608",},
        [160] = {keyID1 = 4,lv = 40,Date = "20130609",},
        [161] = {keyID1 = 100,lv = 30,Date = "20130610",},
        [162] = {keyID1 = 110,lv = 15,Date = "20130611",},
        [163] = {keyID1 = 6,lv = 20,Date = "20130612",},
        [164] = {keyID1 = 7,lv = 20,Date = "20130613",},
        [165] = {keyID1 = 1,lv = 20,Date = "20130614",},
        [166] = {keyID1 = 5,lv = 15,Date = "20130615",},
        [167] = {keyID1 = 4,lv = 40,Date = "20130616",},
        [168] = {keyID1 = 100,lv = 30,Date = "20130617",},
        [169] = {keyID1 = 3,lv = 30,Date = "20130618",},
        [170] = {keyID1 = 6,lv = 20,Date = "20130619",},
        [171] = {keyID1 = 11,lv = 35,Date = "20130620",},
        [172] = {keyID1 = 5,lv = 15,Date = "20130621",},
        [173] = {keyID1 = 2,lv = 25,Date = "20130622",},
        [174] = {keyID1 = 1,lv = 20,Date = "20130623",},
        [175] = {keyID1 = 100,lv = 30,Date = "20130624",},
        [176] = {keyID1 = 10,lv = 25,Date = "20130625",},
        [177] = {keyID1 = 9,lv = 25,Date = "20130626",},
        [178] = {keyID1 = 7,lv = 20,Date = "20130627",},
        [179] = {keyID1 = 4,lv = 40,Date = "20130628",},
        [180] = {keyID1 = 110,lv = 15,Date = "20130629",},
        [181] = {keyID1 = 130,lv = 25,Date = "20130630",},
        [182] = {keyID1 = 8,lv = 25,Date = "20130701",},
        [183] = {keyID1 = 110,lv = 15,Date = "20130702",},
        [184] = {keyID1 = 6,lv = 20,Date = "20130703",},
        [185] = {keyID1 = 7,lv = 20,Date = "20130704",},
        [186] = {keyID1 = 1,lv = 20,Date = "20130705",},
        [187] = {keyID1 = 5,lv = 15,Date = "20130706",},
        [188] = {keyID1 = 4,lv = 40,Date = "20130707",},
        [189] = {keyID1 = 100,lv = 30,Date = "20130708",},
        [190] = {keyID1 = 3,lv = 30,Date = "20130709",},
        [191] = {keyID1 = 6,lv = 20,Date = "20130710",},
        [192] = {keyID1 = 11,lv = 35,Date = "20130711",},
        [193] = {keyID1 = 5,lv = 15,Date = "20130712",},
        [194] = {keyID1 = 2,lv = 25,Date = "20130713",},
        [195] = {keyID1 = 1,lv = 20,Date = "20130714",},
        [196] = {keyID1 = 100,lv = 30,Date = "20130715",},
        [197] = {keyID1 = 10,lv = 25,Date = "20130716",},
        [198] = {keyID1 = 9,lv = 25,Date = "20130717",},
        [199] = {keyID1 = 7,lv = 20,Date = "20130718",},
        [200] = {keyID1 = 4,lv = 40,Date = "20130719",},
        [201] = {keyID1 = 110,lv = 15,Date = "20130720",},
        [202] = {keyID1 = 130,lv = 25,Date = "20130721",},
        [203] = {keyID1 = 8,lv = 25,Date = "20130722",},
        [204] = {keyID1 = 110,lv = 15,Date = "20130723",},
        [205] = {keyID1 = 6,lv = 20,Date = "20130724",},
        [206] = {keyID1 = 7,lv = 20,Date = "20130725",},
        [207] = {keyID1 = 1,lv = 20,Date = "20130726",},
        [208] = {keyID1 = 5,lv = 15,Date = "20130727",},
        [209] = {keyID1 = 4,lv = 40,Date = "20130728",},
        [210] = {keyID1 = 8,lv = 25,Date = "20130729",},
        [211] = {keyID1 = 2,lv = 25,Date = "20130730",},
        [212] = {keyID1 = 6,lv = 20,Date = "20130731",},
        [213] = {keyID1 = 11,lv = 35,Date = "20130801",},
        [214] = {keyID1 = 5,lv = 15,Date = "20130802",},
        [215] = {keyID1 = 4,lv = 40,Date = "20130803",},
        [216] = {keyID1 = 1,lv = 20,Date = "20130804",},
        [217] = {keyID1 = 100,lv = 30,Date = "20130805",},
        [218] = {keyID1 = 110,lv = 15,Date = "20130806",},
        [219] = {keyID1 = 1,lv = 20,Date = "20130807",},
        [220] = {keyID1 = 7,lv = 20,Date = "20130808",},
        [221] = {keyID1 = 130,lv = 25,Date = "20130809",},
        [222] = {keyID1 = 5,lv = 15,Date = "20130810",},
        [223] = {keyID1 = 4,lv = 40,Date = "20130811",},
        [224] = {keyID1 = 100,lv = 30,Date = "20130812",},
        [225] = {keyID1 = 110,lv = 15,Date = "20130813",},
        [226] = {keyID1 = 6,lv = 20,Date = "20130814",},
        [227] = {keyID1 = 7,lv = 20,Date = "20130815",},
        [228] = {keyID1 = 1,lv = 20,Date = "20130816",},
        [229] = {keyID1 = 5,lv = 15,Date = "20130817",},
        [230] = {keyID1 = 4,lv = 40,Date = "20130818",},
        [231] = {keyID1 = 100,lv = 30,Date = "20130819",},
        [232] = {keyID1 = 3,lv = 30,Date = "20130820",},
        [233] = {keyID1 = 6,lv = 20,Date = "20130821",},
        [234] = {keyID1 = 11,lv = 35,Date = "20130822",},
        [235] = {keyID1 = 5,lv = 15,Date = "20130823",},
        [236] = {keyID1 = 2,lv = 25,Date = "20130824",},
        [237] = {keyID1 = 1,lv = 20,Date = "20130825",},
        [238] = {keyID1 = 100,lv = 30,Date = "20130826",},
        [239] = {keyID1 = 10,lv = 25,Date = "20130827",},
        [240] = {keyID1 = 9,lv = 25,Date = "20130828",},
        [241] = {keyID1 = 7,lv = 20,Date = "20130829",},
        [242] = {keyID1 = 4,lv = 40,Date = "20130830",},
        [243] = {keyID1 = 110,lv = 15,Date = "20130831",},
        [244] = {keyID1 = 6,lv = 20,Date = "20130901",},
        [245] = {keyID1 = 7,lv = 20,Date = "20130902",},
        [246] = {keyID1 = 8,lv = 25,Date = "20130903",},
        [247] = {keyID1 = 9,lv = 25,Date = "20130904",},
        [248] = {keyID1 = 11,lv = 35,Date = "20130905",},
        [249] = {keyID1 = 15,lv = 40,Date = "20130906",},
        [250] = {keyID1 = 100,lv = 30,Date = "20130907",},
        [251] = {keyID1 = 110,lv = 15,Date = "20130908",},
        [252] = {keyID1 = 130,lv = 25,Date = "20130909",},
        [253] = {keyID1 = 10,lv = 25,Date = "20130910",},
        [254] = {keyID1 = 1,lv = 20,Date = "20130911",},
        [255] = {keyID1 = 2,lv = 25,Date = "20130912",},
        [256] = {keyID1 = 3,lv = 30,Date = "20130913",},
        [257] = {keyID1 = 4,lv = 40,Date = "20130914",},
        [258] = {keyID1 = 5,lv = 15,Date = "20130915",},
        [259] = {keyID1 = 6,lv = 20,Date = "20130916",},
        [260] = {keyID1 = 7,lv = 20,Date = "20130917",},
        [261] = {keyID1 = 8,lv = 25,Date = "20130918",},
        [262] = {keyID1 = 9,lv = 25,Date = "20130919",},
        [263] = {keyID1 = 11,lv = 35,Date = "20130920",},
        [264] = {keyID1 = 15,lv = 40,Date = "20130921",},
        [265] = {keyID1 = 100,lv = 30,Date = "20130922",},
        [266] = {keyID1 = 110,lv = 15,Date = "20130923",},
        [267] = {keyID1 = 130,lv = 25,Date = "20130924",},
        [268] = {keyID1 = 10,lv = 25,Date = "20130925",},
        [269] = {keyID1 = 1,lv = 20,Date = "20130926",},
        [270] = {keyID1 = 2,lv = 25,Date = "20130927",},
        [271] = {keyID1 = 3,lv = 30,Date = "20130928",},
        [272] = {keyID1 = 4,lv = 40,Date = "20130929",},
        [273] = {keyID1 = 5,lv = 15,Date = "20130930",},
        [274] = {keyID1 = 6,lv = 20,Date = "20131001",},
        [275] = {keyID1 = 7,lv = 20,Date = "20131002",},
        [276] = {keyID1 = 8,lv = 25,Date = "20131003",},
        [277] = {keyID1 = 9,lv = 25,Date = "20131004",},
        [278] = {keyID1 = 11,lv = 35,Date = "20131005",},
        [279] = {keyID1 = 15,lv = 40,Date = "20131006",},
        [280] = {keyID1 = 100,lv = 30,Date = "20131007",},
        [281] = {keyID1 = 110,lv = 15,Date = "20131008",},
        [282] = {keyID1 = 130,lv = 25,Date = "20131009",},
        [283] = {keyID1 = 10,lv = 25,Date = "20131010",},
        [284] = {keyID1 = 1,lv = 20,Date = "20131011",},
        [285] = {keyID1 = 2,lv = 25,Date = "20131012",},
        [286] = {keyID1 = 3,lv = 30,Date = "20131013",},
        [287] = {keyID1 = 4,lv = 40,Date = "20131014",},
        [288] = {keyID1 = 5,lv = 15,Date = "20131015",},
        [289] = {keyID1 = 6,lv = 20,Date = "20131016",},
        [290] = {keyID1 = 7,lv = 20,Date = "20131017",},
        [291] = {keyID1 = 8,lv = 25,Date = "20131018",},
        [292] = {keyID1 = 9,lv = 25,Date = "20131019",},
        [293] = {keyID1 = 11,lv = 35,Date = "20131020",},
        [294] = {keyID1 = 15,lv = 40,Date = "20131021",},
        [295] = {keyID1 = 100,lv = 30,Date = "20131022",},
        [296] = {keyID1 = 110,lv = 15,Date = "20131023",},
        [297] = {keyID1 = 130,lv = 25,Date = "20131024",},
        [298] = {keyID1 = 10,lv = 25,Date = "20131025",},
        [299] = {keyID1 = 1,lv = 20,Date = "20131026",},
        [300] = {keyID1 = 2,lv = 25,Date = "20131027",},
        [301] = {keyID1 = 3,lv = 30,Date = "20131028",},
        [302] = {keyID1 = 1,lv = 20,Date = "20131029",},
        [303] = {keyID1 = 2,lv = 25,Date = "20131030",},
        [304] = {keyID1 = 3,lv = 30,Date = "20131031",},
        [305] = {keyID1 = 4,lv = 40,Date = "20131101",},
        [306] = {keyID1 = 5,lv = 15,Date = "20131102",},
        [307] = {keyID1 = 6,lv = 20,Date = "20131103",},
        [308] = {keyID1 = 7,lv = 20,Date = "20131104",},
        [309] = {keyID1 = 8,lv = 25,Date = "20131105",},
        [310] = {keyID1 = 9,lv = 25,Date = "20131106",},
        [311] = {keyID1 = 11,lv = 35,Date = "20131107",},
        [312] = {keyID1 = 15,lv = 40,Date = "20131108",},
        [313] = {keyID1 = 100,lv = 30,Date = "20131109",},
        [314] = {keyID1 = 110,lv = 15,Date = "20131110",},
        [315] = {keyID1 = 130,lv = 25,Date = "20131111",},
        [316] = {keyID1 = 10,lv = 25,Date = "20131112",},
        [317] = {keyID1 = 1,lv = 20,Date = "20131113",},
        [318] = {keyID1 = 2,lv = 25,Date = "20131114",},
        [319] = {keyID1 = 3,lv = 30,Date = "20131115",},
        [320] = {keyID1 = 4,lv = 40,Date = "20131116",},
        [321] = {keyID1 = 5,lv = 15,Date = "20131117",},
        [322] = {keyID1 = 6,lv = 20,Date = "20131118",},
        [323] = {keyID1 = 7,lv = 20,Date = "20131119",},
        [324] = {keyID1 = 8,lv = 25,Date = "20131120",},
        [325] = {keyID1 = 9,lv = 25,Date = "20131121",},
        [326] = {keyID1 = 11,lv = 35,Date = "20131122",},
        [327] = {keyID1 = 15,lv = 40,Date = "20131123",},
        [328] = {keyID1 = 100,lv = 30,Date = "20131124",},
        [329] = {keyID1 = 110,lv = 15,Date = "20131125",},
        [330] = {keyID1 = 130,lv = 25,Date = "20131126",},
        [331] = {keyID1 = 10,lv = 25,Date = "20131127",},
        [332] = {keyID1 = 1,lv = 20,Date = "20131128",},
        [333] = {keyID1 = 2,lv = 25,Date = "20131129",},
        [334] = {keyID1 = 3,lv = 30,Date = "20131130",},
        [335] = {keyID1 = 4,lv = 40,Date = "20131201",},
        [336] = {keyID1 = 5,lv = 15,Date = "20131202",},
        [337] = {keyID1 = 6,lv = 20,Date = "20131203",},
        [338] = {keyID1 = 7,lv = 20,Date = "20131204",},
        [339] = {keyID1 = 8,lv = 25,Date = "20131205",},
        [340] = {keyID1 = 9,lv = 25,Date = "20131206",},
        [341] = {keyID1 = 11,lv = 35,Date = "20131207",},
        [342] = {keyID1 = 15,lv = 40,Date = "20131208",},
        [343] = {keyID1 = 100,lv = 30,Date = "20131209",},
        [344] = {keyID1 = 110,lv = 15,Date = "20131210",},
        [345] = {keyID1 = 130,lv = 25,Date = "20131211",},
        [346] = {keyID1 = 10,lv = 25,Date = "20131212",},
        [347] = {keyID1 = 1,lv = 20,Date = "20131213",},
        [348] = {keyID1 = 2,lv = 25,Date = "20131214",},
        [349] = {keyID1 = 3,lv = 30,Date = "20131215",},
        [350] = {keyID1 = 4,lv = 40,Date = "20131216",},
        [351] = {keyID1 = 5,lv = 15,Date = "20131217",},
        [352] = {keyID1 = 6,lv = 20,Date = "20131218",},
        [353] = {keyID1 = 7,lv = 20,Date = "20131219",},
        [354] = {keyID1 = 8,lv = 25,Date = "20131220",},
        [355] = {keyID1 = 9,lv = 25,Date = "20131221",},
        [356] = {keyID1 = 11,lv = 35,Date = "20131222",},
        [357] = {keyID1 = 15,lv = 40,Date = "20131223",},
        [358] = {keyID1 = 100,lv = 30,Date = "20131224",},
        [359] = {keyID1 = 110,lv = 15,Date = "20131225",},
        [360] = {keyID1 = 130,lv = 25,Date = "20131226",},
        [361] = {keyID1 = 10,lv = 25,Date = "20131227",},
        [362] = {keyID1 = 1,lv = 20,Date = "20131228",},
        [363] = {keyID1 = 2,lv = 25,Date = "20131229",},
        [364] = {keyID1 = 3,lv = 30,Date = "20131230",},
        [365] = {keyID1 = 1,lv = 20,Date = "20131231",},
        [366] = {keyID1 = 2,lv = 25,Date = "20140101",},
    },


	AllTasks =
    {
     [1] = {lvmin = 20,task = 10746,num = 1,},
     [2] = {lvmin = 25,task = 7680,num = 1,},
     [3] = {lvmin = 30,lvmax = 69,group = "QXG",task = 7692,num = 1,},
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
     [14] = {lvmin = 70,lvmax = 200,group = "QXG",task = 12337,num = 1,},
     [15] = {lvmin = 40,task = 11421,num = 1,},
     [100] = {lvmin = 30,lvmax = 39,group = "LX",task = 10417,num = 1,},
     [101] = {lvmin = 40,lvmax = 49,group = "LX",task = 10418,num = 1,},
     [102] = {lvmin = 50,lvmax = 59,group = "LX",task = 10419,num = 1,},
     [103] = {lvmin = 60,lvmax = 64,group = "LX",task = 10420,num = 1,},
     [104] = {lvmin = 65,lvmax = 69,group = "LX",task = 10421,num = 1,},
     [105] = {lvmin = 70,lvmax = 74,group = "LX",task = 11689,num = 1,},
     [106] = {lvmin = 75,lvmax = 200,group = "LX",task = 11690,num = 1,},
     [110] = {lvmin = 15,lvmax = 19,group = "ZB",task = 8360,num = 1,},
     [111] = {lvmin = 20,lvmax = 34,group = "ZB",task = 8361,num = 1,},
     [112] = {lvmin = 35,lvmax = 44,group = "ZB",task = 8362,num = 1,},
     [113] = {lvmin = 45,lvmax = 54,group = "ZB",task = 8363,num = 1,},
     [114] = {lvmin = 55,lvmax = 64,group = "ZB",task = 8364,num = 1,},
     [115] = {lvmin = 63,lvmax = 67,group = "ZB",task = 9873,num = 1,},
     [116] = {lvmin = 68,lvmax = 72,group = "ZB",task = 9874,num = 1,},
     [117] = {lvmin = 73,lvmax = 74,group = "ZB",task = 11754,num = 1,},
     [118] = {lvmin = 75,lvmax = 80,group = "ZB",task = 12454,num = 1,},
     [119] = {lvmin = 75,lvmax = 80,group = "ZB",task = 16343,num = 1,},
     [120] = {lvmin = 75,lvmax = 80,group = "ZB",task = 16341,num = 1,},
     [121] = {lvmin = 81,lvmax = 200,group = "ZB",task = 17055,num = 1,},
     [130] = {lvmin = 25,lvmax = 29,group = "ZJL",task = 10614,num = 2,},
     [131] = {lvmin = 30,lvmax = 34,group = "ZJL",task = 10615,num = 2,},
     [132] = {lvmin = 35,lvmax = 39,group = "ZJL",task = 10616,num = 2,},
     [133] = {lvmin = 40,lvmax = 44,group = "ZJL",task = 10617,num = 2,},
     [134] = {lvmin = 45,lvmax = 49,group = "ZJL",task = 10618,num = 2,},
     [135] = {lvmin = 50,lvmax = 54,group = "ZJL",task = 10619,num = 2,},
     [136] = {lvmin = 55,lvmax = 59,group = "ZJL",task = 10621,num = 2,},
     [137] = {lvmin = 60,lvmax = 64,group = "ZJL",task = 10622,num = 2,},
     [138] = {lvmin = 65,lvmax = 69,group = "ZJL",task = 10623,num = 2,},
     [139] = {lvmin = 70,lvmax = 74,group = "ZJL",task = 12207,num = 2,},
     [140] = {lvmin = 75,lvmax = 79,group = "ZJL",task = 12208,num = 2,},
     [141] = {lvmin = 80,lvmax = 84,group = "ZJL",task = 13647,num = 2,},
     [142] = {lvmin = 85,lvmax = 89,group = "ZJL",task = 16976,num = 2,},
     [143] = {lvmin = 90,lvmax = 90,group = "ZJL",task = 16977,num = 2,},
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
			--根据玩家等级,从全局表里找到对应的等级经验系数
			local iExperience = TaskExpAdjust[player.level]
			-- 取得幸运等级
			local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)
			--嘉年华（KeyID=15）
			local x = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 1)
			local y = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 2)
			local ordernow = 200 * x + y
			if ordernow == 15 then
				expMulti = expMulti + 1
			end
			return iExperience * baseExp * expMulti * (1+luckGrade)
		end
		,
		Items = function(TASKINTERFACE_POINTER)
			-- 60级以上发信仰双倍道具
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local items = {}
			if iPlayerLev >= 60 then
				items.Item1 =  {ID = 44039, NUM = 1}
			end
			return items
		end
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
		bAbsoluteTime = true,	--是否是绝对时间（用于任务时限,线下时间是否计入任务时间）

  		--iAvailFrequency  = 2,	--	发放间隔每天
		--iTimeInterval = 36,
		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--取出今天是一年内的第几天,放入dayInYear中,1月1日是1,12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--定义关键索引,根据今天的日期找到关键索引的值
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

		--取出今天是一年内的第几天,放入dayInYear中,1月1日是1,12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--定义关键索引,根据今天的日期找到关键索引的值
		local keyID = 1
		keyID = TaskList[10763].ServerLuck1[dayInYear].keyID1

		--------------------------------------------------测试gm-----------------------------------------------------
		local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
		if item2053 ~= 0 then
			keyID = item2053
		end
		-------------------------------------------------测试over----------------------------------------------------

		--对按等级进行随机的Group活动进行处理
		--【标识】【起始key值】【名称】
		local taskGroup =
		{
			[1] = { group = "LX", firstKey = 100, },	--裂隙
			[2] = { group = "ZB", firstKey = 110, },	--装备
			[3] = { group = "WJSF", firstKey = 8, },	--危机四伏
			[4] = { group = "ZJL", firstKey = 130, },	--追剿令
			[5] = { group = "QXG", firstKey = 3, },		--栖溪谷
		}
		for kk,vv in ipairs(taskGroup) do
			if keyID == vv.firstKey then	--如果随到的keyID是属于group活动
				for i,v in pairs(TaskList[10763].AllTasks) do	--在任务列表里找到所有具有相同标识的任务,按等级筛选出1个
					if v.group == vv.group then
						if player.level >= v.lvmin and player.level <= v.lvmax then
							-- 2013.03.23 按全局变量随机75级装备副本
							if v.group == "ZB" and player.level >= 75 then
								local GlobalIndex = 110119
								local GlobalVar = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER,GlobalIndex)
								if GlobalVar == 3 then
									keyID = 120
								elseif GlobalVar == 2 then
									keyID = 119
								else
									keyID = 118
								end
							else
								keyID = i
							end
							break
						end
					end
				end
			break
			end
		end

		--把keyID存入变量1,变量2
		local x,y = math.floor(keyID / 200), keyID % 200				--把keyID拆成两个整数: keyID = 200*x + y
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10763, 1,x)	--x,y分别存入任务变量1和2
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10763, 2,y)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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
			-- 普通包裹栏需要1格
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)
		math.randomseed(os.time())
		--基础经验系数\幸运值\经验档位
		local baseExp = 180
		local baseLuck = 100
		local expMulti = 1
		local godPlus = 0		--幸运任务暴击经验加成初始值
		local luckGradePlus = 0	--【幸运等级】的经验加成初始值
		local PlayerReturnPlus = 0.5	-- 老玩家回归buff加成
		--取得玩家等级数据
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--根据玩家等级,从全局表里找到对应的等级经验系数
		local iExperience = TaskExpAdjust[player.level]
		-- 取得幸运等级
		local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)

		-----------------------------------------------------------------------
		-- 幸运值 = 基础100点 *（ 1 + 嘉年华加成 ）
		-- 世界幸运任务经验 = 基础经验系数180 *（ 1 + 嘉年华幸运加成）* （ 1 + 幸运等级 + 随机暴击倍率）
		-----------------------------------------------------------------------

   		if bSuccess then
			--噩梦嘉年华（keyID = 15）,本体经验+100%
			local ordernow = 200 * ucRandomNum1 + ucRandomNum2	--取出keyid
			if ordernow == 15 then
				expMulti = expMulti + 1
			end
			-- 如果有老玩家回归buff，则经验加成
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,2895) then
				expMulti = expMulti + PlayerReturnPlus
			end
			--等级大于35级才有可能获得更高的暴击经验档位
			if player.level >= 35 then
				local iRand = math.random(1,4000)	--随机经验暴击的几率
				--------------------------------------------------测试gm-----------------------------------------------------
				local item20049 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,20049, true)
				if item20049 ~= 0 then
					if item20049 == 1 then iRand = 51
					elseif  item20049 == 2 then iRand = 11
					elseif item20049 == 3 then iRand = 1
					end
				end
				-------------------------------------------------测试over----------------------------------------------------
				if iRand == 1 then
					godPlus = 3
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10763,TaskBroadcastChannel.System)
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,10633)--10633幸运之星任务
				elseif iRand <= 11 then
					godPlus = 2
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10763, TaskBroadcastChannel.System)
				elseif iRand <= 51 then
					godPlus = 1
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10763, TaskBroadcastChannel.Local)
				else
					godPlus = 0
				end
			end
			-- 计算幸运等级加成
			luckGradePlus = luckGrade

			--奖励经验和幸运值
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iExperience * baseExp * expMulti * (1 + luckGrade + godPlus))
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,10, baseLuck * expMulti)			--发幸运值,声望id=10

			--计算 幸运积累次数
			local idx = 2				--幸运计次占用活动计数编号：2
			local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
			local xx = math.floor(commonCount / 10)										--百位和十位：幸运积累次数
			local yy = commonCount % 10													--个位：今日个人幸运次数
			xx = math.max(0,xx - 1)
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 10 * xx + yy - commonCount)		--设置成 10 * xx + yy

			--每周活跃度
			local WeeklyActivityTaskID = 13122
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, WeeklyActivityTaskID, 2)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,2)
			--发放信仰双倍道具
			if player.level >= 60 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,44039, 1,true)	--绑定
			end
   		end

   		return 0
   	end
}

TaskList[10764] = --日常-服务器幸运活动2
{
	ServerLuck2=
    {
        [1] = {keyID2 = 8,lv = 25,Date = "20130101",},
        [2] = {keyID2 = 1,lv = 20,Date = "20130102",},
        [3] = {keyID2 = 11,lv = 35,Date = "20130103",},
        [4] = {keyID2 = 130,lv = 25,Date = "20130104",},
        [5] = {keyID2 = 3,lv = 30,Date = "20130105",},
        [6] = {keyID2 = 9,lv = 25,Date = "20130106",},
        [7] = {keyID2 = 4,lv = 40,Date = "20130107",},
        [8] = {keyID2 = 10,lv = 25,Date = "20130108",},
        [9] = {keyID2 = 8,lv = 25,Date = "20130109",},
        [10] = {keyID2 = 2,lv = 25,Date = "20130110",},
        [11] = {keyID2 = 130,lv = 25,Date = "20130111",},
        [12] = {keyID2 = 110,lv = 15,Date = "20130112",},
        [13] = {keyID2 = 9,lv = 25,Date = "20130113",},
        [14] = {keyID2 = 4,lv = 40,Date = "20130114",},
        [15] = {keyID2 = 3,lv = 30,Date = "20130115",},
        [16] = {keyID2 = 5,lv = 15,Date = "20130116",},
        [17] = {keyID2 = 1,lv = 20,Date = "20130117",},
        [18] = {keyID2 = 130,lv = 25,Date = "20130118",},
        [19] = {keyID2 = 11,lv = 35,Date = "20130119",},
        [20] = {keyID2 = 6,lv = 20,Date = "20130120",},
        [21] = {keyID2 = 100,lv = 30,Date = "20130121",},
        [22] = {keyID2 = 10,lv = 25,Date = "20130122",},
        [23] = {keyID2 = 8,lv = 25,Date = "20130123",},
        [24] = {keyID2 = 2,lv = 25,Date = "20130124",},
        [25] = {keyID2 = 130,lv = 25,Date = "20130125",},
        [26] = {keyID2 = 110,lv = 15,Date = "20130126",},
        [27] = {keyID2 = 9,lv = 25,Date = "20130127",},
        [28] = {keyID2 = 6,lv = 20,Date = "20130128",},
        [29] = {keyID2 = 3,lv = 30,Date = "20130129",},
        [30] = {keyID2 = 5,lv = 15,Date = "20130130",},
        [31] = {keyID2 = 1,lv = 20,Date = "20130131",},
        [32] = {keyID2 = 130,lv = 25,Date = "20130201",},
        [33] = {keyID2 = 11,lv = 35,Date = "20130202",},
        [34] = {keyID2 = 4,lv = 40,Date = "20130203",},
        [35] = {keyID2 = 100,lv = 30,Date = "20130204",},
        [36] = {keyID2 = 8,lv = 25,Date = "20130205",},
        [37] = {keyID2 = 1,lv = 20,Date = "20130206",},
        [38] = {keyID2 = 9,lv = 25,Date = "20130207",},
        [39] = {keyID2 = 130,lv = 25,Date = "20130208",},
        [40] = {keyID2 = 3,lv = 30,Date = "20130209",},
        [41] = {keyID2 = 11,lv = 35,Date = "20130210",},
        [42] = {keyID2 = 6,lv = 20,Date = "20130211",},
        [43] = {keyID2 = 3,lv = 30,Date = "20130212",},
        [44] = {keyID2 = 5,lv = 15,Date = "20130213",},
        [45] = {keyID2 = 1,lv = 20,Date = "20130214",},
        [46] = {keyID2 = 130,lv = 25,Date = "20130215",},
        [47] = {keyID2 = 11,lv = 35,Date = "20130216",},
        [48] = {keyID2 = 6,lv = 20,Date = "20130217",},
        [49] = {keyID2 = 100,lv = 30,Date = "20130218",},
        [50] = {keyID2 = 10,lv = 25,Date = "20130219",},
        [51] = {keyID2 = 8,lv = 25,Date = "20130220",},
        [52] = {keyID2 = 6,lv = 20,Date = "20130221",},
        [53] = {keyID2 = 130,lv = 25,Date = "20130222",},
        [54] = {keyID2 = 110,lv = 15,Date = "20130223",},
        [55] = {keyID2 = 9,lv = 25,Date = "20130224",},
        [56] = {keyID2 = 4,lv = 40,Date = "20130225",},
        [57] = {keyID2 = 8,lv = 25,Date = "20130226",},
        [58] = {keyID2 = 3,lv = 30,Date = "20130227",},
        [59] = {keyID2 = 11,lv = 35,Date = "20130228",},
        [60] = {keyID2 = 1,lv = 20,Date = "20130301",},
        [61] = {keyID2 = 3,lv = 30,Date = "20130302",},
        [62] = {keyID2 = 9,lv = 25,Date = "20130303",},
        [63] = {keyID2 = 2,lv = 25,Date = "20130304",},
        [64] = {keyID2 = 8,lv = 25,Date = "20130305",},
        [65] = {keyID2 = 1,lv = 20,Date = "20130306",},
        [66] = {keyID2 = 11,lv = 35,Date = "20130307",},
        [67] = {keyID2 = 130,lv = 25,Date = "20130308",},
        [68] = {keyID2 = 3,lv = 30,Date = "20130309",},
        [69] = {keyID2 = 9,lv = 25,Date = "20130310",},
        [70] = {keyID2 = 4,lv = 40,Date = "20130311",},
        [71] = {keyID2 = 10,lv = 25,Date = "20130312",},
        [72] = {keyID2 = 8,lv = 25,Date = "20130313",},
        [73] = {keyID2 = 2,lv = 25,Date = "20130314",},
        [74] = {keyID2 = 130,lv = 25,Date = "20130315",},
        [75] = {keyID2 = 110,lv = 15,Date = "20130316",},
        [76] = {keyID2 = 9,lv = 25,Date = "20130317",},
        [77] = {keyID2 = 6,lv = 20,Date = "20130318",},
        [78] = {keyID2 = 3,lv = 30,Date = "20130319",},
        [79] = {keyID2 = 5,lv = 15,Date = "20130320",},
        [80] = {keyID2 = 1,lv = 20,Date = "20130321",},
        [81] = {keyID2 = 130,lv = 25,Date = "20130322",},
        [82] = {keyID2 = 11,lv = 35,Date = "20130323",},
        [83] = {keyID2 = 6,lv = 20,Date = "20130324",},
        [84] = {keyID2 = 100,lv = 30,Date = "20130325",},
        [85] = {keyID2 = 8,lv = 25,Date = "20130326",},
        [86] = {keyID2 = 1,lv = 20,Date = "20130327",},
        [87] = {keyID2 = 11,lv = 35,Date = "20130328",},
        [88] = {keyID2 = 130,lv = 25,Date = "20130329",},
        [89] = {keyID2 = 3,lv = 30,Date = "20130330",},
        [90] = {keyID2 = 9,lv = 25,Date = "20130331",},
        [91] = {keyID2 = 100,lv = 30,Date = "20130401",},
        [92] = {keyID2 = 8,lv = 25,Date = "20130402",},
        [93] = {keyID2 = 1,lv = 20,Date = "20130403",},
        [94] = {keyID2 = 9,lv = 25,Date = "20130404",},
        [95] = {keyID2 = 130,lv = 25,Date = "20130405",},
        [96] = {keyID2 = 3,lv = 30,Date = "20130406",},
        [97] = {keyID2 = 11,lv = 35,Date = "20130407",},
        [98] = {keyID2 = 6,lv = 20,Date = "20130408",},
        [99] = {keyID2 = 3,lv = 30,Date = "20130409",},
        [100] = {keyID2 = 5,lv = 15,Date = "20130410",},
        [101] = {keyID2 = 1,lv = 20,Date = "20130411",},
        [102] = {keyID2 = 130,lv = 25,Date = "20130412",},
        [103] = {keyID2 = 11,lv = 35,Date = "20130413",},
        [104] = {keyID2 = 6,lv = 20,Date = "20130414",},
        [105] = {keyID2 = 100,lv = 30,Date = "20130415",},
        [106] = {keyID2 = 10,lv = 25,Date = "20130416",},
        [107] = {keyID2 = 8,lv = 25,Date = "20130417",},
        [108] = {keyID2 = 6,lv = 20,Date = "20130418",},
        [109] = {keyID2 = 130,lv = 25,Date = "20130419",},
        [110] = {keyID2 = 110,lv = 15,Date = "20130420",},
        [111] = {keyID2 = 9,lv = 25,Date = "20130421",},
        [112] = {keyID2 = 4,lv = 40,Date = "20130422",},
        [113] = {keyID2 = 8,lv = 25,Date = "20130423",},
        [114] = {keyID2 = 3,lv = 30,Date = "20130424",},
        [115] = {keyID2 = 11,lv = 35,Date = "20130425",},
        [116] = {keyID2 = 1,lv = 20,Date = "20130426",},
        [117] = {keyID2 = 3,lv = 30,Date = "20130427",},
        [118] = {keyID2 = 9,lv = 25,Date = "20130428",},
        [119] = {keyID2 = 2,lv = 25,Date = "20130429",},
        [120] = {keyID2 = 8,lv = 25,Date = "20130430",},
        [121] = {keyID2 = 1,lv = 20,Date = "20130501",},
        [122] = {keyID2 = 11,lv = 35,Date = "20130502",},
        [123] = {keyID2 = 130,lv = 25,Date = "20130503",},
        [124] = {keyID2 = 3,lv = 30,Date = "20130504",},
        [125] = {keyID2 = 9,lv = 25,Date = "20130505",},
        [126] = {keyID2 = 4,lv = 40,Date = "20130506",},
        [127] = {keyID2 = 10,lv = 25,Date = "20130507",},
        [128] = {keyID2 = 8,lv = 25,Date = "20130508",},
        [129] = {keyID2 = 2,lv = 25,Date = "20130509",},
        [130] = {keyID2 = 130,lv = 25,Date = "20130510",},
        [131] = {keyID2 = 110,lv = 15,Date = "20130511",},
        [132] = {keyID2 = 9,lv = 25,Date = "20130512",},
        [133] = {keyID2 = 6,lv = 20,Date = "20130513",},
        [134] = {keyID2 = 3,lv = 30,Date = "20130514",},
        [135] = {keyID2 = 5,lv = 15,Date = "20130515",},
        [136] = {keyID2 = 1,lv = 20,Date = "20130516",},
        [137] = {keyID2 = 130,lv = 25,Date = "20130517",},
        [138] = {keyID2 = 11,lv = 35,Date = "20130518",},
        [139] = {keyID2 = 6,lv = 20,Date = "20130519",},
        [140] = {keyID2 = 100,lv = 30,Date = "20130520",},
        [141] = {keyID2 = 8,lv = 25,Date = "20130521",},
        [142] = {keyID2 = 1,lv = 20,Date = "20130522",},
        [143] = {keyID2 = 11,lv = 35,Date = "20130523",},
        [144] = {keyID2 = 130,lv = 25,Date = "20130524",},
        [145] = {keyID2 = 3,lv = 30,Date = "20130525",},
        [146] = {keyID2 = 9,lv = 25,Date = "20130526",},
        [147] = {keyID2 = 100,lv = 30,Date = "20130527",},
        [148] = {keyID2 = 10,lv = 25,Date = "20130528",},
        [149] = {keyID2 = 8,lv = 25,Date = "20130529",},
        [150] = {keyID2 = 6,lv = 20,Date = "20130530",},
        [151] = {keyID2 = 130,lv = 25,Date = "20130531",},
        [152] = {keyID2 = 110,lv = 15,Date = "20130601",},
        [153] = {keyID2 = 9,lv = 25,Date = "20130602",},
        [154] = {keyID2 = 4,lv = 40,Date = "20130603",},
        [155] = {keyID2 = 8,lv = 25,Date = "20130604",},
        [156] = {keyID2 = 3,lv = 30,Date = "20130605",},
        [157] = {keyID2 = 11,lv = 35,Date = "20130606",},
        [158] = {keyID2 = 1,lv = 20,Date = "20130607",},
        [159] = {keyID2 = 3,lv = 30,Date = "20130608",},
        [160] = {keyID2 = 9,lv = 25,Date = "20130609",},
        [161] = {keyID2 = 2,lv = 25,Date = "20130610",},
        [162] = {keyID2 = 8,lv = 25,Date = "20130611",},
        [163] = {keyID2 = 1,lv = 20,Date = "20130612",},
        [164] = {keyID2 = 11,lv = 35,Date = "20130613",},
        [165] = {keyID2 = 130,lv = 25,Date = "20130614",},
        [166] = {keyID2 = 3,lv = 30,Date = "20130615",},
        [167] = {keyID2 = 9,lv = 25,Date = "20130616",},
        [168] = {keyID2 = 4,lv = 40,Date = "20130617",},
        [169] = {keyID2 = 10,lv = 25,Date = "20130618",},
        [170] = {keyID2 = 8,lv = 25,Date = "20130619",},
        [171] = {keyID2 = 2,lv = 25,Date = "20130620",},
        [172] = {keyID2 = 130,lv = 25,Date = "20130621",},
        [173] = {keyID2 = 110,lv = 15,Date = "20130622",},
        [174] = {keyID2 = 9,lv = 25,Date = "20130623",},
        [175] = {keyID2 = 6,lv = 20,Date = "20130624",},
        [176] = {keyID2 = 3,lv = 30,Date = "20130625",},
        [177] = {keyID2 = 5,lv = 15,Date = "20130626",},
        [178] = {keyID2 = 1,lv = 20,Date = "20130627",},
        [179] = {keyID2 = 130,lv = 25,Date = "20130628",},
        [180] = {keyID2 = 11,lv = 35,Date = "20130629",},
        [181] = {keyID2 = 6,lv = 20,Date = "20130630",},
        [182] = {keyID2 = 100,lv = 30,Date = "20130701",},
        [183] = {keyID2 = 8,lv = 25,Date = "20130702",},
        [184] = {keyID2 = 1,lv = 20,Date = "20130703",},
        [185] = {keyID2 = 11,lv = 35,Date = "20130704",},
        [186] = {keyID2 = 130,lv = 25,Date = "20130705",},
        [187] = {keyID2 = 3,lv = 30,Date = "20130706",},
        [188] = {keyID2 = 9,lv = 25,Date = "20130707",},
        [189] = {keyID2 = 4,lv = 40,Date = "20130708",},
        [190] = {keyID2 = 10,lv = 25,Date = "20130709",},
        [191] = {keyID2 = 8,lv = 25,Date = "20130710",},
        [192] = {keyID2 = 2,lv = 25,Date = "20130711",},
        [193] = {keyID2 = 130,lv = 25,Date = "20130712",},
        [194] = {keyID2 = 110,lv = 15,Date = "20130713",},
        [195] = {keyID2 = 9,lv = 25,Date = "20130714",},
        [196] = {keyID2 = 6,lv = 20,Date = "20130715",},
        [197] = {keyID2 = 3,lv = 30,Date = "20130716",},
        [198] = {keyID2 = 5,lv = 15,Date = "20130717",},
        [199] = {keyID2 = 1,lv = 20,Date = "20130718",},
        [200] = {keyID2 = 130,lv = 25,Date = "20130719",},
        [201] = {keyID2 = 11,lv = 35,Date = "20130720",},
        [202] = {keyID2 = 6,lv = 20,Date = "20130721",},
        [203] = {keyID2 = 100,lv = 30,Date = "20130722",},
        [204] = {keyID2 = 8,lv = 25,Date = "20130723",},
        [205] = {keyID2 = 1,lv = 20,Date = "20130724",},
        [206] = {keyID2 = 11,lv = 35,Date = "20130725",},
        [207] = {keyID2 = 130,lv = 25,Date = "20130726",},
        [208] = {keyID2 = 3,lv = 30,Date = "20130727",},
        [209] = {keyID2 = 9,lv = 25,Date = "20130728",},
        [210] = {keyID2 = 100,lv = 30,Date = "20130729",},
        [211] = {keyID2 = 10,lv = 25,Date = "20130730",},
        [212] = {keyID2 = 8,lv = 25,Date = "20130731",},
        [213] = {keyID2 = 6,lv = 20,Date = "20130801",},
        [214] = {keyID2 = 130,lv = 25,Date = "20130802",},
        [215] = {keyID2 = 110,lv = 15,Date = "20130803",},
        [216] = {keyID2 = 9,lv = 25,Date = "20130804",},
        [217] = {keyID2 = 4,lv = 40,Date = "20130805",},
        [218] = {keyID2 = 8,lv = 25,Date = "20130806",},
        [219] = {keyID2 = 3,lv = 30,Date = "20130807",},
        [220] = {keyID2 = 11,lv = 35,Date = "20130808",},
        [221] = {keyID2 = 1,lv = 20,Date = "20130809",},
        [222] = {keyID2 = 3,lv = 30,Date = "20130810",},
        [223] = {keyID2 = 9,lv = 25,Date = "20130811",},
        [224] = {keyID2 = 2,lv = 25,Date = "20130812",},
        [225] = {keyID2 = 8,lv = 25,Date = "20130813",},
        [226] = {keyID2 = 1,lv = 20,Date = "20130814",},
        [227] = {keyID2 = 11,lv = 35,Date = "20130815",},
        [228] = {keyID2 = 130,lv = 25,Date = "20130816",},
        [229] = {keyID2 = 3,lv = 30,Date = "20130817",},
        [230] = {keyID2 = 9,lv = 25,Date = "20130818",},
        [231] = {keyID2 = 4,lv = 40,Date = "20130819",},
        [232] = {keyID2 = 10,lv = 25,Date = "20130820",},
        [233] = {keyID2 = 8,lv = 25,Date = "20130821",},
        [234] = {keyID2 = 2,lv = 25,Date = "20130822",},
        [235] = {keyID2 = 130,lv = 25,Date = "20130823",},
        [236] = {keyID2 = 110,lv = 15,Date = "20130824",},
        [237] = {keyID2 = 9,lv = 25,Date = "20130825",},
        [238] = {keyID2 = 6,lv = 20,Date = "20130826",},
        [239] = {keyID2 = 3,lv = 30,Date = "20130827",},
        [240] = {keyID2 = 5,lv = 15,Date = "20130828",},
        [241] = {keyID2 = 1,lv = 20,Date = "20130829",},
        [242] = {keyID2 = 130,lv = 25,Date = "20130830",},
        [243] = {keyID2 = 11,lv = 35,Date = "20130831",},
        [244] = {keyID2 = 11,lv = 35,Date = "20130901",},
        [245] = {keyID2 = 15,lv = 40,Date = "20130902",},
        [246] = {keyID2 = 100,lv = 30,Date = "20130903",},
        [247] = {keyID2 = 110,lv = 15,Date = "20130904",},
        [248] = {keyID2 = 130,lv = 25,Date = "20130905",},
        [249] = {keyID2 = 10,lv = 25,Date = "20130906",},
        [250] = {keyID2 = 1,lv = 20,Date = "20130907",},
        [251] = {keyID2 = 2,lv = 25,Date = "20130908",},
        [252] = {keyID2 = 3,lv = 30,Date = "20130909",},
        [253] = {keyID2 = 4,lv = 40,Date = "20130910",},
        [254] = {keyID2 = 5,lv = 15,Date = "20130911",},
        [255] = {keyID2 = 6,lv = 20,Date = "20130912",},
        [256] = {keyID2 = 7,lv = 20,Date = "20130913",},
        [257] = {keyID2 = 8,lv = 25,Date = "20130914",},
        [258] = {keyID2 = 9,lv = 25,Date = "20130915",},
        [259] = {keyID2 = 11,lv = 35,Date = "20130916",},
        [260] = {keyID2 = 15,lv = 40,Date = "20130917",},
        [261] = {keyID2 = 100,lv = 30,Date = "20130918",},
        [262] = {keyID2 = 110,lv = 15,Date = "20130919",},
        [263] = {keyID2 = 130,lv = 25,Date = "20130920",},
        [264] = {keyID2 = 10,lv = 25,Date = "20130921",},
        [265] = {keyID2 = 1,lv = 20,Date = "20130922",},
        [266] = {keyID2 = 2,lv = 25,Date = "20130923",},
        [267] = {keyID2 = 3,lv = 30,Date = "20130924",},
        [268] = {keyID2 = 4,lv = 40,Date = "20130925",},
        [269] = {keyID2 = 5,lv = 15,Date = "20130926",},
        [270] = {keyID2 = 6,lv = 20,Date = "20130927",},
        [271] = {keyID2 = 7,lv = 20,Date = "20130928",},
        [272] = {keyID2 = 8,lv = 25,Date = "20130929",},
        [273] = {keyID2 = 9,lv = 25,Date = "20130930",},
        [274] = {keyID2 = 11,lv = 35,Date = "20131001",},
        [275] = {keyID2 = 15,lv = 40,Date = "20131002",},
        [276] = {keyID2 = 100,lv = 30,Date = "20131003",},
        [277] = {keyID2 = 110,lv = 15,Date = "20131004",},
        [278] = {keyID2 = 130,lv = 25,Date = "20131005",},
        [279] = {keyID2 = 10,lv = 25,Date = "20131006",},
        [280] = {keyID2 = 1,lv = 20,Date = "20131007",},
        [281] = {keyID2 = 2,lv = 25,Date = "20131008",},
        [282] = {keyID2 = 3,lv = 30,Date = "20131009",},
        [283] = {keyID2 = 4,lv = 40,Date = "20131010",},
        [284] = {keyID2 = 5,lv = 15,Date = "20131011",},
        [285] = {keyID2 = 6,lv = 20,Date = "20131012",},
        [286] = {keyID2 = 7,lv = 20,Date = "20131013",},
        [287] = {keyID2 = 8,lv = 25,Date = "20131014",},
        [288] = {keyID2 = 9,lv = 25,Date = "20131015",},
        [289] = {keyID2 = 11,lv = 35,Date = "20131016",},
        [290] = {keyID2 = 15,lv = 40,Date = "20131017",},
        [291] = {keyID2 = 100,lv = 30,Date = "20131018",},
        [292] = {keyID2 = 110,lv = 15,Date = "20131019",},
        [293] = {keyID2 = 130,lv = 25,Date = "20131020",},
        [294] = {keyID2 = 10,lv = 25,Date = "20131021",},
        [295] = {keyID2 = 1,lv = 20,Date = "20131022",},
        [296] = {keyID2 = 2,lv = 25,Date = "20131023",},
        [297] = {keyID2 = 3,lv = 30,Date = "20131024",},
        [298] = {keyID2 = 4,lv = 40,Date = "20131025",},
        [299] = {keyID2 = 5,lv = 15,Date = "20131026",},
        [300] = {keyID2 = 6,lv = 20,Date = "20131027",},
        [301] = {keyID2 = 7,lv = 20,Date = "20131028",},
        [302] = {keyID2 = 5,lv = 15,Date = "20131029",},
        [303] = {keyID2 = 6,lv = 20,Date = "20131030",},
        [304] = {keyID2 = 7,lv = 20,Date = "20131031",},
        [305] = {keyID2 = 8,lv = 25,Date = "20131101",},
        [306] = {keyID2 = 9,lv = 25,Date = "20131102",},
        [307] = {keyID2 = 11,lv = 35,Date = "20131103",},
        [308] = {keyID2 = 15,lv = 40,Date = "20131104",},
        [309] = {keyID2 = 100,lv = 30,Date = "20131105",},
        [310] = {keyID2 = 110,lv = 15,Date = "20131106",},
        [311] = {keyID2 = 130,lv = 25,Date = "20131107",},
        [312] = {keyID2 = 10,lv = 25,Date = "20131108",},
        [313] = {keyID2 = 1,lv = 20,Date = "20131109",},
        [314] = {keyID2 = 2,lv = 25,Date = "20131110",},
        [315] = {keyID2 = 3,lv = 30,Date = "20131111",},
        [316] = {keyID2 = 4,lv = 40,Date = "20131112",},
        [317] = {keyID2 = 5,lv = 15,Date = "20131113",},
        [318] = {keyID2 = 6,lv = 20,Date = "20131114",},
        [319] = {keyID2 = 7,lv = 20,Date = "20131115",},
        [320] = {keyID2 = 8,lv = 25,Date = "20131116",},
        [321] = {keyID2 = 9,lv = 25,Date = "20131117",},
        [322] = {keyID2 = 11,lv = 35,Date = "20131118",},
        [323] = {keyID2 = 15,lv = 40,Date = "20131119",},
        [324] = {keyID2 = 100,lv = 30,Date = "20131120",},
        [325] = {keyID2 = 110,lv = 15,Date = "20131121",},
        [326] = {keyID2 = 130,lv = 25,Date = "20131122",},
        [327] = {keyID2 = 10,lv = 25,Date = "20131123",},
        [328] = {keyID2 = 1,lv = 20,Date = "20131124",},
        [329] = {keyID2 = 2,lv = 25,Date = "20131125",},
        [330] = {keyID2 = 3,lv = 30,Date = "20131126",},
        [331] = {keyID2 = 4,lv = 40,Date = "20131127",},
        [332] = {keyID2 = 5,lv = 15,Date = "20131128",},
        [333] = {keyID2 = 6,lv = 20,Date = "20131129",},
        [334] = {keyID2 = 7,lv = 20,Date = "20131130",},
        [335] = {keyID2 = 8,lv = 25,Date = "20131201",},
        [336] = {keyID2 = 9,lv = 25,Date = "20131202",},
        [337] = {keyID2 = 11,lv = 35,Date = "20131203",},
        [338] = {keyID2 = 15,lv = 40,Date = "20131204",},
        [339] = {keyID2 = 100,lv = 30,Date = "20131205",},
        [340] = {keyID2 = 110,lv = 15,Date = "20131206",},
        [341] = {keyID2 = 130,lv = 25,Date = "20131207",},
        [342] = {keyID2 = 10,lv = 25,Date = "20131208",},
        [343] = {keyID2 = 1,lv = 20,Date = "20131209",},
        [344] = {keyID2 = 2,lv = 25,Date = "20131210",},
        [345] = {keyID2 = 3,lv = 30,Date = "20131211",},
        [346] = {keyID2 = 4,lv = 40,Date = "20131212",},
        [347] = {keyID2 = 5,lv = 15,Date = "20131213",},
        [348] = {keyID2 = 6,lv = 20,Date = "20131214",},
        [349] = {keyID2 = 7,lv = 20,Date = "20131215",},
        [350] = {keyID2 = 8,lv = 25,Date = "20131216",},
        [351] = {keyID2 = 9,lv = 25,Date = "20131217",},
        [352] = {keyID2 = 11,lv = 35,Date = "20131218",},
        [353] = {keyID2 = 15,lv = 40,Date = "20131219",},
        [354] = {keyID2 = 100,lv = 30,Date = "20131220",},
        [355] = {keyID2 = 110,lv = 15,Date = "20131221",},
        [356] = {keyID2 = 130,lv = 25,Date = "20131222",},
        [357] = {keyID2 = 10,lv = 25,Date = "20131223",},
        [358] = {keyID2 = 1,lv = 20,Date = "20131224",},
        [359] = {keyID2 = 2,lv = 25,Date = "20131225",},
        [360] = {keyID2 = 3,lv = 30,Date = "20131226",},
        [361] = {keyID2 = 4,lv = 40,Date = "20131227",},
        [362] = {keyID2 = 5,lv = 15,Date = "20131228",},
        [363] = {keyID2 = 6,lv = 20,Date = "20131229",},
        [364] = {keyID2 = 7,lv = 20,Date = "20131230",},
        [365] = {keyID2 = 5,lv = 15,Date = "20131231",},
        [366] = {keyID2 = 6,lv = 20,Date = "20140101",},
    },

	AllTasks =
    {
     [1] = {lvmin = 20,task = 10746,num = 1,},
     [2] = {lvmin = 25,task = 7680,num = 1,},
     [3] = {lvmin = 30,lvmax = 69,group = "QXG",task = 7692,num = 1,},
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
     [14] = {lvmin = 70,lvmax = 200,group = "QXG",task = 12337,num = 1,},
     [15] = {lvmin = 40,task = 11421,num = 1,},
     [100] = {lvmin = 30,lvmax = 39,group = "LX",task = 10417,num = 1,},
     [101] = {lvmin = 40,lvmax = 49,group = "LX",task = 10418,num = 1,},
     [102] = {lvmin = 50,lvmax = 59,group = "LX",task = 10419,num = 1,},
     [103] = {lvmin = 60,lvmax = 64,group = "LX",task = 10420,num = 1,},
     [104] = {lvmin = 65,lvmax = 69,group = "LX",task = 10421,num = 1,},
     [105] = {lvmin = 70,lvmax = 74,group = "LX",task = 11689,num = 1,},
     [106] = {lvmin = 75,lvmax = 200,group = "LX",task = 11690,num = 1,},
     [110] = {lvmin = 15,lvmax = 19,group = "ZB",task = 8360,num = 1,},
     [111] = {lvmin = 20,lvmax = 34,group = "ZB",task = 8361,num = 1,},
     [112] = {lvmin = 35,lvmax = 44,group = "ZB",task = 8362,num = 1,},
     [113] = {lvmin = 45,lvmax = 54,group = "ZB",task = 8363,num = 1,},
     [114] = {lvmin = 55,lvmax = 64,group = "ZB",task = 8364,num = 1,},
     [115] = {lvmin = 63,lvmax = 67,group = "ZB",task = 9873,num = 1,},
     [116] = {lvmin = 68,lvmax = 72,group = "ZB",task = 9874,num = 1,},
     [117] = {lvmin = 73,lvmax = 74,group = "ZB",task = 11754,num = 1,},
     [118] = {lvmin = 75,lvmax = 80,group = "ZB",task = 12454,num = 1,},
     [119] = {lvmin = 75,lvmax = 80,group = "ZB",task = 16343,num = 1,},
     [120] = {lvmin = 75,lvmax = 80,group = "ZB",task = 16341,num = 1,},
     [121] = {lvmin = 81,lvmax = 200,group = "ZB",task = 17055,num = 1,},
     [130] = {lvmin = 25,lvmax = 29,group = "ZJL",task = 10614,num = 2,},
     [131] = {lvmin = 30,lvmax = 34,group = "ZJL",task = 10615,num = 2,},
     [132] = {lvmin = 35,lvmax = 39,group = "ZJL",task = 10616,num = 2,},
     [133] = {lvmin = 40,lvmax = 44,group = "ZJL",task = 10617,num = 2,},
     [134] = {lvmin = 45,lvmax = 49,group = "ZJL",task = 10618,num = 2,},
     [135] = {lvmin = 50,lvmax = 54,group = "ZJL",task = 10619,num = 2,},
     [136] = {lvmin = 55,lvmax = 59,group = "ZJL",task = 10621,num = 2,},
     [137] = {lvmin = 60,lvmax = 64,group = "ZJL",task = 10622,num = 2,},
     [138] = {lvmin = 65,lvmax = 69,group = "ZJL",task = 10623,num = 2,},
     [139] = {lvmin = 70,lvmax = 74,group = "ZJL",task = 12207,num = 2,},
     [140] = {lvmin = 75,lvmax = 79,group = "ZJL",task = 12208,num = 2,},
     [141] = {lvmin = 80,lvmax = 84,group = "ZJL",task = 13647,num = 2,},
     [142] = {lvmin = 85,lvmax = 89,group = "ZJL",task = 16976,num = 2,},
     [143] = {lvmin = 90,lvmax = 90,group = "ZJL",task = 16977,num = 2,},
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
			--根据玩家等级,从全局表里找到对应的等级经验系数
			local iExperience = TaskExpAdjust[player.level]
			-- 取得幸运等级
			local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)
			--嘉年华（KeyID=15）
			local x = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 1)
			local y = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 2)
			local ordernow = 200 * x + y
			if ordernow == 15 then
				expMulti = expMulti + 1
			end
			return math.floor(iExperience * baseExp * expMulti * (1+luckGrade))
		end
		,
		Items = function(TASKINTERFACE_POINTER)
			-- 60级以上发信仰双倍道具
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local items = {}
			if iPlayerLev >= 60 then
				items.Item1 =  {ID = 44039, NUM = 1}
			end
			return items
		end
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
		bAbsoluteTime = true,	--是否是绝对时间（用于任务时限,线下时间是否计入任务时间）

  		--iAvailFrequency  = 2,	--	发放间隔每天
		--iTimeInterval = 36,
		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--取出今天是一年内的第几天,放入dayInYear中,1月1日是1,12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--定义关键索引,根据今天的日期找到关键索引的值
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

		--取出今天是一年内的第几天,放入dayInYear中,1月1日是1,12月31日是365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--定义关键索引,根据今天的日期找到关键索引的值
		local keyID = 1
		keyID = TaskList[10764].ServerLuck2[dayInYear].keyID2

		--------------------------------------------------测试gm-----------------------------------------------------
		local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
		if item2053 ~= 0 then
			keyID = item2053
		end
		-------------------------------------------------测试over----------------------------------------------------


		--对按等级进行随机的Group活动进行处理
		--【标识】【起始key值】【名称】
		local taskGroup =
		{
			[1] = { group = "LX", firstKey = 100, },	--裂隙
			[2] = { group = "ZB", firstKey = 110, },	--装备
			[3] = { group = "WJSF", firstKey = 8, },	--危机四伏
			[4] = { group = "ZJL", firstKey = 130, },	--追剿令
			[5] = { group = "QXG", firstKey = 3, },		--栖溪谷
		}
		for kk,vv in ipairs(taskGroup) do
			if keyID == vv.firstKey then	--如果随到的keyID是属于group活动
				for i,v in pairs(TaskList[10764].AllTasks) do	--在任务列表里找到所有具有相同标识的任务,按等级筛选出1个
					if v.group == vv.group then
						if player.level >= v.lvmin and player.level <= v.lvmax then
							-- 2013.03.23 按全局变量随机75级装备副本
							if v.group == "ZB" and player.level >= 75 then
								local GlobalIndex = 110119
								local GlobalVar = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER,GlobalIndex)
								if GlobalVar == 3 then
									keyID = 120
								elseif GlobalVar == 2 then
									keyID = 119
								else
									keyID = 118
								end
							else
								keyID = i
							end
							break
						end
					end
				end
			break
			end
		end

		--把keyID存入变量1,变量2
		local x,y = math.floor(keyID / 200), keyID % 200				--把keyID拆成两个整数: keyID = 200*x + y
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10764, 1,x)	--x,y分别存入任务变量1和2
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,10764, 2,y)

		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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
			-- 普通包裹栏需要1格
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)
		math.randomseed(os.time())
		--基础经验系数、幸运值和经验档位
		local baseExp = 180
		local baseLuck = 100
		local expMulti = 1
		local godPlus = 0		--幸运任务暴击经验加成初始值
		local luckGradePlus = 0	--任务天赋的经验加成初始值
		local PlayerReturnPlus = 0.5	-- 老玩家回归buff加成
		--取得玩家等级数据
		local player={}
		player.level = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--根据玩家等级,从全局表里找到对应的等级经验系数
		local iExperience = TaskExpAdjust[player.level]
		-- 取得幸运等级
		local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)

		-----------------------------------------------------------------------
		-- 幸运值 = 基础100点 *（ 1 + 嘉年华加成 ）
		-- 世界幸运任务经验 = 基础经验系数180 *（ 1 + 嘉年华幸运加成）* （ 1 + 幸运等级 + 随机暴击倍率）
		-----------------------------------------------------------------------

   		if bSuccess then
			--噩梦嘉年华（keyID = 15）,本体经验+100%
			local ordernow = 200 * ucRandomNum1 + ucRandomNum2	--取出keyid
			if ordernow == 15 then
				expMulti = expMulti + 1
			end
			-- 如果有老玩家回归buff，则经验加成
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,2895) then
				expMulti = expMulti + PlayerReturnPlus
			end
			--等级大于35级才有可能获得更高的暴击经验档位
			if player.level >= 35 then
				local iRand = math.random(1,4000)	--随机经验暴击的几率
				--------------------------------------------------测试gm-----------------------------------------------------
				local item20049 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,20049, true)
				if item20049 ~= 0 then
					if item20049 == 1 then iRand = 51
					elseif  item20049 == 2 then iRand = 11
					elseif item20049 == 3 then iRand = 1
					end
				end
				-------------------------------------------------测试over----------------------------------------------------

				if iRand == 1 then
					godPlus = 3
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10764,TaskBroadcastChannel.System)
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,10633)--10633幸运之星任务
				elseif iRand <= 11 then
					godPlus = 2
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10764, TaskBroadcastChannel.System)
				elseif iRand <= 51 then
					godPlus = 1
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,10764, TaskBroadcastChannel.Local)
				else
					godPlus = 0
				end
			end

			-- 计算幸运等级加成
			luckGradePlus = luckGrade

			--奖励经验和幸运值
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iExperience * baseExp * expMulti * (1 + luckGradePlus + godPlus))
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,10, baseLuck * expMulti)			--发幸运值,声望id=10

			--计算 幸运积累次数和个人幸运次数
			local idx = 2				--幸运计次占用活动计数编号：2
			local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
			local xx = math.floor(commonCount / 10)										--百位和十位：幸运积累次数
			local yy = commonCount % 10													--个位：个人幸运次数
			xx = math.max(0,xx - 1)
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 10 * xx + yy - commonCount)		--设置成 10 * xx + yy

			--每周活跃度
			local WeeklyActivityTaskID = 13122
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, WeeklyActivityTaskID, 2)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,2)
			--发放信仰双倍道具
			if player.level >= 60 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,44039, 1,true)	--绑定
			end
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

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iBindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)	--魂币
		local iGold = TaskCApi.GetGoldAmount(TASKINTERFACE_POINTER)				--金币
		local idx = 0	--活动计数的编号：神之试炼
		local iCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--取得计次数值

		--计数值转化成待补偿经验,需要耗费魂币！
		--所需魂币数 == 等级系数 * 全局变量TaskMoneyAdjust[等级]
		local iCostMoneyRatio = 216	 * 0.25 --所需耗费的魂币的等级系数 -- 2011.7.13zang
		local iCostMoney = math.max(1,math.floor(TaskMoneyAdjust[iPlayerLev])) * iCostMoneyRatio or iCostMoneyRatio

	   	if iPlayerLev < 20 then	--神之试炼的参与等级：20级
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
	   	end
		if iCount <= 1 then	--计次数值小于或等于1次时,不能转换
	   	    return TASK_PREREQU_FAIL_LUA_TASK
		end
		if iBindMoney + iGold < iCostMoney	then --魂币不够用金币补足。魂币和金币之和都不够，就不让接任务
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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
		local iBindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)	--魂币
		local iGold = TaskCApi.GetGoldAmount(TASKINTERFACE_POINTER)				--金币
		local idx = 0	--活动计数的编号：神之试炼
		local iCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--取得计次数值

		--计数值转化成待补偿经验,需要耗费魂币！
		--所需魂币数 == 等级系数 * 全局变量TaskMoneyAdjust[等级]
		local iCostMoneyRatio = 216	 * 0.25 --所需耗费的魂币的等级系数 -- 2011.7.13zang
		local iCostMoney = math.max(1,math.floor(TaskMoneyAdjust[iPlayerLev])) * iCostMoneyRatio or iCostMoneyRatio	--所需耗费的魂币

		--根据等级给予待补偿经验
		--应转化的待补偿经验 == 等级系数 * 全局变量TaskExpAdjust[等级]
		local iMakeupExpRatio = 1350	--应转化的待补偿经验的等级系数
		local iMakeupExp = iMakeupExpRatio * (math.floor(TaskExpAdjust[iPlayerLev]) or TaskExpAdjust[20])--应转化的待补偿经验(缺省值是20级的）

   		if bSuccess then
			--收魂币，如果魂币不足用金币补
			if iBindMoney >= iCostMoney then
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,-iCostMoney)	--收魂币
			elseif iBindMoney < iCostMoney and iGold > iCostMoney - iBindMoney then
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,-iBindMoney)	--收魂币
				TaskCApi.TakeAwayGold(TASKINTERFACE_POINTER,math.max(0,iCostMoney-iBindMoney))	--收金币
			end
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

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
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

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--计算今天可以做的个人幸运次数 == max (3,个人幸运剩余次数)
		local iTaskID = 10631	--个人幸运任务的id
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		local idx = 2			--幸运计次占用的活动计数编号
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
		local xx = math.floor(commonCount / 10)										--百位和十位：幸运积累次数
		local yy = commonCount % 10													--个位：个人幸运剩余次数

		if iCount >= 3 or yy < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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
		local greenWeight = 0.3	--绿幸运任务的概率
		local blueWeight = 0.05	--蓝幸运任务的概率
		local iTaskIDMain = 10631	--个人幸运任务的id
		local iTaskIDExclusive = 11711	--个人幸运任务的互斥任务的id
		local iTaskIDGreen = 11759	--绿色幸运任务的id
		local iTaskIDBlue = 11760	--蓝色幸运任务的id

		math.randomseed(os.time())
		local iRandomNum = math.random()
		----------- 测试模式 --------------
		local item20049 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,20049, true)
		if item20049 ~= 0 then
			if item20049 == 20 then iRandomNum = 0.1
			elseif  item20049 == 60 then iRandomNum = 0.04
			end
		end
		----------- 测试模式 over ---------
		--取得绿幸运任务引子、蓝幸运任务引子的完成次数
		local greenLuck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskIDGreen)
		local blueLuck = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskIDBlue)

   		if bSuccess then
			TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskIDMain, false)		--中止个人幸运任务,不发失败奖励
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

--			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskIDGreen)	--发放个人幸运
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

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iItemID1 = 34314	--龙纹珠贝的物品id
		local iItemID2 = 23911	--公会基地建设令id
		local iCount1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID1, true)
		local iCount2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID2, true)
		if iCount1 < 1 or iCount2 < 1 then
			return TASK_PREREQU_FAIL_NO_ITEM
		end
--[[
		local iTaskID = 11758	--前提任务（完成过至少1次对踊跃者的奖赏）
		local iTaskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		if iTaskCount < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES	--错误码41
		end
--]]
		local iTaskID2 = 8554	--互斥任务（踊跃者奖赏）
		local iTaskCount2 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID2)
		if iTaskCount2 >= 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 1 then
			return TASK_PREREQU_FAIL_GIVEN_ITEM
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
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
				{0,0,2,2,0},{0,0,3,3,0},{0,0,4,4,0},{0,0,5,5,0},--第1/2/3/4次基地任务奖励,资源值0#武装,1#魔法,2#经济,3#文明,4#信仰
			},
			[2] = --5级公会
			{
				{0,1,1,1,1},{0,1,1,1,1},{0,2,2,2,2},{0,3,3,3,3},
			},
			[3] = --6级公会
			{
				{1,1,1,1,1},{1,1,1,1,1},{2,2,2,2,2},{2,2,2,2,2},
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
			local tFactionResTotal = {0,0,0,0,0}	--前4次即1轮的合计
			if iFactionLev == 4 then
				for k,v in ipairs(tFactionResources[1]) do
					for k1,v1 in ipairs(v) do
						tFactionResTotal[k1] = tFactionResTotal[k1] + v1
					end
				end
			elseif iFactionLev == 5 then
				for k,v in ipairs(tFactionResources[2]) do
					for k1,v1 in ipairs(v) do
						tFactionResTotal[k1] = tFactionResTotal[k1] + v1
					end
				end
			elseif iFactionLev > 5 then
				for k,v in ipairs(tFactionResources[3]) do
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
			--获得开启公会基地神之恩赐幸运宝库的权限
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 14381, 1)
			--发放金镶玉task
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,16106)
		end
		return 0
   	end
}

TaskList[12244] = --沉睡丛林探险家主任务：伟大的旅程
{
	TaskAll =
	{
		[1] = { 12005,}, 	--沉睡丛林的探险任务id
		[2] = { 9933,9993,9996,9997,11815,11816,11817,11818,11819,11820,11821,}	--沉睡丛林的足迹任务id,每个任务在一天内只允许接到1次
	}
	,
	TaskToComplete = {12220 ,10079} 	--探险发藏宝图任务，足迹发卡片任务	--这是本任务的完成条件
	,
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bCanSeekOut = true,

		bRecordFinishCount = true,
  		iMaxFinishCount = 5,		--每天最多可完成的次数：5
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.TanXianJia,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 15, iSideOccupExp = 10 }
			local iExperience = TaskExpAdjust[playerLev]		--根据玩家等级,从全局表里找到对应的等级经验系数
			local acturalExp = math.floor(iExperience * base_awards.xp)
			return acturalExp
		end
		,
		-- 副职业经验
		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			local playerExplorerLev =  TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,33) or 1	--探险家副职业等级
			local base_awards = { xp = 15, iSideOccupExp = 10 }
			local OccupExpAdjust = 1 --对探险家经验的调整参数,3级探险家以上增加50%
			if playerExplorerLev >= 3 then
				OccupExpAdjust = OccupExpAdjust + 0.5
			end
			local acturalSideOccupExp = base_awards.iSideOccupExp * OccupExpAdjust	--实际探险家经验
			soe = {
				SOE1 = {ID = 33, EXP = acturalSideOccupExp},	--id为副职业id,exp为数值,exp为0显示？？？
			}
			return soe
		end
		,
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
				Item1 = {ID = 0, NUM = 0},	--0时为？？？,其他显示物品和数量
			}
			return items
		end
		,
	}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local playerExplorerLev =  TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,33) or 1	--探险家副职业等级
		if playerLev < 60 or playerExplorerLev < 2 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end
		--任务栏是否已满
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 12005)
		if iRet ~= 0 then
			return TASK_PREREQU_FAIL_FULL
		end
		--身上是否有互斥任务
		local taskExclusive = 12295
		if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, taskExclusive) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end
		for k,v in ipairs(TaskList[12244].TaskAll) do
			for k1,v1 in ipairs(v) do
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v1) then
					return TASK_PREREQU_FAIL_LUA_TASK
				end
			end
		end
		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		--清空作为完成条件的任务的次数
		for i,m in ipairs(TaskList[12244].TaskToComplete) do
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,m)
		end
		--筛选任务
		local taskToDeliver = {}
		for k,v in ipairs(TaskList[12244].TaskAll) do
			taskToDeliver[k] = {}
			if k == 1 then
				for kk,vv in ipairs(v) do
					table.insert(taskToDeliver[k],vv)
				end
			else
				for k1,v1 in ipairs(v) do
					local iTaskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,v1)
					if iTaskCount < 1 then
						table.insert(taskToDeliver[k],v1)
					end
				end
			end
		end
		local randomTaskType = math.random(1, #TaskList[12244].TaskAll)
		local randomTaskIndex = math.random(1, #taskToDeliver[randomTaskType] )
		local taskId = 	taskToDeliver[randomTaskType][randomTaskIndex]

		-----------------gm debug -- start -------------------------------------------------
		local item2053 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,2053, true)
		if item2053 ~= 0 then
			if item2053 >= 101 and item2053 <= #TaskList[12244].TaskAll[2] + 100 then
				if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,item2053) <= 1 then
					taskId = TaskList[12244].TaskAll[2][item2053-100]
					randomTaskType = 2
				else
					taskId = TaskList[12244].TaskAll[1][1]
					randomTaskType = 1
				end
			else
				taskId = TaskList[12244].TaskAll[1][1]
				randomTaskType = 1
			end
		end
		-----------------gm debug -- over----------------------------------------------------

		--发放任务
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, taskId)
		--把randomTaskType存入变量1
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12244, 1, randomTaskType)
		return 0
	end
   	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		local randomTaskType = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12244, 1)

		Method.CompleteTask = {TaskID = TaskList[12244].TaskToComplete[randomTaskType] , Num = 1}
--   		Method.CompleteTask = {TaskID = TaskList[10764].AllTasks[ordernow].task, Num = TaskList[10764].AllTasks[ordernow].num}
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local randomTaskType = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12244, 1)
		local taskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[12244].TaskToComplete[randomTaskType])	--任务完成次数
   		if taskCount >= 1 then
			iRet = TASK_SUCC_FINISH
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
	    local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local playerExplorerLev =  TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,33) or 1	--探险家副职业等级

   		if bSuccess then
			--发放经验和探险家经验奖励
			local base_awards = { xp = 15, iSideOccupExp = 10 }
			local iExperience = TaskExpAdjust[playerLev]		--根据玩家等级,从全局表里找到对应的等级经验系数
			local OccupExpAdjust = 1 --对探险家经验的调整参数,3级探险家以上增加50%

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,math.floor(iExperience * base_awards.xp))
			if playerExplorerLev >= 3 then
				OccupExpAdjust = OccupExpAdjust + 0.5
			end
			TaskCApi.DeliverSideOccupExp (TASKINTERFACE_POINTER, 33, base_awards.iSideOccupExp*OccupExpAdjust )
			--记录累计次数（与40级探险家共用）
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 14005, 1)
		else
			--发放互斥任务
			local taskExclusive = 12295
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, taskExclusive)
			--中止所有相关的分支任务
			local taskInvolved = { 12020,12019 }	--探险任务的辅助分支任务
			for k,v in ipairs(TaskList[12244].TaskAll) do
				for kk,vv in ipairs(v) do
					if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, vv) then
						TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, vv, false)
					end
				end
			end
			for i,m in ipairs(taskInvolved) do
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, m) then
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, m, false)
				end
			end
		end
		return 0
   	end
}

TaskList[12635] = ----四季合唱团-嘉铭,
{
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local ratio = 1		--奖励倍率
			return iExperience * ratio	--经验
		end
		,
		BindMoney = function(TASKINTERFACE_POINTER)
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iBindMoney = TaskMoneyAdjust[playerLev] * base_awards.bindmoney		--根据玩家等级,从全局表里找到对应的魂币经验系数
			local ratio = 1		--奖励倍率
			return iBindMoney * ratio	--魂币
		end
		,
	}
	,
	Property =
  	{
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		if iPlayerLev < 30 then	--参与等级：30级
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		--2011年6月6日19：00到6月9日20：00
		local timePackage = os.date("*t", os.time())
		local year = timePackage.year
		local month = timePackage.month
		local day = timePackage.day
		local hour = timePackage.hour
		if year == 2011 and month == 6
		  and ((day == 6 and hour >= 19 ) or (day == 9 and hour < 20 ) or (day > 6 and day < 9)) then
				return 0
		else
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--完美计次
		local iTaskID = 12672	--完美计次任务的id
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12635, 1,iCount)	--把完美计次已经完成的次数存入1号变量
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.SubmitItem = true
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local items = {	16220,19043,22889,33659}	--需要的物品id1,2,3,4
 		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12635)	--提交物品的信息：id，数量

		local flag_correct_sequence = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12635, 2)	--2号变量的值记录：正确顺序的进度
		local flag_items = {}
		flag_items[1] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12635, 3)	--3号变量的值>0表示：物品1已经被提交过
		flag_items[2] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12635, 4)	--4号变量的值>0表示：物品2已经被提交过
		flag_items[3] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12635, 5)	--5号变量的值>0表示：物品3已经被提交过
		flag_items[4] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12635, 6)	--6号变量的值>0表示：物品4已经被提交过

		if itemIDSubmitted and itemNumberSubmitted then
			for k,v in ipairs(items) do
				if itemIDSubmitted == v and itemNumberSubmitted >= 1 then
					if flag_items[k] == 0 then	--从没有提交过这个物品
						if flag_correct_sequence == k-1 then	--正确的顺序
							flag_correct_sequence = k
							TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12635, 2,flag_correct_sequence)
							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12635, 29, 20011)
						else
							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12635, 29, 20012)
						end
						flag_items[k] = 1	--把标志置为该物品已提交
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12635, k+2,flag_items[k])	--把标志存入相应的变量
						TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, v, 1)

						if flag_items[1]>0 and  flag_items[2]>0 and  flag_items[3]>0 and  flag_items[4]>0 then	--所有物品都提交了
							iRet = TASK_SUCC_FINISH
						end
						break
					else
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12635, 29, 20013)
					end
				elseif k == #items then
					TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12635, 29, 20000)
				end
			end
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local iBindMoney = TaskMoneyAdjust[playerLev] * base_awards.bindmoney		--根据玩家等级,从全局表里找到对应的魂币经验系数
			local ratio = 1		--奖励倍率
			if ucRandomNum2 >= 4 then	--按正确顺序提交
				ratio = 1.5
				--完美计次
				local iTaskID = 12672	--完美计次任务的id
				local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
				if iCount <= 9999 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskID)
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,12635, TaskBroadcastChannel.Local)
				end
			end
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iExperience * ratio)	--经验
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,iBindMoney * ratio)	--魂币
   		end
   		return 0
   	end
}


TaskList[12634] = ----四季合唱团-真真,
{
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local ratio = 1		--奖励倍率
			return iExperience * ratio	--经验
		end
		,
		BindMoney = function(TASKINTERFACE_POINTER)
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iBindMoney = TaskMoneyAdjust[playerLev] * base_awards.bindmoney		--根据玩家等级,从全局表里找到对应的魂币经验系数
			local ratio = 1		--奖励倍率
			return iBindMoney * ratio	--魂币
		end
		,
	}
	,
	Property =
  	{
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.HuoDong,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local PreTask = 12635
		if iPlayerLev < 30 then	--参与等级：30级
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		--2011年6月9日19：00到6月12日20：00
		local timePackage = os.date("*t", os.time())
		local year = timePackage.year
		local month = timePackage.month
		local day = timePackage.day
		local hour = timePackage.hour
		if year == 2011 and month == 6
		  and ((day == 9 and hour >= 19 ) or (day == 12 and hour < 20 ) or (day > 9 and day < 12)) then
				return 0
		else
			return TASK_PREREQU_FAIL_LUA_TASK
		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--完美计次
		local iTaskID = 12672	--完美计次任务的id
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12634, 1,iCount)	--把完美计次已经完成的次数存入1号变量
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.SubmitItem = true
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local items = {	7077,23397,20496,28826}	--需要的物品id1,2,3,4
 		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12634)	--提交物品的信息：id，数量

		local flag_correct_sequence = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12634, 2)	--2号变量的值记录：正确顺序的进度
		local flag_items = {}
		flag_items[1] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12634, 3)	--3号变量的值>0表示：物品1已经被提交过
		flag_items[2] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12634, 4)	--4号变量的值>0表示：物品2已经被提交过
		flag_items[3] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12634, 5)	--5号变量的值>0表示：物品3已经被提交过
		flag_items[4] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12634, 6)	--6号变量的值>0表示：物品4已经被提交过

		if itemIDSubmitted and itemNumberSubmitted then
			for k,v in ipairs(items) do
				if itemIDSubmitted == v and itemNumberSubmitted >= 1 then
					if flag_items[k] == 0 then	--从没有提交过这个物品
						if flag_correct_sequence == k-1 then	--正确的顺序
							flag_correct_sequence = k
							TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12634, 2,flag_correct_sequence)
							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12634, 29, 20011)
						else
							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12634, 29, 20012)
						end
						flag_items[k] = 1	--把标志置为该物品已提交
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12634, k+2,flag_items[k])	--把标志存入相应的变量
						TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, v, 1)

						if flag_items[1]>0 and  flag_items[2]>0 and  flag_items[3]>0 and  flag_items[4]>0 then	--所有物品都提交了
							iRet = TASK_SUCC_FINISH
						end
						break
					else
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12634, 29, 20013)
					end
				elseif k == #items then
					TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12634, 29, 20000)
				end
			end
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local iBindMoney = TaskMoneyAdjust[playerLev] * base_awards.bindmoney		--根据玩家等级,从全局表里找到对应的魂币经验系数
			local ratio = 1		--奖励倍率
			if ucRandomNum2 >= 4 then	--按正确顺序提交
				ratio = 1.5
				--完美计次
				local iTaskID = 12672	--完美计次任务的id
				local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
				if iCount <= 9999 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskID)
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,12634, TaskBroadcastChannel.Local)
				end
			end
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iExperience * ratio)	--经验
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,iBindMoney * ratio)	--魂币
   		end
   		return 0
   	end
}

TaskList[12636] = ----四季合唱团-炀羽,
{
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local ratio = 1		--奖励倍率
			return iExperience * ratio	--经验
		end
		,
		BindMoney = function(TASKINTERFACE_POINTER)
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iBindMoney = TaskMoneyAdjust[playerLev] * base_awards.bindmoney		--根据玩家等级,从全局表里找到对应的魂币经验系数
			local ratio = 1		--奖励倍率
			return iBindMoney * ratio	--魂币
		end
		,
	}
	,
	Property =
  	{
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.HuoDong,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local PreTask = 12634
		if iPlayerLev < 30 then	--参与等级：30级
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		--2011年6月12日19：00到6月17日0：00
		local timePackage = os.date("*t", os.time())
		local year = timePackage.year
		local month = timePackage.month
		local day = timePackage.day
		local hour = timePackage.hour
		if year == 2011 and month == 6
		  and ((day == 12 and hour >= 19 ) or (day == 17 and hour < 0 ) or (day > 12 and day < 17)) then
				return 0
		else
			return TASK_PREREQU_FAIL_LUA_TASK
		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--完美计次
		local iTaskID = 12672	--完美计次任务的id
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12636, 1,iCount)	--把完美计次已经完成的次数存入1号变量
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.SubmitItem = true
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local items = {	16745,9057,22881,8584}	--需要的物品id1,2,3,4
 		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12636)	--提交物品的信息：id，数量

		local flag_correct_sequence = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12636, 2)	--2号变量的值记录：正确顺序的进度
		local flag_items = {}
		flag_items[1] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12636, 3)	--3号变量的值>0表示：物品1已经被提交过
		flag_items[2] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12636, 4)	--4号变量的值>0表示：物品2已经被提交过
		flag_items[3] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12636, 5)	--5号变量的值>0表示：物品3已经被提交过
		flag_items[4] = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12636, 6)	--6号变量的值>0表示：物品4已经被提交过

		if itemIDSubmitted and itemNumberSubmitted then
			for k,v in ipairs(items) do
				if itemIDSubmitted == v and itemNumberSubmitted >= 1 then
					if flag_items[k] == 0 then	--从没有提交过这个物品
						if flag_correct_sequence == k-1 then	--正确的顺序
							flag_correct_sequence = k
							TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12636, 2,flag_correct_sequence)
							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12636, 29, 20011)
						else
							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12636, 29, 20012)
						end
						flag_items[k] = 1	--把标志置为该物品已提交
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,12636, k+2,flag_items[k])	--把标志存入相应的变量
						TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, v, 1)

						if flag_items[1]>0 and  flag_items[2]>0 and  flag_items[3]>0 and  flag_items[4]>0 then	--所有物品都提交了
							iRet = TASK_SUCC_FINISH
						end
						break
					else
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12636, 29, 20013)
					end
				elseif k == #items then
					TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12636, 29, 20000)
				end
			end
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 120,bindmoney = 40}
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local iBindMoney = TaskMoneyAdjust[playerLev] * base_awards.bindmoney		--根据玩家等级,从全局表里找到对应的魂币经验系数
			local ratio = 1		--奖励倍率
			if ucRandomNum2 >= 4 then	--按正确顺序提交
				ratio = 1.5
				--完美计次
				local iTaskID = 12672	--完美计次任务的id
				local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskID)
				if iCount <= 9999 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskID)
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,12636, TaskBroadcastChannel.Local)
				end
			end
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iExperience * ratio)	--经验
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,iBindMoney * ratio)	--魂币
   		end
   		return 0
   	end
}
TaskList[13008] = ----初次领取历练精华,
{
	ItemNum =
	{
		[1] = 0,
		[2] = 1,
		[3] = 1,
		[4] = 1,
		[5] = 1,
		[6] = 1,
		[7] = 1,
		[8] = 1,
		[9] = 1,
		[10] = 5,
		[11] = 3,
		[12] = 3,
		[13] = 3,
		[14] = 3,
		[15] = 7,
		[16] = 5,
		[17] = 5,
		[18] = 5,
		[19] = 5,
		[20] = 8,
		[21] = 6,
		[22] = 6,
		[23] = 6,
		[24] = 6,
		[25] = 10,
		[26] = 8,
		[27] = 8,
		[28] = 8,
		[29] = 8,
		[30] = 12,
		[31] = 10,
		[32] = 10,
		[33] = 10,
		[34] = 10,
		[35] = 10,
		[36] = 10,
		[37] = 10,
		[38] = 10,
		[39] = 10,
		[40] = 16,
		[41] = 12,
		[42] = 12,
		[43] = 12,
		[44] = 12,
		[45] = 12,
		[46] = 12,
		[47] = 12,
		[48] = 12,
		[49] = 12,
		[50] = 20,
		[51] = 16,
		[52] = 16,
		[53] = 16,
		[54] = 16,
		[55] = 16,
		[56] = 16,
		[57] = 16,
		[58] = 16,
		[59] = 16,
		[60] = 32,
		[61] = 20,
		[62] = 20,
		[63] = 20,
		[64] = 20,
		[65] = 20,
		[66] = 20,
		[67] = 20,
		[68] = 20,
		[69] = 20,
		[70] = 40,
		[71] = 32,
		[72] = 32,
		[73] = 32,
		[74] = 32,
		[75] = 32,
		[76] = 32,
		[77] = 32,
		[78] = 32,
		[79] = 32,
		[80] = 60,
		[81] = 30,
		[82] = 30,
		[83] = 30,
		[84] = 30,
		[85] = 30,
		[86] = 30,
		[87] = 30,
		[88] = 30,
		[89] = 30,
		[90] = 50,
		[91] = 50,
		[92] = 50,
	}
	,
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = true,	--记录完成结果
		bCanRedo = false,	--成功后不可重复完成
  		bCanRedoAfterFailure = true,
		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,	--界面按钮任务
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if playerLev < 2 then	--2级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
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
		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 13008)
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			local iItemID = 36667
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iItemNum = 0
			--如果等级小于等于5级，发到第2级的奖励
			if playerLev <= 5 then
				iItemNum = TaskList[13008].ItemNum[1] + TaskList[13008].ItemNum[2]
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iItemID, iItemNum,true)	--绑定
			--如果等级大于5级，且小于等于10级，发到第5级的奖励
			elseif playerLev > 5 and playerLev <= 10 then
				for i=1,5 do
					iItemNum = iItemNum + TaskList[13008].ItemNum[i]
				end
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iItemID, iItemNum,true)	--绑定
			--如果等级大于10级，发到 当级-1 的奖励
			else
				for i=1,playerLev-1 do
					iItemNum = iItemNum + TaskList[13008].ItemNum[i]
				end
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iItemID, iItemNum,true)	--绑定
			end
   		end
   		return 0
   	end
}
TaskList[13012] = ----魔方百层塔队长选关,
{
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		iAvailFrequency  = TaskAvailFrequency.EverySeconds,		--任务发放时间间隔
		iTimeInterval = 300,									--每隔5分钟 = 300s 发放
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--玩家队长才可以接
		if not TaskCApi.IsInTeam(TASKINTERFACE_POINTER) or not TaskCApi.IsCaptain(TASKINTERFACE_POINTER) then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			local taskID =
			{
				12992,	--1区1关 boss击杀
				12993,	--1区2关 boss击杀
				12994,	--1区3关 boss01击杀
				12995,	--1区3关 boss02击杀
				12996,	--1区4关 boss01击杀
				12997,	--1区4关 boss02击杀

				13501,	--2区1关 boss击杀
				13502,	--2区2关 boss击杀
				13503,	--2区3关 boss击杀
				13504,	--2区4关 boss击杀
				13505,	--2区5关 boss击杀
			}
			local commander = 3264000
			local ctrl_n_msg =
			{
				[1] =
				{
					[1] = {ctrl = 103038,param1 = 2002,param2 = 1,},
				},
				[2] =
				{
					[1] = {ctrl = 103039,param1 = 2003,param2 = 1,},
				},
				[3] =
				{
					[1] = {ctrl = 103040,param1 = 2004,param2 = 1,},
					[2] = {ctrl = 103041,param1 = 2004,param2 = 2,},
				},
				[4] =
				{
					[1] = {ctrl = 103042,param1 = 2005,param2 = 1,},
					[2] = {ctrl = 103043,param1 = 2005,param2 = 2,},
				},
				[5] =
				{
					[1] = {ctrl = 103064,param1 = 2006,param2 = 1,},
				},
				[6] =
				{
					[1] = {ctrl = 103065,param1 = 2007,param2 = 1,},
				},
				[7] =
				{
					[1] = {ctrl = 103066,param1 = 2008,param2 = 1,},
				},
				[8] =
				{
					[1] = {ctrl = 103067,param1 = 2009,param2 = 1,},
				},
				[9] =
				{
					[1] = {ctrl = 103068,param1 = 2010,param2 = 1,},
				},
				[10] =
				{
					[1] = {ctrl = 0,param1 = 2011,param2 = 1,},
				},
			}
			local taskTimes = {}
			for k,v in ipairs(taskID) do
				taskTimes[k] = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,v)
			end
			--根据任务完成情况，开启不同的控制器并给commander发消息
			local scene = 1		--是第几关
			local rand = 1		--有随机的情况下随到第几个，没有随机就是1
			math.randomseed(os.time())
			--第1关
			if taskTimes[1] < 1 then
				scene = 1
			--第2关
			elseif taskTimes[2] < 1 then
				scene = 2
			--第3关
			elseif taskTimes[3] < 1 and taskTimes[4] < 1 then
				scene = 3
				rand = math.random(1, table.getn(ctrl_n_msg[3]))
			--第4关
			elseif taskTimes[5] < 1 and taskTimes[6] < 1 then
				scene = 4
				rand = math.random(1, table.getn(ctrl_n_msg[4]))
			elseif taskTimes[7] < 1 then
				scene = 5
			elseif taskTimes[8] < 1 then
				scene = 6
			elseif taskTimes[9] < 1 then
				scene = 7
			elseif taskTimes[10] < 1 then
				scene = 8
			elseif taskTimes[11] < 1 then
				scene = 9
			else
				scene = 10
			end

			TaskCApi.MonsterCtrl (TASKINTERFACE_POINTER ,ctrl_n_msg[scene][rand].ctrl, true)
			TaskCApi.SendAIEvent (TASKINTERFACE_POINTER, commander, ctrl_n_msg[scene][rand].param1, ctrl_n_msg[scene][rand].param2)
   		end
   		return 0
   	end
}
TaskList[13217] = ----连续登陆3天奖励,
{
	AwardPreview =	{}
	,
	Property =
  	{
		bHiddenTask = true,
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		local idx = 4	--连续登陆占用的活动计数编号是4
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
		if playerLev < 20 then	--20级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if emptySlots < 1 then	--普通包裹栏需要1格
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
		if commonCount ~= 3 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			math.randomseed(os.time())
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local base_awards = { xp = 200, bindmoney = 100 }
			local itemID = 36667	--历练精华
			local idx = 5	--宝石重铸次数占用的活动计数编号是5
			local iExperience = TaskExpAdjust[playerLev] * base_awards.xp		--根据玩家等级,从全局表里找到对应的等级经验系数
			local iBindMoney = TaskMoneyAdjust[playerLev] * base_awards.bindmoney		--根据玩家等级,从全局表里找到对应的魂币经验系数

			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 1)
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemID, 1,true)	--绑定
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,iExperience)
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,iBindMoney)

			local rand1 = math.random(1,5)
			local rand2 = math.random(1,5)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExperience * rand1))
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,math.floor(iBindMoney * rand2))

   		end
   		return 0
   	end
}
TaskList[13222] = --宝石重铸,
{
	Gems =
	{
		{id = 19130,	prob = 15,},	--生命宝石1级	自然
		{id = 19135,	prob = 10,},	--魔法宝石1级	泉水
		{id = 19140,	prob = 15,},	--攻击宝石1级	锐利
		{id = 19145,	prob = 15,},	--防御宝石1级	坚硬
		{id = 20290,	prob = 12,},	--命中宝石1级	鹰眼
		{id = 20295,	prob = 10,},	--闪躲宝石1级	灵巧
		{id = 20300,	prob = 5,},		--暴击宝石1级	毁灭
		{id = 20310,	prob = 6,},		--暴伤宝石1级	割裂
		{id = 20305,	prob = 6,},		--免暴击宝石1级	钝厚
		{id = 20315,	prob = 6,},		--减暴伤宝石1级	结晶
	}
	,
--[[	生命	15.00%
		魔法	10.00%
		攻击	15.00%
		防御	15.00%
		命中	12.00%
		闪避	10.00%
		暴击	5.00%
		免暴击	6.00%
		暴伤	6.00%
		免暴伤	6.00%
--]]

	Gems2 =
	{
		{id = 19131,	prob = 15,},	--生命宝石2级	自然
		{id = 19136,	prob = 10,},	--魔法宝石2级	泉水
		{id = 19141,	prob = 15,},	--攻击宝石2级	锐利
		{id = 19146,	prob = 15,},	--防御宝石2级	坚硬
		{id = 20291,	prob = 12,},	--命中宝石2级	鹰眼
		{id = 20296,	prob = 10,},	--闪躲宝石2级	灵巧
		{id = 20301,	prob = 5,},		--暴击宝石2级	毁灭
		{id = 20311,	prob = 6,},		--暴伤宝石2级	割裂
		{id = 20306,	prob = 6,},		--免暴击宝石2级	钝厚
		{id = 20316,	prob = 6,},		--减暴伤宝石2级	结晶
	}
	,
	Gems3 =
	{
		{id = 19132,	prob = 15,},	--生命宝石3级	自然
		{id = 19137,	prob = 10,},	--魔法宝石3级	泉水
		{id = 19142,	prob = 15,},	--攻击宝石3级	锐利
		{id = 19147,	prob = 15,},	--防御宝石3级	坚硬
		{id = 20292,	prob = 12,},	--命中宝石3级	鹰眼
		{id = 20297,	prob = 10,},	--闪躲宝石3级	灵巧
		{id = 20302,	prob = 5,},		--暴击宝石3级	毁灭
		{id = 20312,	prob = 6,},		--暴伤宝石3级	割裂
		{id = 20307,	prob = 6,},		--免暴击宝石3级	钝厚
		{id = 20317,	prob = 6,},		--减暴伤宝石3级	结晶
	}
	,
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		local idx = 5	--宝石重铸占用的活动计数编号是5
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
		if playerLev < 20 then	--20级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if emptySlots < 1 then	--普通包裹栏需要1格
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
		if commonCount < 1 then
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
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.SubmitItem  = true
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local idx = 5		--宝石重铸次数占用的活动计数编号是5
		local times2 = 2	--2级宝石重铸每次消耗次数
		local times3 = 5	--2级宝石重铸每次消耗次数
		local bindMoneyLv2 = 200000		--重铸2级宝石所需魂币
		local bindMoneyLv3 = 1000000	--重铸3级宝石所需魂币
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,13222)	--提交物品的信息：id，数量
		local currentTimes = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)		-- 宝石重铸剩余次数
		local currentBindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)		-- 现有魂币
		local bLv1Gem = false
		local bLv2Gem = false
		local bLv3Gem = false

		if itemIDSubmitted and itemNumberSubmitted then
			for k,v in ipairs(TaskList[13222].Gems) do
				if itemIDSubmitted == v.id and itemNumberSubmitted >= 1 then
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13222, 1,k)	--把宝石在table的序号存入1号变量
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13222, 2,1)	--把宝石的等级存入2号变量。1、2、3级宝石=1、2、3
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, -1)		--宝石重铸次数减去1
					TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,13222, 1)	--收取提交的宝石
					bLv1Gem = true
					iRet = TASK_SUCC_FINISH
					break
				end
			end
			for k,v in ipairs(TaskList[13222].Gems2) do
				if itemIDSubmitted == v.id and itemNumberSubmitted >= 1 then
					bLv2Gem = true
					if currentTimes < times2 then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 13222, 29, 20002)	--次数不足的提示
						break
					elseif currentBindMoney < bindMoneyLv2 then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 13222, 29, 20003)	--魂币不足的提示
						break
					else
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13222, 1,k)	--把宝石在table的序号存入1号变量
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13222, 2,2)	--把宝石的等级存入2号变量。1、2、3级宝石=1、2、3
						TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, -times2)		--宝石重铸次数减去2
						TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,13222, 1)	--收取提交的宝石
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,-bindMoneyLv2)	--收魂币
						iRet = TASK_SUCC_FINISH
						break
					end
				end
			end
			for k,v in ipairs(TaskList[13222].Gems3) do
				if itemIDSubmitted == v.id and itemNumberSubmitted >= 1 then
					bLv3Gem = true
					if currentTimes < times3 then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 13222, 29, 20002)	--次数不足的提示
						break
					elseif currentBindMoney < bindMoneyLv3 then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 13222, 29, 20003)	--魂币不足的提示
						break
					else
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13222, 1,k)	--把宝石在table的序号存入1号变量
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13222, 2,3)	--把宝石的等级存入2号变量。1、2、3级宝石=1、2、3
						TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, -times3)		--宝石重铸次数减去5
						TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,13222, 1)	--收取提交的宝石
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,-bindMoneyLv3)	--收魂币
						iRet = TASK_SUCC_FINISH
						break
					end
				end
			end
			if (bLv1Gem == false) and (bLv2Gem == false) and (bLv3Gem == false) then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 13222, 29, 20000)	--非重铸物品的提示
			end
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			math.randomseed(os.time())
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local gemIdx = 	ucRandomNum1	--1号变量：所提交的宝石的在table的序号
			local gemLv = ucRandomNum2		--2号变量：宝石等级
			local vipBuffID = 2164			--vip卡的buffid
			local idx = 5					--宝石重铸次数占用的活动计数编号是5
			local sumProbability = 0		--求所有宝石权重之和
			local bVIP = TaskCApi.HasBuff(TASKINTERFACE_POINTER,vipBuffID) 		--是否VIP

			local gemTable = {}
			if gemLv == 2 then
				gemTable = TaskList[13222].Gems2
			elseif gemLv == 3 then
				gemTable = TaskList[13222].Gems3
			else
				gemTable = TaskList[13222].Gems
			end
			for k,v in ipairs(gemTable) do
				if bVIP and k == gemIdx then		--如果是vip，那么所提交的宝石概率不计入总权重
					sumProbability = sumProbability
				else
					sumProbability = sumProbability + v.prob
				end
			end
			local rand = math.random(1,sumProbability)
			local temp = 0
			local itemID = 0
			for k,v in ipairs(gemTable) do
				if not ( bVIP and k == gemIdx ) then		--如果是vip，就排除掉所提交的宝石
					if rand <= temp + v.prob then
						itemID = v.id
						break
					else
						temp = temp + v.prob
					end
				end
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemID, 1,true)	--绑定
   		end
   		return 0
   	end
}

TaskList[13579] = --纪元每周领经验
{
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,	--接受即完成！

		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每周最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,--每周清空
		iClearFinishCountDay = 1,
		iClearFinishCountHour = 0,
		iClearFinishCountMin = 0,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--取得本周活跃度数值
		local BuffID = 2164			--无忧卡buff的buffid
		local bActive = TaskCApi.HasBuff(TASKINTERFACE_POINTER,BuffID) 		--是否无忧卡
		if not bActive and iCount < 80 then	--活跃度小于80时,不能领取(活跃会员不受此限）
	   	    return TASK_PREREQU_FAIL_LUA_TASK
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER,iParam)
		local iPrayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
		local data =
		{
			[1] = { prayValue = 500000, expRatio = 1000, maxLev = 70 },
			[2] = { prayValue = 2000000, expRatio = 1250, maxLev = 70 },
			[3] = { prayValue = 3500000, expRatio = 1500, maxLev = 70 },
			[4] = { prayValue = 5000000, expRatio = 1750, maxLev = 70 },
			[5] = { prayValue = 6500000, expRatio = 2000, maxLev = 70 },
			[6] = { prayValue = 8500000, expRatio = 2250, maxLev = 70 },
			[7] = { prayValue = 11000000, expRatio = 2500, maxLev = 70 },
			[8] = { prayValue = 9999000000, expRatio = 2750, maxLev = 70 },	--未开放
		}
		local goldCost = 100000				--可选花费10金币
		local goldMulti = 10				--花金币后的经验倍率
		local VIPLevel = TaskCApi.GetVipLevel(TASKINTERFACE_POINTER)
		local VIPRequire = 5
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local curEraIndex = 1
		--根据祈福值落在哪一个区间，算取应领取的经验
		if iPrayValue then
			for i=1,#data do
				if iPrayValue >= data[i].prayValue then
					curEraIndex = i
				end
			end
		end
		local keyLev = math.min(data[curEraIndex].maxLev,iPlayerLev)	--经验等级不能超过maxLev
		local iExp = data[curEraIndex].expRatio * TaskExpAdjust[keyLev]
		if iParam == 10 then
			local currentGold = TaskCApi.GetGoldAmount(TASKINTERFACE_POINTER)
			if currentGold >= goldCost and VIPLevel >= VIPRequire then
				iExp = iExp * goldMulti
				TaskCApi.TakeAwayGold(TASKINTERFACE_POINTER,goldCost)	--收金币
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))	--发多倍经验
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
				TaskCApi.Broadcast(TASKINTERFACE_POINTER ,13579, TaskBroadcastChannel.Trade)
			end
		else
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))

		end
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam, bRetrieve ,ucRandomNum1)
		if bSuccess then
		end
		return 0
   	end
}
TaskList[13580] = --纪元每周领补偿经验
{
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bFinishWhenDelvier = true,	--接受即完成！

		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每周最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,--每周清空
		iClearFinishCountDay = 1,
		iClearFinishCountHour = 0,
		iClearFinishCountMin = 0,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
		bUIButtonTask = true,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iPrayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
		if iPlayerLev < 25 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		elseif iPlayerLev <= 60 then
			if iPrayValue then				--客户端取祈福值会返回nil，所以这里要看下
				if iPrayValue < 5000000 then
					return TASK_PREREQU_FAIL_LUA_TASK
				end
			end
		elseif iPlayerLev <= 70 then
			if iPrayValue then
				if iPrayValue < 8500000 then
					return TASK_PREREQU_FAIL_LUA_TASK
				end
			end
		else
			return TASK_PREREQU_FAIL_ABOVE_LEVEL
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
		if bSuccess then
			local data =
			{
				[1] = { pray = 8500000,lvmin = 25,lvmax = 75, expMakeup = 2860,},
				[2] = { pray = 5000000,lvmin = 25,lvmax = 65, expMakeup = 1430,},
			}
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPrayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
			local iExp

			if iPlayerLev >= data[1].lvmin and iPlayerLev <= data[1].lvmax and iPrayValue >= data[1].pray then
				TaskCApi.DeliverPrepareMakeupExp(TASKINTERFACE_POINTER, math.floor(data[1].expMakeup * TaskExpAdjust[iPlayerLev] ))
			elseif  iPlayerLev >= data[2].lvmin and iPlayerLev <= data[2].lvmax and iPrayValue >= data[2].pray then
				TaskCApi.DeliverPrepareMakeupExp(TASKINTERFACE_POINTER, math.floor(data[2].expMakeup * TaskExpAdjust[iPlayerLev] ))
			end
		end
		return 0
   	end
}

TaskList[13588] = --（作废）凤凰令1级	--使用 38000 接到
{
	MonsterInfo =			--等级杀怪
	{
		{Lv = 1, Monster =57, Num = 150,},
		{Lv = 30, Monster =8075, Num = 150,},
		{Lv = 35, Monster =8929, Num = 150,},
		{Lv = 40, Monster =47, Num = 150,},
		{Lv = 45, Monster =44, Num = 150,},
		{Lv = 50, Monster =5782, Num = 150,},
		{Lv = 55, Monster =53, Num = 150,},
		{Lv = 60, Monster =10441, Num = 150,},
		{Lv = 65, Monster =13955, Num = 150,},
		{Lv = 70, Monster =13957, Num = 150,},
		{Lv = 75, Monster =13958, Num = 150,},
	}
	,
	ExpInfo =				--基础经验系数
	{
		{Lv = 1, BaseExp = 1200,},
		{Lv = 45, BaseExp = 900,},
		{Lv = 60, BaseExp = 600,},
	}
	,
	TimeData = 				--时间档位
	{
		[1] = { secondMin = 1201, secondMax = 99999999 },	--20分钟以上
		[2] = { secondMin = 901, secondMax = 1200 },	--20分钟以内
		[3] = { secondMin = 601, secondMax = 900 },	--15分钟以内
		[4] = { secondMin = 0, secondMax = 600 },	--10分钟以内
	}
	,
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.JuanZhou,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local baseExp		--基本经验系数
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPlayerLevOnDeliver = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13588, 4)
			local ExpInfo = TaskList[13588].ExpInfo	--基本经验table
			--按等级段取得：基本经验系数
			for i=1,#ExpInfo do
				if iPlayerLevOnDeliver >= ExpInfo[i].Lv then
					baseExp = ExpInfo[i].BaseExp
				end
			end
			local iExp = baseExp * TaskExpAdjust[iPlayerLevOnDeliver]
			return iExp
		end
	}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local idx = 7	--凤凰令系列任务占用的活动计数编号是7
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		if iPlayerLev < 25 then	--等级限制25级以上
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if commonCount < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local idx = 7	--凤凰令系列任务占用的活动计数编号是7
		local MonsterInfo = TaskList[13588].MonsterInfo
		local monsterIndex	= 1 --要杀的怪物id在表里的索引，预设为1
		for i=1,#MonsterInfo do
			if iPlayerLev >= MonsterInfo[i].Lv then
				monsterIndex = i
			end
		end

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13588, 1,monsterIndex)	--把怪物id在表里的索引存入1号变量
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13588, 4,iPlayerLev)		--把接受任务时候的角色等级存入4号变量
		TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx,-1)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		local MonsterInfo = TaskList[13588].MonsterInfo
		local monsterIndex = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13588, 1)
		Method.KillMonster = { Mons1={ID=MonsterInfo[monsterIndex].Monster, Num=MonsterInfo[monsterIndex].Num}, }
   		Method.iWaitTime = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iRet = TASK_NO_FINISH
		local monsterKilled = TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER,13588, "Mons1")
		local MonsterInfo = TaskList[13588].MonsterInfo
		local monsterIndex = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13588, 1)
		if monsterKilled >= MonsterInfo[monsterIndex].Num then
			local curTime = TaskCApi.GetCurTime(TASKINTERFACE_POINTER) --获取系统当前时间,单位秒
			local deliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER ,13588) --获取玩家接收到任务iTaskID的时间,单位秒
			local duration = curTime - deliverTime		--得到玩家真实的耗费时间
			local second = math.floor(duration % 60)	--秒数
			local minute = math.floor(duration / 60)	--分钟数（超过60分钟的并不会折算成小时）
			--处理分钟数大于60的情况：把大于60分钟的分钟数都置为60
			minute = math.min(minute,60)
			--把秒数、分钟数存入变量2、3号
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13588, 2,second)
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13588, 3,minute)

			iRet = TASK_SUCC_FINISH
		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,13588, TaskBroadcastChannel.Trade)
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			local baseExp,eraExpRatio,timeExpRatio		--基本经验系数，纪元经验加成率，时间经验加成率
			eraExpRatio = 1.5				--纪元给予的经验加成率50%
			local PlayerReturnPlus = 0.5	-- 老玩家回归buff加成率
			local prayData =				--达到某些纪元，且在规定等级以下时有经验加成
			{
				[1] = { prayValue = 6500000, maxLev = 65 },		--黑龙纪元
				[2] = { prayValue = 11000000, maxLev = 75 },	--女神纪元
			}
			local TimeData = TaskList[13588].TimeData			--时间档位
			local expViaTime = 				--各个等级段在不同时间档位的经验加成
			{
				{Lv = 1, Ratio = {1, 1, 1, 1},},
				{Lv = 30, Ratio = {1, 1.1, 1.1, 1.1},},
				{Lv = 40, Ratio = {1, 1.1, 1.2, 1.2},},
				{Lv = 50, Ratio = {1, 1.1, 1.2, 1.3},},
			}
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPrayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
			local ExpInfo = TaskList[13588].ExpInfo	--基本经验table
			--按领取任务时的等级取得：基本经验系数
			local iPlayerLevOnDeliver
			if not ucRandomNum4 or ucRandomNum4 == 0 then
				iPlayerLevOnDeliver = iPlayerLev
			else
				iPlayerLevOnDeliver = ucRandomNum4
			end
			for i=1,#ExpInfo do
				if iPlayerLevOnDeliver >= ExpInfo[i].Lv then
					baseExp = ExpInfo[i].BaseExp
				end
			end
			--根据祈福值和等级得到：纪元经验加成率
			for i=1,#prayData do
				if iPrayValue >= prayData[i].prayValue and iPlayerLev <= prayData[i].maxLev then
					eraExpRatio = eraExpRatio
					break
				else
					eraExpRatio = 1
				end
			end
			--根据时间查询到时间档位
			local second = ucRandomNum2
			local minute = ucRandomNum3
			local duration = minute * 60 + second
			local TimeData = TaskList[13588].TimeData			--时间档位table
			local durationClass = 1								--时间档位的序号，缺省是1
			for k,v in ipairs(TimeData) do
				if duration >= v.secondMin and duration <= v.secondMax then
					durationClass = k
					break
				end
			end
			--根据时间档位查询到：时间经验加成率
			local temp = 1
			for i=1,#expViaTime do
				if iPlayerLev >= expViaTime[i].Lv then
					temp = i
				end
			end
			timeExpRatio = expViaTime[temp].Ratio[durationClass]
			-- 	如果有老玩家回归buff，则经验加成
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,2895) then
				baseExp = baseExp * (1+ PlayerReturnPlus)
			end
			--发经验奖励
			local iExp = baseExp * eraExpRatio * timeExpRatio * TaskExpAdjust[iPlayerLevOnDeliver]
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
			--每周活跃度
			local WeeklyActivityTaskID = 13122
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, WeeklyActivityTaskID, 2)
			--成就，一次任务只能完成其中1个成就
			local achTaskID1 = 13628	--急速的凤凰
			local achTaskID2 = 13629	--愤怒的凤凰，需要先完成：急速的凤凰
			local achTaskID1Flag = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,achTaskID1,true)
			local achTaskID2Flag = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,achTaskID2,true)
			if TaskCApi.IsCaptain(TASKINTERFACE_POINTER) then	--必须是队长
				if not achTaskID1Flag then			--如果没完成过任务1则继续，否则跳过
					if iPlayerLev >= 40 and duration <= 900 then							--如果40级以上，15分钟以内
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,achTaskID1)			--发放任务1
					end
				else								--只有当完成过任务1的时候才能走到这里，避免没完成前提成就就违规发放后面的成就任务
					if not achTaskID2Flag then				--如果没完成过任务2则继续，否则跳过
						if iPlayerLev >= 50 and duration <= 480 then	--如果50级以上，8分钟以内
							TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,achTaskID2)			--发放任务2
						end
					end
				end
			end
		end
		return 0
   	end
}

TaskList[13637] = --（作废）辉光令1级	--使用 38375 接到
{
	MonsterInfo =			--等级杀怪
	{
		{ Lv = 1,  BeliefLv = 0, Monster = 38169, Num = 240, Belief = 120000, Exp = 240, repu = 100,},   --比尔血盟刺客
		{ Lv = 65, BeliefLv = 0, Monster = 38173, Num = 240, Belief = 180000, Exp = 240, repu = 600,},   --黑矮人矿工
		{ Lv = 70, BeliefLv = 0, Monster = 38177, Num = 240, Belief = 240000, Exp = 240, repu = 2400,},   --人类主权同盟精英
		{ Lv = 75, BeliefLv = 0, Monster = 38180, Num = 240, Belief = 300000, Exp = 240, repu = 7200,},   --血纹苦修者
		{ Lv = 80, BeliefLv = 0, Monster = 38182, Num = 240, Belief = 360000, Exp = 240, repu = 7500,},   --黑地精保镖
	}
	,
	TimeData = 				--时间档位
	{
		[1] = { secondMin = 1801, secondMax = 99999999 },	--30分钟以上
		[2] = { secondMin = 1201, secondMax = 1800 },	--30分钟以内
		[3] = { secondMin = 721, secondMax = 1200 },	--20分钟以内
		[4] = { secondMin = 0, secondMax = 720 },	--12分钟以内
	}
	,
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.JuanZhou,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local baseExp		--基本经验系数
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPlayerLevOnDeliver = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13637, 4)
			local MonsterInfo = TaskList[13637].MonsterInfo	--基本怪物信息和经验table
			--按等级段取得：基本经验系数
			for i=1,#MonsterInfo do
				if iPlayerLevOnDeliver >= MonsterInfo[i].Lv then
					baseExp = MonsterInfo[i].Exp
				end
			end
			local iExp = baseExp * TaskExpAdjust[iPlayerLevOnDeliver]
			return iExp
		end ,
		Belief = function(TASKINTERFACE_POINTER)
			local baseBelief		--基本信仰值奖励
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPlayerLevOnDeliver = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13637, 4)
			local iPlayerGodLev = TaskCApi.GetGodLevel(TASKINTERFACE_POINTER) or 0		--神之信仰等级
			local iPlayerEvilLev = TaskCApi.GetEvilLevel (TASKINTERFACE_POINTER) or 0 	--魔之信仰等级
			local MonsterInfo = TaskList[13637].MonsterInfo	--基本怪物信息和经验table
			for i=1,#MonsterInfo do
				if iPlayerLevOnDeliver >= MonsterInfo[i].Lv and math.max(iPlayerGodLev, iPlayerEvilLev) >= MonsterInfo[i].BeliefLv then
					baseBelief = MonsterInfo[i].Belief
				end
			end
			return baseBelief
		end	,
		FriendShips = function(TASKINTERFACE_POINTER)
			local baseRepu		--基本雷辛格声望
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPlayerLevOnDeliver = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13637, 4)
			local iPlayerGodLev = TaskCApi.GetGodLevel(TASKINTERFACE_POINTER) or 0		--神之信仰等级
			local iPlayerEvilLev = TaskCApi.GetEvilLevel (TASKINTERFACE_POINTER) or 0 	--魔之信仰等级
			local MonsterInfo = TaskList[13637].MonsterInfo	--基本怪物信息和经验table
			for i=1,#MonsterInfo do
				if iPlayerLevOnDeliver >= MonsterInfo[i].Lv and math.max(iPlayerGodLev, iPlayerEvilLev) >= MonsterInfo[i].BeliefLv then
					baseRepu = MonsterInfo[i].repu
				end
			end
			local friendships =
			{
				FS1 = { ID = 1, VAL = baseRepu },
			}
			return friendships
		end	,
	}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local idx = 7	--神兽令系列任务占用的活动计数编号是7
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		if iPlayerLev < 60 then	--等级限制60级以上
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if commonCount < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iPlayerGodLev = TaskCApi.GetGodLevel(TASKINTERFACE_POINTER) or 1		--神之信仰等级
		local iPlayerEvilLev = TaskCApi.GetEvilLevel (TASKINTERFACE_POINTER) or 1 	--魔之信仰等级
		local idx = 7	--神兽令系列任务占用的活动计数编号是7
		local MonsterInfo = TaskList[13637].MonsterInfo
		local monsterIndex	= 1 --要杀的怪物id在表里的索引，预设为1
		for i=1,#MonsterInfo do
			if iPlayerLev >= MonsterInfo[i].Lv and math.max(iPlayerGodLev, iPlayerEvilLev) >= MonsterInfo[i].BeliefLv then
				monsterIndex = i
			end
		end

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13637, 1,monsterIndex)	--把怪物id在表里的索引存入1号变量
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13637, 4,iPlayerLev)		--把接受任务时候的角色等级存入4号变量
		TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx,-1)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		local MonsterInfo = TaskList[13637].MonsterInfo
		local monsterIndex = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13637, 1)
		Method.KillMonster = { Mons1={ID=MonsterInfo[monsterIndex].Monster, Num=MonsterInfo[monsterIndex].Num}, }
   		Method.iWaitTime = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iRet = TASK_NO_FINISH
		local monsterKilled = TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER,13637, "Mons1")
		local MonsterInfo = TaskList[13637].MonsterInfo
		local monsterIndex = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13637, 1)
		if monsterKilled >= MonsterInfo[monsterIndex].Num then
			local curTime = TaskCApi.GetCurTime(TASKINTERFACE_POINTER) --获取系统当前时间,单位秒
			local deliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER ,13637) --获取玩家接收到任务iTaskID的时间,单位秒
			local duration = curTime - deliverTime		--得到玩家真实的耗费时间
			local second = math.floor(duration % 60)	--秒数
			local minute = math.floor(duration / 60)	--分钟数（超过60分钟的并不会折算成小时）
			--处理分钟数大于60的情况：把大于60分钟的分钟数都置为60
			minute = math.min(minute,60)
			--把秒数、分钟数存入变量2、3号
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13637, 2,second)
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,13637, 3,minute)

			iRet = TASK_SUCC_FINISH
		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,13637, TaskBroadcastChannel.Trade)
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			local baseExp,baseBelief,baseRepu,eraRatio,timeRatio		--基本经验系数，基本信仰值奖励，纪元加成率，时间加成率
			eraRatio = 1				--纪元给予的加成率 【暂时为1】
			timeRatio = 1
			local PlayerReturnPlus = 0.5	-- 老玩家回归buff加成率
			local prayData =				--达到某些纪元，且在规定等级以下时有奖励加成【暂无】
			{
				[1] = { prayValue = 6500000, maxLev = 65 },		--黑龙纪元
				[2] = { prayValue = 11000000, maxLev = 75 },	--女神纪元
			}
			local expViaTime = 				--各个等级段在不同时间档位的信仰值加成
			{
				{Lv = 1, Ratio = {1, 1.1, 1.1, 1.1},},
				{Lv = 65, Ratio = {1, 1.1, 1.2, 1.2},},
				{Lv = 70, Ratio = {1, 1.1, 1.2, 1.3},},
			}
			local TimeData = TaskList[13637].TimeData			--时间档位
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

			local iPlayerGodLev = TaskCApi.GetGodLevel(TASKINTERFACE_POINTER) or 0		--神之信仰等级
			local iPlayerEvilLev = TaskCApi.GetEvilLevel(TASKINTERFACE_POINTER) or 0 	--魔之信仰等级
			local iPrayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
			local MonsterInfo = TaskList[13637].MonsterInfo	--基本怪物信息和经验table
			--按领取任务时的等级取得：基本经验系数 和 信仰值
			local iPlayerLevOnDeliver
			if not ucRandomNum4 or ucRandomNum4 == 0 then
				iPlayerLevOnDeliver = iPlayerLev
			else
				iPlayerLevOnDeliver = ucRandomNum4
			end
			for i=1,#MonsterInfo do
				if iPlayerLevOnDeliver >= MonsterInfo[i].Lv and math.max(iPlayerGodLev, iPlayerEvilLev) >= MonsterInfo[i].BeliefLv then
					baseExp = MonsterInfo[i].Exp
					baseBelief = MonsterInfo[i].Belief
					baseRepu = MonsterInfo[i].repu
				end
			end
--[[			--根据祈福值和等级得到：纪元加成率
			for i=1,#prayData do
				if iPrayValue >= prayData[i].prayValue and iPlayerLev <= prayData[i].maxLev then
					eraRatio = eraRatio
					break
				else
					eraRatio = 1
				end
			end
--]]			--根据时间查询到时间档位
			local second = ucRandomNum2
			local minute = ucRandomNum3
			local duration = minute * 60 + second
			local TimeData = TaskList[13637].TimeData			--时间档位table
			local durationClass = 1								--时间档位的序号，缺省是1
			for k,v in ipairs(TimeData) do
				if duration >= v.secondMin and duration <= v.secondMax then
					durationClass = k
					break
				end
			end
			--根据时间档位查询到：时间加成率
			local temp = 1
			for i=1,#expViaTime do
				if iPlayerLev >= expViaTime[i].Lv then
					temp = i
				end
			end
			timeRatio = expViaTime[temp].Ratio[durationClass]
			-- 	如果有老玩家回归buff，则经验加成
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,2895) then
				baseExp = baseExp * (1+ PlayerReturnPlus)
			end
			--发经验和信仰值奖励
			local iExp = baseExp * TaskExpAdjust[iPlayerLev]
			local iBeliefVal = baseBelief * eraRatio * timeRatio
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,iBeliefVal, true)
			--每周活跃度,累计次数
			local WeeklyActivityTaskID = 13122
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, WeeklyActivityTaskID, 2)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13972, 1)
			--发雷辛格声望
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,1, baseRepu)
			--成就，一次任务只能完成其中1个成就
			local achTaskID1 = 13648	--刹那辉光
			local achTaskID2 = 13649	--天行辉光，需要先完成：刹那辉光
			local achTaskID1Flag = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,achTaskID1,true)
			local achTaskID2Flag = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,achTaskID2,true)
			if TaskCApi.IsCaptain(TASKINTERFACE_POINTER) then	--必须是队长
				if not achTaskID1Flag then			--如果没完成过任务1则继续，否则跳过
					if iPlayerLev >= 60 and duration <= 720 then							--如果60级以上，12分钟以内
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,achTaskID1)			--发放任务1
					end
				else								--只有当完成过任务1的时候才能走到这里，避免没完成前提成就就违规发放后面的成就任务
					if not achTaskID2Flag then				--如果没完成过任务2则继续，否则跳过
						if iPlayerLev >= 70 and duration <= 480 then	--如果70级以上，8分钟以内
							TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,achTaskID2)			--发放任务2
						end
					end
				end
			end
		end
		return 0
   	end
}
TaskList[13642] = --装备本随机周常主任务（英雄主义的呐喊）
{
	allTasks =			--任务id和权重（！权重合计必须等于100！）
	{
		{id = 12609, weight = 30,},		--灾域虚空
		{id = 13644, weight = 70,},		--万王之陵
	}
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.FuBen,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每周最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,--每周清空
		iClearFinishCountDay = 1,
		iClearFinishCountHour = 0,
		iClearFinishCountMin = 0,
  	}
   	,
	AwardPreview =	{}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local bEmpty = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,12609)
		if iPlayerLev < 75 then	--等级限制75级以上
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if not bEmpty then
			return TASK_PREREQU_FAIL_FULL
		end
		for k,v in ipairs(TaskList[13642].allTasks) do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,v.id) then
				return TASK_PREREQU_FAIL_LUA_TASK
			end
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		math.randomseed(os.time())
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		--计算出权重的合计值
		local totalWeight = 0
		for k,v in ipairs(TaskList[13642].allTasks) do
			totalWeight = totalWeight + v.weight
		end
		--随机，按随机概率确定任务id，并发放该任务
		local iRand = math.random(1,totalWeight)
		local sum = 0
		for k,v in ipairs(TaskList[13642].allTasks) do
			sum = sum + v.weight
			if iRand <= sum then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,v.id)
				break
			end
		end
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
		end
		return 0
   	end
}
TaskList[13214] = --累计登录180之后的经验嘉奖
{
	Property =
  	{
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local idx = 3			--累计登录占用的活动计数编号是3
		local preTask = 13213	--前提任务
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
		if commonCount < 190 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,preTask,true) then
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
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
   		if bSuccess then
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		if bSuccess then
			local baseExp = 300
			local titles = { 6147,6148,	6149,6150,6151,6152,6153,6154,6155,6156 }
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--发经验
			local iExp = baseExp * TaskExpAdjust[iPlayerLev]
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
			--发称号
			for k,v in ipairs(titles) do
				if not TaskCApi.HasTitle(TASKINTERFACE_POINTER,v) then
					TaskCApi.GiveOneTitle(TASKINTERFACE_POINTER,v)
					break
				end
			end
		end
		return 0
   	end
}
TaskList[13758] = --【雷辛格日常】换防令
{
	Reputation =
	{
		{lv = 1, repu = 100,},
		{lv = 65, repu = 600,},
		{lv = 70, repu = 2400,},
		{lv = 75, repu = 7200,},
	}
	,
	Property =
  	{
		iRetrieveIdx = 30,			--活动补偿类型索引 30
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = true,
  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local baseExp = 60
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExp = math.floor(baseExp * TaskExpAdjust[iPlayerLev])
			return iExp
		end ,
		Belief = function(TASKINTERFACE_POINTER)
			local baseBelief = 9000
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--80级以后发信仰值
			if iPlayerLev < 80 then
				baseBelief = nil
			end
			return baseBelief
		end	,
		FriendShips = function(TASKINTERFACE_POINTER)
			local baseRepu		--基本雷辛格声望
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			for i=1,#TaskList[13758].Reputation do
				if iPlayerLev >= TaskList[13758].Reputation[i].lv then
					baseRepu = TaskList[13758].Reputation[i].repu
				end
			end
			local friendships =
			{
				FS1 = { ID = 1, VAL = baseRepu },
			}
			return friendships
		end	,
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 0, NUM = 1},--0时为？？？,其他显示物品和数量
					}
			return items
		end,
	}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local idx = 8			--雷辛格日常活动统一计数编号是8
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local taskIDs = { 13643,13765,13758,}
		for k,v in ipairs(taskIDs) do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,v) then
				return TASK_PREREQU_FAIL_LUA_TASK
			end
		end
		if commonCount < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
		if iPlayerLev < 65 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,13759)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.CompleteTask = {TaskID = 13759 , Num = 5}
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local taskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13759)	--任务完成次数
		if taskCount >= 5 then
			iRet = TASK_SUCC_FINISH
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve)
		if bSuccess then
			local iRetrieveIdx = 30			--活动补偿类型索引30
			local baseExp = 60
			local baseBelief = 9000
			local baseRepu = 0
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--发经验
			local iExp = baseExp * TaskExpAdjust[iPlayerLev]
--			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
			TaskCApi.DeliverRetrieveExp(TASKINTERFACE_POINTER, math.floor(iExp),bRetrieve,iRetrieveIdx)

			--80级以后发信仰值
			if iPlayerLev >= 80 then
--				TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,baseBelief, true)
				TaskCApi.DeliverRetrieveBelief(TASKINTERFACE_POINTER, baseBelief, true, bRetrieve ,iRetrieveIdx)

			end
			--发声望
			for i=1,#TaskList[13758].Reputation do
				if iPlayerLev >= TaskList[13758].Reputation[i].lv then
					baseRepu = TaskList[13758].Reputation[i].repu
				end
			end
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,1, baseRepu)
			--发物品：血色咒文
			math.randomseed(os.time())
			local iRand = math.random(1,1000)
			if iRand <= 50 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,39263, 1,false)	--不绑定（蓝咒文）5%
				TaskCApi.Broadcast(TASKINTERFACE_POINTER ,13758, TaskBroadcastChannel.System)
			elseif iRand <= 250 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,39262, 2,false)	--不绑定（绿咒文）20%
			elseif iRand <= 750 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,39261, 3,false)	--不绑定（白咒文）50%
			end
			--活动计数减去1
			local idx = 8			--雷辛格日常活动统一计数编号是8
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, -1)
			--活跃度计次，幸运任务计次，累计次数统计
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13122, 1)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13646, 1)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 14007, 1)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,1)
			--清空活动补偿值
			TaskCApi. ClearRetrieveVal(TASKINTERFACE_POINTER,13758, iRetrieveIdx)
			-- 获得活跃度喊话通知任务
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15876)
		end
		return 0
   	end
}
TaskList[13780] = --【竞技场热身赛奖励】根据积分发称号
{
	Property =
  	{
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = true,
  		bCanSeekOut = true,
		bFinishWhenDelvier = true,	--接受即完成！
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview = {}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
--		local globalIndex = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER,100100) or 0
		if iPlayerLev < 200 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
--		if globalIndex ~= 0 then
--			return TASK_PREREQU_FAIL_LUA_TASK
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
			Titles =
			{
				{score = 0, title = 6216,},
				{score = 1500, title = 6217,},
				{score = 2100, title = 6218,},
				{score = 2400, title = 6219,},
				{score = 2700, title = 6220,},
			}
			local v33 = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,27)	--3v3
			local v66 = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,28)	--6v6
			local highest = math.max(v33,v66)
			--发称号
			local temp = 1
			for k,v in ipairs(Titles) do
				if highest >= v.score then
					temp = k
				else
					break
				end
			end
			TaskCApi.GiveOneTitle(TASKINTERFACE_POINTER, Titles[temp].title)
		end
		return 0
   	end
}

TaskList[13765] = --【雷辛格日常】阿敢快跑
{
	Reputation =
	{
		{lv = 1, repu = 100,},
		{lv = 65, repu = 600,},
		{lv = 70, repu = 2400,},
		{lv = 75, repu = 7200,},
	}
	,
	Property =
  	{
		iRetrieveIdx = 28,			--活动补偿类型索引28
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = true,
  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local baseExp = 60
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExp = math.floor(baseExp * TaskExpAdjust[iPlayerLev])
			return iExp
		end ,
		Belief = function(TASKINTERFACE_POINTER)
			local baseBelief = 9000
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--80级以后发信仰值
			if iPlayerLev < 80 then
				baseBelief = nil
			end
			return baseBelief
		end	,
		FriendShips = function(TASKINTERFACE_POINTER)
			local baseRepu		--基本雷辛格声望
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			for i=1,#TaskList[13765].Reputation do
				if iPlayerLev >= TaskList[13765].Reputation[i].lv then
					baseRepu = TaskList[13765].Reputation[i].repu
				end
			end
			local friendships =
			{
				FS1 = { ID = 1, VAL = baseRepu },
			}
			return friendships
		end	,
	}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local idx = 8			--雷辛格日常活动统一计数编号是8
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local taskIDs = { 13643,13765,13758,}
		for k,v in ipairs(taskIDs) do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,v) then
				return TASK_PREREQU_FAIL_LUA_TASK
			end
		end
		if commonCount < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
		if iPlayerLev < 60 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,13766)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.CompleteTask = {TaskID = 13766 , Num = 30}
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local taskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13766)	--任务完成次数
		if taskCount >= 30 then
			iRet = TASK_SUCC_FINISH
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve)
		if bSuccess then
			local baseExp = 60
			local baseBelief = 9000
			local baseRepu = 0
			local iRetrieveIdx = 28
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			--发经验
			local iExp = baseExp * TaskExpAdjust[iPlayerLev]
--			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
			TaskCApi.DeliverRetrieveExp(TASKINTERFACE_POINTER, math.floor(iExp),bRetrieve,iRetrieveIdx)

			--80级以后发信仰值
			if iPlayerLev >= 80 then
--				TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,baseBelief, true)
				TaskCApi.DeliverRetrieveBelief(TASKINTERFACE_POINTER, baseBelief, true, bRetrieve ,iRetrieveIdx)

			end
			--发声望
			for i=1,#TaskList[13765].Reputation do
				if iPlayerLev >= TaskList[13765].Reputation[i].lv then
					baseRepu = TaskList[13765].Reputation[i].repu
				end
			end
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,1, baseRepu)
			--发物品：星辰结晶或信仰源能
			math.randomseed(os.time())
			local iRand = math.random(1,1000)
			if iPlayerLev >= 70 and iRand <= 10 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,39952, 1,false)	--不绑定（信仰源能）1%
				TaskCApi.Broadcast(TASKINTERFACE_POINTER ,13765, TaskBroadcastChannel.System)
			elseif iRand <= 70 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,14188, 1,false)	--不绑定（星辰结晶）6%
			--	TaskCApi.Broadcast(TASKINTERFACE_POINTER ,13765, TaskBroadcastChannel.System)
			end
			--活动计数减去1
			local idx = 8			--雷辛格日常活动统一计数编号是8
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, -1)
			--活跃度计次，幸运任务计次,累计次数统计
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13122, 1)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13646, 1)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 14007, 1)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,1)
			--清空活动补偿值
			TaskCApi. ClearRetrieveVal(TASKINTERFACE_POINTER,13765, iRetrieveIdx)
			-- 获得活跃度喊话通知任务
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15876)
		end
		return 0
   	end
}

TaskList[13915] = --【体验服发奖】活跃度
{
	ActiveAward =
	{
		[1] = {active = 20, number = 3,},
		[2] = {active = 45, number = 4,},
		[3] = {active = 70, number = 5,},
		[4] = {active = 95, number = 6,},
		[5] = {active = 120, number = 7,},
		[6] = {active = 145, number = 8,},
		[7] = {active = 165, number = 9,},
		[8] = {active = 185, number = 10,},
		[9] = {active = 200, number = 11,},
	}
	,
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = true,
  		bCanSeekOut = true,

		bRecordFinishCount = true,
  		iMaxFinishCount = 9,		--每周最多可完成的次数：9	增加ActiveAward表的长度时需要改变这个值
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,--每周清空
		iClearFinishCountDay = 1,
		iClearFinishCountHour = 0,
		iClearFinishCountMin = 0,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview =
	{

	}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local RegionMask = TaskCApi.GetRegionMask( TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local taskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13915)	--本任务的完成次数！
		local curActivity = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--本周活跃度

		if RegionMask ~= 17 and RegionMask ~= 25 then	--仅体验服和先遣服
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		if iPlayerLev < 15 then
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		local taskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13915)	--本任务的完成次数！
		Method.CompleteTask = {TaskID = 13122 , Num = TaskList[13915].ActiveAward[taskCount+1].active}
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local taskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13915)	--本任务的完成次数！
		local curActivity = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--本周活跃度
		if curActivity >= TaskList[13915].ActiveAward[taskCount+1].active then
			iRet = TASK_SUCC_FINISH
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		if bSuccess then
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local taskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13915)	--本任务的完成次数！
			local item = 39681	--暮光先锋团纪念金币
			--发物品：暮光先锋团纪念金币
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,item, TaskList[13915].ActiveAward[taskCount].number,true)	--绑定
		end
		return 0
   	end
}
TaskList[14160] = --凤凰令·真	--使用 38000 接到
{

	Alltasks =
	{
		{Lv = 1, TaskID = 14161,},
		{Lv = 30, TaskID = 14162,},
		{Lv = 35, TaskID = 14163,},
		{Lv = 40, TaskID = 14164,},
		{Lv = 45, TaskID = 14165,},
		{Lv = 50, TaskID = 14166,},
		{Lv = 55, TaskID = 14167,},
		{Lv = 60, TaskID = 14168,},
		{Lv = 65, TaskID = 14169,},
		{Lv = 70, TaskID = 14170,},
		{Lv = 75, TaskID = 14171,},
		{Lv = 80, TaskID = 16978,},
		{Lv = 85, TaskID = 16979,},
		{Lv = 90, TaskID = 16980,},
	}
	,
	taskToComplete = 14172		--所有分支任务完成后都会修改这个任务的次数，使+1
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JuanZhou,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview =	{	}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local idx = 7	--凤凰令系列任务占用的活动计数编号是7
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local Alltasks = TaskList[14160].Alltasks
		if iPlayerLev < 25 then	--等级限制25级以上
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if commonCount < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
		for k,v in ipairs (Alltasks) do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,v.TaskID) then
				return TASK_PREREQU_FAIL_LUA_TASK
			end
		end
		--任务栏是否已满
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 14161)
		if iRet ~= 0 then
			return TASK_PREREQU_FAIL_FULL
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local idx = 7	--凤凰令系列任务占用的活动计数编号是7
		local Alltasks = TaskList[14160].Alltasks
		local taskIndex	= 1 --要发放的任务id在表里的索引，预设为1
		local taskToComplete = TaskList[14160].taskToComplete
		for i=1,#Alltasks do
			if iPlayerLev >= Alltasks[i].Lv then
				taskIndex = i
			end
		end
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,Alltasks[taskIndex].TaskID)			--发放分支任务
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14160, 1,taskIndex)		--把任务id在表里的索引存入1号变量
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14160, 4,iPlayerLev)		--把接受任务时候的角色等级存入4号变量
		--清空通用完成任务的次数
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,taskToComplete)
		--神兽令次数-1
		TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx,-1)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		local taskToComplete = TaskList[14160].taskToComplete
		Method.CompleteTask = {TaskID = taskToComplete, Num = 1}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iRet = TASK_NO_FINISH
		local taskToComplete = TaskList[14160].taskToComplete
		local itaskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,taskToComplete)
		if itaskCount >= 1 then
			local curTime = TaskCApi.GetCurTime(TASKINTERFACE_POINTER) --获取系统当前时间,单位秒
			local deliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER ,14160) --获取玩家接收到任务iTaskID的时间,单位秒
			local duration = curTime - deliverTime		--得到玩家真实的耗费时间
			local second = math.floor(duration % 60)	--秒数
			local minute = math.floor(duration / 60)	--分钟数（超过60分钟的并不会折算成小时）
			--处理分钟数大于60的情况：把大于60分钟的分钟数都置为60
			minute = math.min(minute,60)
			--把秒数、分钟数存入变量2、3号
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14160, 2,second)
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14160, 3,minute)
			iRet = TASK_SUCC_FINISH
		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local curTime = TaskCApi.GetCurTime(TASKINTERFACE_POINTER) --获取系统当前时间,单位秒
			local deliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER ,14160) --获取玩家接收到任务iTaskID的时间,单位秒
			local duration = curTime - deliverTime		--得到玩家真实的耗费时间
			local second = math.floor(duration % 60)	--秒数
			local minute = math.floor(duration / 60)	--分钟数（超过60分钟的并不会折算成小时）
			--处理分钟数大于60的情况：把大于60分钟的分钟数都置为60
			minute = math.min(minute,60)
			--把秒数、分钟数存入变量2、3号
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14160, 2,second)
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14160, 3,minute)
--			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,14160, TaskBroadcastChannel.Trade)
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			--这个任务只额外给纪元增加的经验 和 时间快慢增加的经验，基本经验已经由分支任务给了。
			--本任务经验 =  基本经验 x （ 纪元增加的百分比 + 时间档位增加的百分比 ）
			local baseExp,eraExpRatio,timeExpRatio		--基本经验系数，纪元经验加成率，时间经验加成率
			local taskToComplete = TaskList[14160].taskToComplete
			local ExpInfo =				--等级不同，基本经验也不同
			{
				{Lv = 1, BaseExp = 1500,},
				{Lv = 30, BaseExp = 3000,},
				{Lv = 80, BaseExp = 3000,},
			}
			eraExpRatio = 0.5				--纪元给予的经验加成率50%
			local PlayerReturnPlus = 0.5	-- 老玩家回归buff加成率
			local prayData =				--达到某些纪元，且在规定等级以下时有经验加成
			{
				[1] = { prayValue = 6500000, maxLev = 65 },		--黑龙纪元
				[2] = { prayValue = 11000000, maxLev = 75 },	--女神纪元
			}
			local TimeData = 				--时间档位
			{
				[1] = { secondMin = 1201, secondMax = 99999999 },	--20分钟以上
				[2] = { secondMin = 901, secondMax = 1200 },	--20分钟以内
				[3] = { secondMin = 601, secondMax = 900 },	--15分钟以内
				[4] = { secondMin = 0, secondMax = 600 },	--10分钟以内
			}
			local expViaTime = 				--各个等级段在不同时间档位的经验加成
			{
				{Lv = 1, Ratio = {0, 0, 0, 0},},
				{Lv = 30, Ratio = {0, 0.1, 0.1, 0.1},},
				{Lv = 40, Ratio = {0, 0.1, 0.2, 0.2},},
				{Lv = 50, Ratio = {0, 0.1, 0.2, 0.3},},
			}
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPrayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
			--按领取任务时的等级取得：基本经验系数
			local iPlayerLevOnDeliver
			if not ucRandomNum4 or ucRandomNum4 == 0 then
				iPlayerLevOnDeliver = iPlayerLev
			else
				iPlayerLevOnDeliver = ucRandomNum4
			end
			for i=1,#ExpInfo do
				if iPlayerLevOnDeliver >= ExpInfo[i].Lv then
					baseExp = ExpInfo[i].BaseExp
				end
			end
			--根据祈福值和领取任务时的等级得到：纪元经验加成率
			for i=1,#prayData do
				if iPrayValue >= prayData[i].prayValue and iPlayerLevOnDeliver <= prayData[i].maxLev then
					eraExpRatio = 0.5
					break
				else
					eraExpRatio = 0
				end
			end
			--根据时间查询到时间档位
			local second = ucRandomNum2
			local minute = ucRandomNum3
			local duration = minute * 60 + second
			local durationClass = 1								--时间档位的序号，缺省是1
			for k,v in ipairs(TimeData) do
				if duration >= v.secondMin and duration <= v.secondMax then
					durationClass = k
					break
				end
			end
			--根据时间档位查询到：时间经验加成率
			local temp = 1
			for i=1,#expViaTime do
				if iPlayerLevOnDeliver >= expViaTime[i].Lv then
					temp = i
				end
			end
			timeExpRatio = expViaTime[temp].Ratio[durationClass]

			-- 	如果有老玩家回归buff，则经验加成
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,2895) then
				PlayerReturnPlus = PlayerReturnPlus
			else
				PlayerReturnPlus = 0
			end

			--发经验奖励, -- 最大经验等级==80
			local iExp = baseExp * TaskExpAdjust[math.min(80,iPlayerLevOnDeliver)] * (eraExpRatio + timeExpRatio + PlayerReturnPlus)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))

			--每周活跃度
			local WeeklyActivityTaskID = 13122
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, WeeklyActivityTaskID, 2)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,2)
			--成就，一次任务只能完成其中1个成就
			local achTaskID1 = 13628	--急速的凤凰
			local achTaskID2 = 13629	--愤怒的凤凰，需要先完成：急速的凤凰
			local achTaskID1Flag = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,achTaskID1,true)
			local achTaskID2Flag = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,achTaskID2,true)
			if TaskCApi.IsCaptain(TASKINTERFACE_POINTER) then	--必须是队长
				if not achTaskID1Flag then			--如果没完成过任务1则继续，否则跳过
					if iPlayerLev >= 40 and duration <= 900 then							--如果40级以上，15分钟以内
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,achTaskID1)			--发放任务1
					end
				else								--只有当完成过任务1的时候才能走到这里，避免没完成前提成就就违规发放后面的成就任务
					if not achTaskID2Flag then				--如果没完成过任务2则继续，否则跳过
						if iPlayerLev >= 50 and duration <= 480 then	--如果50级以上，8分钟以内
							TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,achTaskID2)			--发放任务2
						end
					end
				end
			end
			--清空通用完成任务的次数
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,taskToComplete)
		end
		return 0
   	end
}
TaskList[14173] = --辉光令·真	--使用 38375 接到
{
	taskInfo =			--等级杀怪对应的分支任务id及基本信仰值、经验和声望奖励
	{
		{ Lv = 1,  BeliefLv = 0, TaskID = 14174, Num = 240, Belief = 240000, Exp = 240, repu = 100,},   --比尔血盟刺客
		{ Lv = 65, BeliefLv = 0, TaskID = 14175, Num = 240, Belief = 360000, Exp = 240, repu = 600,},   --黑矮人矿工
		{ Lv = 70, BeliefLv = 0, TaskID = 14176, Num = 240, Belief = 480000, Exp = 240, repu = 2400,},   --人类主权同盟精英
		{ Lv = 75, BeliefLv = 0, TaskID = 14177, Num = 240, Belief = 600000, Exp = 240, repu = 7200,},   --血纹苦修者
		{ Lv = 80, BeliefLv = 0, TaskID = 14178, Num = 240, Belief = 720000, Exp = 240, repu = 14400,},   --黑地精保镖
		{ Lv = 85, BeliefLv = 0, TaskID = 16981, Num = 240, Belief = 840000, Exp = 240, repu = 28800,},   --冰霜鱼人
		{ Lv = 90, BeliefLv = 0, TaskID = 16982, Num = 240, Belief = 960000, Exp = 240, repu = 57600,},   --娜迦
	}
	,
	taskToComplete = 14179		--所有分支任务完成后都会修改这个任务的次数，使+1
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JuanZhou,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview =	{}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local idx = 7	--神兽令系列任务占用的活动计数编号是7
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local taskInfo = TaskList[14173].taskInfo
		if iPlayerLev < 60 then	--等级限制60级以上
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if commonCount < 1 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
		for k,v in ipairs(taskInfo) do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,v.TaskID) then
				return TASK_PREREQU_FAIL_LUA_TASK
			end
		end
		--任务栏是否已满
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 14174)
		if iRet ~= 0 then
			return TASK_PREREQU_FAIL_FULL
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iPlayerGodLev = TaskCApi.GetGodLevel(TASKINTERFACE_POINTER) or 1		--神之信仰等级
		local iPlayerEvilLev = TaskCApi.GetEvilLevel (TASKINTERFACE_POINTER) or 1 	--魔之信仰等级
		local idx = 7	--神兽令系列任务占用的活动计数编号是7
		local taskInfo = TaskList[14173].taskInfo
		local taskToComplete = TaskList[14173].taskToComplete
		local taskIndex	= 1 --按等级和信仰等级随机出要发放的分支任务id在表里的索引，预设为1
		for i=1,#taskInfo do
			if iPlayerLev >= taskInfo[i].Lv and math.max(iPlayerGodLev, iPlayerEvilLev) >= taskInfo[i].BeliefLv then
				taskIndex = i
			end
		end
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,taskInfo[taskIndex].TaskID)			--发放分支任务
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14173, 1,taskIndex)	--把分支任务id在表里的索引存入1号变量
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14173, 4,iPlayerLev)		--把接受任务时候的角色等级存入4号变量
		--清空通用完成任务的次数
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,taskToComplete)
		--神兽令次数-1
		TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx,-1)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		local taskToComplete = TaskList[14173].taskToComplete
		Method.CompleteTask = {TaskID = taskToComplete, Num = 1}
   		Method.iWaitTime = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iRet = TASK_NO_FINISH
		local taskToComplete = TaskList[14173].taskToComplete
		local itaskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,taskToComplete)
		if itaskCount >= 1 then
			local curTime = TaskCApi.GetCurTime(TASKINTERFACE_POINTER) --获取系统当前时间,单位秒
			local deliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER ,14173) --获取玩家接收到任务iTaskID的时间,单位秒
			local duration = curTime - deliverTime		--得到玩家真实的耗费时间
			local second = math.floor(duration % 60)	--秒数
			local minute = math.floor(duration / 60)	--分钟数（超过60分钟的并不会折算成小时）
			--处理分钟数大于60的情况：把大于60分钟的分钟数都置为60
			minute = math.min(minute,60)
			--把秒数、分钟数存入变量2、3号
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14173, 2,second)
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14173, 3,minute)
			iRet = TASK_SUCC_FINISH
		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local curTime = TaskCApi.GetCurTime(TASKINTERFACE_POINTER) --获取系统当前时间,单位秒
			local deliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER ,14173) --获取玩家接收到任务iTaskID的时间,单位秒
			local duration = curTime - deliverTime		--得到玩家真实的耗费时间
			local second = math.floor(duration % 60)	--秒数
			local minute = math.floor(duration / 60)	--分钟数（超过60分钟的并不会折算成小时）
			--处理分钟数大于60的情况：把大于60分钟的分钟数都置为60
			minute = math.min(minute,60)
			--把秒数、分钟数存入变量2、3号
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14173, 2,second)
			TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14173, 3,minute)
--			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,14173, TaskBroadcastChannel.Trade)
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			--这个任务只额外给纪元增加的信仰值 和 时间档位增加的信仰值，其他所有奖励（包括基本经验、信仰值、声望）已经由分支任务给了。
			--本任务信仰值 =  基本信仰值 x （ 纪元增加的百分比 + 时间档位增加的百分比 ）
			local baseExp,baseBelief,baseRepu,eraRatio,timeRatio		--基本经验系数，基本信仰值奖励，纪元加成率，时间加成率
			local taskToComplete = TaskList[14173].taskToComplete
			eraRatio = 0				--纪元给予的加成率 【暂时为0】
			timeRatio = 0
			local prayData =				--达到某些纪元，且在规定等级以下时有奖励加成【暂无】
			{
				[1] = { prayValue = 6500000, maxLev = 65 },		--黑龙纪元
				[2] = { prayValue = 11000000, maxLev = 75 },	--女神纪元
			}
			local expViaTime = 				--各个等级段在不同时间档位的信仰值加成
			{
				{Lv = 1, Ratio = {0, 0.1, 0.1, 0.1},},
				{Lv = 65, Ratio = {0, 0.1, 0.2, 0.2},},
				{Lv = 70, Ratio = {0, 0.1, 0.2, 0.3},},
			}
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPlayerGodLev = TaskCApi.GetGodLevel(TASKINTERFACE_POINTER) or 0		--神之信仰等级
			local iPlayerEvilLev = TaskCApi.GetEvilLevel(TASKINTERFACE_POINTER) or 0 	--魔之信仰等级
			local iPrayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
			local taskInfo = TaskList[14173].taskInfo	--分支任务id信息和信仰值table
			--按领取任务时的等级取得：基本经验系数 和 信仰值 和 声望 （已经填在分支任务奖励里）
			local iPlayerLevOnDeliver
			if not ucRandomNum4 or ucRandomNum4 == 0 then
				iPlayerLevOnDeliver = iPlayerLev
			else
				iPlayerLevOnDeliver = ucRandomNum4
			end
			for i=1,#taskInfo do
				if iPlayerLevOnDeliver >= taskInfo[i].Lv and math.max(iPlayerGodLev, iPlayerEvilLev) >= taskInfo[i].BeliefLv then
					baseExp = taskInfo[i].Exp
					baseBelief = taskInfo[i].Belief
					baseRepu = taskInfo[i].repu
				end
			end
--[[			--根据祈福值和等级得到：纪元加成率
			for i=1,#prayData do
				if iPrayValue >= prayData[i].prayValue and iPlayerLev <= prayData[i].maxLev then
					eraRatio = eraRatio
					break
				else
					eraRatio = 0
				end
			end
--]]		local TimeData = 				--时间档位
			{
				[1] = { secondMin = 1801, secondMax = 99999999 },	--30分钟以上
				[2] = { secondMin = 1201, secondMax = 1800 },	--30分钟以内
				[3] = { secondMin = 721, secondMax = 1200 },	--20分钟以内
				[4] = { secondMin = 0, secondMax = 720 },	--12分钟以内
			}
			--根据时间查询到时间档位
			local second = ucRandomNum2
			local minute = ucRandomNum3
			local duration = minute * 60 + second
			local durationClass = 1								--时间档位的序号，缺省是1
			for k,v in ipairs(TimeData) do
				if duration >= v.secondMin and duration <= v.secondMax then
					durationClass = k
					break
				end
			end
			--根据时间档位查询到：时间加成率
			local temp = 1
			for i=1,#expViaTime do
				if iPlayerLevOnDeliver >= expViaTime[i].Lv then
					temp = i
				end
			end
			timeRatio = expViaTime[temp].Ratio[durationClass]

			--增发额外的奖励（目前只有受时间档位影响的信仰值加成）
			local iBeliefVal = baseBelief * (eraRatio + timeRatio)
			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,iBeliefVal, false)
			--每周活跃度,累计次数
			local WeeklyActivityTaskID = 13122
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, WeeklyActivityTaskID, 2)
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13972, 1)
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,2)
			--成就，一次任务只能完成其中1个成就
			local achTaskID1 = 13648	--刹那辉光
			local achTaskID2 = 13649	--天行辉光，需要先完成：刹那辉光
			local achTaskID1Flag = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,achTaskID1,true)
			local achTaskID2Flag = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,achTaskID2,true)
			if TaskCApi.IsCaptain(TASKINTERFACE_POINTER) then	--必须是队长
				if not achTaskID1Flag then			--如果没完成过任务1则继续，否则跳过
					if iPlayerLev >= 60 and duration <= 720 then							--如果60级以上，12分钟以内
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,achTaskID1)			--发放任务1
					end
				else								--只有当完成过任务1的时候才能走到这里，避免没完成前提成就就违规发放后面的成就任务
					if not achTaskID2Flag then				--如果没完成过任务2则继续，否则跳过
						if iPlayerLev >= 70 and duration <= 480 then	--如果70级以上，8分钟以内
							TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,achTaskID2)			--发放任务2
						end
					end
				end
			end
			--清空通用完成任务的次数
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,taskToComplete)
		end
		return 0
   	end
}
TaskList[14572] = --宝石重铸-恩德值
{
	Gems =
	{
		{id = 19130,	prob = 15,},	--生命宝石1级	自然
		{id = 19135,	prob = 10,},	--魔法宝石1级	泉水
		{id = 19140,	prob = 15,},	--攻击宝石1级	锐利
		{id = 19145,	prob = 15,},	--防御宝石1级	坚硬
		{id = 20290,	prob = 12,},	--命中宝石1级	鹰眼
		{id = 20295,	prob = 10,},	--闪躲宝石1级	灵巧
		{id = 20300,	prob = 5,},		--暴击宝石1级	毁灭
		{id = 20305,	prob = 6,},		--暴伤宝石1级	割裂
		{id = 20310,	prob = 6,},		--免暴击宝石1级	钝厚
		{id = 20315,	prob = 6,},		--减暴伤宝石1级	结晶
	}
	,
--[[	生命	15.00%
		魔法	10.00%
		攻击	15.00%
		防御	15.00%
		命中	12.00%
		闪避	10.00%
		暴击	5.00%
		免暴击	6.00%
		暴伤	6.00%
		免暴伤	6.00%
--]]
	Prices =
	{
		bindMoney = 20000,		--重铸所需魂币
		kindnessValue = 100,	--第1次重铸所需恩德值
		kindnessValueStep = 10,	--每次消耗恩德值的增量
	}
	,
	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = true,
  		bRecordFinishCount = true,
  		iMaxFinishCount = 100,		--每周最多可完成的次数：100
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,--每周清空
		iClearFinishCountDay = 1,
		iClearFinishCountHour = 0,
		iClearFinishCountMin = 0,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if playerLev < 60 then	--60级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
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
		Method.SubmitItem  = true
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14572)	--本任务的完成次数
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,14572)	--提交物品的信息：id，数量
		local bindMoney = TaskList[14572].Prices.bindMoney			--消耗魂币
		local kindnessValue = TaskList[14572].Prices.kindnessValue	--消耗恩德值（每周第1次）
		local kindnessValueStep = TaskList[14572].Prices.kindnessValueStep	--每次消耗恩德值的递增量
		local kindnessID = 11	--恩德值的声望id

		if itemIDSubmitted and itemNumberSubmitted then
			for k,v in ipairs(TaskList[14572].Gems) do
				if itemIDSubmitted == v.id and itemNumberSubmitted >= 1 then
					local currentBindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)	--持有魂币
					local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
					local costKindnessValue = kindnessValue + kindnessValueStep * icount		--本次重铸需要消耗的恩德值
					if currentBindMoney < bindMoney then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14572, 29, 20002)	--魂币不足的提示
						break
					elseif currentKindnessValue < costKindnessValue then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14572, 29, 20003)	--恩德值不足的提示
						break
					else
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14572, 1,k)	--把宝石的在table的序号存入1号变量
						TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,14572, 1)	--收取提交的宝石
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,-bindMoney)	--收魂币
						TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID,-costKindnessValue)	--收恩德值
						iRet = TASK_SUCC_FINISH
						break
					end
				else
					if k == #TaskList[14572].Gems then
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14572, 29, 20000)	--提交的不是1级宝石
						break
					end
				end
			end
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
			math.randomseed(os.time())
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local gemIdx = 	ucRandomNum1	--1号变量：所提交的宝石的在table的序号
			local vipBuffID = 2164			--vip卡的buffid
			local sumProbability = 0		--求所有宝石权重之和
			local bVIP = TaskCApi.HasBuff(TASKINTERFACE_POINTER,vipBuffID) 		--是否VIP
			local bindMoney = TaskList[14572].Prices.bindMoney
			local kindnessValue = TaskList[14572].Prices.kindnessValue
			local kindnessValueStep = TaskList[14572].Prices.kindnessValueStep
			local kindnessID = 11	--恩德值的声望id
			local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14572)	--本任务的完成次数
			--随机发放一颗宝石，vip一定随机到不同的宝石
			for k,v in ipairs(TaskList[14572].Gems) do
				if bVIP and k == gemIdx then		--如果是vip，那么所提交的宝石概率不计入总权重
					sumProbability = sumProbability
				else
					sumProbability = sumProbability + v.prob
				end
			end
			local rand = math.random(1,sumProbability)
			local temp = 0
			local itemID = 0
			for k,v in ipairs(TaskList[14572].Gems) do
				if not ( bVIP and k == gemIdx ) then		--如果是vip，就排除掉所提交的宝石
					if rand <= temp + v.prob then
						itemID = v.id
						break
					else
						temp = temp + v.prob
					end
				end
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemID, 1,true)	--绑定
   		end
   		return 0
   	end

}
TaskList[14573] = --用恩德值重置流光之地副本进入次数
{
	CostkindnessValue =	{ 200,300,400,500,600 }	--每次消耗恩德值
	,
	Property =
  	{
		bFinishWhenDelvier = true,	--接受即完成！
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = true,
  		bRecordFinishCount = true,
  		iMaxFinishCount = 5,		--每天最多可完成的次数：5
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
		local kindnessID = 11	--恩德值的声望id
		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
		local costKindnessValue = TaskList[14573].CostkindnessValue	[math.min(5,icount+1)]	--本次重置次数需要消耗的恩德值
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,14573, 1,math.min(5,icount+1))	--把消耗恩德值在表里的序号存入1号变量
		local icountToClear = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,8643)		--流光副本进入任务的完成次数
		if playerLev < 70 then	--70级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if currentKindnessValue < costKindnessValue then	--恩德值不够不能领
			return 32
		end
		if icountToClear < 1 then	--流光副本还有次数，不能领
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
   		if bSuccess then
			local kindnessID = 11	--恩德值的声望id
			--清空流光本的进入次数
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,8643)
			--收取恩德值
			icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
			if icount > 5 then
				icount = 5
			end
			cost = TaskList[14573].CostkindnessValue[math.max(1,icount)]
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID,-cost)	--收恩德值
   		end
   		return 0
   	end

}
TaskList[14581] = --运营声望清空及转化魂币
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

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
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
   		Method.iTimeLimit = 0
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14581)
   		if ulCurTime - ulDeliverTime > 30 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local operationRepuID = 2	--运营声望的声望id
		local currentOperationRepu = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,operationRepuID)	--现有声望值
		local multi = 100	 -- 转化率：1声望=100铜魂币
		local awardTaskID = { 13978,13979,13980,13981,13982,13983 }		--一次性领奖任务，记录结果
		local ceiling = 20 * 10000 * 10000	--发魂币上限20亿
   		if bSuccess then
			--把该声望按 1声望=100铜魂币，全部转成魂币
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, math.min(ceiling,currentOperationRepu * multi))	--转成魂币
			--把声望清零
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,operationRepuID,-9999999)
			--把领奖任务的记录结果清除
			for k,v in ipairs(awardTaskID) do
				TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
			end
			-- 仅用于2012.10.18神魔二周年发放固有玩家标记任务，过后可删除
			--   获得时间流
			local timePackage = os.date("*t", os.time())
			local year = timePackage.year
			local yday = timePackage.yday
			local day  = timePackage.day
			local hour = timePackage.hour
			local month = timePackage.month
			if year == 2012 and month == 10 and (day >= 18 and day <= 25) then
				local titleTask = 15761
				local titleTask_ActivePlayer = 15807
				local bReturnee = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,titleTask,true)
				local bActivePlayer = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,titleTask_ActivePlayer,true)
				if playerLev >= 50 and (not bReturnee) then
					if not bActivePlayer then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,titleTask_ActivePlayer)
					end
				end
			end
			return 0
		end
   	end
}
TaskList[14630] = --悬赏信刷新
{
	BindMoneyCost = {5000,10000,15000,20000,25000,30000,30000,30000,30000,30000,}
	,
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
  		iMaxFinishCount = 10,		--每周最多可完成的次数：10
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
		bUIButtonTask = true,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--领取条件：等级40-60，活跃度30-69，祈福值2000000，魂币满足本次刷新所需，与高级刷新共享任务次数（共同使用刷新任务的计次）
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local activity = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--活跃度
		local count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14630)	--本任务的完成次数
		local prayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
		local bindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)	--魂币
		local BindMoneyCost = TaskList[14630].BindMoneyCost
		local idx = 10	--阀值占用的活动计数id
		local currentFlag = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--现有阀值

		if playerLev < 40 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if playerLev > 60 then
			return TASK_PREREQU_FAIL_ABOVE_LEVEL
		end
		if activity < 50 or activity > 79 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
--[[
		if prayValue < 2000000 then
			return 133
		end
--]]
		if bindMoney < BindMoneyCost[math.min(10,count+1)] then
			return 105
		end
		if currentFlag >= 3 then
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14630)
   		if ulCurTime - ulDeliverTime > 30 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--[[
		--根据当前阀值，随机，判断是否改变阀值
		--绿变蓝：成功率0.4，成功后阀值设为1；蓝变紫：成功率0.1，成功后阀值设为2；紫变橙：成功率0.01，成功后阀值设为3
		--]]
		local idx = 10	--阀值占用的活动计数id
		local currentFlag = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--现有阀值
		local BindMoneyCost = TaskList[14630].BindMoneyCost
		local count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14630)	--本任务的完成次数
		math.randomseed(os.time())
   		if bSuccess then
			--随机刷新
			if currentFlag == 0 then	--现在是绿
				local rand_green2blue = math.random(1,100)
				if rand_green2blue <= 30 then
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 1)	--把活动计数+1
				end
			elseif currentFlag == 1 then	--现在是蓝
				local rand_blue2purple = math.random(1,100)
				if rand_blue2purple <= 7 then
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 1)	--把活动计数+1
				end
			elseif	currentFlag == 2 then	--现在是紫
				local rand_purple2orange = math.random(1,100)
				if rand_purple2orange <= 1 then
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 1)	--把活动计数+1
				end
			end
			--扣除魂币
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, -BindMoneyCost[math.min(10,math.max(1,count))])
			return 0
		end
   	end
}
TaskList[14631] = --悬赏信高级刷新
{
	BindMoneyCost = {5000,10000,15000,20000,25000,30000,30000,30000,30000,30000,}
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,	--接受即完成！

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
		bUIButtonTask = true,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--领取条件：等级40-60，活跃度80以上（VIP不受此限），祈福值2000000，魂币满足本次刷新所需，与“刷新”任务共享任务次数（共同使用“刷新”任务的计次）
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local activity = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--活跃度
		local count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14630)	--“刷新”任务的完成次数，不是本任务
		local prayValue = TaskCApi.GetPrayValue(TASKINTERFACE_POINTER)	--祈福值
		local bindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)	--魂币
		local BindMoneyCost = TaskList[14631].BindMoneyCost
		local BuffID = 2164			--无忧卡的buffid
		local bActiveMember = TaskCApi.HasBuff(TASKINTERFACE_POINTER,BuffID) 		--是否无忧卡
		local idx = 10	--阀值占用的活动计数id
		local currentFlag = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--现有阀值

		if playerLev < 40 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if playerLev > 60 then
			return TASK_PREREQU_FAIL_ABOVE_LEVEL
		end
		if not bActiveMember and activity < 80 then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
--		if prayValue < 2000000 then
--			return 133
--		end
		if bindMoney < BindMoneyCost[math.min(10,count+1)] then
			return 105
		end
		--与“刷新”任务共享任务次数，10次
		if count >= 10 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end
		if currentFlag >= 3 then
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
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
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14631)
   		if ulCurTime - ulDeliverTime > 30 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--[[
		--根据当前阀值，随机，判断是否改变阀值
		--绿变蓝：成功率1，成功后阀值设为1；蓝变紫：成功率0.35，成功后阀值设为2；紫变橙：成功率0.07，成功后阀值设为3
		--]]
		local idx = 10	--阀值占用的活动计数id
		local currentFlag = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)	--现有阀值
		local BindMoneyCost = TaskList[14631].BindMoneyCost
		local count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14630)	--“刷新”任务的完成次数
		math.randomseed(os.time())
   		if bSuccess then
			--随机刷新
			if currentFlag == 0 then	--现在是绿
				TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 1)	--把活动计数+1
			elseif currentFlag == 1 then	--现在是蓝
				local rand_blue2purple = math.random(1,100)
				if rand_blue2purple <= 35 then
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 1)	--把活动计数+1
				end
			elseif	currentFlag == 2 then	--现在是紫
				local rand_purple2orange = math.random(1,100)
				if rand_purple2orange <= 7 then
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, 1)	--把活动计数+1
				end
			end
			--把“刷新”任务的完成次数+1
			count = count + 1
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 14630, 1)
			--扣除魂币
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, -BindMoneyCost[math.min(10,math.max(1,count))])
			return 0
		end
   	end
}
TaskList[14723] = --悬赏信声望换高级符文方式1，计次任务
{
	ItemAwards =
	{

		{id = 39478, num = 1, rand = 0.0033,},	--1级高级起源符文 红
		{id = 39479, num = 1, rand = 0.0033,},	--1级高级启示符文 黄
		{id = 39480, num = 1, rand = 0.0033,},	--1级高级孕育符文 蓝
		{id = 41877, num = 1, rand = 0.6601,},	--碎裂的高级符文 x 1
		{id = 41877, num = 2, rand = 0.2,},	--碎裂的高级符文 x 2
		{id = 41877, num = 3, rand = 0.1,},	--碎裂的高级符文 x 3
		{id = 41877, num = 10, rand = 0.03,},	--碎裂的高级符文 x 10
	}
	,
	Costs =
	{
		kindness = 50,
		bindMoney = 10000,
	}
	,
	Property =
  	{
		bFinishWhenDelvier = true,	--接受即完成！
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bRecordFinishCount = true,
  		iMaxFinishCount = 100,		--每周最多可完成的次数：100
  		iClearFinishCountType = TaskClearFinishCountType.None,--不清空，靠commontaskcount.lua在每周清空悬赏信荣耀值的时候把次数清零
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
		bUIButtonTask = true,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14723)	--本任务的完成次数
		local kindnessID = 11	--恩德值的声望id
		local GloryID = 14		--悬赏信荣耀值声望id
		local kindnessToCost = TaskList[14723].Costs.kindness		--恩德值消耗，每次
		local bindMoneyToCost = TaskList[14723].Costs.bindMoney		--魂币消耗，每次
		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
		local currentGloryValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,GloryID)	--现有悬赏信荣耀值
		local currentBindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)					--现有魂币
		local timesLeft = math.max(	0, math.floor(currentGloryValue/100) - icount)	--剩余次数
		if playerLev < 60 then	--60级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if currentKindnessValue < kindnessToCost then	--恩德值不够不能领
			return 32
		end
		if timesLeft < 1 then	--次数不够，不能领
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
		if currentBindMoney < bindMoneyToCost then
			return 105
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
			local kindnessID = 11	--恩德值的声望id
			math.randomseed(os.time())
			--抽奖
			local totalRand	 = 0					--总权重
			for k,v in ipairs( TaskList[14723].ItemAwards ) do
				totalRand = totalRand + v.rand * 10000
			end
			local rand = math.random(1,totalRand)	--随机
			local tempSum = 0
			for k,v in ipairs( TaskList[14723].ItemAwards ) do		--定位并发奖
				if rand <= tempSum + v.rand * 10000 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,v.id, v.num,false)	--不绑定
					break
				else
					tempSum = tempSum + v.rand * 10000
				end
			end
			--收取恩德值
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID,-TaskList[14723].Costs.kindness)	--收恩德值
			--收取魂币
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, -TaskList[14723].Costs.bindMoney)
   		end
   		return 0
   	end
}
TaskList[14724] = --悬赏信声望换高级符文方式2，非计次任务
{
	ItemAwards =
	{

		{id = 39478, num = 1, rand = 0.0033,},	--1级高级起源符文 红
		{id = 39479, num = 1, rand = 0.0033,},	--1级高级启示符文 黄
		{id = 39480, num = 1, rand = 0.0033,},	--1级高级孕育符文 蓝
		{id = 41877, num = 1, rand = 0,},	--碎裂的高级符文 x 1
		{id = 41877, num = 2, rand = 0.39,},	--碎裂的高级符文 x 2
		{id = 41877, num = 3, rand = 0.45,},	--碎裂的高级符文 x 3
		{id = 41877, num = 10, rand = 0.15,},	--碎裂的高级符文 x 10
	}
	,
	Costs =
	{
		kindness = 200,
		bindMoney = 40000,
	}
	,
	Property =
  	{
		bFinishWhenDelvier = true,	--接受即完成！
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bRecordFinishCount = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
		bUIButtonTask = true,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14723)	--普通抽取任务的完成次数
		local kindnessID = 11	--恩德值的声望id
		local GloryID = 14		--悬赏信荣耀值声望id
		local kindnessToCost = TaskList[14724].Costs.kindness		--恩德值消耗，每次
		local bindMoneyToCost = TaskList[14724].Costs.bindMoney		--魂币消耗，每次
		local currentKindnessValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,kindnessID)	--现有恩德值
		local currentGloryValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,GloryID)	--现有悬赏信荣耀值
		local currentBindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)					--现有魂币
		local timesLeft = math.max(	0, math.floor(currentGloryValue/100) - icount)	--剩余次数
		if playerLev < 60 then	--60级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if currentKindnessValue < kindnessToCost then	--恩德值不够不能领
			return 32
		end
		if timesLeft < 1 then	--次数不够，不能领
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end
		if currentBindMoney < bindMoneyToCost then
			return 105
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
			local kindnessID = 11	--恩德值的声望id
			local count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14723)	--“普通抽取”任务的完成次数
			math.randomseed(os.time())
			--抽奖
			local totalRand	 = 0					--总权重
			for k,v in ipairs( TaskList[14724].ItemAwards ) do
				totalRand = totalRand + v.rand * 10000
			end
			local tempSum = 0
			local rand = math.random(1,totalRand)	--随机
			for k,v in ipairs( TaskList[14724].ItemAwards ) do		--定位并发奖
				if rand <= tempSum + v.rand * 10000 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,v.id, v.num,false)	--不绑定
					break
				else
					tempSum = tempSum + v.rand * 10000
				end
			end
			--收取恩德值
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,kindnessID,-TaskList[14724].Costs.kindness)	--收恩德值
			--收取魂币
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, -TaskList[14724].Costs.bindMoney)
			--修改普通抽取任务的次数 +1
			count = count + 1
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 14723, 1)

   		end
   		return 0
   	end
}


TaskList[14881] = ----欧洲杯金靴抽奖,
{
	AwardPreview =	{}
	,
	ChampionID = 42430
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
  		bRecordFinishCount = true,
		iMaxFinishCount = 9999,		--最多可完成的次数：9999
  		iClearFinishCountType = TaskClearFinishCountType.None,--不清空
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local champion = TaskList[14881].ChampionID
		--2012年7月5日0：00到7月9日0：00
		local timePackage = os.date("*t", os.time())
		local year = timePackage.year
		local month = timePackage.month
		local day = timePackage.day
		local hour = timePackage.hour
		if not ( year == 2012 and month == 7 and ( day >= 5 and day <= 8 )) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		--普通包裹栏需要1格
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 1 then
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
		--需要有冠军徽章
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,champion, true) < 1 then
			return TASK_PREREQU_FAIL_NO_ITEM
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14631)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			local index = 34																	--全局变量
			local count = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,index)
			local champion = TaskList[14881].ChampionID

			--发奖
			TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER ,index,1)
			count = count + 1
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,champion, 1)
			if count == 30 or count == 430 or count == 830 or count == 1230 or count == 1630 or count == 2030 or count == 2430 then	--紫
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,14952)
			elseif count == 200 or count == 1100 or count == 2300 then					--橙
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,14882)
			else
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,280000)
			end

			--称号
			local title01 = 6287
			local title02 = 6288
			local title03 = 6289
			local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14881)	--任务的完成次数
			if not TaskCApi.HasTitle(TASKINTERFACE_POINTER,title01) then
				TaskCApi.GiveOneTitle(TASKINTERFACE_POINTER, title01)
			end
			if times == 10 then
				TaskCApi.GiveOneTitle(TASKINTERFACE_POINTER, title02)
			elseif times == 30 then
				TaskCApi.GiveOneTitle(TASKINTERFACE_POINTER, title03)
			end
   		end
   		return 0
   	end
}

TaskList[14927] = --地狱之路蔷薇公主属性1加点
{
	AwardPreview =	{}
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--有剩余可分配点数，公主每升1级获得1点可分配点数
		local maxPoint = 162		--最大加点数
		local expOfPrincessID = 26	--公主经验值的声望id
		local currentExpOfPrincess = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,expOfPrincessID)	--现有值
		local lvOfPrincess = math.floor(currentExpOfPrincess/1000) 		--每1000点经验为1级，获得1点
		local point1 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14918)		--属性1的已加点数
		local point2 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14919)		--属性2的已加点数
		local point3 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14920)		--属性3的已加点数
		local restPoint = lvOfPrincess - point1 - point2 - point3
		if restPoint < 1 or point1 >= maxPoint then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14927)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			--属性1对应的计次任务的id
			local keyID = 14918

			--智能加点	Zang 2013-6-09
			local expOfPrincessID = 26	--公主经验值的声望id
			local currentExpOfPrincess = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,expOfPrincessID)	--现有值
			local lvOfPrincess = math.floor(currentExpOfPrincess/1000) 		--每1000点经验为1级，获得1点
			local point1 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14918)		--属性1的已加点数
			local point2 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14919)		--属性2的已加点数
			local point3 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14920)		--属性3的已加点数
			local restPoint = lvOfPrincess - point1 - point2 - point3
			if restPoint >= 9 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 9);
			elseif restPoint >=3 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 3);
			elseif restPoint >=1 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 1);
			end
   		end
   		return 0
   	end
}
TaskList[14928] = --地狱之路蔷薇公主属性2加点
{
	AwardPreview =	{}
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--有剩余可分配点数，公主每升1级获得1点可分配点数
		local maxPoint = 162		--最大加点数
		local expOfPrincessID = 26	--公主经验值的声望id
		local currentExpOfPrincess = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,expOfPrincessID)	--现有值
		local lvOfPrincess = math.floor(currentExpOfPrincess/1000) 		--每1000点经验为1级，获得1点
		local point1 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14918)		--属性1的已加点数
		local point2 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14919)		--属性2的已加点数
		local point3 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14920)		--属性3的已加点数
		local restPoint = lvOfPrincess - point1 - point2 - point3
		if restPoint < 1 or point2 >= maxPoint then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14928)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			--属性1对应的计次任务的id
			local keyID = 14919

			--智能加点	Zang 2013-6-09
			local expOfPrincessID = 26	--公主经验值的声望id
			local currentExpOfPrincess = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,expOfPrincessID)	--现有值
			local lvOfPrincess = math.floor(currentExpOfPrincess/1000) 		--每1000点经验为1级，获得1点
			local point1 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14918)		--属性1的已加点数
			local point2 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14919)		--属性2的已加点数
			local point3 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14920)		--属性3的已加点数
			local restPoint = lvOfPrincess - point1 - point2 - point3
			if restPoint >= 9 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 9);
			elseif restPoint >=3 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 3);
			elseif restPoint >=1 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 1);
			end

   		end
   		return 0
   	end
}
TaskList[14929] = --地狱之路蔷薇公主属性3加点
{
	AwardPreview =	{}
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--有剩余可分配点数，公主每升1级获得1点可分配点数
		local maxPoint = 162		--最大加点数
		local expOfPrincessID = 26	--公主经验值的声望id
		local currentExpOfPrincess = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,expOfPrincessID)	--现有值
		local lvOfPrincess = math.floor(currentExpOfPrincess/1000) 		--每1000点经验为1级，获得1点
		local point1 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14918)		--属性1的已加点数
		local point2 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14919)		--属性2的已加点数
		local point3 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14920)		--属性3的已加点数
		local restPoint = lvOfPrincess - point1 - point2 - point3
		if restPoint < 1 or point3 >= maxPoint then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14929)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			--属性1对应的计次任务的id
			local keyID = 14920

			--智能加点	Zang 2013-6-09
			local expOfPrincessID = 26	--公主经验值的声望id
			local currentExpOfPrincess = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,expOfPrincessID)	--现有值
			local lvOfPrincess = math.floor(currentExpOfPrincess/1000) 		--每1000点经验为1级，获得1点
			local point1 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14918)		--属性1的已加点数
			local point2 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14919)		--属性2的已加点数
			local point3 = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14920)		--属性3的已加点数
			local restPoint = lvOfPrincess - point1 - point2 - point3
			if restPoint >= 9 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 9);
			elseif restPoint >=3 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 3);
			elseif restPoint >=1 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, keyID, 1);
			end

   		end
   		return 0
   	end
}
TaskList[15106] = --推广员奖励经验
{
	AwardPreview =	{}
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
  		bRecordFinishCount = true,
  		iMaxFinishCount = 1685,		--一生最多可完成的次数：1685
  		iClearFinishCountType = TaskClearFinishCountType.None,--不清空
		bUIButtonTask = true,

  	}
   	,
	Conditions =
	{
		[50] = 8,	[51] = 9,	[52] = 10,	[53] = 12,	[54] = 15,	[55] = 18,	[56] = 21,	[57] = 24,	[58] = 28,	[59] = 33,
		[60] = 33,	[61] = 35,	[62] = 38,	[63] = 41,	[64] = 45,	[65] = 50,	[66] = 56,	[67] = 62,	[68] = 69,	[69] = 77,
		[70] = 99,	[71] = 137,	[72] = 177,	[73] = 211,	[74] = 320,	[75] = 354,	[76] = 489,	[77] = 695,	[78] = 992,	[79] = 1685,
		[80] = 1685,
	}
	,
	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--每一个角色等级内可以完成固定的次数
		local PromotionID = 32		--推广点数的声望id
		local currentPromotionPoint = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,PromotionID)	--现有值
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15106)	--已完成次数
		--级别不小于50级
		if playerLev < 50 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		--推广点数不小于100
		if currentPromotionPoint < 100 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end
		--按级别查询当级最多完成次数
		if icount >= TaskList[15106].Conditions[math.max(playerLev,50)] then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 14929)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local iExp = 1000000
			local PromotionID = 32		--推广点数的声望id
			local PromotionCost = 100	--耗费
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,PromotionID, -PromotionCost)
   		end
   		return 0
   	end
}
TaskList[15369] = --装备副本日常首次大额经验&前4次活跃
{
	AwardPreview ={}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bHiddenTask = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15369)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			-- 副本mapID\适合等级\日常任务id
			local siteList =
			{
				[1] = {mapID = 201, lvMin = 15,lvMax = 19, taskID = 8360},
				[2] = {mapID = 202, lvMin = 20,lvMax = 29, taskID = 8361},
				[3] = {mapID = 203, lvMin = 30,lvMax = 39, taskID = 8362},
				[4] = {mapID = 204, lvMin = 40,lvMax = 49, taskID = 8363},
				[5] = {mapID = 205, lvMin = 50,lvMax = 59, taskID = 8364},
				[6] = {mapID = 206, lvMin = 60,lvMax = 64, taskID = 9873},
				[7] = {mapID = 207, lvMin = 65,lvMax = 69, taskID = 9874},
				[8] = {mapID = 208, lvMin = 70,lvMax = 74, taskID = 11754},
				[9] = {mapID = 209, lvMin = 75,lvMax = 80, taskID = 12454},
				[10] = {mapID = 226, lvMin = 75,lvMax = 80, taskID = 16343},
				[11] = {mapID = 238, lvMin = 75,lvMax = 80, taskID = 16341},
				[12] = {mapID = 242, lvMin = 80,lvMax = 84, taskID = 17055},
				[13] = {mapID = 253, lvMin = 85,lvMax = 200, taskID = 17115},
			}
			-- 取得角色等级和位置
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPlayerMap = TaskCApi.GetPlayerCurSite(TASKINTERFACE_POINTER)

			-- 计算日常任务的今日完成状况：1、所有副本次数，2、适合等级的副本次数
			local totalCount = 0
			local suitableCount = 0
			local baseExp = 3000			--基础经验
			local bsuitableMap = false		--是否处于适合等级的副本场景内

			for k,v in ipairs(siteList) do
				local count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,v.taskID)
				totalCount = totalCount + count
				if iPlayerLev >= v.lvMin and iPlayerLev <= v.lvMax then
					suitableCount = suitableCount + count
					if iPlayerMap == v.mapID then
						bsuitableMap = true
					end
				end
			end

			-- 如果是处于适合等级的副本内
			if bsuitableMap then
				-- 如果是当天的第1次同级副本，则发放10x经验
				if suitableCount == 1 then
					local iExp = baseExp * TaskExpAdjust[iPlayerLev]
					TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
				end
				-- 如果是75级以上，则增加一次 75级装备副本日常统一计次
				if iPlayerLev >= 75 then
					TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 16344, 1)
				end
			end

			-- 如果是当天的前4次则增加活跃度1点
			if totalCount <= 4 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13122, 1)
				TaskCApi.Broadcast(TASKINTERFACE_POINTER ,15369, TaskBroadcastChannel.Trade)
				TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,1)
			end

			-- 如果是老玩家回归buff拥有者
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,2895) then
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,20*10000)
				-- 从天空之城副本开始，向队友发送运营声望
				if iPlayerMap ~= 201 and iPlayerMap ~= 202 and iPlayerMap ~= 203 and iPlayerMap ~= 204 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,17154)				--向队友发运营声望
				end
			end
   		end
   		return 0
   	end
}

TaskList[15370] = --装备副本日常前4次完成后领取魂器食物奖励
{
	AwardPreview = {}
	,
	siteList =
	{
		[1] = {mapID = 201, lvMin = 15,lvMax = 19, taskID = 8360},
		[2] = {mapID = 202, lvMin = 20,lvMax = 29, taskID = 8361},
		[3] = {mapID = 203, lvMin = 30,lvMax = 39, taskID = 8362},
		[4] = {mapID = 204, lvMin = 40,lvMax = 49, taskID = 8363},
		[5] = {mapID = 205, lvMin = 50,lvMax = 59, taskID = 8364},
		[6] = {mapID = 206, lvMin = 60,lvMax = 64, taskID = 9873},
		[7] = {mapID = 207, lvMin = 65,lvMax = 69, taskID = 9874},
		[8] = {mapID = 208, lvMin = 70,lvMax = 74, taskID = 11754},
		[9] = {mapID = 209, lvMin = 75,lvMax = 79, taskID = 16344},	--75级装备本统一计次
		[10] = {mapID = 226, lvMin = 75,lvMax = 79, taskID = 16344},--75级装备本统一计次
		[11] = {mapID = 238, lvMin = 75,lvMax = 79, taskID = 16344},--75级装备本统一计次
		[12] = {mapID = 242, lvMin = 80,lvMax = 84, taskID = 17055},--80级装备本
		[13] = {mapID = 253, lvMin = 85,lvMax = 200, taskID = 17115},--85lv法师塔
	}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bHiddenTask = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--每天最多可完成的次数：4
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		-- 普通包裹栏需要1格
		if emptySlots < 1 then
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
		-- 等级大于等于60级
		if iPlayerLev < 60 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		-- 完成与自己等级最相近的4个副本日常任务
		-- 每完成日常1次可领1次物品奖励，最多领4次。副本等级越高，奖励越多，但必须依等级降序依次领取。
		local totalCount = 0			-- 自己等级最相近的4个副本日常任务的合计完成次数
		local siteList = TaskList[15370].siteList
		local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15370)	--本任务已完成次数
		local index = 7					-- 与自己等级最接近的副本任务的序号，默认是7（65级副本）
		for k,v in ipairs(siteList) do
			if iPlayerLev >= v.lvMin and iPlayerLev <= v.lvMax then
				index = k
			end
		end
		local currentIndex = index - selfCount		-- 第1次：必须完成与等级最接近的副本任务，第2次及以后：副本序号依次降低
		local currentTaskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,siteList[currentIndex].taskID)
		if currentTaskCount < 1 then
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
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
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
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15370)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
   		if bSuccess then
			math.randomseed(os.time())
			local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15370)	--本任务已完成次数
			local itemNumber = {15,10,3,2}
			local itemIDs = {43380,43381}
			local rand = math.random(1,2)
			if selfCount >= 1 or selfCount <= #itemNumber then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemIDs[rand], itemNumber[selfCount],true)		--绑定
			end
		end
   		return 0
   	end
}

TaskList[15388] = --活跃度140点以上向导任务
{
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local activityNow = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--活跃度
			local activityMin = 240
			local baseExp = 420			--基础经验
			local expLvCap = 65			--经验等级上限
			local rate = 0.05			--活跃度每多1点而经验增加的百分比
			local expRatio = math.max(1,math.min( 10,(activityNow - activityMin) * rate + 1))		--经验倍率，最高10倍，最低1倍

			local iExp = math.max(0,baseExp * TaskExpAdjust[iPlayerLev] * expRatio)
			return iExp
		end
		,
	}
	,
	Property =
  	{
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,

		bShowPrompt = true,
		bCanGiveUp = true,
  		bCanSeekOut = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--现有活跃度
		local bPreTaskFinished = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,13746,true)	--前置任务是否完成
		--级别不小于65级
		if playerLev < 65 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		--需完成前置任务：活跃度200任务
		if not bPreTaskFinished then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
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
		Method.CompleteTask = {TaskID = 13122 , Num = 240}
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local taskCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--活跃度
		if taskCount >= 240 then
			iRet = TASK_SUCC_FINISH
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
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local activityNow = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--活跃度
			local activityMin = 240
			local baseExp = 420			--基础经验
			local expLvCap = 65			--经验等级上限
			local rate = 0.05			--活跃度每多1点而经验增加的百分比
			local expRatio = math.min( 10,(activityNow - activityMin) * rate + 1)		--经验倍率，最高10倍

			local iExp = math.max(0,baseExp * TaskExpAdjust[iPlayerLev] * expRatio)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(iExp))
   		end
   		return 0
   	end
}

TaskList[15371] = --使用幸运值刷新 - 有几率发放任务：提升幸运等级的脚本任务
{
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bHiddenTask = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,

		bRecordFinishCount = true,
  		iMaxFinishCount = 5,		--每天最多可完成的次数：5
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local luckValueID = 10	--幸运值的声望id
		local currentLuckValue = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,luckValueID)	--现有幸运值
		local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)	--幸运等级
		if currentLuckValue < 66 then
			return 32
		end
		if luckGrade >= 6 then
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
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
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
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15371)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			math.randomseed(os.time())
			local luckValueID = 10	--幸运值的声望id
			local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)	--幸运等级
			local rand = {333,250,200,166,125,111}
			if luckGrade < 6 then
				local temp = math.random(1,1000)
				if temp <= rand[luckGrade+1] then
					TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 15372, 1)		--幸运等级+1
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15420)				--仅用于喊话的任务
				else
					TaskCApi.Broadcast(TASKINTERFACE_POINTER ,15371, TaskBroadcastChannel.Trade)
				end
			end

			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,luckValueID,-66)	--收幸运值
   		end
   		return 0
   	end
}
TaskList[15420] = --喊话报告幸运等级的脚本任务
{
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bHiddenTask = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15420)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			TaskCApi.Broadcast(TASKINTERFACE_POINTER ,15420, TaskBroadcastChannel.Trade)
   		end
   		return 0
   	end
}

TaskList[15703] = --解锁战备大礼
{
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bHiddenTask = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,

		bRecordFinishCount = true,
  		iMaxFinishCount = 8,		--最多可完成的次数：8
  		iClearFinishCountType = TaskClearFinishCountType.None,--不清空
  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		-- 主线任务全id
		local AllTask =
		{
			[0] =		-- 特别篇
			{
				13293,13292,12862,12653,12652,12651,12459,12350,11485,11107,10785,10495,10494,10493,10316,
				10211,10041,9841,12263,
			},

			[10] =
			{
				{5678,5679,5680,5681,5682,5683,5684,5685,5856,5694,5695,5696,5697,5698,},		--人类(1)新手村
				{7667,7670,7671,7672,7673,7674,7675,5767,5776,5777,5778,7698,5780,},			--精灵(2)新手村
				{5686,5687,5688,5689,5690,5984,5691,5692,5693,5694,5695,5696,5697,5698,},		--矮人(3)新手村
				{5768,7605,7612,7650,7654,7658,7660,7661,5776,5777,5778,7698,5780,},			--巨人(4)新手村
				{6914,7949,6915,6916,6917,6918,6919,6920,6921,6922,6923,6924,6925,6926,6927,},	--血族(5)新手村
				{15356,15378,15384,15355,15357,15358,15359,15360,15361,15362,15842,15363,15364,15365,15366,15367,15368,}	--狼族(6)新手村
			},

			[20] =
			{
				6146,8747,8751,6989,6147,6259,6260,6261,6262,6263,6264,6265,6148,6149,6150,
				6151,6153,6154,6155,6156,6157,6158,6159,6160,6161,6163,6164,6165,6166,6167,
				6168,6169,6170,6171,6172,6173,6174,6175,6176,6177,6178,6179,6180,6181,6182,
				6183,6184,6185,6186,6187,6188,6189,6271,6190,6191,6192,6193,6194,6195,6196,
				6197,6198,6199,
			},

			[30] =
			{
				6729,6730,6731,6732,6733,6734,6735,8370,6736,6737,6738,6739,6740,6741,6742,
				6743,8371,6744,6746,6747,6748,6749,6750,6751,6752,6754,6755,8373,16661,
			},

			[40] =
			{
				6756,6757,6758,6759,6760,6761,8378,6762,6763,6764,6765,6766,6767,6768,6769,
				6770,8397,6771,6772,6773,6774,6775,6776,6777,6778,6779,6780,6781,6782,6783,
			},

			[50] =
			{
				8432,8433,8434,8435,8436,8437,8438,8439,8440,8441,8442,8443,8444,8445,8446,
				8447,8448,8449,8450,8451,8452,8453,8454,8455,8456,8457,8458,8459,8460,8461,
				8471,8472,8473,8474,8475,
			},

			[60] =
			{
				8476,8477,8478,8479,8480,8481,8482,8483,8484,8485,8486,8487,8488,8489,8490,
				8491,8492,8493,8494,8495,9091,9092,9093,9094,9095,9096,9097,9098,
			},

			[70] =
			{
				9554, 9555, 9556, 9557, 9558, 9559, 9560, 9561, 9562, 9563, 9564, 9565, 9566, 9567, 9568,
				9569, 9570, 9571, 9572, 9573, 9574, 9575, 9576, 9577, 9578, 9579, 9580, 9581, 12245,12246,
				12247,12248,12249,12251,12252,12253,12254,12255,12256,12257,12258,12259,12260,12261,12262,
				13672,13673,13675,13676,13677,13678,13679,13680,13682,13683,13684,13685,13686,13687,13688,
				13689,13690,13691,13693,14288,
			},
			[80] =
			{
				17010,17011,17012,17013,17014,17015,17016,17018,17019,17020,
				17021,17022,17023,17024,17025,17026,17027,17028,17029,17030,
				17073,17074,17075,17128,
			},
		}

		-- 每档礼物所需主线任务完成数
		local taskCountRequired = {95,125,160,180,185,190,200,210}

		-- 解锁每档礼物的任务（本任务）id，只能完成7次对应每一档
		local taskUnlock = 15703
		local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,taskUnlock)		-- 本任务次数

		-- 计算主线任务完成次数
		local playerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)			--获取玩家等级
		local playerRace = TaskCApi.GetPlayerRace(TASKINTERFACE_POINTER) 		--获取玩家种族id
		local sum = 0

		if playerRace >= 1 and playerRace <= #AllTask[10] then
			for k,v in ipairs(AllTask[10][playerRace]) do
				if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v,true) then
					sum = sum + 1
				end
			end
		end
		for k,v in pairs(AllTask) do
			if k ~= 10 and k <= playerLevel + 20 then
				for k1,v1 in ipairs(v) do
					if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v1,true) then
						sum = sum + 1
					end
				end
			end
		end

		-- 如果主线任务完成数少于每一档的需求数量，则不允许发放任务
		if sum < taskCountRequired[math.min(8,selfCount+1)] then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15703)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   		end
   		return 0
   	end
}
TaskList[15706] = --北美专属任务：签到
{
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
		bFinishWhenDelvier = true,	--接受即完成！

		iAvailFrequency  = TaskAvailFrequency.EachDay,
  		bRecordFinishCount = true,
  		iMaxFinishCount = 20,		--最多可完成的次数：20
  		iClearFinishCountType = TaskClearFinishCountType.None,--不清空
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview = { }
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local regionMask = TaskCApi.GetRegionMask(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if regionMask ~= 3 then	--北美专属
			return TASK_PREREQU_FAIL_LUA_TASK
		end
		if emptySlots < 3 then	--普通包裹栏需要3格
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		TaskCApi.Broadcast(TASKINTERFACE_POINTER ,15706, TaskBroadcastChannel.Trade)
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15706)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		if bSuccess then
			local baseExp = 50
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			-- 按完成次数发经验   exp = 次数 * baseExp
			local iExp = baseExp * TaskExpAdjust[iPlayerLev]
			local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15706)		-- 本任务次数
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExp * selfCount)
			-- 发道具
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,43773, 1,true)	--绑定
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,43774, 1,true)	--绑定
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,43776, 1,true)	--绑定
		end
		return 0
   	end
}
TaskList[15785] = --获得更多魔石牌子的解锁任务
{
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
		bHiddenTask = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,

  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local activityNow = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--取得当前活跃度
		local cutDownTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15786)	--取得降低门槛任务次数
		local stepCutDown = 5	-- 每次降低的活跃度门槛数值
		local activityRequired = 280	--初始活跃度门槛值

		-- 计算当前门槛
		local currentVal = math.max(120,activityRequired - cutDownTimes * stepCutDown)

		-- 如果活跃度少于当前门槛，则不允许发放任务
		if activityNow < currentVal then
			return TASK_PREREQU_FAIL_COMPLETE_TIMES
		end

		if iPlayerLev < 50 then
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
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
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
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15785)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
   		end
   		return 0
   	end
}
TaskList[15852] = --地狱之路获得活跃度
{
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bHiddenTask = true,
		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = true,	--接受即完成！
		bUIButtonTask = true,
  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 15852)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local currentLevel = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14904)	--取得地狱之路当前关数
			if currentLevel == 5 or currentLevel == 10 or currentLevel == 15 then
				TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, 13122, 1)
				TaskCApi.Broadcast(TASKINTERFACE_POINTER ,15852, TaskBroadcastChannel.Trade)
				TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,36,1)
			end
   		end
   		return 0
   	end
}
TaskList[15956] = --【竞技场第一赛季奖励】根据积分发称号和时装包、坐骑包等
{
	Property =
  	{
		bRecordFinish = true,
		bCanRedo = false,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = true,
  		bCanSeekOut = true,
		bFinishWhenDelvier = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview = {}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if iPlayerLev < 45 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if emptySlots < 5 then
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
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local repuNum = 5
			local awards =
			{
				{score = 0, title = 6348, baseExp = 700, bindMoney = 150, pvpPoint = 500,},
				{score = 1500, title = 6349, baseExp = 900, bindMoney = 200, pvpPoint = 1000,},
				{score = 2100, title = 6350, baseExp = 1100, bindMoney = 250, pvpPoint = 1500,},
				{score = 2400, title = 6351, baseExp = 1300, bindMoney = 300, pvpPoint = 2000,},
				{score = 2700, title = 6352, baseExp = 1500, bindMoney = 350, pvpPoint = 2500,},
			}
			local awardItems1 = {33627,33629,33630,33631,33616}
			local awardItems2 = {33627,33629,33630,33631,33621}
			local v33 = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,27)	--3v3
			local v66 = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,28)	--6v6
			local highest = math.max(v33,v66)
			--发称号
			local temp = 1
			for k,v in ipairs(awards) do
				if highest >= v.score then
					temp = k
				else
					break
				end
			end
			TaskCApi.GiveOneTitle(TASKINTERFACE_POINTER, awards[temp].title)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,awards[temp].baseExp * TaskExpAdjust[iPlayerLev])
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,awards[temp].bindMoney * TaskMoneyAdjust[iPlayerLev])
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,repuNum,awards[temp].pvpPoint)
			-- 发道具
			if temp <=3 then
				for k,v in ipairs(awardItems1) do
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,v, 1,true)	--绑定
				end
			else
				for k,v in ipairs(awardItems2) do
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,v, 1,true)	--绑定
				end
			end

		end
		return 0
   	end
}

TaskList[15974] = ----神之试炼二章代工额外奖励
{
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
		bFinishWhenDelvier = false,	-- not 接受即完成！

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview =
	{
		-- 信仰值
		Belief = function(TASKINTERFACE_POINTER)
			local baseBelief = 450
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iBelief = baseBelief * TaskBeliefAdjust[iPlayerLev]
			return iBelief	--返回0时为？？？,其他为显示的值
		end	,
	}
	,
	Items = { 45659,44039 }		-- 试炼特典,双倍信仰
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iItemID1 = TaskList[15974].Items[1]	-- 试炼特典
		local bAvailable = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID1, true)
		if bAvailable < 1 then
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.CollectItem =
		{
			Item1={ID=TaskList[15974].Items[1], Num=1, Common=true},	-- 试炼特典
			Item2={ID=TaskList[15974].Items[2], Num=1, Common=true},	-- 双倍信仰
		}
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iItemID1 = TaskList[15974].Items[1]	-- 试炼特典
		local iItemID2 = TaskList[15974].Items[2]	-- 双倍信仰
		local bAvailable1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID1, true)
		local bAvailable2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID2, true)
		if bAvailable1 >= 1 and bAvailable2 >= 1 then
			iRet = TASK_SUCC_FINISH
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
			local baseExp = 0
			local baseBelief = 450
			local iItemID1 = TaskList[15974].Items[1]	-- 试炼特典
			local iItemID2 = TaskList[15974].Items[2]	-- 双倍信仰
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExp = baseExp * TaskExpAdjust[iPlayerLev]
			local iBelief = baseBelief * TaskBeliefAdjust[iPlayerLev]
			-- TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExp * selfCount)
			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,iBelief,false)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID1,1)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID2,1)
		end
		return 0
   	end
}

TaskList[15975] = ----神之试炼二章代工额外奖励++
{
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
		bFinishWhenDelvier = false,	-- not 接受即完成！

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local baseExp = 400 + 400
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExp = baseExp * TaskExpAdjust[iPlayerLev]
			return iExp	--返回0时为？？？,其他为显示的值
		end	,
		-- 信仰值
		Belief = function(TASKINTERFACE_POINTER)
			local baseBelief = 450 + (450+450)
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iBelief = baseBelief * TaskBeliefAdjust[iPlayerLev]
			return iBelief	--返回0时为？？？,其他为显示的值
		end	,
	}
	,
	Items = { 45659,44039,45649 }		-- 试炼特典,双倍信仰,祭品
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local itemID1 = TaskList[15975].Items[1]	-- 试炼特典
		local bAvailable = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,itemID1, true)
		if bAvailable < 1 then
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

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		local itemID1 = TaskList[15975].Items[1]	-- 试炼特典
		local itemID2 = TaskList[15975].Items[2]	-- 试炼特典
		local itemID3 = TaskList[15975].Items[3]	-- 试炼特典
   		Method.CollectItem =
		{
			Item1={ID=itemID1, Num=1, Common=true},	-- 试炼特典
			Item2={ID=itemID2, Num=1, Common=true},	-- 双倍信仰
			Item3={ID=itemID3, Num=1, Common=true},	-- 任务奖励加倍道具
		}
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		--无条件完成
   		local iRet = TASK_SUCC_FINISH		--默认完成
		for i,v in pairs(TaskList[15975].Items) do		--任何一个物品数量=0就判定不完成
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,v, true) == 0 then
				iRet = TASK_NO_FINISH
			end
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
			local baseExp = 400 + 400
			local baseBelief = 450 + (450+450)
			local itemID1 = TaskList[15975].Items[1]	-- 试炼特典
			local itemID2 = TaskList[15975].Items[2]	-- 试炼特典
			local itemID3 = TaskList[15975].Items[3]	-- 试炼特典
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExp = baseExp * TaskExpAdjust[iPlayerLev]
			local iBelief = baseBelief * TaskBeliefAdjust[iPlayerLev]
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExp)
			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,iBelief,false)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,itemID1,1)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,itemID2,1)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,itemID3,1)
		end
		return 0
   	end
}

TaskList[16106] = ----根据累计活跃度发金镶玉
{
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = false,
		bCanGiveUp = true,
		bFinishWhenDelvier = true,	-- 接受即完成！
		bHiddenTask = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
	AwardPreview ={}
	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 1 then
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
		--无条件完成
   		local iRet = TASK_NO_FINISH
   		iRet = TASK_SUCC_FINISH
		--时间到失败 --意外保护
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 16106)
   		if ulCurTime - ulDeliverTime > 30 then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 1 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		if bSuccess then
			-- 根据宝石收藏技能发金镶玉
			local iSkillID = 4648
			local iItemID = 45826
			if TaskCApi.HasSkill(TASKINTERFACE_POINTER,iSkillID) then
				local iSkillLev = TaskCApi.GetSkillLev(TASKINTERFACE_POINTER,iSkillID)
				local iItemNum = iSkillLev
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iItemID,iItemNum,true)
			end
			-- 根据活跃度领点金值和金币、信仰
			local iBuffID = 3047
			local iActivityValue = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--活跃度
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iPlayerMap = TaskCApi.GetPlayerCurSite(TASKINTERFACE_POINTER)
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,iBuffID) then
				-- 等级大于等于60且位于公会基地内
				if iPlayerLevel >= 60 and iPlayerMap == 200 then
					if iActivityValue < 80 then
						TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,10000, false)
					elseif iActivityValue >= 80 and iActivityValue <= 119 then
						TaskCApi.PlayerGetKingdomGoldenValue(TASKINTERFACE_POINTER,5000*2)   	--翻倍,2013.06.28修改by zhaotao/lujinghua
						TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,25000, false)
					elseif iActivityValue >= 120 and iActivityValue <= 159 then
						TaskCApi.PlayerGetKingdomGoldenValue(TASKINTERFACE_POINTER,7500*2)		--翻倍,2013.06.28修改by zhaotao/lujinghua
						TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,37500, false)
					elseif iActivityValue >= 160 then
						TaskCApi.PlayerGetKingdomGoldenValue(TASKINTERFACE_POINTER,10000*2)		--翻倍,2013.06.28修改by zhaotao/lujinghua
						TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,50000, false)
					end
				end
			end
		end
		return 0
   	end
}

TaskList[16376] = --装备本幸运任务
{
	allTasks =			--任务id和权重（！权重合计必须等于100！）
	{
		{id = 12638, GlobleIdxValue = 1,},		--灾域虚空
		{id = 13645, GlobleIdxValue = 2,},		--万王之陵
		{id = 16342, GlobleIdxValue = 3,},		--黑矮人矿场
		{id = 17055, GlobleIdxValue = 4,},		--镰刀岛
		{id = 17115, GlobleIdxValue = 5,},		--法师塔初级
	}
	,
	allItems = 			-- 淬炼道具ids
	{
		-- 蓝
		46461,		46462,		46463,		46464,		46479,		46480,		46481,		46482,		46483,
		46484,		46485,		46486,		46487,		46488,		46489,		46490,		46491,		46492,
		-- 紫
		46493,		46494,		46495,		46496,		46511,		46512,		46513,		46514,		46515,
		46516,		46517,		46518,		46519,		46520,		46521,		46522,		46523,		46524,
	}
	,
	chipPackageItem = 46769		-- 淬炼碎片礼包id
	,
	Property =
  	{
		bHiddenTask = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
		bAbsoluteTime = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,

		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--每天最多可完成的次数：1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--每天清空
  	}
   	,
	AwardPreview =
	{
		Exp = function(TASKINTERFACE_POINTER)
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local baseExp = 1620
			return math.floor(baseExp * TaskExpAdjust[iPlayerLev])
		end
		,
		FriendShips = function(TASKINTERFACE_POINTER)
			local heroPointAward = 50
			local friendships = {}
			friendships = {
				FS1 = {ID = 4, VAL = heroPointAward},
			}
			return friendships
		end
		,
		Items = function(TASKINTERFACE_POINTER)
			local itemIndex = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 4)
			local itemID = TaskList[16376].allItems[itemIndex]
			local items = {}
			items = {
				Item1 = {ID = 0, NUM = 1},
			}
			return items
		end	,

	}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		-- 获得时间流
		local timePackage = os.date("*t", os.time())
		local hour = timePackage.hour
		--等级限制75级以上
		if iPlayerLev < 75 then
	   	    return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		-- 23点前可以接任务
		if hour >= 23 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end
   		return 0
   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local GlobalIndex = 110119
		local GlobalVar = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER,GlobalIndex)

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local idx = 1		-- 默认序号是1：灾狱虚空

		-- 获得时间流
		local timePackage = os.date("*t", os.time())
		local hour = timePackage.hour
		local minute = timePackage.min
		local second = timePackage.sec
		if second > 0 then
			minute = minute + 1
		end

		-- 根据全局变量随机出今天的英雄命运副本
		for k,v in ipairs(TaskList[16376].allTasks) do
			if GlobalVar == v.GlobleIdxValue then
				-- 79级及以下玩家只限定前3个，84级及以下玩家只限定前4个
				if iPlayerLev <= 79 then
					if k%3 == 0 then
						idx = 3
					else
						idx = k%3
					end
				elseif iPlayerLev <= 84 then
					if k%4 == 0 then
						idx = 4
					else
						idx = k%4
					end
				else
					idx = k
				end
				break
			end
		end

		-- 随机出一个这次奖励的淬炼道具序号
		local allItems = TaskList[16376].allItems
		math.randomseed(os.time())
		local iRandomNum = math.random(1,#allItems)

		----------- 测试模式 --------------------
		local item20049 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,20049, true)
		if item20049 ~= 0 then
			iRandomNum = math.min(item20049,#allItems)
		end
		------------ debug end ------------------

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16376, 1,idx)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16376, 2,hour)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16376, 3,minute)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16376, 4,iRandomNum)
		return 0
	end
	,

   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
		local idx = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 1)
		local hour = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 2)
		local minute = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 3)
		local Time = (hour * 60 + minute) * 60		-- 接受任务时候的总时间秒数（从0点算）
		local restTime	= math.max(1, 23 * 3600 + 59 * 60 - Time)	-- 离当天23：59分的时间差

   		local Method = {}
   		Method.CompleteTask = {TaskID = TaskList[16376].allTasks[idx].id, Num = 1}
		-- 根据接任务时间计算出到当天23：59分的时间差作为任务限时
   		Method.iTimeLimit = restTime
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iRet = TASK_NO_FINISH
		local idx = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 1)
		local hour = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 2)
		local minute = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 3)
		local Time = (hour * 60 + minute) * 60		-- 接受任务时候的总时间秒数（从0点算）
		local restTime	= math.max(1, 23 * 3600 + 59 * 60 - Time)	-- 离当天23：59分的时间差

		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[16376].allTasks[idx].id)
		if iCount >= 1 then
			iRet = TASK_SUCC_FINISH
		end
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 16376)
   		if ulCurTime - ulDeliverTime > restTime then
   		    iRet = TASK_FAIL_FINISH
   		end
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
			if emptySlots < 3 then
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
   		end
   		return 0
   	end
   	,

   	--完成该任务时服务器调用
   	OnAward = function(TASKINTERFACE_POINTER,bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			local heroPointAward = 50
			local baseExp = 1620
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			if ucRandomNum4 == nil or ucRandomNum4 == 0 then
				ucRandomNum4 = 1
			end
			local itemID = TaskList[16376].allItems[ucRandomNum4]
			local chipPackageItem = TaskList[16376].chipPackageItem

			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER, 4, heroPointAward)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, math.floor(baseExp * TaskExpAdjust[iPlayerLev]))
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemID, 1,true)
			TaskCApi.DeliverRandomGift(TASKINTERFACE_POINTER, chipPackageItem)

			-- 按几率发放大星辰结晶
			math.randomseed(os.time())
			local iRandomNum = math.random(1,200)
			if iRandomNum <= 1 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,50156, 1,true)
			end

		end
		return 0
   	end
}
TaskList[16388] = --无限追缴令
{
	allTasks =			--任务id
	{
		{16977,},
		{16976,},
		{13647,},
		{12208,13641,},
		{12207,13640,},
		{10623,13639,},
		{10622,13638,},
		{10621,},
		{10619,},
		{10618,},
		{10617,},
		{10616,},
		{10615,},
		{10614,},
	}
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
		bFinishWhenDelvier = true,	-- 接受即完成！
  	}
   	,
	AwardPreview =	{}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
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
		iRet = TASK_SUCC_FINISH		--默认完成
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 16388)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER,bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			local itemID = 46705
			local allTasks = TaskList[16388].allTasks
			local allTasksCount = {}
			local MAXTASKCOUNT = 15
			local itemCount = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,itemID, true)
			-- 当天杀怪数小于等于8000只，才处理
			local monsterKilled = TaskCApi.GetMonsterKillAmount(TASKINTERFACE_POINTER)
			local keyValue = 8000*100
			if monsterKilled <= keyValue then
				-- 当有无限追缴令物品的时候才处理
				if itemCount >= 1 then
					for k,v in ipairs(allTasks) do
						allTasksCount[k] = 0
						for k1,v1 in ipairs(v) do
							local count = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,v1)
							if count >= MAXTASKCOUNT then
								allTasksCount[k] = 1
								break
							end
						end
					end
					for m,n in ipairs(allTasksCount) do
						if n >= 1 and itemCount >= 1 then
							TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,itemID,1)
							itemCount = itemCount - 1
							for m1,n1 in ipairs(allTasks[m]) do
								TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER,n1,-1)
							end
						end
					end
				end
			end
		end
		return 0
   	end
}

TaskList[16635] = --封印技能书重铸
{
	Books =
	{
		{ id = 31781, lv = 70, occu = 1, wt = 50,},
		{ id = 31800, lv = 70, occu = 2, wt = 50,},
		{ id = 31820, lv = 70, occu = 3, wt = 50,},
		{ id = 31838, lv = 70, occu = 7, wt = 50,},
		{ id = 31861, lv = 70, occu = 8, wt = 50,},
		{ id = 31881, lv = 70, occu = 4, wt = 50,},
		{ id = 31899, lv = 70, occu = 5, wt = 50,},
		{ id = 31922, lv = 70, occu = 6, wt = 50,},
		{ id = 31773, lv = 60, occu = 1, wt = 33,},
		{ id = 31793, lv = 60, occu = 2, wt = 33,},
		{ id = 31831, lv = 60, occu = 7, wt = 33,},
		{ id = 31873, lv = 60, occu = 4, wt = 33,},
		{ id = 31892, lv = 60, occu = 5, wt = 33,},
		{ id = 31813, lv = 62, occu = 3, wt = 33,},
		{ id = 31854, lv = 63, occu = 8, wt = 33,},
		{ id = 31915, lv = 63, occu = 6, wt = 33,},
		{ id = 31901, lv = 66, occu = 5, wt = 20,},
		{ id = 31883, lv = 69, occu = 4, wt = 20,},
		{ id = 31783, lv = 70, occu = 1, wt = 20,},
		{ id = 31802, lv = 70, occu = 2, wt = 20,},
		{ id = 31822, lv = 70, occu = 3, wt = 20,},
		{ id = 31840, lv = 70, occu = 7, wt = 20,},
		{ id = 31863, lv = 70, occu = 8, wt = 20,},
		{ id = 31924, lv = 70, occu = 6, wt = 20,},
		{ id = 31835, lv = 65, occu = 7, wt = 17,},
		{ id = 31778, lv = 65, occu = 1, wt = 17,},
		{ id = 31798, lv = 65, occu = 2, wt = 17,},
		{ id = 31818, lv = 65, occu = 3, wt = 17,},
		{ id = 31859, lv = 65, occu = 8, wt = 17,},
		{ id = 31880, lv = 65, occu = 4, wt = 17,},
		{ id = 31895, lv = 65, occu = 5, wt = 17,},
		{ id = 31920, lv = 65, occu = 6, wt = 17,},
		{ id = 35377, lv = 75, occu = 1, wt = 17,},
		{ id = 35402, lv = 75, occu = 2, wt = 17,},
		{ id = 35425, lv = 75, occu = 3, wt = 17,},
		{ id = 35449, lv = 75, occu = 7, wt = 17,},
		{ id = 35472, lv = 75, occu = 8, wt = 17,},
		{ id = 35496, lv = 75, occu = 4, wt = 17,},
		{ id = 35520, lv = 75, occu = 5, wt = 17,},
		{ id = 35545, lv = 75, occu = 6, wt = 17,},
		{ id = 31784, lv = 70, occu = 1, wt = 14,},
		{ id = 31803, lv = 70, occu = 2, wt = 14,},
		{ id = 31823, lv = 70, occu = 3, wt = 14,},
		{ id = 31841, lv = 70, occu = 7, wt = 14,},
		{ id = 31864, lv = 70, occu = 8, wt = 14,},
		{ id = 31884, lv = 70, occu = 4, wt = 14,},
		{ id = 31902, lv = 70, occu = 5, wt = 14,},
		{ id = 31925, lv = 70, occu = 6, wt = 14,},
		{ id = 31919, lv = 63, occu = 6, wt = 13,},
		{ id = 31779, lv = 66, occu = 1, wt = 13,},
		{ id = 31819, lv = 66, occu = 3, wt = 13,},
		{ id = 31879, lv = 66, occu = 4, wt = 13,},
		{ id = 31799, lv = 68, occu = 2, wt = 13,},
		{ id = 31897, lv = 68, occu = 5, wt = 13,},
		{ id = 31837, lv = 69, occu = 7, wt = 13,},
		{ id = 31860, lv = 70, occu = 8, wt = 13,},
		{ id = 35476, lv = 79, occu = 8, wt = 13,},
		{ id = 35552, lv = 79, occu = 6, wt = 13,},
		{ id = 35386, lv = 80, occu = 1, wt = 13,},
		{ id = 35389, lv = 80, occu = 1, wt = 13,},
		{ id = 35410, lv = 80, occu = 2, wt = 13,},
		{ id = 35411, lv = 80, occu = 2, wt = 13,},
		{ id = 35434, lv = 80, occu = 3, wt = 13,},
		{ id = 35435, lv = 80, occu = 3, wt = 13,},
		{ id = 35458, lv = 80, occu = 7, wt = 13,},
		{ id = 35460, lv = 80, occu = 7, wt = 13,},
		{ id = 35478, lv = 80, occu = 8, wt = 13,},
		{ id = 35504, lv = 80, occu = 4, wt = 13,},
		{ id = 35505, lv = 80, occu = 4, wt = 13,},
		{ id = 35528, lv = 80, occu = 5, wt = 13,},
		{ id = 35531, lv = 80, occu = 5, wt = 13,},
		{ id = 35556, lv = 80, occu = 6, wt = 13,},
		{ id = 35367, lv = 71, occu = 1, wt = 12,},
		{ id = 35394, lv = 71, occu = 2, wt = 12,},
		{ id = 35418, lv = 71, occu = 3, wt = 12,},
		{ id = 35485, lv = 71, occu = 4, wt = 12,},
		{ id = 35513, lv = 71, occu = 5, wt = 12,},
		{ id = 35533, lv = 71, occu = 6, wt = 12,},
		{ id = 35374, lv = 73, occu = 1, wt = 12,},
		{ id = 35399, lv = 73, occu = 2, wt = 12,},
		{ id = 35443, lv = 73, occu = 7, wt = 12,},
		{ id = 35467, lv = 73, occu = 8, wt = 12,},
		{ id = 35493, lv = 73, occu = 4, wt = 12,},
		{ id = 35515, lv = 73, occu = 5, wt = 12,},
		{ id = 35538, lv = 73, occu = 6, wt = 12,},
		{ id = 35539, lv = 73, occu = 6, wt = 12,},
		{ id = 35424, lv = 75, occu = 3, wt = 12,},
		{ id = 35448, lv = 75, occu = 7, wt = 12,},
		{ id = 35470, lv = 75, occu = 8, wt = 12,},
		{ id = 35403, lv = 76, occu = 2, wt = 12,},
		{ id = 35498, lv = 76, occu = 4, wt = 12,},
		{ id = 35428, lv = 77, occu = 3, wt = 12,},
		{ id = 31782, lv = 66, occu = 1, wt = 11,},
		{ id = 31801, lv = 66, occu = 2, wt = 11,},
		{ id = 31839, lv = 66, occu = 7, wt = 11,},
		{ id = 31821, lv = 69, occu = 3, wt = 11,},
		{ id = 31862, lv = 69, occu = 8, wt = 11,},
		{ id = 31882, lv = 70, occu = 4, wt = 11,},
		{ id = 31900, lv = 70, occu = 5, wt = 11,},
		{ id = 31923, lv = 70, occu = 6, wt = 11,},
		{ id = 35378, lv = 76, occu = 1, wt = 11,},
		{ id = 35404, lv = 76, occu = 2, wt = 11,},
		{ id = 35427, lv = 76, occu = 3, wt = 11,},
		{ id = 35450, lv = 76, occu = 7, wt = 11,},
		{ id = 35451, lv = 76, occu = 7, wt = 11,},
		{ id = 35474, lv = 76, occu = 8, wt = 11,},
		{ id = 35547, lv = 76, occu = 6, wt = 11,},
		{ id = 35380, lv = 78, occu = 1, wt = 11,},
		{ id = 35382, lv = 78, occu = 1, wt = 11,},
		{ id = 35407, lv = 78, occu = 2, wt = 11,},
		{ id = 35429, lv = 78, occu = 3, wt = 11,},
		{ id = 35452, lv = 78, occu = 7, wt = 11,},
		{ id = 35499, lv = 78, occu = 4, wt = 11,},
		{ id = 35500, lv = 78, occu = 4, wt = 11,},
		{ id = 35501, lv = 78, occu = 4, wt = 11,},
		{ id = 35522, lv = 78, occu = 5, wt = 11,},
		{ id = 35523, lv = 78, occu = 5, wt = 11,},
		{ id = 35549, lv = 78, occu = 6, wt = 11,},
		{ id = 35550, lv = 78, occu = 6, wt = 11,},
		{ id = 35409, lv = 79, occu = 2, wt = 11,},
		{ id = 35433, lv = 79, occu = 3, wt = 11,},
		{ id = 35526, lv = 79, occu = 5, wt = 11,},
		{ id = 35481, lv = 80, occu = 8, wt = 11,},
		{ id = 35557, lv = 80, occu = 6, wt = 11,},
		{ id = 35401, lv = 75, occu = 2, wt = 10,},
		{ id = 35426, lv = 76, occu = 3, wt = 10,},
		{ id = 35497, lv = 76, occu = 4, wt = 10,},
		{ id = 35521, lv = 76, occu = 5, wt = 10,},
		{ id = 35548, lv = 77, occu = 6, wt = 10,},
		{ id = 35381, lv = 78, occu = 1, wt = 10,},
		{ id = 35406, lv = 78, occu = 2, wt = 10,},
		{ id = 35430, lv = 78, occu = 3, wt = 10,},
		{ id = 35431, lv = 78, occu = 3, wt = 10,},
		{ id = 35453, lv = 78, occu = 7, wt = 10,},
		{ id = 35475, lv = 78, occu = 8, wt = 10,},
		{ id = 35524, lv = 78, occu = 5, wt = 10,},
		{ id = 35551, lv = 78, occu = 6, wt = 10,},
		{ id = 35383, lv = 79, occu = 1, wt = 10,},
		{ id = 35408, lv = 79, occu = 2, wt = 10,},
		{ id = 35455, lv = 79, occu = 7, wt = 10,},
		{ id = 35456, lv = 79, occu = 7, wt = 10,},
		{ id = 35477, lv = 79, occu = 8, wt = 10,},
		{ id = 35503, lv = 79, occu = 4, wt = 10,},
		{ id = 35553, lv = 79, occu = 6, wt = 10,},
		{ id = 35388, lv = 80, occu = 1, wt = 10,},
		{ id = 35484, lv = 80, occu = 8, wt = 10,},
		{ id = 35508, lv = 80, occu = 4, wt = 10,},
		{ id = 35530, lv = 80, occu = 5, wt = 10,},
		{ id = 35405, lv = 78, occu = 2, wt = 10,},
		{ id = 35454, lv = 78, occu = 7, wt = 10,},
		{ id = 35432, lv = 79, occu = 3, wt = 10,},
		{ id = 35502, lv = 79, occu = 4, wt = 10,},
		{ id = 35525, lv = 79, occu = 5, wt = 10,},
		{ id = 35384, lv = 80, occu = 1, wt = 10,},
		{ id = 35385, lv = 80, occu = 1, wt = 10,},
		{ id = 35387, lv = 80, occu = 1, wt = 10,},
		{ id = 35412, lv = 80, occu = 2, wt = 10,},
		{ id = 35413, lv = 80, occu = 2, wt = 10,},
		{ id = 35436, lv = 80, occu = 3, wt = 10,},
		{ id = 35437, lv = 80, occu = 3, wt = 10,},
		{ id = 35457, lv = 80, occu = 7, wt = 10,},
		{ id = 35459, lv = 80, occu = 7, wt = 10,},
		{ id = 35479, lv = 80, occu = 8, wt = 10,},
		{ id = 35480, lv = 80, occu = 8, wt = 10,},
		{ id = 35482, lv = 80, occu = 8, wt = 10,},
		{ id = 35506, lv = 80, occu = 4, wt = 10,},
		{ id = 35507, lv = 80, occu = 4, wt = 10,},
		{ id = 35527, lv = 80, occu = 5, wt = 10,},
		{ id = 35529, lv = 80, occu = 5, wt = 10,},
		{ id = 35554, lv = 80, occu = 6, wt = 10,},
		{ id = 35555, lv = 80, occu = 6, wt = 10,},
		{ id = 35558, lv = 80, occu = 6, wt = 10,},
		{ id = 35390, lv = 80, occu = 1, wt = 9,},
		{ id = 35414, lv = 80, occu = 2, wt = 9,},
		{ id = 35438, lv = 80, occu = 3, wt = 9,},
		{ id = 35461, lv = 80, occu = 7, wt = 9,},
		{ id = 35483, lv = 80, occu = 8, wt = 9,},
		{ id = 35509, lv = 80, occu = 4, wt = 9,},
		{ id = 35532, lv = 80, occu = 5, wt = 9,},
		{ id = 35559, lv = 80, occu = 6, wt = 9,},
	}
	,
	MoneyCost = 10000
	,
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
  	}
   	,
   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		local idx = 5	--灵魂重铸占用的活动计数编号是5
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)

		if playerLev < 60 then	--60级以上才能领
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end
		if emptySlots < 1 then	--普通包裹栏需要1格
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end
		if commonCount < 1 then	--重铸次数大于1次
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
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		Method.SubmitItem  = true
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local moneyCost = 20000		--魂币消耗2金
		local idx = 5	--灵魂重铸次数占用的活动计数编号是5

		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,16635)	--提交物品的信息：id，数量
		if itemIDSubmitted and itemNumberSubmitted then
			local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)
			local currentBindMoney = TaskCApi.GetBindMoneyAmount(TASKINTERFACE_POINTER)	--持有魂币
			if commonCount < 1 then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 16635, 29, 20012)		--重铸次数不足的提示
			elseif currentBindMoney < moneyCost then
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 16635, 29, 20013)		--魂币次数不足的提示
			else
				for k,v in ipairs(TaskList[16635].Books) do
					if itemIDSubmitted == v.id and itemNumberSubmitted >= 1 then
						TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16635, 1,k)	--把item在table的序号存入1号变量
						TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,idx, -1)		--重铸次数减去1
						TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,16635, 1)	--收取提交的item
						iRet = TASK_SUCC_FINISH
						break
					end
				end
			end
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4,ucRandomNum5,ucRandomNum6)
   		if bSuccess then
			math.randomseed(os.time())
			local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)			--获取玩家等级
			local playerOccu = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)		--获取玩家职业
			local itemIdx = 	ucRandomNum1	--1号变量：所提交的item在table的序号
			local sumProbability = 0		--求所有权重之和

			for k,v in ipairs(TaskList[16635].Books) do
				if playerLev < v.lv - 1 or playerOccu ~= v.occu then	--如果等级低于技能书等级-1，或者非本职业，则不计入总权重
					sumProbability = sumProbability
				else
					sumProbability = sumProbability + v.wt
				end
			end
			local rand = math.random(1,sumProbability)
			local temp = 0
			local itemID = 0
			for k,v in ipairs(TaskList[16635].Books) do
				if not ( playerLev < v.lv - 1 or playerOccu ~= v.occu ) then	--如果等级低于技能书等级-1，或者非本职业，就排除
					if rand <= temp + v.wt then
						itemID = v.id
						break
					else
						temp = temp + v.wt
					end
				end
			end
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemID, 1,true)	--绑定
   		end
   		return 0
   	end
}
TaskList[17062] = --地狱之路过关奖励技能封印之卷
{
	data =		-- [领奖记录序号]={关卡序号,牌子数量}
	{
		[1] = {11,1,},
		[2] = {12,1,},
		[3] = {13,1,},
		[4] = {14,1,},
		[5] = {15,2,},
		[6] = {16,2,},
		[7] = {17,2,},
		[8] = {18,2,},
		[9] = {19,3,},
		[10] = {20,3,},
		[11] = {21,3,},
		[12] = {22,4,},
		[13] = {23,4,},
		[14] = {24,4,},
		[15] = {25,5,},
		[16] = {26,5,},
		[17] = {27,5,},
		[18] = {28,6,},
		[19] = {29,6,},
		[20] = {30,6,},
		[21] = {31,7,},
		[22] = {32,7,},
		[23] = {33,7,},
		[24] = {34,8,},
		[25] = {35,8,},
		[26] = {36,8,},
	}
	,
	AwardPreview =	{}
	,
	Property =
  	{
		bRecordFinish = false,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
		bHiddenTask = false,
		bShowPrompt = true,
		bCanGiveUp = true,
  		iType  = TaskType.JiangLi,
  		iTopic = TaskTopic.YiBan,
		bFinishWhenDelvier = false,	--not 接受即完成！
		bUIButtonTask = true,
  	}
   	,

	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local taskCurrentLevel	=	14904			-- 记录玩家地狱之路当前通关数的任务id
		local taskRecord		=	17063			-- 记录玩家领取封印之卷的进度的任务id
		local currentTaskRecord = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,taskRecord)	--取得当前进度
		if currentTaskRecord >= #TaskList[17062].data then
			return TASK_PREREQU_FAIL_LUA_TASK
		end
   		return 0
   	end
   	,
   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local taskRecord		=	17063			-- 记录玩家领取封印之卷的进度的任务id
		local currentTaskRecord	= TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,taskRecord)	--取得当前存贮进度
		local requiredLevelIdx	= TaskList[17062].data[math.min(#TaskList[17062].data,currentTaskRecord + 1)][1]		--任务需要去完成的关数
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,17062, 1,requiredLevelIdx)
		return 0
	end
	,
   	--服务器杀怪、取得物品等条件下调用,客户端任务界面显示时调用
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
		local taskCurrentLevel	=	14904			-- 记录玩家地狱之路当前通关数的任务id
		local requiredLevelIdx	= TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,17062, 1)
		Method.CompleteTask = {TaskID = taskCurrentLevel , Num = requiredLevelIdx}
   		return Method
   	end
   	,
   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		--无条件完成
   		local iRet = TASK_NO_FINISH

		local taskCurrentLevel	=	14904			-- 记录玩家地狱之路当前通关数的任务id
		local currentLevelIdx	= TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,taskCurrentLevel)	--取得当前通关数
		local requiredLevelIdx	= TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,17062, 1)

		if currentLevelIdx >= requiredLevelIdx then
			iRet = TASK_SUCC_FINISH
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
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			local taskCurrentLevel	=	14904			-- 记录玩家地狱之路当前通关数的任务id
			local taskRecord		=	17063			-- 记录玩家领取封印之卷的进度的任务id
			local currentLevelIdx	= TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,taskCurrentLevel)	--取得当前通关数
			local currentTaskRecord	= TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,taskRecord)	--取得当前存贮进度
			local itemCount = TaskList[17062].data[math.min(#TaskList[17062].data,currentTaskRecord + 1)][2]				-- 奖励的物品个数
			local itemID = 48447	--奖励的物品id
			TaskCApi.ModifyTaskFinishCnt(TASKINTERFACE_POINTER, taskRecord, 1)	--把存贮进度+1
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,itemID, itemCount,true)	--绑定
		end
   		return 0
   	end
}

TaskList[17130] = -- 201311回流礼包
{
	allAwards =			--所有奖励列表
	{
		-- [天数] = { 经验书，信仰书，魂币，战神声望，攻击灵器食物，防御灵器食物 }
		-- 第一天给1个天天领宝石卡礼包（50714）；除最后一天外每天返还一个聚宝盆；改奖励需要酌情改包裹格子判断
		-- 第一天额外给一个绑定的天赋罗盘13227 限时30天
		[1]	=	{expBook = 2,	beliefBook = 2,	bindMoney = 500*10000,	GOW = 51322,	LingQiFood = 50,},
		[2]	=	{expBook = 2,	beliefBook = 0,	bindMoney = 200*10000,	GOW = 51321,	LingQiFood = 50,},
		[3]	=	{expBook = 0,	beliefBook = 2,	bindMoney = 200*10000,	GOW = 0,	LingQiFood = 50,},
		[4]	=	{expBook = 2,	beliefBook = 0,	bindMoney = 200*10000,	GOW = 0,	LingQiFood = 50,},
		[5]	=	{expBook = 0,	beliefBook = 2,	bindMoney = 200*10000,	GOW = 0,	LingQiFood = 50,},
		[6]	=	{expBook = 2,	beliefBook = 0,	bindMoney = 200*10000,	GOW = 0,	LingQiFood = 50,},
		[7]	=	{expBook = 0,	beliefBook = 2,	bindMoney = 200*10000,	GOW = 0,	LingQiFood = 50,},
		[8]	=	{expBook = 2,	beliefBook = 0,	bindMoney = 200*10000,	GOW = 0,	LingQiFood = 50,},
		[9]	=	{expBook = 0,	beliefBook = 2,	bindMoney = 200*10000,	GOW = 0,	LingQiFood = 50,},
		[10]=	{expBook = 2,	beliefBook = 0,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 50,},
		[11]=	{expBook = 0,	beliefBook = 2,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 50,},
		[12]=	{expBook = 2,	beliefBook = 0,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 50,},
		[13]=	{expBook = 0,	beliefBook = 2,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 0,},
		[14]=	{expBook = 2,	beliefBook = 0,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 0,},
		[15]=	{expBook = 0,	beliefBook = 2,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 0,},
		[16]=	{expBook = 2,	beliefBook = 0,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 0,},
		[17]=	{expBook = 0,	beliefBook = 2,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 0,},
		[18]=	{expBook = 2,	beliefBook = 0,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 0,},
		[19]=	{expBook = 0,	beliefBook = 2,	bindMoney = 100*10000,	GOW = 0,	LingQiFood = 0,},
		[20]=	{expBook = 2,	beliefBook = 0,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[21]=	{expBook = 0,	beliefBook = 2,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[22]=	{expBook = 2,	beliefBook = 0,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[23]=	{expBook = 0,	beliefBook = 2,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[24]=	{expBook = 2,	beliefBook = 0,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[25]=	{expBook = 0,	beliefBook = 2,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[26]=	{expBook = 2,	beliefBook = 0,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[27]=	{expBook = 0,	beliefBook = 2,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[28]=	{expBook = 2,	beliefBook = 0,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[29]=	{expBook = 0,	beliefBook = 2,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
		[30]=	{expBook = 2,	beliefBook = 0,	bindMoney = 50*10000,	GOW = 0,	LingQiFood = 0,},
	}
	,
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
		bFinishWhenDelvier = true,	-- 接受即完成！
		bRecordFinishCount = true,				--是否记录完成次数
		iMaxFinishCount = 30,					--最大完成次数
		iClearFinishCountType = TaskClearFinishCountType.None,			-- 清空完成次数的方式	0, --不清空,1, --每天,2—每周
		iAvailFrequency  = TaskAvailFrequency.EachDay,					-- 发放间隔是每天

	}
   	,
	AwardPreview =	{}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		-- 与任务17127互斥
		local taskID2 = 17127
		if 	TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,taskID2,true) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end
-- 		-- 任务17140已达到30次后不可使用
-- 		local dayCountTaskID = 17140
-- 		if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,dayCountTaskID) >= 30 then
-- 			return TASK_PREREQU_FAIL_COMPLETE_TIMES
-- 		end
		-- 包裹不足则不可使用
		local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,17130)
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if selfCount < 1 then
			if emptySlots < 8 then			--第1天需要8格
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		elseif selfCount >= 1 or selfCount < 12 then
			if emptySlots < 5 then			--第2到12天需要5格
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		else
			if emptySlots < 2 then			--其他天需要2格
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
		iRet = TASK_SUCC_FINISH		--默认完成
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 17130)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER,bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			local expBookID,beliefBookID,LingQiFoodID1,LingQiFoodID2 = 46696,46697,43380,43381
			local gemCardID,selfID = 50714,50579
			local GOW_ID	=	34
			local selfCount	=	TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,17130)
			local maxCount	=	#TaskList[17130].allAwards

			-- 第一天给1个天天领宝石卡礼包（50714），天赋罗盘（13227，限时30天）
			if selfCount == 1 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,gemCardID, 1,true)
				TaskCApi.DeliverCommonPeriodItem(TASKINTERFACE_POINTER,13227, 1, 3600*24*30, true)
			end
			-- 除最后一天外每天返还一个聚宝盆
			if selfCount < maxCount then
				TaskCApi.DeliverCommonPeriodItem(TASKINTERFACE_POINTER,selfID, 1, 1296000, true)
			end
			-- 每天按清单发奖励
			if selfCount >= 1 and selfCount <= maxCount then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,expBookID, TaskList[17130].allAwards[selfCount].expBook,true)
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,beliefBookID, TaskList[17130].allAwards[selfCount].beliefBook,true)
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,TaskList[17130].allAwards[selfCount].bindMoney)
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[17130].allAwards[selfCount].GOW,1,true)
				local LingQiFood = TaskList[17130].allAwards[selfCount].LingQiFood
				if LingQiFood ~= 0 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,LingQiFoodID1, LingQiFood,true)
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,LingQiFoodID2, LingQiFood,true)
				end
			end
		end
		return 0
   	end
}

TaskList[17196] = --远古入侵经验书礼盒
{
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
		bFinishWhenDelvier = true,	-- 接受即完成！
  	}
   	,
	AwardPreview =	{}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		-- 包裹不足则不可使用
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 2 then			--需要2格
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
		iRet = TASK_SUCC_FINISH		--默认完成
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 17196)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER,bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			local itemID = 51062

			local RequiredValue = 145	--有几率获得多个物品的活跃度门槛
			local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--取得本周活跃度数值
			local rateTable = 			-- 几率表	【数量】 = 几率*100
			{
				[1] = 75,	[2] = 20,	[3] = 5,
			}
			-- 活跃度大于等于145时，有几率获得多个物品
			if iCount >= RequiredValue then
				math.randomseed(os.time())
				local iRandomNum = math.random(1, 100)
				local totalRand = 0
				for k,v in ipairs(rateTable) do
					if iRandomNum <= totalRand + v then
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, itemID, k, false)
						break
					else
						totalRand = totalRand + v
					end
				end
			else
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, itemID, 1, true)
			end
		end
		return 0
   	end
}

TaskList[17197] = --远古入侵信仰书礼盒
{
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
		bFinishWhenDelvier = true,	-- 接受即完成！
  	}
   	,
	AwardPreview =	{}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		-- 包裹不足则不可使用
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 2 then			--需要2格
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
		iRet = TASK_SUCC_FINISH		--默认完成
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 17197)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER,bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			local itemID = 51063

			local RequiredValue = 145	--有几率获得多个物品的活跃度门槛
			local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--取得本周活跃度数值
			local rateTable = 			-- 几率表	【数量】 = 几率*100
			{
				[1] = 75,	[2] = 20,	[3] = 5,
			}
			-- 活跃度大于等于145时，有几率获得多个物品
			if iCount >= RequiredValue then
				math.randomseed(os.time())
				local iRandomNum = math.random(1, 100)
				local totalRand = 0
				for k,v in ipairs(rateTable) do
					if iRandomNum <= totalRand + v then
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, itemID, k, false)
						break
					else
						totalRand = totalRand + v
					end
				end
			else
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, itemID, 1, true)
			end
		end
		return 0
   	end
}

TaskList[17198] = --远古入侵物资礼盒
{
	Property =
  	{
		bHiddenTask = true,
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bShowPrompt = false,
		bCanGiveUp = true,
  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.XingYun,
		bFinishWhenDelvier = true,	-- 接受即完成！
  	}
   	,
	AwardPreview =	{}
	,

   	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		-- 包裹不足则不可使用
		local emptySlots = TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)
		if emptySlots < 1 then			--需要1格
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
		iRet = TASK_SUCC_FINISH		--默认完成
		--时间到失败
   		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, 17198)
   		if ulCurTime - ulDeliverTime > 10 then
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
   	OnAward = function(TASKINTERFACE_POINTER,bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		if bSuccess then
			local itemID =
			{
				{id = 19130,	prob = 15 * 41,	num = 3},	--生命宝石1级	自然
				{id = 19135,	prob = 10 * 41,	num = 3},	--魔法宝石1级	泉水
				{id = 19140,	prob = 15 * 41,	num = 3},	--攻击宝石1级	锐利
				{id = 19145,	prob = 15 * 41,	num = 3},	--防御宝石1级	坚硬
				{id = 20290,	prob = 12 * 41,	num = 3},	--命中宝石1级	鹰眼
				{id = 20295,	prob = 10 * 41,	num = 3},	--闪躲宝石1级	灵巧
				{id = 20300,	prob = 05 * 41,	num = 3},	--暴击宝石1级	毁灭
				{id = 20310,	prob = 06 * 41,	num = 3},	--暴伤宝石1级	割裂
				{id = 20305,	prob = 06 * 41,	num = 3},	--免暴击宝石1级	钝厚
				{id = 20315,	prob = 06 * 41,	num = 3},	--减暴伤宝石1级	结晶
				{id = 19131,	prob = 15 * 12,	num = 1},		--生命宝石2级	自然
				{id = 19136,	prob = 10 * 12,	num = 1},		--魔法宝石2级	泉水
				{id = 19141,	prob = 15 * 12,	num = 1},		--攻击宝石2级	锐利
				{id = 19146,	prob = 15 * 12,	num = 1},		--防御宝石2级	坚硬
				{id = 20291,	prob = 12 * 12,	num = 1},		--命中宝石2级	鹰眼
				{id = 20296,	prob = 10 * 12,	num = 1},		--闪躲宝石2级	灵巧
				{id = 20301,	prob = 05 * 12,	num = 1},		--暴击宝石2级	毁灭
				{id = 20311,	prob = 06 * 12,	num = 1},		--暴伤宝石2级	割裂
				{id = 20306,	prob = 06 * 12,	num = 1},		--免暴击宝石2级	钝厚
				{id = 20316,	prob = 06 * 12,	num = 1},		--减暴伤宝石2级	结晶
				{id = 19132,	prob = 15 * 2,	num = 1},			--生命宝石3级	自然
				{id = 19137,	prob = 10 * 2,	num = 1},			--魔法宝石3级	泉水
				{id = 19142,	prob = 15 * 2,	num = 1},			--攻击宝石3级	锐利
				{id = 19147,	prob = 15 * 2,	num = 1},			--防御宝石3级	坚硬
				{id = 20292,	prob = 12 * 2,	num = 1},			--命中宝石3级	鹰眼
				{id = 20297,	prob = 10 * 2,	num = 1},			--闪躲宝石3级	灵巧
				{id = 20302,	prob = 05 * 2,	num = 1},			--暴击宝石3级	毁灭
				{id = 20312,	prob = 06 * 2,	num = 1},			--暴伤宝石3级	割裂
				{id = 20307,	prob = 06 * 2,	num = 1},			--免暴击宝石3级	钝厚
				{id = 20317,	prob = 06 * 2,	num = 1},			--减暴伤宝石3级	结晶
				{id = 35681,	prob = 3500,	num = 1},					--紫色灵能
				{id = 48444,	prob = 1000,	num = 1},					--紫色玄能
			}

			local RequiredValue = 145	--有几率获得多个物品的活跃度门槛
			local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122)	--取得本周活跃度数值
			local rateTable = 			-- 几率表	【数量倍率】 = 几率*100
			{
				[1] = 85,	[2] = 12,	[3] = 3,
			}

			-- 计算物品概率之和
			local totalItemRand = 0
			for k,v in ipairs(itemID) do
				totalItemRand = math.floor(totalItemRand + v.prob)
			end
			--	随机出应该奖励哪个物品
			local SelectedItem
			local num
			math.randomseed(os.time())
			local rand1 = math.random(1, totalItemRand)
			local tempSum = 0
			for k,v in ipairs(itemID) do
				tempSum = tempSum + v.prob
				if rand1 <= tempSum then
					SelectedItem = v.id
					num = v.num
					break
				end
			end
			-- 活跃度大于等于145时，有几率获得多个物品,随机出倍率
			if iCount >= RequiredValue then
				math.randomseed(os.time())
				local iRandomNum = math.random(1, 100)
				local totalRand = 0
				for k,v in ipairs(rateTable) do
					totalRand = totalRand + v
					if iRandomNum <= totalRand then
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, SelectedItem, k * num, false)
						break
					end
				end
			else
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, SelectedItem, num, true)
			end
		end
		return 0
   	end
}
