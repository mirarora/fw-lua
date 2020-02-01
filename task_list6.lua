---------------------------------------------------------------
--  created:   2012.11.30
--
--  内容：任务脚本文件。

---------------------------------------------------------------
----	脚本任务列表：by ZangChunyu

----	1st edition:	2013-7-13
---------------------------------------------------------------
-- 目录
-- TaskList[16765] = --狮心骑士团训练营20级·清除副本进度
-- TaskList[16777] = --狮心骑士团训练营20级·检测玩家状态的脚本任务

--*********************************************************
--具体任务脚本
--*********************************************************

TaskList[16765] = --狮心骑士团训练营20级·清除副本进度
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
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
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			return 0	--返回0时为？？？，其他为显示的值
		end
		,
		-- 绑定钱
		Gold = function(TASKINTERFACE_POINTER)
			return 0	--返回0时为？？？，其他为显示的值
		end
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
		local COMMANDER_NAME = 4708700;	--副本commander注册名
		local MSG_LIST = {
			INSTANCE_RESET	= 22;	--玩家用道具重置了副本进度
		};
		--需要清空次数的任务
		local RESET_LIST = {
			RESET_TASK_01_FORMATION 		= 16712;	--日常队列练习
			RESET_TASK_02_CHALLENGE 		= 16713;	--闯关任务
			RESET_TASK_03_FINISH_FORMATION 	= 16715;	--完成日常的隐藏任务
			RESET_TASK_10_SCORE				= 16779;	--记录通关进度
		};
		--需要清空结果任务id
		local CLEAR_LIST = {
			CLEAR_TASK_01_WEAPON 		= 16767;	--死亡或战斗超时，触发领取装备
			CLEAR_TASK_101_WARRIOR 		= 16768;	--战士武器发放
			CLEAR_TASK_102_MAGE 		= 16769;	--法师武器发放
			CLEAR_TASK_103_PRIEST 		= 16770;	--牧师武器发放
			CLEAR_TASK_104_ASSASSIN		= 16771;	--刺客武器发放
			CLEAR_TASK_105_MARKSMAN		= 16772;	--火枪手武器发放
			CLEAR_TASK_106_PROTECTOR	= 16773;	--守护者武器发放
			CLEAR_TASK_107_VAMPIRE		= 16774;	--血魔武器发放
			CLEAR_TASK_108_BARD			= 16775;	--吟游诗人武器发放
			CLEAR_TASK_109_STRIKER		= 16859;	--血袭者武器发放
			CLEAR_TASK_11_STAGE_01		= 16781;	--第1关
			CLEAR_TASK_12_STAGE_02		= 16782;	--第2关
			CLEAR_TASK_13_STAGE_03		= 16783;	--第3关
			CLEAR_TASK_14_STAGE_04		= 16784;	--第4关
			CLEAR_TASK_15_STAGE_05		= 16785;	--第5关
			CLEAR_TASK_16_STAGE_06		= 16786;	--第6关
			CLEAR_TASK_17_STAGE_07		= 16787;	--第7关
			CLEAR_TASK_18_STAGE_08		= 16788;	--第8关
			CLEAR_TASK_19_STAGE_09		= 16789;	--第9关
			CLEAR_TASK_20_STAGE_10		= 16790;	--第10关
			CLEAR_TASK_21_GRADUATE		= 16801;	--毕业典礼
			CLEAR_TASK_22_INTRO			= 16806;	--引导任务，教玩家如何强化
		};
   		if bSuccess then
			-- 20 处理zangchunyu每周狮心骑士团副本挑战任务的清空
			local tasksLionHeart = 	{ 16781,16782,16783,16784,16785,16786,16787,16788,16789,16790 }
			for k,v in ipairs(tasksLionHeart) do
				TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
				TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
			end
			--清除结果（不包括完成次数）
			for i, v in pairs( CLEAR_LIST ) do
				TaskCApi.ClearFinishRecords( TASKINTERFACE_POINTER, v );
			end
			--清除次数
			for i, v in pairs( RESET_LIST ) do
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList( TASKINTERFACE_POINTER, v );
			end
			TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MSG_LIST.INSTANCE_RESET, 1 );
   		end
   		return 0
   	end
}

