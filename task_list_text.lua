TaskListText[6835] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[6835][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[6835][2],

	--完成方式：与NPC对话
	TalkToNpcText      = TaskListTextString[6835][3],

	--完成方式：到达指定地点



	ReachSiteText      = TaskListTextString[6835][4],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 2,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[6835][5],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[6835][6],
						next_window = 2
					},

					{
						player_talk_text = TaskListTextString[6835][7],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

			[2] =
			{
				parent_window = 1,
				npc_talk_text = TaskListTextString[6835][8],
				num_option = 4,
				option =
				{
					{
						player_talk_text = TaskListTextString[6835][9],
						next_window = TaskService.NPC_GIVE_TASK,
						param = 2
					},

					{
						player_talk_text = TaskListTextString[6835][14],
						next_window = TaskService.NPC_GIVE_TASK,
						param = 1
					},

					{
						player_talk_text = TaskListTextString[6835][10],
						next_window = TaskService.TALK_RETURN
					},

					{
						player_talk_text = TaskListTextString[6835][11],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[6835][12],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[6835][13],
						next_window = TaskService.NPC_COMPLETE_TASK,
						param = 2
					},

					{
						player_talk_text = TaskListTextString[6835][15],
						next_window = TaskService.NPC_COMPLETE_TASK,
						param = 1
					},
				},
			},
		},
	},

}

TaskListText[3756] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[3756][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[3756][2],

	--完成方式：与NPC对话
	TalkToNpcText      = TaskListTextString[3756][3],

	--完成方式：到达指定地点



	ReachSiteText      = TaskListTextString[3756][4],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 2,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[3756][5],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[3756][6],
						next_window = 2
					},

					{
						player_talk_text = TaskListTextString[3756][7],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

			[2] =
			{
				parent_window = 1,
				npc_talk_text = TaskListTextString[3756][8],
				num_option = 4,
				option =
				{
					{
						player_talk_text = TaskListTextString[3756][9],
						next_window = TaskService.NPC_GIVE_TASK,
						param = 2
					},

					{
						player_talk_text = TaskListTextString[3756][14],
						next_window = TaskService.NPC_GIVE_TASK,
						param = 1
					},

					{
						player_talk_text = TaskListTextString[3756][10],
						next_window = TaskService.TALK_RETURN
					},

					{
						player_talk_text = TaskListTextString[3756][11],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[3756][12],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[3756][13],
						next_window = TaskService.NPC_COMPLETE_TASK,
						param = 2
					},

					{
						player_talk_text = TaskListTextString[3756][15],
						next_window = TaskService.NPC_COMPLETE_TASK,
						param = 1
					},
				},
			},
		},
	},

}

TaskListText[6717] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[6717][1],
}

TaskListText[7680] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[7680][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[7680][2],

	--完成方式：与NPC对话
	TalkToNpcText      = TaskListTextString[7680][3],

	--完成方式：到达指定地点



	ReachSiteText      = TaskListTextString[7680][4],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7680][5],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[7680][6],
						next_window = TaskService.NPC_GIVE_TASK
					},

				},
			},

		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7680][8],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[7680][9],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[7680][10],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},
}

TaskListText[7700] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[7700][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[7700][2],

	--完成方式：与NPC对话
	TalkToNpcText      = TaskListTextString[7700][3],

	--完成方式：到达指定地点



	ReachSiteText      = TaskListTextString[7700][4],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7700][5],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[7700][6],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[7700][7],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},

}

