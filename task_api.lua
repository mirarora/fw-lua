---------------------------------------------------------------
--  created:   2010.3.31
--  author:    chenyong
--  内容：     任务脚本接口。
---------------------------------------------------------------
OnPropertyEntrance = function(TASKINTERFACE_POINTER, TaskID)
	return  TaskList[TaskID].OnProperty(TASKINTERFACE_POINTER)
end

OnCheckDeliverEntrance = function(TASKINTERFACE_POINTER, TaskID)
	return  TaskList[TaskID].OnCheckDeliver(TASKINTERFACE_POINTER)
end

OnDeliverEntrance = function(TASKINTERFACE_POINTER, TaskID, iParam)
	return  TaskList[TaskID].OnDeliver(TASKINTERFACE_POINTER, iParam)
end

OnMethodEntrance = function(TASKINTERFACE_POINTER, TaskID)
	return  TaskList[TaskID].OnMethod(TASKINTERFACE_POINTER)
end

OnCheckFinishEntrance = function(TASKINTERFACE_POINTER, TaskID)
	return  TaskList[TaskID].OnCheckFinish(TASKINTERFACE_POINTER)
end

OnCheckAwardEntrance = function(TASKINTERFACE_POINTER, TaskID, bSuccess)
	return  TaskList[TaskID].OnCheckAward(TASKINTERFACE_POINTER, bSuccess)
end

OnAwardEntrance = function(TASKINTERFACE_POINTER, TaskID, bSuccess, iParam, bRetrieve, ucRandomNum1, ucRandomNum2, ucRandomNum3, ucRandomNum4, ucRandomNum5, ucRandomNum6, ucRandomNum7, ucRandomNum8, ucRandomNum9, ucRandomNum10)
	return  TaskList[TaskID].OnAward(TASKINTERFACE_POINTER, bSuccess, iParam, bRetrieve, ucRandomNum1, ucRandomNum2, ucRandomNum3, ucRandomNum4, ucRandomNum5, ucRandomNum6, ucRandomNum7, ucRandomNum8, ucRandomNum9, ucRandomNum10)
end

OnAIEventEntrance = function(TASKINTERFACE_POINTER, TaskID, iAiObjId, iParam1, iParam2)
	return TaskList[TaskID].OnAIEvent(TASKINTERFACE_POINTER, iAiObjId, iParam1, iParam2)
end

OnNewDayEntrance = function(TASKINTERFACE_POINTER, iRoleAbsence, IsNewWeek, IsNewMonth)
	return CommonTaskCount.OnNewDay(TASKINTERFACE_POINTER, iRoleAbsence, IsNewWeek, IsNewMonth)
end

OnNewWeekEntrance = function(TASKINTERFACE_POINTER)
	return CommonTaskCount.OnNewWeek(TASKINTERFACE_POINTER)
end

OnPVPFinishEntrance = function(TASKINTERFACE_POINTER, iResult, iKillPlayers)
	return CommonTaskCount.OnPVPFinish(TASKINTERFACE_POINTER, iResult, iKillPlayers)
end
