---------------------------------------------------------------
--  created:   2012.11.30
--
--  内容：任务脚本文件。


---------------------------------------------------------------
----	脚本任务列表：by zhaotao

----	1st edition:	2010.6.8
---------------------------------------------------------------
-----------------------------
--试炼二章脚本任务,id 15948--15953
--2012.11.28 Created by 赵涛
-----------------------------
--TaskList={}			--只是为了编译能过...必须注掉~
-----------------------------
TaskList[15948] =		--试炼二章玩家1奖励脚本任务
{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then
			local TaskBeliefAdjust = {
			[60]=100,[61]=110,[62]=120,[63]=130,[64]=140,
			[65]=150,[66]=160,[67]=170,[68]=180,[69]=190,
			[70]=200,[71]=210,[72]=220,[73]=230,[74]=240,
			[75]=250,[76]=260,[77]=270,[78]=280,[79]=290,
			[80]=300,[81]=310,[82]=320,[83]=330,[84]=340,
			[85]=350,[86]=360,[87]=370,[88]=380,[89]=390,
			[90]=400,
			}
			local player_level 		= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local basic_belief 		= 450*TaskBeliefAdjust[player_level]
			local basic_exp			= 400*TaskExpAdjust[player_level]

			local Activity_value 	= TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,180313)
			local Activity_belief 	= 450*TaskBeliefAdjust[player_level]
			local Activity_exp		= 400*TaskExpAdjust[player_level]
			Activity_value = Activity_value /300
			if Activity_value >1 then Activity_value = 1 end
			Activity_belief = math.floor(Activity_belief 	* Activity_value)
			Activity_exp	= math.floor(Activity_exp 		* Activity_value)
			local iItemID = 45649
			local double = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID, true)
			if double >= 1 then double =1 else double = 0 end
			if double == 1 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID, 1)		--收取1个双倍物品

			end

			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,(basic_belief+Activity_belief)*(1+double), true)		--发放信仰值:(基础+活跃)*(1+是否双倍)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,(basic_exp+Activity_exp)*(1+double))

			if Activity_value>=1 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15958)
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15959)
			end
		end

		return 0	--这个return值似乎没有实际意义？
	end

}


TaskList[15949] =		--试炼二章玩家2奖励脚本任务
{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then
			local TaskBeliefAdjust = {
			[60]=100,[61]=110,[62]=120,[63]=130,[64]=140,
			[65]=150,[66]=160,[67]=170,[68]=180,[69]=190,
			[70]=200,[71]=210,[72]=220,[73]=230,[74]=240,
			[75]=250,[76]=260,[77]=270,[78]=280,[79]=290,
			[80]=300,[81]=310,[82]=320,[83]=330,[84]=340,
			[85]=350,[86]=360,[87]=370,[88]=380,[89]=390,
			[90]=400,
			}
			local player_level 		= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local basic_belief 		= 450*TaskBeliefAdjust[player_level]
			local basic_exp			= 400*TaskExpAdjust[player_level]

			local Activity_value 	= TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,180314)
			local Activity_belief 	= 450*TaskBeliefAdjust[player_level]
			local Activity_exp		= 400*TaskExpAdjust[player_level]
			Activity_value = Activity_value /300
			if Activity_value >1 then Activity_value = 1 end
			Activity_belief = math.floor(Activity_belief 	* Activity_value)
			Activity_exp	= math.floor(Activity_exp 		* Activity_value)
			local iItemID = 45649
			local double = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID, true)
			if double >= 1 then double =1 else double = 0 end
			if double == 1 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID, 1)		--收取1个双倍物品

			end

			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,(basic_belief+Activity_belief)*(1+double), true)		--发放信仰值:(基础+活跃)*(1+是否双倍)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,(basic_exp+Activity_exp)*(1+double))

			if Activity_value>=1 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15958)
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15959)
			end
		end

		return 0	--这个return值似乎没有实际意义？
	end,

}