TaskListText[7787] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[7787][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[7787][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7787][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[7787][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[7787][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7787][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[7787][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[7787][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},



}
--[[
TaskListText[7892] =
{
	--任务描述
	TaskDescriptionText = TaskListTextString[7787][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[7787][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7787][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[7787][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[7787][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7787][6],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[7787][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},



}
]]--

TaskListText[7787] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[7787][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[7787][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7787][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[7787][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[7787][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[7787][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[7787][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[7787][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[8089] = {

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8089][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[8089][2],
						next_window = TaskService.NPC_GIVE_TASK
					},

				},
			},

		},
	},

}


TaskListText[8162] = { --少数诀活动
	--任务描述
	TaskDescriptionText = TaskListTextString[8162][61],

	--任务感谢辞


	TaskTributeText    = TaskListTextString[8162][62],

	--完成方式：与NPC对话
	TalkToNpcText      = TaskListTextString[8162][62],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8162][63],

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[8162][64],
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},

		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{

			[1] =
			{
				parent_window = -1,
				npc_talk_text = function()
					local value = TaskTextCApi.GetDataFromActiveTaskList(8162, 1)
					local QuesNum = (value-1)*3 + 1

					return TaskListTextString[8162][QuesNum]
					end,



				num_option = 3,
				option =
				{
					{
						player_talk_text = function()
								local value = TaskTextCApi.GetDataFromActiveTaskList(8162, 1)
								local AnsNum = (value-1)*3 + 2
								return TaskListTextString[8162][AnsNum]
							end,
						next_window = TaskService.NPC_COMPLETE_TASK,
						param = 1

					},

					{
						player_talk_text = function()
								local value = TaskTextCApi.GetDataFromActiveTaskList(8162, 1)
								local AnsNum = (value-1)*3 + 3
								return TaskListTextString[8162][AnsNum]
							end,
						next_window	= TaskService.NPC_COMPLETE_TASK,
						param = 2
					},

					{
						player_talk_text = TaskListTextString[8162][65],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}


TaskListText[8193] = { --少数诀活动后续A
	--任务描述
	TaskDescriptionText = TaskListTextString[8193][1],

	--任务感谢辞


	TaskTributeText    =  TaskListTextString[8193][2],

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{

			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8193][3],

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[8193][4],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[8194] = { --少数诀活动后续B
	--任务描述
	TaskDescriptionText = TaskListTextString[8194][1],

	--任务感谢辞


	TaskTributeText    = TaskListTextString[8194][2],

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{

			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8194][3],

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[8194][4],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[8204] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[8204][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[8204][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8204][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8204][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[8204][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8204][6],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[8204][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[8547] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[8547][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[8547][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8547][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8547][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[8547][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8547][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8547][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[8547][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[8548] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[8548][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[8548][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8548][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8548][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[8548][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8548][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8548][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[8548][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[8549] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[8549][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[8549][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8549][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8549][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[8549][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8549][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8549][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[8549][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}
TaskListText[8550] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[8550][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[8550][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8550][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8550][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[8550][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8550][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8550][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[8550][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}
TaskListText[8551] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[8551][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[8551][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8551][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8551][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[8551][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[8551][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[8551][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[8551][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[9619] = {	--xiao 社交家：我在克兰蒙多的日子
	--任务描述
	TaskDescriptionText = TaskListTextString[9619][4],
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[9619][1],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[9619][2],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[9619][3],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},

}

TaskListText[9706] = {	--自由港生活  by xiaozhiyu
	--任务描述
	TaskDescriptionText = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,9706, 1)
		local y = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,9706, 2)
		local ordernow = (200 * x + y) or 1
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,1)	--取得极效生活剩余次数
		local strPrefix = string.format(TaskListTextString[9706].Prefix,commonCount)
		return strPrefix..TaskListTextString[9706][ordernow + 10]
	end
	,
	--任务感谢辞
	TaskTributeText    = TaskListTextString[9706].BroadCast,
	--完成方式：完成特定任务n次
	CompleteTask      = TaskListTextString[9706].CompleteTaskCommon,
	--提交特定物品
	SubmitItemText	= function()
		local submitGroup = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,9706, 4)	--提交物品组编号
		local stringIdx = "SubmitItemText"..submitGroup
		return TaskListTextString[9706][stringIdx]
	end
	,
	--提交特定物品界面开场白
	SubmitItemPrologue = function()
		local submitGroup = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,9706, 4)	--提交物品组编号
		local stringIdx = "SubmitItemPrologue"..submitGroup
		return TaskListTextString[9706][stringIdx]
	end
	,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[9706].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[9706].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[9706].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[9706].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[9928] = {	--xiao 足迹-重复-40级
	--任务描述
	TaskDescriptionText = TaskListTextString[9928][1],
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[9928][2],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[9928][3],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[9928][4],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},

}

TaskListText[9927] = {
	--感谢辞
	TaskTributeText = TaskListTextString[9927][3],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[9927][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[9927][2],
						next_window = TaskService.NPC_GIVE_TASK
					},

				},
			},

		},
	},

}

TaskListText[10368] = {--2级花园公会基地任务
	--任务描述
	TaskDescriptionText = TaskListTextString[10368][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[10368][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10368][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10368][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[10368][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10368][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10368][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[10368][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}
TaskListText[10369] = {--2级炼金公会基地任务

	--任务描述
	TaskDescriptionText = TaskListTextString[10369][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[10369][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10369][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10369][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[10369][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10369][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10369][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[10369][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[10370] = {--2级渔场公会基地任务

	--任务描述
	TaskDescriptionText = TaskListTextString[10370][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[10370][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10370][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10370][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[10370][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10370][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10370][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[10370][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[10371] = {--2级酒吧公会基地任务

	--任务描述
	TaskDescriptionText = TaskListTextString[10371][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[10371][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10371][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10371][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[10371][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10371][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10371][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[10371][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[10444] = {--2级采矿公会基地任务

	--任务描述
	TaskDescriptionText = TaskListTextString[10444][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[10444][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10444][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10444][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[10444][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10444][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10444][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[10444][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[10445] = {--2级魔宠公会基地任务

	--任务描述
	TaskDescriptionText = TaskListTextString[10445][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[10445][2],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10445][3],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10445][4],
						next_window = TaskService.NPC_GIVE_TASK
					},

					{
						player_talk_text = TaskListTextString[10445][5],
						next_window	= TaskService.TALK_EXIT
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10445][6],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[10445][7],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[10445][8],
						next_window = TaskService.TALK_EXIT,
					},
				},
			},
		},
	},

}

TaskListText[9445] =  {--xiaozhiyu测试任务

	--任务描述
	TaskDescriptionText = function()
		local iTask = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,9445, 1)
		return	TaskListTextString[9445][iTask+10]
	end
	,
	--任务感谢辞
	TaskTributeText    = TaskListTextString[9445][5],
	--完成任务n次
	CompleteTask      = TaskListTextString[9445][6],
	--提交特定物品
	SubmitItemText	= TaskListTextString[9445][3],
	--提交特定物品界面开场白
	SubmitItemPrologue = TaskListTextString[9445][4],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[9445][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[9445][2],
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[9445][3],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[9445][4],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[10631] = { --个人幸运
	--任务描述
	TaskDescriptionText = function()
		local iTask = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10631, 1)
		local iColor = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10631, 2)				--绿色或蓝色

		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,2)	--取得幸运de活动计数
		local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,10631)	--取得自身的完成次数
		local todayCount = math.max(1,math.min(3-selfCount,commonCount%10))	--取得个人幸运今日剩余次数
		local stringText = TaskListTextString[10631][iTask+10]
		if iColor == 1 then
			stringText = TaskListTextString[10631][6]..stringText
		elseif iColor == 2 then
			stringText = TaskListTextString[10631][7]..stringText
		end
		stringText = string.format(TaskListTextString[10631].Prefix,todayCount)..stringText
		return	stringText
	end
	,
	--任务感谢辞
	TaskTributeText = TaskListTextString[10631][5]
	,

	--完成任务n次
	CompleteTask   = function()
		local iTask = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10631, 1)
		local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)	--幸运等级
		local text = TaskListTextString[10631][iTask+300]
		if luckGrade > 0 then
			text = "[+"..luckGrade.."]"..text
		end
		return	text
	end
	,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10631][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[10631][2],
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10631][3],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[10631][4],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},
}

TaskListText[10763] = { --日常-服务器幸运活动1
	--任务描述
	TaskDescriptionText = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 1)
		local y = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 2)
		local iTask = 200 * x + y
		return	TaskListTextString[10763][iTask]
	end
	,
	--任务感谢辞
	TaskTributeText = TaskListTextString[10763].broadcast
	,
	--完成任务n次
	CompleteTask   = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 1)
		local y = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10763, 2)
		local iTask = 200 * x + y
		local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)	--幸运等级
		local text = TaskListTextString[10763][iTask+500]
		if luckGrade > 0 then
			text = "[+"..luckGrade.."]"..text
		end
		return	text
	end
	,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10763].talk_to_give,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[10763].give_task,
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10763].talk_to_complete,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[10763].complete_task,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[10764] = { --日常-服务器幸运活动2
	--任务描述
	TaskDescriptionText = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 1)
		local y = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 2)
		local iTask = 200 * x + y
		return	TaskListTextString[10764][iTask]
	end
	,
	--任务感谢辞
	TaskTributeText = TaskListTextString[10764].broadcast
	,

	--完成任务n次
	CompleteTask   = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 1)
		local y = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,10764, 2)
		local iTask = 200 * x + y
		local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)	--幸运等级
		local text = TaskListTextString[10764][iTask+500]
		if luckGrade > 0 then
			text = "[+"..luckGrade.."]"..text
		end
		return	text
	end
	,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10764].talk_to_give,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[10764].give_task,
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},

		},
	},
	--任务奖励对话


	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[10764].talk_to_complete,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[10764].complete_task,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}



TaskListText[11265] = { --世界之树的嫩枝
	--任务描述
	TaskDescriptionText = function()
		local value = 1
		value = TaskTextCApi.GetDataFromActiveTaskList(11265, 1)

		return TaskListTextString[11265][value]
		end,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11265].DeliverTaskTalk_npc,

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11265].DeliverTaskTalk_player,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},

		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11265].AwardTalk_npc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11265].AwardTalk_player,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}



TaskListText[11303] = { --神赐节许愿卡
	--任务描述
	TaskDescriptionText = function()
		local value = 1
		value = TaskTextCApi.GetDataFromActiveTaskList(11303, 1)

		return TaskListTextString[11303][value]
		end,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11303].DeliverTaskTalk_npc,

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11303].DeliverTaskTalk_player,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},

		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11303].AwardTalk_npc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11303].AwardTalk_player,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}


TaskListText[11418] = { --噩梦游乐场续 第一关发奖

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11418][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11418][2],
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},
		},
	},

}


TaskListText[11419] = { --噩梦游乐场续 第二关发奖

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11419][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11419][2],
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},
		},
	},

}


TaskListText[11420] = { --噩梦游乐场续 第三关发奖

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11420][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11420][2],
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},
		},
	},

}