TaskList[16777] = --狮心骑士团训练营20级·检测玩家状态的脚本任务
{
  	Property =
  	{
  		--bRecordFinish = true,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
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
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			return 0	--返回0时为？？？，其他为显示的值
		end
		,
		-- 绑定钱
		Gold = function(TASKINTERFACE_POINTER)
			return 0	--返回0时为？？？，其他为显示的值
		end
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
		local MESSAGE = {
			TASK_01_WEAPON	= 13;		--脚本任务查询：是否已经完成发放武器前置任务
			TASK_101_WARRIOR 	= 14;	--战士武器发放
			TASK_102_MAGE 		= 15;	--法师武器发放
			TASK_103_PRIEST 	= 16;	--牧师武器发放
			TASK_104_ASSASSIN	= 17;	--刺客武器发放
			TASK_105_MARKSMAN	= 18;	--火枪手武器发放
			TASK_106_PROTECTOR	= 19;	--守护者武器发放
			TASK_107_VAMPIRE	= 20;	--血魔武器发放
			TASK_108_BARD		= 21;	--吟游诗人武器发放
			TASK_109_STRIKER	= 31;	--血袭者武器发放	【*】
			TASK_02_SCORE		= 23;	--检查玩家通关进度
		};
		--查询所需任务id
		local CHK_ID = {
			TASK_01_WEAPON = 16767;		--死亡或战斗超时，触发领取装备
			TASK_101_WARRIOR 	= 16768;	--战士武器发放
			TASK_102_MAGE 		= 16769;	--法师武器发放
			TASK_103_PRIEST 	= 16770;	--牧师武器发放
			TASK_104_ASSASSIN	= 16771;	--刺客武器发放
			TASK_105_MARKSMAN	= 16772;	--火枪手武器发放
			TASK_106_PROTECTOR	= 16773;	--守护者武器发放
			TASK_107_VAMPIRE	= 16774;	--血魔武器发放
			TASK_108_BARD		= 16775;	--吟游诗人武器发放
			TASK_109_STRIKER	= 16859;	--血袭者武器发放	【*】
			TASK_02_SCORE		= 16779;	--记录玩家通关进度
		};
		local COMMANDER_NAME = 4708700;

		local bWeaponTaskGranted = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_01_WEAPON, true );		--是否已发放武器领取前置任务
		local bWarrior = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_101_WARRIOR, true );
		local bMage = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_102_MAGE, true );
		local bPriest = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_103_PRIEST, true );
		local bAssassin = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_104_ASSASSIN, true );
		local bMarksman = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_105_MARKSMAN, true );
		local bProtector = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_106_PROTECTOR, true );
		local bVampire = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_107_VAMPIRE, true );
		local bBard = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_108_BARD, true );
		local bStriker = TaskCApi.HasTaskInFinsihTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_109_STRIKER, true );

		local iScore = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList( TASKINTERFACE_POINTER, CHK_ID.TASK_02_SCORE );		--获取任务完成次数

   		if bSuccess then
			TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_02_SCORE, iScore );

			if bWeaponTaskGranted then
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_01_WEAPON, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_01_WEAPON, 0 );
			end

			if bWarrior then	--1
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_101_WARRIOR, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_101_WARRIOR, 0 );
			end
			if bMage then	--2
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_102_MAGE, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_102_MAGE, 0 );
			end
			if bPriest then	--3
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_103_PRIEST, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_103_PRIEST, 0 );
			end
			if bAssassin then	--4
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_104_ASSASSIN, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_104_ASSASSIN, 0 );
			end
			if bMarksman then	--5
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_105_MARKSMAN, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_105_MARKSMAN, 0 );
			end
			if bProtector then	--6
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_106_PROTECTOR, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_106_PROTECTOR, 0 );
			end
			if bVampire then	--7
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_107_VAMPIRE, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_107_VAMPIRE, 0 );
			end
			if bBard then	--8
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_108_BARD, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_108_BARD, 0 );
			end
			if bStriker then	--9	血袭者
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_109_STRIKER, 1 );
			else
				TaskCApi.SendAIEvent( TASKINTERFACE_POINTER, COMMANDER_NAME, MESSAGE.TASK_109_STRIKER, 0 );
			end
   		end
   		return 0
   	end
}