TaskList[15950] =		--试炼二章玩家3奖励脚本任务
{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then
			local TaskBeliefAdjust = {
			[60]=100,[61]=110,[62]=120,[63]=130,[64]=140,
			[65]=150,[66]=160,[67]=170,[68]=180,[69]=190,
			[70]=200,[71]=210,[72]=220,[73]=230,[74]=240,
			[75]=250,[76]=260,[77]=270,[78]=280,[79]=290,
			[80]=300,[81]=310,[82]=320,[83]=330,[84]=340,
			[85]=350,[86]=360,[87]=370,[88]=380,[89]=390,
			[90]=400,
			}
			local player_level 		= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local basic_belief 		= 450*TaskBeliefAdjust[player_level]
			local basic_exp			= 400*TaskExpAdjust[player_level]

			local Activity_value 	= TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,180315)
			local Activity_belief 	= 450*TaskBeliefAdjust[player_level]
			local Activity_exp		= 400*TaskExpAdjust[player_level]
			Activity_value = Activity_value /300
			if Activity_value >1 then Activity_value = 1 end
			Activity_belief = math.floor(Activity_belief 	* Activity_value)
			Activity_exp	= math.floor(Activity_exp 		* Activity_value)
			local iItemID = 45649
			local double = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID, true)
			if double >= 1 then double =1 else double = 0 end
			if double == 1 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID, 1)		--收取1个双倍物品

			end

			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,(basic_belief+Activity_belief)*(1+double), true)		--发放信仰值:(基础+活跃)*(1+是否双倍)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,(basic_exp+Activity_exp)*(1+double))


			if Activity_value>=1 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15958)
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15959)
			end
		end

		return 0	--这个return值似乎没有实际意义？
	end,

}


TaskList[15951] =		--试炼二章玩家4奖励脚本任务
{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then
			local TaskBeliefAdjust = {
			[60]=100,[61]=110,[62]=120,[63]=130,[64]=140,
			[65]=150,[66]=160,[67]=170,[68]=180,[69]=190,
			[70]=200,[71]=210,[72]=220,[73]=230,[74]=240,
			[75]=250,[76]=260,[77]=270,[78]=280,[79]=290,
			[80]=300,[81]=310,[82]=320,[83]=330,[84]=340,
			[85]=350,[86]=360,[87]=370,[88]=380,[89]=390,
			[90]=400,
			}
			local player_level 		= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local basic_belief 		= 450*TaskBeliefAdjust[player_level]
			local basic_exp			= 400*TaskExpAdjust[player_level]

			local Activity_value 	= TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,180316)
			local Activity_belief 	= 450*TaskBeliefAdjust[player_level]
			local Activity_exp		= 400*TaskExpAdjust[player_level]
			Activity_value = Activity_value /300
			if Activity_value >1 then Activity_value = 1 end
			Activity_belief = math.floor(Activity_belief 	* Activity_value)
			Activity_exp	= math.floor(Activity_exp 		* Activity_value)
			local iItemID = 45649
			local double = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID, true)
			if double >= 1 then double =1 else double = 0 end
			if double == 1 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID, 1)		--收取1个双倍物品

			end

			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,(basic_belief+Activity_belief)*(1+double), true)		--发放信仰值:(基础+活跃)*(1+是否双倍)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,(basic_exp+Activity_exp)*(1+double))

			if Activity_value>=1 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15958)
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15959)
			end
		end

		return 0	--这个return值似乎没有实际意义？
	end,

}