TaskListText[11421] = { --噩梦游乐场续 第四关发奖
	--感谢辞
	TaskTributeText = TaskListTextString[11421][3],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11421][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11421][2],
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},
		},
	},

}
TaskListText[11417] = { --试炼次数转补偿
	--任务感谢辞
	TaskTributeText    = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,11417, 1)
		x = x - 1
		local msg = TaskListTextString[11417].broadcast..x
		return msg
	end
	,
}

TaskListText[11757] = { --公会基地商城物品快捷完成基地任务并捐资金

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[11757][1],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[11757][2],
						next_window = TaskService.NPC_GIVE_TASK
					},

				},
			},

		},
	},

}

TaskListText[12244] = { --沉睡丛林探险家主任务：伟大的旅程
	--任务描述
	TaskDescriptionText = function()
		local value = 1
		value = TaskTextCApi.GetDataFromActiveTaskList(12244, 1)
		return TaskListTextString[12244][value]
	end
	,
	--完成特定任务
	CompleteTask = function()
		local value = 1
		value = TaskTextCApi.GetDataFromActiveTaskList(12244, 1)
		if value == 1 then
			return TaskListTextString[12244].CompleteTaskExplo
		else
			return TaskListTextString[12244].CompleteTaskFootstep
		end
	end
	,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12244].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12244].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12244].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12244].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}


TaskListText[12641] = { --12641灾域虚空－武器01
	--任务描述
	TaskDescriptionText = TaskListTextString[12641][1],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12641][2],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12641][3],
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12641][4],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12641][5],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}


TaskListText[12650] = { --12650灾域虚空－武器03
	--任务描述
	TaskDescriptionText = TaskListTextString[12650][1],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12650][2],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12650][3],
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--提交特定物品
	SubmitItemText	= function()
					local iOccupation = TaskTextCApi.GetDataFromActiveTaskList(12650, 1)

					return TaskListTextString[12650][iOccupation +5]
					end,

	--提交特定物品界面开场白
	SubmitItemPrologue = TaskListTextString[12650][14],

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12650][4],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12650][5],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[12666] = { --12666灾域虚空－帽子01
	--任务描述
	TaskDescriptionText = TaskListTextString[12666][1],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12666][2],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12666][3],
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12666][4],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12666][5],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}


TaskListText[12668] = { --12668灾域虚空－帽子03
	--任务描述
	TaskDescriptionText = TaskListTextString[12668][1],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12668][2],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12668][3],
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--提交特定物品
	SubmitItemText	= function()
					local iOccupation = TaskTextCApi.GetDataFromActiveTaskList(12668, 1)

					return TaskListTextString[12668][iOccupation +5]
					end,
	--提交特定物品界面开场白
	SubmitItemPrologue = TaskListTextString[12668][14],

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12668][4],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12668][5],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[12669] = { --12669灾域虚空－护肩01
	--任务描述
	TaskDescriptionText = TaskListTextString[12669][1],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12669][2],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12669][3],
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12669][4],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12669][5],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}


TaskListText[12671] = { --12671灾域虚空－护肩03
	--任务描述
	TaskDescriptionText = TaskListTextString[12671][1],


	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12671][2],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12671][3],
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--提交特定物品
	SubmitItemText	= function()
					local iOccupation = TaskTextCApi.GetDataFromActiveTaskList(12671, 1)

					return TaskListTextString[12671][iOccupation +5]
					end,
	--提交特定物品界面开场白
	SubmitItemPrologue = TaskListTextString[12671][14],

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12671][4],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12671][5],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}


TaskListText[12635] = { --四季合唱团-嘉铭,
	--任务描述
	TaskDescriptionText = function()
		return TaskListTextString[12635].Description
	end
	,
	--提交特定物品
	SubmitItemText	= function()
		return TaskListTextString[12635].SubmitItemText
	end
	,
	--提交特定物品界面开场白
	SubmitItemPrologue = function()
		return TaskListTextString[12635].SubmitItemPrologue
	end
	,
	--任务感谢辞
	TaskTributeText = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12635, 1)	--取得完美计次任务的当前次数
		x = x + 1
		local Str = string.format(TaskListTextString[12635].Broadcast,x)
		return Str
	end
	,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12635].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12635].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12635].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12635].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},
}


TaskListText[12634] = { --四季合唱团-真真,
	--任务描述
	TaskDescriptionText = function()
		return TaskListTextString[12634].Description
	end
	,
	--任务感谢辞
	TaskTributeText = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12634, 1)	--取得完美计次任务的当前次数
		x = x + 1
		local Str = string.format(TaskListTextString[12634].Broadcast,x)
		return Str
	end
	,
	--提交特定物品
	SubmitItemText	= function()
		return TaskListTextString[12634].SubmitItemText
	end
	,
	--提交特定物品界面开场白
	SubmitItemPrologue = function()
		return TaskListTextString[12634].SubmitItemPrologue
	end
	,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12634].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12634].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12634].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12634].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[12636] = { --四季合唱团-炀羽,
	--任务描述
	TaskDescriptionText = function()
		return TaskListTextString[12636].Description
	end
	,
	--任务感谢辞
	TaskTributeText = function()
		local x = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,12636, 1)	--取得完美计次任务的当前次数
		x = x + 1
		local Str = string.format(TaskListTextString[12636].Broadcast,x)
		return Str
	end
	,
	--提交特定物品
	SubmitItemText	= function()
		return TaskListTextString[12636].SubmitItemText
	end
	,
	--提交特定物品界面开场白
	SubmitItemPrologue = function()
		return TaskListTextString[12636].SubmitItemPrologue
	end
	,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12636].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12636].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12636].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12636].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[12760] = { --12760武器师日常活动.FayeS
	--任务描述
	TaskDescriptionText = function()
					--取出3个随机数
					local itaskmethodid = TaskTextCApi.GetDataFromActiveTaskList(12760, 1)		--任务类型（ABCD大类）
					local isubtaskmethodid = TaskTextCApi.GetDataFromActiveTaskList(12760, 2)	--子任务类型（针对CD类任务库）
					local num3 = TaskTextCApi.GetDataFromActiveTaskList(12760, 3)
					local iPlayerLev = TaskTextCApi.GetDataFromActiveTaskList(12760, 4) 		--4号变量存储的是玩家等级

					if itaskmethodid == 1 then
						isubtaskmethodid = 1
					elseif itaskmethodid == 2 then
						isubtaskmethodid = math.floor(iPlayerLev/5) *5
					end

					return TaskListTextString[12760].DescriptionText[itaskmethodid][isubtaskmethodid]
					end,


	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12760].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12760].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--完成方式：完成特定任务n次
	CompleteTask      = TaskListTextString[12760].CompleteTaskCommon,

	--提交特定物品
	SubmitItemText	= TaskListTextString[12760].SubmitItemText,

	--提交特定物品界面开场白
	SubmitItemPrologue = TaskListTextString[12760].SubmitItemPrologue,

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12760].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12760].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}


TaskListText[12763] = { --12763防具师日常活动.FayeS
	--任务描述
	TaskDescriptionText = function()
					--取出4个随机数
					local itaskmethodid = TaskTextCApi.GetDataFromActiveTaskList(12763, 1)		--任务类型（ABCD大类）
					local isubtaskmethodid = TaskTextCApi.GetDataFromActiveTaskList(12763, 2)	--子任务类型（针对CD类任务库）
					local num3 = TaskTextCApi.GetDataFromActiveTaskList(12763, 3)
					local iPlayerLev = TaskTextCApi.GetDataFromActiveTaskList(12763, 4) 		--4号变量存储的是玩家等级

					if itaskmethodid == 1 then
						isubtaskmethodid = 1
					elseif itaskmethodid == 2 then
						isubtaskmethodid = math.floor(iPlayerLev/5) *5
					end

					return TaskListTextString[12763].DescriptionText[itaskmethodid][isubtaskmethodid]
					end,


	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12763].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12763].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--完成方式：完成特定任务n次
	CompleteTask      = function()
					--取出随机数
					local isubtaskmethodid = TaskTextCApi.GetDataFromActiveTaskList(12763, 2)	--子任务类型（针对CD类任务库）

					return TaskListTextString[12763].CompleteTaskCommon[isubtaskmethodid]
					end,

	--提交特定物品
	SubmitItemText	= TaskListTextString[12763].SubmitItemText,

	--提交特定物品界面开场白
	SubmitItemPrologue = TaskListTextString[12763].SubmitItemPrologue,

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[12763].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[12763].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}
TaskListText[13008] = { ----初次领取历练精华,
	--任务描述
	TaskDescriptionText = TaskListTextString[13008].DescriptionText	,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13008].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13008].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}
TaskListText[13012] = { ----魔方百层塔队长选关,
	--任务描述
	TaskDescriptionText = TaskListTextString[13012].DescriptionText	,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13012].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13012].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}

TaskListText[13222] = { --宝石重铸,
	--任务描述
	TaskDescriptionText = TaskListTextString[13222].DescriptionText
	,
	--提交特定物品
	SubmitItemText	= function()
		return TaskListTextString[13222].SubmitItemText
	end
	,
	--提交特定物品界面开场白
	SubmitItemPrologue = function()
		return TaskListTextString[13222].SubmitItemPrologue
	end
	,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13222].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13222].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13222].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13222].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},
}

TaskListText[13388] = {
	--任务感谢辞
	TaskTributeText = function()
		local CurSiteAward = {
							[1]=201,
							[2]=202,
							[3]=203,
							[4]=204,
							[5]=216,
							[6]=217,
							[7]=205,
							[8]=206,
							[9]=207,
							}
		local iPlayerMap = TaskCApi.GetPlayerCurSite(TASKINTERFACE_POINTER)
		local MapNum = 0
		for i= 1, #CurSiteAward do
			if iPlayerMap == CurSiteAward[i] then
				MapNum = i
				break
			end
		end
		return TaskListTextString[13388][MapNum]
	end
}

TaskListText[13579] = { ----纪元每周领经验
	--任务描述
	TaskDescriptionText = TaskListTextString[13579].DescriptionText,
	--喊话
	TaskTributeText = function()
		local VIPLevel = TaskCApi.GetVipLevel(TASKINTERFACE_POINTER)
		local VIPRequire = 5
		if VIPLevel < VIPRequire then
			return TaskListTextString[13579].BroadcastNotVIP
		else
			return TaskListTextString[13579].Broadcast
		end
	end
	,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13579].DeliverTalkNpc,
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[13579].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
						param = 1,
					},
					{
						player_talk_text = TaskListTextString[13579].DeliverTalkPlayer_gold,
						next_window = TaskService.NPC_GIVE_TASK,
						param = 10,
					},
				},
			},
		},
	},
}


TaskListText[13588] = { ----凤凰令1级
	--任务描述
	TaskDescriptionText = function()
		local descString = ""
		local descViaLevel = 				--各个等级段的额外任务描述
		{
			{Lv = 30, desc = TaskListTextString[13588].DescriptionText1},
			{Lv = 40, desc = TaskListTextString[13588].DescriptionText2},
			{Lv = 50, desc = TaskListTextString[13588].DescriptionText3},
		}
		local descMonster =	 TaskListTextString[13588].DescriptionMonster				--怪物地点和名字

		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local monsterIndex = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13588, 1)
		local idx = 7	--凤凰令系列任务占用的活动计数编号是7
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)

		descString = descString..string.format(TaskListTextString[13588].DescriptionTextCount,commonCount)
		for k,v in ipairs(descViaLevel) do
			if playerLev >= v.Lv then
				descString = descString..v.desc
			end
		end
		descString = descString..string.format(TaskListTextString[13588].DescriptionText,descMonster[monsterIndex][1],descMonster[monsterIndex][2])
		return descString
	end
	,
	--喊话
	TaskTributeText = function()
		local broadcastString
		local timeClassString
		--把完成任务耗费的秒数、分钟数从任务变量2、3号中取出
		local second = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13588, 2)
		local minute = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13588, 3)
		--得到耗费时间
		local duration = minute * 60 + second
		--根据耗费时间查询出时间档位
		local TimeData =
		{
			[1] = { secondMin = 1200, secondMax = 99999999 },	--20分钟以上
			[2] = { secondMin = 901, secondMax = 1200 },	--20分钟以内
			[3] = { secondMin = 601, secondMax = 900 },	--15分钟以内
			[4] = { secondMin = 0, secondMax = 600 },	--10分钟以内
		}
		local timeClass = 1								--时间档位的序号，缺省是1
		for k,v in ipairs(TimeData) do
			if duration >= v.secondMin and duration <= v.secondMax then
				timeClass = k
				break
			end
		end
		--根据秒数、分钟数和时间档位拼接出喊话字符串
		if timeClass == 0 or timeClass > 4 then
			timeClassString = ""
		else
			timeClassString = TaskListTextString[13588]["BroadcastClass"..timeClass]
		end
		if minute >= 60 then
			broadcastString = string.format(TaskListTextString[13588].BroadcastOver60,timeClassString)
		elseif minute < 1 then
			broadcastString = string.format(TaskListTextString[13588].BroadcastBelowOne,second,timeClassString)
		else
			broadcastString = string.format(TaskListTextString[13588].BroadcastCommon,minute,second,timeClassString)
		end
		return broadcastString
	end
	,
}