TaskList[15952] =		--试炼二章玩家5奖励脚本任务
{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then
			local TaskBeliefAdjust = {
			[60]=100,[61]=110,[62]=120,[63]=130,[64]=140,
			[65]=150,[66]=160,[67]=170,[68]=180,[69]=190,
			[70]=200,[71]=210,[72]=220,[73]=230,[74]=240,
			[75]=250,[76]=260,[77]=270,[78]=280,[79]=290,
			[80]=300,[81]=310,[82]=320,[83]=330,[84]=340,
			[85]=350,[86]=360,[87]=370,[88]=380,[89]=390,
			[90]=400,
			}
			local player_level 		= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local basic_belief 		= 450*TaskBeliefAdjust[player_level]
			local basic_exp			= 400*TaskExpAdjust[player_level]

			local Activity_value 	= TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,180317)
			local Activity_belief 	= 450*TaskBeliefAdjust[player_level]
			local Activity_exp		= 400*TaskExpAdjust[player_level]
			Activity_value = Activity_value /300
			if Activity_value >1 then Activity_value = 1 end
			Activity_belief = math.floor(Activity_belief 	* Activity_value)
			Activity_exp	= math.floor(Activity_exp 		* Activity_value)
			local iItemID = 45649
			local double = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID, true)
			if double >= 1 then double =1 else double = 0 end
			if double == 1 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID, 1)		--收取1个双倍物品

			end

			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,(basic_belief+Activity_belief)*(1+double), true)		--发放信仰值:(基础+活跃)*(1+是否双倍)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,(basic_exp+Activity_exp)*(1+double))

			if Activity_value>=1 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15958)
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15959)
			end
		end

		return 0	--这个return值似乎没有实际意义？
	end,

}

TaskList[15953] =		--试炼二章玩家6奖励脚本任务
{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then
			local TaskBeliefAdjust = {
			[60]=100,[61]=110,[62]=120,[63]=130,[64]=140,
			[65]=150,[66]=160,[67]=170,[68]=180,[69]=190,
			[70]=200,[71]=210,[72]=220,[73]=230,[74]=240,
			[75]=250,[76]=260,[77]=270,[78]=280,[79]=290,
			[80]=300,[81]=310,[82]=320,[83]=330,[84]=340,
			[85]=350,[86]=360,[87]=370,[88]=380,[89]=390,
			[90]=400,
			}
			local player_level 		= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local basic_belief 		= 450*TaskBeliefAdjust[player_level]
			local basic_exp			= 400*TaskExpAdjust[player_level]

			local Activity_value 	= TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,180318)
			local Activity_belief 	= 450*TaskBeliefAdjust[player_level]
			local Activity_exp		= 400*TaskExpAdjust[player_level]
			Activity_value = Activity_value /300
			if Activity_value >1 then Activity_value = 1 end
			Activity_belief = math.floor(Activity_belief 	* Activity_value)
			Activity_exp	= math.floor(Activity_exp 		* Activity_value)
			local iItemID = 45649
			local double = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemID, true)
			if double >= 1 then double =1 else double = 0 end
			if double == 1 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemID, 1)		--收取1个双倍物品

			end

			TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,(basic_belief+Activity_belief)*(1+double), true)		--发放信仰值:(基础+活跃)*(1+是否双倍)
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,(basic_exp+Activity_exp)*(1+double))


			if Activity_value>=1 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15958)
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15959)
			end
		end

		return 0	--这个return值似乎没有实际意义？
	end,

}



TaskList[16370] =		--圣域遗迹发放216000点信仰奖励任务

{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then

			local player_level 		= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			if player_level >=80 then
				TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,216000, true)		--发放信仰值

			end
		end

		return 0	--这个return值似乎没有实际意义？
	end

}



TaskList[16371] =		--圣域遗迹发放540000点信仰奖励任务

{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then

			local player_level 		= TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			if player_level >=80 then
				TaskCApi.DeliverBelief(TASKINTERFACE_POINTER,540000, true)		--发放信仰值

			end
		end

		return 0	--这个return值似乎没有实际意义？
	end

}