TaskListText[13520] = { --飞行活动：暴风邪能入侵
	--任务描述
	TaskDescriptionText = TaskListTextString[13520].Description,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13520].DeliverTaskTalk_npc,

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13520].DeliverTaskTalk_player,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},

		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13520].AwardTalk_npc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13520].AwardTalk_player,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[13637] = { ----辉光令1级
	--任务描述
	TaskDescriptionText = function()
		local descString = ""
		local descViaLevel = 				--各个等级段的额外任务描述
		{
			{Lv = 60, desc = TaskListTextString[13637].DescriptionText1},
			{Lv = 65, desc = TaskListTextString[13637].DescriptionText2},
			{Lv = 70, desc = TaskListTextString[13637].DescriptionText3},
		}
		local descMonster =	 TaskListTextString[13637].DescriptionMonster				--怪物地点和名字

		local playerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local monsterIndex = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13637, 1)
		local idx = 7	--凤凰令系列任务占用的活动计数编号是7
		local commonCount = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,idx)

		descString = descString..string.format(TaskListTextString[13637].DescriptionTextCount,commonCount)
		for k,v in ipairs(descViaLevel) do
			if playerLev >= v.Lv then
				descString = descString..v.desc
			end
		end
		descString = descString..string.format(TaskListTextString[13637].DescriptionText,descMonster[monsterIndex][1],descMonster[monsterIndex][2])
		return descString
	end
	,
	--喊话
	TaskTributeText = function()
		local broadcastString
		local timeClassString
		--把完成任务耗费的秒数、分钟数从任务变量2、3号中取出
		local second = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13637, 2)
		local minute = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,13637, 3)
		--得到耗费时间
		local duration = minute * 60 + second
		--根据耗费时间查询出时间档位
		local TimeData =
		{
			[1] = { secondMin = 1801, secondMax = 99999999 },	--30分钟以上
			[2] = { secondMin = 1201, secondMax = 1800 },	--30分钟以内
			[3] = { secondMin = 721, secondMax = 1200 },	--20分钟以内
			[4] = { secondMin = 0, secondMax = 720 },	--12分钟以内
		}
		local timeClass = 1								--时间档位的序号，缺省是1
		for k,v in ipairs(TimeData) do
			if duration >= v.secondMin and duration <= v.secondMax then
				timeClass = k
				break
			end
		end
		--根据秒数、分钟数和时间档位拼接出喊话字符串
		if timeClass == 0 or timeClass > 4 then
			timeClassString = ""
		else
			timeClassString = TaskListTextString[13637]["BroadcastClass"..timeClass]
		end
		if minute >= 60 then
			broadcastString = string.format(TaskListTextString[13637].BroadcastOver60,timeClassString)
		elseif minute < 1 then
			broadcastString = string.format(TaskListTextString[13637].BroadcastBelowOne,second,timeClassString)
		else
			broadcastString = string.format(TaskListTextString[13637].BroadcastCommon,minute,second,timeClassString)
		end
		return broadcastString
	end
	,
}

TaskListText[13642] = { ----装备本随机周常主任务（英雄主义的呐喊）
	--任务描述
	TaskDescriptionText = TaskListTextString[13642].DescriptionText	,
	--喊话
	TaskTributeText = TaskListTextString[13642].Broadcast,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13642].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13642].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}

TaskListText[13643] = { --雷辛格不会告诉你.FayeS
	--任务描述
	TaskDescriptionText = function()
					--取出3个随机数
					local itaskmethodid = 0

					if TaskTextCApi.GetDataFromActiveTaskList(13643, 1) then
						itaskmethodid = TaskTextCApi.GetDataFromActiveTaskList(13643, 1)		--任务类型（ABCD大类）
					end

					return TaskListTextString[13643].DescriptionText[itaskmethodid]
					end,


	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13643].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13643].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13643].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13643].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}
TaskListText[13758] = { --【雷辛格日常】换防令
	--任务描述
	TaskDescriptionText = TaskListTextString[13758].DescriptionText	,
	--喊话
	TaskTributeText = TaskListTextString[13758].Broadcast,
	--完成任务n次的方式
	CompleteTask      = TaskListTextString[13758].CompleteTask,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13758].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13758].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13758].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13758].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},
}
TaskListText[13780] = { --【竞技场热身赛奖励】根据积分发称号
	--任务描述
	TaskDescriptionText = TaskListTextString[13780].DescriptionText	,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13780].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13780].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}
TaskListText[13765] = { --【雷辛格日常】阿敢快跑
	--任务描述
	TaskDescriptionText = TaskListTextString[13765].DescriptionText	,
	--喊话
	TaskTributeText = TaskListTextString[13765].Broadcast,
	--完成任务n次的方式
	CompleteTask      = TaskListTextString[13765].CompleteTask,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13765].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13765].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13765].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13765].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},
}
TaskListText[13915] = { --【体验服发奖】活跃度
	--任务描述
	TaskDescriptionText = TaskListTextString[13915].DescriptionText	,
	--完成任务n次的方式
	CompleteTask      = TaskListTextString[13915].CompleteTask,
	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13915].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13915].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[13915].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[13915].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},
}
TaskListText[14160] = { ----凤凰令·真
	--任务描述
	TaskDescriptionText = TaskListTextString[14160].DescriptionText	,
	--喊话
	TaskTributeText = function()
		local broadcastString
		local timeClassString
		--把完成任务耗费的秒数、分钟数从任务变量2、3号中取出
		local second = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14160, 2)
		local minute = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14160, 3)
		--得到耗费时间
		local duration = minute * 60 + second
		--根据耗费时间查询出时间档位
		local TimeData =
		{
			[1] = { secondMin = 1200, secondMax = 99999999 },	--20分钟以上
			[2] = { secondMin = 901, secondMax = 1200 },	--20分钟以内
			[3] = { secondMin = 601, secondMax = 900 },	--15分钟以内
			[4] = { secondMin = 0, secondMax = 600 },	--10分钟以内
		}
		local timeClass = 1								--时间档位的序号，缺省是1
		for k,v in ipairs(TimeData) do
			if duration >= v.secondMin and duration <= v.secondMax then
				timeClass = k
				break
			end
		end
		--根据秒数、分钟数和时间档位拼接出喊话字符串
		if timeClass == 0 or timeClass > 4 then
			timeClassString = ""
		else
			timeClassString = TaskListTextString[14160]["BroadcastClass"..timeClass]
		end
		if minute >= 60 then
			broadcastString = string.format(TaskListTextString[14160].BroadcastOver60,timeClassString)
		elseif minute < 1 then
			broadcastString = string.format(TaskListTextString[14160].BroadcastBelowOne,second,timeClassString)
		else
			broadcastString = string.format(TaskListTextString[14160].BroadcastCommon,minute,second,timeClassString)
		end
		return broadcastString
	end
	,
}
TaskListText[14173] = { ----辉光令·真
	--任务描述
	TaskDescriptionText = TaskListTextString[14173].DescriptionText	,
	--喊话
	TaskTributeText = function()
		local broadcastString
		local timeClassString
		--把完成任务耗费的秒数、分钟数从任务变量2、3号中取出
		local second = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14173, 2)
		local minute = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14173, 3)
		--得到耗费时间
		local duration = minute * 60 + second
		--根据耗费时间查询出时间档位
		local TimeData =
		{
			[1] = { secondMin = 1801, secondMax = 99999999 },	--30分钟以上
			[2] = { secondMin = 1201, secondMax = 1800 },	--30分钟以内
			[3] = { secondMin = 721, secondMax = 1200 },	--20分钟以内
			[4] = { secondMin = 0, secondMax = 720 },	--12分钟以内
		}
		local timeClass = 1								--时间档位的序号，缺省是1
		for k,v in ipairs(TimeData) do
			if duration >= v.secondMin and duration <= v.secondMax then
				timeClass = k
				break
			end
		end
		--根据秒数、分钟数和时间档位拼接出喊话字符串
		if timeClass == 0 or timeClass > 4 then
			timeClassString = ""
		else
			timeClassString = TaskListTextString[14173]["BroadcastClass"..timeClass]
		end
		if minute >= 60 then
			broadcastString = string.format(TaskListTextString[14173].BroadcastOver60,timeClassString)
		elseif minute < 1 then
			broadcastString = string.format(TaskListTextString[14173].BroadcastBelowOne,second,timeClassString)
		else
			broadcastString = string.format(TaskListTextString[14173].BroadcastCommon,minute,second,timeClassString)
		end
		return broadcastString
	end
	,
}

TaskListText[14094] = { --七日谈
	--任务描述
	TaskDescriptionText = TaskListTextString[14094].Description,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14094].DeliverTaskTalk_npc,

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14094].DeliverTaskTalk_player,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},

		},
	},

	--完成方式：完成特定任务n次
	CompleteTask      = TaskListTextString[14094].CompleteTaskCommon,

	--提交特定物品
	SubmitItemText	= TaskListTextString[14094].SubmitItemText,

	--提交特定物品界面开场白
	SubmitItemPrologue = TaskListTextString[14094].SubmitItemPrologue,

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14094].AwardTalk_npc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14094].AwardTalk_player,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[14262] = { --种植符文
	--任务描述
	TaskDescriptionText = function()
					--取出随机数
					local itaskmethodid = 0

					if TaskTextCApi.GetDataFromActiveTaskList(14262, 1) > 0 then
						itaskmethodid = 1		--当前是否交纳符文
					end

					return TaskListTextString[14262].DescriptionText[itaskmethodid]
					end,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14262].DeliverTaskTalk_npc,

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14262].DeliverTaskTalk_player,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},

		},
	},

	--完成方式：完成特定任务n次
	CompleteTask      =  function()
						local itaskmethodid = 0

						if TaskTextCApi.GetDataFromActiveTaskList(14262, 1) > 0 then
							itaskmethodid = 1		--当前是否交纳符文
						end

						return TaskListTextString[14262].CompleteTaskCommon[itaskmethodid]
						end,

	--提交特定物品
	SubmitItemText	=  function()
						local itaskmethodid = 0

						if TaskTextCApi.GetDataFromActiveTaskList(14262, 1) > 0 then
							itaskmethodid = 1		--当前是否交纳符文
						end

						return TaskListTextString[14262].SubmitItemText[itaskmethodid]
						end,

	--提交特定物品界面开场白
	SubmitItemPrologue = function()
						local itaskmethodid = 0

						if TaskTextCApi.GetDataFromActiveTaskList(14262, 1) > 0 then
							itaskmethodid = 1		--当前是否交纳符文
						end

						return TaskListTextString[14262].SubmitItemPrologue[itaskmethodid]
						end,

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14262].AwardTalk_npc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14262].AwardTalk_player,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}
TaskListText[14276] = {
	--春节年兽任务奖励
	TaskTributeText = function()
	local tmp_say_num = TaskTextCApi.GetDataFromActiveTaskList(14276, 1)
	return TaskListTextString[14276][tmp_say_num]
	end
}


--new_公会_通用建设任务
TaskListText[14379] = {
	--任务描述
	TaskDescriptionText = function()
							local iTaskType = TaskTextCApi.GetDataFromActiveTaskList(14379, 3)

							if not iTaskType then
								iTaskType = 1
							end

							return TaskListTextString[14379].DescriptionText[iTaskType]

							end,

	--感谢辞
	TaskTributeText = TaskListTextString[14379].TaskTributeText,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14379].DeliverTaskTalk_npc,

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14379].DeliverTaskTalk_player,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},

		},
	},

	--完成方式：完成特定任务n次
	CompleteTask 	 =  function()
						local key1 = TaskTextCApi.GetDataFromActiveTaskList(14379, 1)
						local key2 = TaskTextCApi.GetDataFromActiveTaskList(14379, 2)
						local itaskid = key1*200 + key2

						return TaskListTextString[14379].CompleteTaskCommon[itaskid]
						end,

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14379].AwardTalk_npc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14379].AwardTalk_player,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

--新：通用基地非建设任务
TaskListText[14380] = {
	--任务描述
	TaskDescriptionText = function()
							local iTaskType = TaskTextCApi.GetDataFromActiveTaskList(14379, 3)

							if not iTaskType then
								iTaskType = 1
							end

							return TaskListTextString[14379].DescriptionText[iTaskType]

							end,

	--感谢辞
	TaskTributeText = TaskListTextString[14380].TaskTributeText,

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14380].DeliverTaskTalk_npc,

				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14380].DeliverTaskTalk_player,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},

		},
	},

	--完成方式：完成特定任务n次
	CompleteTask      =  function()
						local key1 = TaskTextCApi.GetDataFromActiveTaskList(14380, 1)
						local key2 = TaskTextCApi.GetDataFromActiveTaskList(14380, 2)
						local itaskid = key1*200 + key2

						return TaskListTextString[14380].CompleteTaskCommon[itaskid]
						end,

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14380].AwardTalk_npc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14380].AwardTalk_player,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

--雷辛格随机事件·时间祭坛
	TaskListText[14560] = {
	--任务描述
		TaskDescriptionText =  TaskListTextString[14560].DescriptionText,
	--提交特定物品
		SubmitItemText	= function()
		return TaskListTextString[14560].SubmitItemText
	end
	,
	--提交特定物品界面开场白
	SubmitItemPrologue = function()
		return TaskListTextString[14560].SubmitItemPrologue
	end
	,
	--感谢词
	TaskTributeText = function()
		local ItemTijiaoNum = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,14560,2)
		if ItemTijiaoNum == 1 then
			return TaskListTextString[14560].TaskTributeText[1]
		end
		if ItemTijiaoNum == 2 then
			return TaskListTextString[14560].TaskTributeText[2]
		end
		if ItemTijiaoNum == 3 then
			return TaskListTextString[14560].TaskTributeText[3]
		end
		if ItemTijiaoNum > 3 then
			return TaskListTextString[14560].TaskTributeText[4]
		end
	end
	,

	--任务发放对话
		DeliverTaskTalk ={
				num_window = 1,
				window =
				{
					[1] =
					{
						parent_window = -1,
						npc_talk_text = TaskListTextString[14560].DeliverTalkNpc,
						num_option = 1,
						option =
						{
							{
								player_talk_text = TaskListTextString[14560].DeliverTalkPlayer,
								next_window = TaskService.NPC_GIVE_TASK,
							},
						},
					},
				},
			},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14560].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14560].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}