TaskList[16723] = --为任务ID16723:公会-酒吧-周常,收取烹饪物品.
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成

  		bCanRedoAfterFailure = true,--失败可重复完成


  		bCanGiveUp = true,--可放弃

  		bShowPrompt = true,--显示系统提示
  		bCanSeekOut = true,--允许被查找


  		bRecordFinishCount = true,--记录完成次数
		iMaxFinishCount = 7,--最大完成次数为7
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,--每周清空
		iClearFinishCountDay = 1,		--表示清空时间的星期，只对周清空方式有用且必须填写，范围为[1,7]，7表示星期日，1表示星期一，依次类推

		iClearFinishCountHour = 0,		--表示清空时间的小时，范围为[0,23]
		iClearFinishCountMin = 0,		--表示清空时间的分钟，范围为[0,59]

  		iType  = TaskType.HuoDong,--任务类型：活动

  		iTopic = TaskTopic.YiBan,--一般主题任务

  	}
   	,

	-- 成功时有效


	AwardPreview =
	{
		-- 经验
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 250									--经验奖励系数
			local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16723)
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = math.floor(AwardExpAdjust * AwardMulti * math.pow(1.2,times))		--每次完成都比上一次多获得20%经验
			return AwardExp--返回0时为？？？，其他为显示的值

		end
		,
		SideOccupExp = function(TASKINTERFACE_POINTER)		--发放副职业经验

			local soe = {}
			soe = {
				SOE1 = {ID = 1, EXP = 200},
			--id为副职业id,exp为数值,exp为0显示？？？

			}
			return soe
		end	,

		BindMoney = function(TASKINTERFACE_POINTER)			--发魂币

			local AwardMulti = 750									--奖励系数
			local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16723)
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardMoneyAdjust = TaskMoneyAdjust[PlayerLevel] 		--玩家金钱的修正经验

			local AwardBindMoney = math.floor(AwardMoneyAdjust * AwardMulti * math.pow(1.2,times))		--每次完成都比上一次多获得20%魂币
			return AwardBindMoney--返回0时为？？？，其他为显示的值

		end	,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 4 --公会贡献度

			factionaward.credit = 4  --公会功勋
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
		--local OpenVacationId = { 0,1,5,6,}--当前开放的可收取物品的副职业id，可扩展
   		return 0

   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local OpenVacationId = { 0,1,5,6,}--当前开放的可收取物品的副职业id，可扩展
		local ChargeItems = {

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

				},
			[2]= {
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

				},
			[3] = {
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
				},
			[4] = {
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

				},
			[5] = {
				--烹饪5阶(5.18更新版本。1206修改黄沙蛋糕改为蜘蛛蛋卷13439，1208由于不更客户端，改回来)
				12241,--美味花鳍鱼

				12244,--海鲜煎蛋卷

				13439,--蜘蛛蛋卷,原先为黄沙蛋糕

				12259,--香烤熊肋排

				12247,--麻辣野味大餐

				9758,--萨提洛斯葡萄酒

				17085,--粉红诱惑
				17086,--菊花酿

				17087,--黑月秘酿
				11688,--银莲酒

				},
				--烹饪6阶（1206修改黄沙蛋糕改为蜘蛛蛋卷13439，1208由于不更客户端，改回来)
			[6] = {
				12244,--海鲜煎蛋卷

				13439,--蜘蛛蛋卷,原先为黄沙蛋糕

				12259,--香烤熊肋排

				12247,--清炒紫苜蓿

				9758, --尼索葡萄酒


				17085,--粉红诱惑
				17086,--菊花酿

				17087,--黑月密酿
				13439,--蜘蛛蛋卷,原先为丛林大杂烩
				17086,--菊花酿

				},
				--烹饪7阶(2011.3.17扩展）

			[7] = {
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
				},
				--烹饪8阶

			[8] = {
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
		}

		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)
		local day = math.floor((os.time()-RoleCreateTime)/86400)		--现在-创建的天数差

		local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16723)
		--local Rand  = math.random(table.getn(ChargeItems[times+1]))
		local Rand  = ( day % table.getn(ChargeItems[times+1]) ) + 1		--天数差/表元素数目取余,结果再+1

		local NeedItemId = ChargeItems[times+1][Rand]											--需要的物品id

		local  key1,key2 --物品id存储方法 key1=id/200,key2=id%200,id=key1+key2
		key1 = math.floor(NeedItemId / 200)
		key2 = NeedItemId % 200

		--设置随机数


		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16723, 1, 1)		--存储副职业种类

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16723, 2, 1)		--存储副职业等级


		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16723, 3, key1)				--存储物品id/200
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16723, 4, key2)				--存储物品id%200

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16723, 3)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16723, 4)
		local NeedItemId = key1 * 200 + key2						--解析出收取物品id
		Method.CollectItem = { Item1={ID=NeedItemId, Num=100, Common=true},}
   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16723, 3)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16723, 4)
		local ChargeItemId = key1 * 200 + key2						--解析出收取物品id
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,ChargeItemId, true) >= 100 then
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

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		--变量1号副职业种类，2号副职业等级，3号4号为物品id（3号变量值*200+4号变量值）
		local AwardMulti = 250									--经验奖励系数,金钱x3
		local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16723)-1
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

		local AwardExp = math.floor(AwardExpAdjust * AwardMulti * math.pow(1.2,times))		--每次完成都比上一次多获得20%经验
		local AwardMoneyAdjust = TaskMoneyAdjust[PlayerLevel] 		--玩家金钱的修正经验

		local AwardBindMoney = math.floor(AwardMoneyAdjust * AwardMulti * math.pow(1.2,times)*3)		--每次完成都比上一次多获得20%魂币
		local ChargeItemId	= 200 * ucRandomNum3 + ucRandomNum4

		if bSuccess then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, ChargeItemId, 100)    	--收取普通物品100个


			TaskCApi.DeliverSideOccupExp (TASKINTERFACE_POINTER, 1, 200)--给玩家发放副职业经验,烹饪是1
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExp)--给玩家发放经验

			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,AwardBindMoney)	--发魂币

			--发放工会贡献度4点

			TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, 4)
			--发放功勋4点

			TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, 4)
			--TaskCApi.DeliverVitality(TASKINTERFACE_POINTER, 30)
			--TaskCApi.DeliverVigour(TASKINTERFACE_POINTER, 30)
   		end

   		return 0
   	end
}



TaskList[16724] = --为任务ID16724:公会-炼金-周常
{
  	Property =
  	{
  		bCanRedo = true,--成功可重复完成

  		bCanRedoAfterFailure = true,--失败可重复完成


  		bCanGiveUp = true,--可放弃

  		bShowPrompt = true,--显示系统提示
  		bCanSeekOut = true,--允许被查找


  		bRecordFinishCount = true,--记录完成次数
		iMaxFinishCount = 7,--最大完成次数为7
  		iClearFinishCountType = TaskClearFinishCountType.Weekly,--每周清空
		iClearFinishCountDay = 1,		--表示清空时间的星期，只对周清空方式有用且必须填写，范围为[1,7]，7表示星期日，1表示星期一，依次类推

		iClearFinishCountHour = 0,		--表示清空时间的小时，范围为[0,23]
		iClearFinishCountMin = 0,		--表示清空时间的分钟，范围为[0,59]

  		iType  = TaskType.HuoDong,--任务类型：活动

  		iTopic = TaskTopic.YiBan,--一般主题任务

  	}
   	,

	-- 成功时有效


	AwardPreview =
	{

		-- 经验
		Exp = function(TASKINTERFACE_POINTER)

			local AwardMulti = 250									--经验奖励系数
			local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16724)
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

			local AwardExp = math.floor(AwardExpAdjust * AwardMulti * math.pow(1.2,times))		--每次完成都比上一次多获得20%经验
			return AwardExp--返回0时为？？？，其他为显示的值


		end
		,
		SideOccupExp = function(TASKINTERFACE_POINTER)			--发放副职业经验

			local soe = {}
			soe = {
				SOE1 = {ID = 0, EXP = 200},
				--id为副职业id,exp为数值,exp为0显示？？？

			}
			return soe
		end	,

		BindMoney = function(TASKINTERFACE_POINTER)			--发魂币

			local AwardMulti = 750									--奖励系数
			local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16724)
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

			local AwardMoneyAdjust = TaskMoneyAdjust[PlayerLevel] 		--玩家金钱的修正经验

			local AwardBindMoney = math.floor(AwardMoneyAdjust * AwardMulti * math.pow(1.2,times))		--每次完成都比上一次多获得20%魂币
			return AwardBindMoney--返回0时为？？？，其他为显示的值

		end	,

		-- 公会奖励相关
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 4 --公会贡献度

			factionaward.credit = 4 --公会功勋
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
		--local OpenVacationId = { 0,1,5,6,}--当前开放的可收取物品的副职业id，可扩展
   		return 0

   	end
   	,

   	--玩家接收该任务时调用
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local OpenVacationId = { 0,1,5,6,}--当前开放的可收取物品的副职业id，可扩展
		local ChargeItems = {
			--炼金001-080
			[1] = {
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
				},
			[2] = {
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
				},
			[3] = {
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
				},
			[4] = {
				--炼金4阶31-40
				9424,    --初级生命之源
				9425,    --初级魔法之泉
				21105,   --太阳之心
				21109,   --太阳之辉
				9704,    --次级佐餐药剂
				9705,    --次级助酒药剂
				},
			[5] = {
				--炼金5阶41-50
				21638,--5级炼金瞬回生命药水(纯净之心)
				21642,--5级炼金瞬回魔法药水(纯净之辉)
				9719,--中效佐餐药剂
				9720,--中效助酒药剂
				9647,--低效生命药剂
				9648,--低效魔力药剂
				},
			[6] = {
				--炼金6阶51-60
				9428,--次级生命之源
				9429,--次级魔法之泉
				9729,--佐餐药剂
				9730,--助酒药剂
				21639,--梦境之心
				21643,--梦境之辉

				},
			[7] = {
				--炼金7阶61-70
				9430,	--中效生命药剂
				9431,	--中效魔力药剂
				30987,	--强效佐餐药剂
				30988,	--强效助酒药剂
				21640,	--绿镜之心
				21644,	--绿镜之辉
				},
			[8] = {
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
		}


		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)
		local day = math.floor((os.time()-RoleCreateTime)/86400)		--现在-创建的天数差

		local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16724)
		--local Rand  = math.random(table.getn(ChargeItems[times+1]))
		local Rand  = ( day % table.getn(ChargeItems[times+1]) ) + 1		--天数差/表元素数目取余,结果再+1

		local NeedItemId = ChargeItems[times+1][Rand]											--需要的物品id


		local  key1,key2 --物品id存储方法 key1=id/200,key2=id%200,id=key1+key2
		key1 = math.floor(NeedItemId / 200)
		key2 = NeedItemId % 200

		--设置随机数


		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16724, 1, 0)		--存储副职业种类

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16724, 2, 0)	--存储副职业等级


		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16724, 3, key1)				--存储物品id/200
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,16724, 4, key2)				--存储物品id%200

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16724, 3)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16724, 4)

		local NeedItemId = key1 * 200 + key2						--解析出收取物品id

		Method.CollectItem = { Item1={ID=NeedItemId, Num=100, Common=true},}

   		return Method
   	end
   	,

   	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16724, 3)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16724, 4)
		local ChargeItemId = key1 * 200 + key2						--解析出收取物品id

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,ChargeItemId, true) >= 100 then
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

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		--变量1号副职业种类，2号副职业等级，3号4号为物品id（3号变量值*200+4号变量值）

		local AwardMulti = 250										--经验奖励系数,金钱x3
		local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16724)-1
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--取得玩家等级，发奖励用

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--玩家等级的修正经验

		local AwardExp = math.floor(AwardExpAdjust * AwardMulti * math.pow(1.2,times))		--每次完成都比上一次多获得20%经验
		local AwardMoneyAdjust = TaskMoneyAdjust[PlayerLevel] 		--玩家金钱的修正经验

		local AwardBindMoney = math.floor(AwardMoneyAdjust * AwardMulti * math.pow(1.2,times)*3)		--每次完成都比上一次多获得20%魂币
		local ChargeItemId	= 200 * ucRandomNum3 + ucRandomNum4

		if bSuccess then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, ChargeItemId, 100)    	--收取普通物品100个


			TaskCApi.DeliverSideOccupExp(TASKINTERFACE_POINTER,0,200)--给玩家发放副职业经验,炼金是0
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExp)--给玩家发放经验

			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, AwardBindMoney)		--发魂币

			--发放工会贡献度4点

			TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, 4)
			--发放功勋4点

			TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, 4)
			--TaskCApi.DeliverVitality(TASKINTERFACE_POINTER, 30)
			--TaskCApi.DeliverVigour(TASKINTERFACE_POINTER, 30)
   		end

   		return 0
   	end
}
TaskList[16958] =		--圣域遗迹日常附带的为公会建筑服务的抽奖任务