--恩德值宝石重铸
	TaskListText[14572] = {
	--任务描述
		TaskDescriptionText =  TaskListTextString[14572].DescriptionText,
	--提交特定物品
		SubmitItemText	= function()
		return TaskListTextString[14572].SubmitItemText
	end
	,
	--提交特定物品界面开场白
	SubmitItemPrologue = function()
		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14572)	--本任务的完成次数
		local kindnessValue = TaskList[14572].Prices.kindnessValue	--消耗恩德值（每周第1次）
		local kindnessValueStep = TaskList[14572].Prices.kindnessValueStep	--每次消耗恩德值的递增量
		local kindnessID = 11	--恩德值的声望id
		local costKindnessValue = kindnessValue + kindnessValueStep * icount		--本次重铸需要消耗的恩德值
		local text = string.format(TaskListTextString[14572].SubmitItemPrologue,icount+1,costKindnessValue)
		return text
	end
	,
	--感谢词
	TaskTributeText = function()
		return TaskListTextString[14572].TaskTributeText
	end
	,

	--任务发放对话
		DeliverTaskTalk ={
				num_window = 1,
				window =
				{
					[1] =
					{
						parent_window = -1,
						npc_talk_text = TaskListTextString[14572].DeliverTalkNpc,
						num_option = 1,
						option =
						{
							{
								player_talk_text = TaskListTextString[14572].DeliverTalkPlayer,
								next_window = TaskService.NPC_GIVE_TASK,
							},
						},
					},
				},
			},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14572].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14572].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}
--用恩德值重置流光之地副本进入次数
	TaskListText[14573] = {
	--任务描述
	TaskDescriptionText =  function()
		local cost =	{ 200,300,400,500,600 }	--每次消耗恩德值
		local icount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,14573)	--本任务的完成次数
		local str = string.format(TaskListTextString[14573].DescriptionText,icount+1,cost[icount+1])
		return str
	end
	,
	--感谢词
	TaskTributeText = function()
		return TaskListTextString[14573].TaskTributeText
	end
	,

	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14573].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14573].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}
--悬赏信声望换高级符文方式1，计次任务
	TaskListText[14723] = {
	--任务描述
	TaskDescriptionText =  TaskListTextString[14723].DescriptionText
	,
	--感谢词
	TaskTributeText = function()
		return TaskListTextString[14723].TaskTributeText
	end
	,

	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14723].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14723].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}
--悬赏信声望换高级符文方式1，计次任务
	TaskListText[14724] = {
	--任务描述
	TaskDescriptionText =  TaskListTextString[14724].DescriptionText
	,
	--感谢词
	TaskTributeText = function()
		return TaskListTextString[14724].TaskTributeText
	end
	,

	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14724].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14724].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}
--测试·百层塔测数发装备任务
	TaskListText[14762] = {
		--任务发放对话
		DeliverTaskTalk ={
				num_window = 1,
				window =
				{
					[1] =
					{
						parent_window = -1,
						npc_talk_text = TaskListTextString[14762].DeliverTalkNpc,
						num_option = 5,
						option =
						{
							{
								player_talk_text = TaskListTextString[14762].DeliverTalkPlayer1,
								next_window = TaskService.NPC_GIVE_TASK,
								param =1
							},
							{
								player_talk_text = TaskListTextString[14762].DeliverTalkPlayer2,
								next_window = TaskService.NPC_GIVE_TASK,
								param =2
							},
							{
								player_talk_text = TaskListTextString[14762].DeliverTalkPlayer3,
								next_window = TaskService.NPC_GIVE_TASK,
								param =3
							},
							{
								player_talk_text = TaskListTextString[14762].DeliverTalkPlayer4,
								next_window = TaskService.NPC_GIVE_TASK,
								param =4
							},
							{
								player_talk_text = TaskListTextString[14762].DeliverTalkPlayer5,
								next_window = TaskService.NPC_GIVE_TASK,
								param =5
							},
						},
					},
				},
			},
}
--欧洲杯竞猜活动
	TaskListText[14881] = {
	--任务描述
	TaskDescriptionText =  TaskListTextString[14881].DescriptionText
	,
	--感谢词
	TaskTributeText = function()
		return TaskListTextString[14881].TaskTributeText
	end
	,

	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[14881].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[14881].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}


TaskListText[15201] = { --F 秋收节：祭奠英灵
	--任务描述
	TaskDescriptionText = function()
					--取出3个随机数
					local itaskmethodid = 0

					if TaskTextCApi.GetDataFromActiveTaskList(15201, 1) then
						itaskmethodid = TaskTextCApi.GetDataFromActiveTaskList(15201, 1)		--任务类型（ABCD大类）
					end

					return TaskListTextString[15201].DescriptionText[itaskmethodid]
					end,


	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15201].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15201].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--完成方式：完成特定任务n次
	CompleteTask      =  function()
						local key = TaskTextCApi.GetDataFromActiveTaskList(15201, 1)
						return TaskListTextString[15201].CompleteTaskCommon[key]
						end,

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15201].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15201].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}

TaskListText[15294] = { --F 秋收节种植收获任务
	--任务描述
	TaskDescriptionText = function()
					--取出随机数
					local itaskmethodid = 0

					if TaskTextCApi.GetDataFromActiveTaskList(15294, 1) then
						itaskmethodid = TaskTextCApi.GetDataFromActiveTaskList(15294, 1)
					end

					return TaskListTextString[15294].DescriptionText[itaskmethodid]
					end,


	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15294].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15294].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},

	--完成方式：完成特定任务n次
	CompleteTask      =  function()
						local key = TaskTextCApi.GetDataFromActiveTaskList(15294, 1)
						return TaskListTextString[15294].CompleteTaskCommon[key]
						end,

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15294].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15294].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	},

}
--装备副本日常首次大额经验&前4次活跃
TaskListText[15369]={
    TaskTributeText =	TaskListTextString[15369].TaskTributeText
}
--活跃度140点以上向导任务
TaskListText[15388] = {
	--任务描述
	TaskDescriptionText =  TaskListTextString[15388].DescriptionText
	,
	--感谢词
	TaskTributeText = function()
		return TaskListTextString[15388].TaskTributeText
	end
	,
	--完成方式：完成特定任务n次
	CompleteTask  =  TaskListTextString[15388].CompleteTask
	,	--完成方式：完成特定任务n次
	CompleteTask  =  TaskListTextString[15388].CompleteTask
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15388].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15388].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15388].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15388].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}


TaskListText[14754]={
    TaskTributeText =	TaskListTextString[14754].TaskTributeText
}


TaskListText[14755]={
    TaskTributeText =	TaskListTextString[14755].TaskTributeText
}

TaskListText[14750]={
    TaskTributeText =	TaskListTextString[14750].TaskTributeText
}

--使用幸运值刷新 - 有几率发放任务：提升幸运等级的脚本任务
TaskListText[15371] = {
	--感谢词
	TaskTributeText = function()
		local text = TaskListTextString[15371].TaskTributeText
		return text
	end
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15371].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15371].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}
--喊话报告幸运等级的脚本任务
TaskListText[15420]={
    TaskTributeText = function()
--		local luckGrade = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15372)	--幸运等级
		local text = TaskListTextString[15420].TaskTributeText
		return text
	end
}
--北美专属任务：签到
TaskListText[15706] = {
	--感谢词
	TaskTributeText = function()
		local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15706)		-- 本任务次数
		local text = string.format(TaskListTextString[15706].TaskTributeText,selfCount+1)
		return text
	end
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15706].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15706].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}

TaskListText[15774]={
    TaskTributeText =	TaskListTextString[15774].TaskTributeText
}
--地狱之路获得活跃度
TaskListText[15852]={
    TaskTributeText =	TaskListTextString[15852].TaskTributeText
}
--【竞技场第一赛季奖励】根据积分发称号和时装包、坐骑包等
TaskListText[15956] = {
	--感谢词
	TaskTributeText = TaskListTextString[15956].TaskTributeText
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15956].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15956].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
}

------神之试炼二章代工额外奖励
TaskListText[15974] = {
	TaskDescriptionText =  TaskListTextString[15974].DescriptionText
	,
	--感谢词
	TaskTributeText = TaskListTextString[15974].TaskTributeText
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15974].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15974].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15974].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15974].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}

------神之试炼二章代工额外奖励++
TaskListText[15975] = {
	TaskDescriptionText =  TaskListTextString[15975].DescriptionText
	,
	--感谢词
	TaskTributeText = TaskListTextString[15975].TaskTributeText
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15975].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15975].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[15975].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[15975].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}



------芳香岛采花任务
TaskListText[16253] = {
	TaskDescriptionText =  TaskListTextString[16253].DescriptionText
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16253].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[16253].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16253].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[16253].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}
-----装备本幸运任务
TaskListText[16376] = {
	TaskDescriptionText =  function()
		local idx = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 1)
		if idx == 0 then idx = 1 end
		return TaskListTextString[16376].DescriptionText[idx]
	end
	,
	--完成方式：完成特定任务n次
	CompleteTask  =  function()
		local idx = TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,16376, 1)
		if idx == 0 then idx = 1 end
		return TaskListTextString[16376].CompleteTask[idx]
	end
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16376].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[16376].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16376].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[16376].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}
--封印技能书重铸
	TaskListText[16635] = {
	--任务描述
		TaskDescriptionText =  TaskListTextString[16635].DescriptionText,
	--提交特定物品
		SubmitItemText	= function()
		return TaskListTextString[16635].SubmitItemText
	end
	,
	--提交特定物品界面开场白
	SubmitItemPrologue = function()
		local text = TaskListTextString[16635].SubmitItemPrologue
		return text
	end
	,
	--感谢词
	TaskTributeText = function()
		return TaskListTextString[16635].TaskTributeText
	end
	,

	--任务发放对话
		DeliverTaskTalk ={
				num_window = 1,
				window =
				{
					[1] =
					{
						parent_window = -1,
						npc_talk_text = TaskListTextString[16635].DeliverTalkNpc,
						num_option = 1,
						option =
						{
							{
								player_talk_text = TaskListTextString[16635].DeliverTalkPlayer,
								next_window = TaskService.NPC_GIVE_TASK,
							},
						},
					},
				},
			},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16635].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[16635].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}

TaskListText[16723] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[16723][1],
	--[[TaskDescriptionText =  function()
		local times = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,16723) + 1
		local string = string.format(TaskListTextString[16723][1],times)
		return string
	end]]--

	--任务感谢辞



	TaskTributeText    = TaskListTextString[16723][2],

	--完成方式：与NPC对话
	TalkToNpcText      = TaskListTextString[16723][3],

	--完成方式：到达指定地点



	ReachSiteText      = TaskListTextString[16723][4],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16723][5],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[16723][6],
						next_window = TaskService.NPC_GIVE_TASK
					},

				},
			},

		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16723][8],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[16723][9],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[16723][10],
						next_window = TaskService.TALK_RETURN,
					},
				},
			},
		},
	},
}


TaskListText[16724] = {
	--任务描述
	TaskDescriptionText = TaskListTextString[16724][1],

	--任务感谢辞



	TaskTributeText    = TaskListTextString[16724][2],

	--完成方式：与NPC对话
	TalkToNpcText      = TaskListTextString[16724][3],

	--完成方式：到达指定地点



	ReachSiteText      = TaskListTextString[16724][4],

	--发放任务对话
	DeliverTaskTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16724][5],
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[16724][6],
						next_window = TaskService.NPC_GIVE_TASK
					},

				},
			},

		},
	},

	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[16724][8],
				num_option = 2,
				option =
				{
					{
						player_talk_text = TaskListTextString[16724][9],
						next_window = TaskService.NPC_COMPLETE_TASK,
					},

					{
						player_talk_text = TaskListTextString[16724][10],
						next_window = TaskService.TALK_RETURN,
					},
				},
			},
		},
	},
}

--地狱之路过关奖励技能封印之卷
TaskListText[17062] = {
	TaskDescriptionText =  function()
		local requiredLevelIdx	= TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,17062, 1)
		if requiredLevelIdx == 0 then
			return TaskListTextString[17062].DescriptionText_default
		else
			return string.format(TaskListTextString[17062].DescriptionText,requiredLevelIdx)
		end
	end
	,
	--完成方式：完成特定任务n次
	CompleteTask  =  function()
		local requiredLevelIdx	= TaskTextCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,17062, 1)
		if requiredLevelIdx == 0 then
			return TaskListTextString[17062].CompleteTask_default
		else
			return string.format(TaskListTextString[17062].CompleteTask,requiredLevelIdx)
		end
	end
	,
	--任务发放对话
	DeliverTaskTalk ={
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[17062].DeliverTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[17062].DeliverTalkPlayer,
						next_window = TaskService.NPC_GIVE_TASK,
					},
				},
			},
		},
	},
	--任务奖励对话
	AwardTalk =
	{
		num_window = 1,
		window =
		{
			[1] =
			{
				parent_window = -1,
				npc_talk_text = TaskListTextString[17062].AwardTalkNpc,
				num_option = 1,
				option =
				{
					{
						player_talk_text = TaskListTextString[17062].AwardTalkPlayer,
						next_window = TaskService.NPC_COMPLETE_TASK,
					},
				},
			},
		},
	}
}