{
	Property = {					--存放任务属性表
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,
  		bShowPrompt = false,
  		bCanSeekOut = false,
		bFinishWhenDelvier = true,
		bHiddenTask=true,
	},
	AwardPreview = {				--奖励预览配置，仅用于客户端,是一张表

	},


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

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
							iWaitTime = 0
		}
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		--TASK_NO_FINISH   = 0 --未完成

		--TASK_SUCC_FINISH = 1 --成功完成
		--TASK_FAIL_FINISH = 2 --失败完成

		return TASK_SUCC_FINISH
	end,

	OnCheckAward = function(TASKINTERFACE_POINTER,bSuccess)		--检查发奖时调用,安全性检查

		if bSuccess then
   	    	--if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --普通包裹栏需要1格，最基本的检查,这个任务不收物品就不查了
   			--   return TASK_PREREQU_FAIL_GIVEN_ITEM
			--end
		end
   		return 0	--这个return值似乎没有实际意义？
	end,

	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)			--完成该任务时调用
		--这里执行一些完成任务发放实际奖励的操作，

		if bSuccess then
			local award_table = {
			[1] = {
				[1] = {id = {42089,},	num = 1,	ratio = 0.945},
				[2] = {id = {42089,},	num = 2,	ratio = 0.04},
				[3] = {id = {42089,},	num = 5,	ratio = 0.01},
				[4] = {id = {42089,},	num = 10,	ratio = 0.005},
				[5] = {id = {39478,},	num = 1,	ratio = 0},
				[6] = {id = {39479,},	num = 1,	ratio = 0},
				[7] = {id = {39480,},	num = 1,	ratio = 0},
				},
			[2] = {
				[1] = {id = {42089,},	num = 1,	ratio = 0.89},
				[2] = {id = {42089,},	num = 2,	ratio = 0.08},
				[3] = {id = {42089,},	num = 5,	ratio = 0.02},
				[4] = {id = {42089,},	num = 10,	ratio = 0.01},
				[5] = {id = {39478,},	num = 1,	ratio = 0},
				[6] = {id = {39479,},	num = 1,	ratio = 0},
				[7] = {id = {39480,},	num = 1,	ratio = 0},
				},
			[3] = {
				[1] = {id = {42089,},	num = 1,	ratio = 0.75},
				[2] = {id = {42089,},	num = 2,	ratio = 0.16},
				[3] = {id = {42089,},	num = 5,	ratio = 0.04},
				[4] = {id = {42089,},	num = 10,	ratio = 0.02},
				[5] = {id = {39478,},	num = 1,	ratio = 0.01},
				[6] = {id = {39479,},	num = 1,	ratio = 0.01},
				[7] = {id = {39480,},	num = 1,	ratio = 0.01},
				},
			[4] = {
				[1] = {id = {42089,},	num = 1,	ratio = 0.645},
				[2] = {id = {42089,},	num = 2,	ratio = 0.16},
				[3] = {id = {42089,},	num = 5,	ratio = 0.08},
				[4] = {id = {42089,},	num = 10,	ratio = 0.04},
				[5] = {id = {39478,},	num = 1,	ratio = 0.025},
				[6] = {id = {39479,},	num = 1,	ratio = 0.025},
				[7] = {id = {39480,},	num = 1,	ratio = 0.025},
				},
			[5] = {
				[1] = {id = {42089,},	num = 1,	ratio = 0.50},
				[2] = {id = {42089,},	num = 2,	ratio = 0.20},
				[3] = {id = {42089,},	num = 5,	ratio = 0.10},
				[4] = {id = {42089,},	num = 10,	ratio = 0.05},
				[5] = {id = {39478,},	num = 1,	ratio = 0.05},
				[6] = {id = {39479,},	num = 1,	ratio = 0.05},
				[7] = {id = {39480,},	num = 1,	ratio = 0.05},
				},
			}
			local learned = TaskCApi.HasSkill(TASKINTERFACE_POINTER,5012)
			local skill_level = TaskCApi.GetSkillLev(TASKINTERFACE_POINTER,5012)
			if learned then
				local breakPoint = math.random()
				local chance = 0
				local tab = award_table[skill_level]
				local award_time = 0
				for i = 1, #tab do
					chance = chance + tab[i].ratio
					if breakPoint < chance  then
						local item_num  = #tab[i].id
						local iItemID	= tab[i].id[math.random(item_num)]
						local iItemNum = tab[i].num
						local bind = true
						if award_time<1 then
							for j = 1, iItemNum do
								TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iItemID, 1,bind)
							end
							award_time = award_time + 1
						end
					end
				end
			end
		end

		return 0	--这个return值似乎没有实际意义？
	end

}


TaskList[17265] = --新争抢武器重铸任务

{
	weapons = {
				50457,
				50458,
				50459,
				50460,
				50461,
				50462,
				50463,
				50464,
				50465,
				51355,
				51356,
				51357,
				51358,
				51359,
				51360,
				51361,
				51362,
				51363,
				51364,
				51365,
				51366,
				51367,
				51368,
				51369,
				51370,
				51371,
				51372,
				},

	Property =
  	{
		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bRecordFinishCount = false,
  		iType  = TaskType.ZhiXian,
  		iTopic = TaskTopic.YiBan
  	},

	AwardPreview = {},			--奖励预览配置，仅用于客户端,是一张表


	OnCheckDeliver = function(TASKINTERFACE_POINTER)	--任务发放检查,客户端在NPC显示、玩家确认接受时调用,服务器在响应发放时调用

		--[[local ItemNumInPacket = 0
		local Item_num = 0
		for i,v in pairs(weapons) do
			ItemNumInPacket = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,pairs(i), true)
			if ItemNumInPacket > Item_num then
				Item_num = ItemNumInPacket
			end

		end
		if ItemNumInPacket < 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end]]--
			--取包裹物品数量，挨个取个边


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

		local Method = {}
		Method.SubmitItem  = true
		return Method
	end,

	OnCheckFinish = function(TASKINTERFACE_POINTER)	--检查完成任务,在杀怪、拾取物品、每隔一定时间、发奖前调用,判定完成方式
		local iRet = TASK_NO_FINISH
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,17265)
		local CanReborn = false
		local index = 0
		local extra_item_num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,41995, true)	--荣耀之辉的数量

		local extra_item_num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,42275, true) --灵魂重铸能量的数量


		if itemIDSubmitted then
			for i,v in pairs(TaskList[17265].weapons) do
				if v==itemIDSubmitted then
					CanReborn = true
					index = i
				end
			end

			if CanReborn==true and extra_item_num1>=1600 and extra_item_num2>=1 then
				TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,17265, 1)
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,41995, 1600)
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,42275, 1)
				TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,17265, 1,index)
				iRet = TASK_SUCC_FINISH
			end
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

		if bSuccess then
			local index = ucRandomNum1
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[17265].weapons[index], 1,true)
		end

		return 0
	end,
}

