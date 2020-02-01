---------------------------------------------------------------
--  created:   2009.8.24
--  author:    cy
--  ���ݣ�����ű��ļ���


--  �޸ģ�QF
--  ���ݣ�������Ϸ���ýű�����


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--cy���Խű���������ű�������༭��������Ķ�
TaskList[6835] =
{
  	Property =
  	{
  		bKeyTask = true,
  		bCanGiveUp = true,
  		bShowPrompt = true,
  	}
   	,

	-- �ɹ�ʱ��Ч

	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			return 100--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
		-- �ǰ�Ǯ
		Gold = function(TASKINTERFACE_POINTER)
			return 200--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
		-- ��Ǯ
		BindMoney = function(TASKINTERFACE_POINTER)
			return 300--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
		-- SP
		SP = function(TASKINTERFACE_POINTER)
			return 400--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
		-- ����
		Reputation = function(TASKINTERFACE_POINTER)
			return 500--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 7075, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������

						Item2 = {ID = 7076, NUM = 2},
					}
			return items
		end
		,
		-- ��ְҵ����
		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			soe = {
						SOE1 = {ID = 1, EXP = 10},--idΪ��ְҵid��expΪ��ֵ��expΪ0��ʾ������
						SOE2 = {ID = 2, EXP = 20},
				  }
			return soe
		end
		,

		-- ��������
		FriendShips = function(TASKINTERFACE_POINTER)
			local friendships = {}
			friendships = {
								FS1 = {ID = 1, VAL = 10},--idΪ����id��valΪ��ֵ��val=0 ����������id=-1�� ���� ��������val=0��
								FS2 = {ID = 2, VAL = 20},
						  }
			return friendships
		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 1 --���ṱ�׶�
			factionaward.money = 2   --�����ʽ�
			factionaward.melee = 3   --������װ
			factionaward.magic = 4   --����ħ��
			factionaward.economy = 5 -- ���ᾭ��
			factionaward.culture = 6 --��������
			factionaward.belief = 7  --��������
			factionaward.credit = 8  --���Ṧѫ
			factionaward.vitality = 9 --�����Ծ��
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
   		local iRatio = 1   --��������
   		if iParam == 1 then
			iRatio = 1
		elseif iParam == 2 then
			iRatio = 3
		end

		TaskCApi.DeliverGold(TASKINTERFACE_POINTER, 1000*iRatio)       --����
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
   	   	local iRatio = 1   --��������
   		if iParam == 1 then
			iRatio = 1
		elseif iParam == 2 then
			iRatio = 3
		end

   		if bSuccess then
   		   TaskCApi.DeliverGold(TASKINTERFACE_POINTER, 1000*iRatio)       --����
   		else
   		   TaskCApi.DeliverGold(TASKINTERFACE_POINTER, 100*iRatio)
   		end

   		return 0
   	end
  }


TaskList[6023] =
{
  	--�������ʱ����


   	Property = {}
  		--���ÿɱ�����

   	,

	--TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, iItemID, bCommon) --��ȡ��Ұ�����ָ����Ʒ������iItemIDΪ��ƷID��bCommonֵΪtrue��ʾ��ͨ��Ʒ��false��ʾ������Ʒ��


   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iItemID = 7114
	   	if iPlayerLev < 3 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��

   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, iItemID, true) < 3 then	--ĳ��ͨ��Ʒ��������3
			return TASK_PREREQU_FAIL_NO_ITEM
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
   		--�����߻���
		TaskCApi.DeliverGold(TASKINTERFACE_POINTER,1000)         	    --����
		TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,5757, 1)       --��5757��ͨ��Ʒ1��
		--TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,7114, 1)	--��ȡ7114��ͨ��Ʒ1��
		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
   		if iPlayerLev <= 10 then
   		    Method.KillMonster = { Mons1={ID=21, Num=3}, Mons2={ID=22, Num=5},}
   		else
   		    Method.KillMonster = { Mons1={ID=21, Num=3}, Mons2={ID=22, Num=5}, Mons3={ID=23, Num=7},}
   		    Method.CollectItem = { Item1={ID=9049, Num=10, Common=true},}
   		    Method.iTimeLimit = 120 --2����û���������ʧ��
   		end

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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
   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 2 then --��ͨ��������Ҫ2��
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
   	    	end

   	   		if TaskCApi.GetShowTaskRemainCount(TASKINTERFACE_POINTER) < 1  and  --��1���ɼ�����
   		   	   TaskCApi.GetActiveTaskListRemainSpace(TASKINTERFACE_POINTER) < 5 then  --���ŵ�������4��������
			   --������bug��--������ŵ�������ǰ�ᣬ�������㣬��ʱ������ʾ�򣬵��������ճ���ɡ�--Ӧ�ò�������ɡ�
			   --��Ҫ��һ���ӿڣ��жϷ�������Ľ��������Ƿ�����
   		   	   return TASK_PREREQU_FAIL_FULL
   	   		end
   		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 5757, 1)    --��ȡ5757��ͨ��Ʒ1��
			TaskCApi.DeliverTaskItem(TASKINTERFACE_POINTER, 760, 3)      	--��760������Ʒ3��
			TaskCApi.DeliverNewTaskxxxx(TASKINTERFACE_POINTER, 3757)           --����������3757
   		else
   		   TaskCApi.TakeAwayGold(TASKINTERFACE_POINTER, 1000)         	     --��ȡ��
		   TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 7114, 1)      --��ȡ5757��ͨ��Ʒ1��
		   TaskCApi.DeliverTaskItem(TASKINTERFACE_POINTER, 760, 3)      	 --��760������Ʒ3��
   		end

   		return 0
   	end
}

TaskList[6717] = --�罻�ҽ�������:by xzy
{
  	Property =
  	{
  		bRecordFinish = false,
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = false,
  		bCanSeekOut = false,
  		bFinishWhenDelvier = true,	--���ܼ���ɣ�

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--ÿ��������1��

  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.SheJiaoJia,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч

	AwardPreview =
	{

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--��������Ƿ����ظ�����id 7164-7214  6374-6424
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

		--��Ҫ�罻�ҵȼ�����Ϊ3��

		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, 32) then
			return TASK_PREREQU_FAIL_LUA_TASK
		elseif TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER, 32) < 3 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iWaitTime = 0

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

   	--��ɸ�����ʱ����������

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then

			math.randomseed(os.time())
			local iRandomNum = math.random(0, 1)
			local iTask1 = math.random(7164,7214)
			local iTask2 = math.random(6374,6424)

			if iTask1 == 7168 or iTask1 == 7202 then	--ȥ�� ��ë �� ����
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

TaskList[7680] = --Ϊ����ID7680:ʯ��õ��001�ղ�Ʒ
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����

		bUIButtonTask = true, --��������

  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
  		bCanSeekOut = true,--��������

  		bRecordFinishCount = true,--��¼��ɴ���
  		iMaxFinishCount = 1,--�����ɴ���Ϊ1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--ÿ�����

  		iType  = TaskType.HuoDong,--�������ͣ��
  		iTopic = TaskTopic.YiBan,--һ����������
  	}
   	,

	-- �ɹ�ʱ��Ч

	AwardPreview =
	{

		-- ����
		Exp = function(TASKINTERFACE_POINTER)

			local AwardMulti = 60										--���齱��ϵ��
			local AwardMultiply = {1,1.2,1.4,1.6,1.8,2,2.1,2.2,2.3,2.4}			--������������������

			local ChargeVacationId = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 1) --����ȡ����Ʒ���Եĸ�ְҵid
			local ChargeVacationLevel =TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 2) --����ȡ����Ʒ���Եĸ�ְҵ�ȼ�

			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMultiply[ChargeVacationLevel] * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,

		-- ��Ʒ���и��ʷ��Ÿ��ƽ�����
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 0, NUM = 0},--0ʱΪ��������������ʾ��Ʒ������
			}
			return items
		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 1 --���ṱ�׶�
			factionaward.credit = 1  --���Ṧѫ
			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)   --��ҵȼ�
		--�����ҵȼ��Ƿ�>=25
		if iPlayerLev < 25 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end


		--������һ��������
		local iGuild = TaskCApi.GetFactionLev(TASKINTERFACE_POINTER)
		if iGuild < 0 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

		local OpenVacationId = { 0,1,5,6,}--��ǰ���ŵĿ���ȡ��Ʒ�ĸ�ְҵid������չ


		--���û��ѧ�������ัְҵ�����޷�����
		for i, v in pairs(OpenVacationId) do
			if TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, v) then
				return 0
			elseif i == #OpenVacationId then
				return 28
			end
		end

		--[[
		if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,9748) then--�������������9748�����ܷ��ţ���ֹ���������
			return TASK_PREREQU_FAIL_LUA_TASK
		end
		]]--
   		return 0

   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local OpenVacationId = { 0,1,5,6,}--��ǰ���ŵĿ���ȡ��Ʒ�ĸ�ְҵid������չ

		--Ҫ��ȡ����Ʒ��񣬸�ְҵidΪ����

		local ChargeItems = {
			--����001-080
			[0] = {
				--����1��1-10
				21102,   --õ����
				21106,   --�����
				9636,    --����ҩ��
				9637,    --���ҩ��
				9649,    --��Ч����ҩ��

				9650,    --��Ч����ҩ��
				21102,   --õ����
				21106,   --�����
				9649,    --��Ч����ҩ��
				9650,    --��Ч����ҩ��

				--����2��11-20
				9658,    --��������ҩ�� ԭΪ(�Ϸ���֮��21103)
				9657,    --��������ҩ�� ԭΪ(�Ϸ���֮��21107)
				9641,    --����ҩ��
				9642,    --��ʥҩ��
				9643,    --��˪ҩ��

				9644,    --����ҩ��
				9645,    --�籩ҩ��
				21079,   --���ҩ��
				21080,   --�ڰ�ҩ��
				9657,    --��������ҩ��

				--����3��21-30
				9422,    --��Ч����֮Դ ԭΪ(�ƽ�֮��21104)
				9423,    --��Чħ��֮Ȫ ԭΪ(�ƽ�֮��21108)
				9422,    --��Ч����֮Դ
				9423,    --��Чħ��֮Ȫ
				9426,    --����ս��ҩ��

				9422,    --��Ч����֮Դ
				9423,    --��Чħ��֮Ȫ
				9663,    --��Ч����ҩ��
				9664,    --��Ч����ҩ��
				9422,    --��Ч����֮Դ

				--����4��31-40��40���ⶥ��
				9424,    --��������֮Դ
				9425,    --����ħ��֮Ȫ
				21105,   --̫��֮��
				21109,   --̫��֮��
				9654,    --��Ұҩˮ

				9659,    --��ŭҩ��
				9660,    --ʯ��ҩ��
				9662,    --��ҩ��
				9704,    --�μ�����ҩ��
				9705,    --�μ�����ҩ��

				--����5��41-50��5.18�汾���£�����5����
				21638,--5������˲������ҩˮ
				21642,--5������˲��ħ��ҩˮ
				9719,--��Ч����ҩ��
				9720,--��Ч����ҩ��
				9647,--��Ч����ҩ��

				9648,--��Чħ��ҩ��
				9661,--�޵�ҩ��
				9719,--��Ч����ҩ��
				9720,--��Ч����ҩ��
				9647,--��Ч����ҩ��

				--����6��51-60
				9652,--̫��֮��
				9653,--̫��֮��
				9654,--��Ұҩˮ
				9655,--����ҩˮ
				9660,--ʯ��ҩ��

				9662,--��ҩ��
				7143,--����֮��
				9654,--��Ұҩˮ
				9655,--����ҩˮ
				9660,--ʯ��ҩ��

				--����7��61-70 (2011.3.17�޸�)
				9430,	--��Ч����ҩ��
				9431,	--��Чħ��ҩ��
				30987,	--ǿЧ����ҩ��
				30988,	--ǿЧ����ҩ��
				9430,	--��Ч����ҩ��

				9430,	--��Ч����ҩ��
				9431,	--��Чħ��ҩ��
				30987,	--ǿЧ����ҩ��
				30988,	--ǿЧ����ҩ��
				30988,	--ǿЧ����ҩ��


				--����8��71-80
				9704,--�μ�����ҩ��
				9705,--�μ�����ҩ��
				9706,--�μ�Ӫ��ҩ��
				9704,--�μ�����ҩ��
				9705,--�μ�����ҩ��

				9706,--�μ�Ӫ��ҩ��
				9704,--�μ�����ҩ��
				9705,--�μ�����ҩ��
				9706,--�μ�Ӫ��ҩ��
				9704,--�μ�����ҩ��
			},

			--���1001-1080
			[1] = {
				--���1��

				19033, --������
				19040, --��ţ��
				19033, --������
				19040, --��ţ��
				19033, --������

				19040, --��ţ��
				19033, --������
				19040, --��ţ��
				19033, --������
				19040, --��ţ��

				--���2��111-120
				11690,    --��������
				11691,    --Ҭ��С��
				17190,    --����з��
				17080,    --Ҭ��֭
				17081,    --����Ũ��

				17082,    --���������
				11690,    --��������
				11691,    --Ҭ��С��
				17190,    --����з��
				17080,    --Ҭ��֭

				--���3��

				12238,    --ʥ�׳���
				12239,    --�������
				12246,    --��ζ����
				17191,    --����������
				12235,    --˯������

				12236,    --��������
				17083,    --ǳɫ����
				17084,    --������Ȫˮ
				12238,    --ʥ�׳���
				12239,    --�������

				--���4��

				12231,    --��ζ����
				12232,    --Ũ�������
				23288,    --������
				17192,    --��������
				9760,     --����Ѫ��

				12233,    --���̾�
				12255,    --ҹ������
				12242,    --��ݮ��
				12231,    --��ζ����
				12232,    --Ũ�������

				--���5��(5.18���°汾��1206�޸Ļ�ɳ�����Ϊ֩�뵰��13439��1208���ڲ����ͻ��ˣ��Ļ���)
				12241,--��ζ������
				12244,--���ʼ嵰��
				12250,--��ɳ����
				12259,--�㿾������
				12247,--����Ұζ���

				9758,--������˹���Ѿ�
				17085,--�ۺ��ջ�
				17086,--�ջ���
				17087,--��������
				11688,--������

				--���6�ף�1206�޸Ļ�ɳ�����Ϊ֩�뵰��13439��1208���ڲ����ͻ��ˣ��Ļ���)

				12244,--���ʼ嵰��
				12250,--��ɳ����
				12259,--�㿾������
				12247,--�峴����ޣ
				9758, --�������Ѿ�

				17085,--�ۺ��ջ�
				17086,--�ջ���
				17087,--��������
				17195,--ɭ�ִ��ӻ�
				17086,--�ջ���

				--���7��(2011.3.17��չ��

				34161,	--��ζ�����
				34162,	--�������
				34164,	--��������
				34165,	--��¶��
				34166,	--ף����¶

				34161,	--��ζ�����
				34162,	--�������
				34164,	--��������
				34165,	--��¶��
				34166,	--ף����¶

				--���8��

				17194,--õ������
				17194,
				17194,
				17194,
				17194,

				17088,--��Ƥ����
				17088,
				17088,
				17088,
				17088,
			},
			--�ɿ�5001-5010
			[5] = {
				7056, --1��  ͭ��
				7057, --2��  ����ʯ
				11683,--3��  ����ʯ
				17455,--4��  п��ʯ
				17456,--5��  Ǧ��ʯ

				7058, --6��  ����ʯ
				7058, --7��  ����ʯ
				7058, --8��  ����ʯ
				7058, --9��  ����ʯ
				7060, --10�� ��ǿ�ʯ
			},
			--��ժ6001-6020
			[6] = {
				7076,  --1��  ҰǾޱ
				7075,  --1��  ޹�²�

				7081,  --2��  ֽɯ��
				9517,  --2��  Ҭ��

				7084,  --3��  ˯��
				7082,  --3��  ������

				7080,  --4��  ������
				9514,  --4��  ��ѿ��

				9518,  --5��  ����ޣ
				9501,  --5��  ������

				17063, --6��  �ξ���
				17065, --6��  ˪Ҷ��

				34111, --7��  �����
				34107, --7��  ��¶��

				34111, --8��
				34107, --8��

				7079,  --9��
				17063, --9��

				17065, --10��
				17065, --10��

			},
		}

		--��ʼ����ְҵ��񣬴洢������ָʾ�ĸ�ְҵid��Ʒ��ChargeItems{}����Ʒid
		--[��ְҵid] = {��ȡ��Ʒ������ʼid��Ӧ����ţ�ÿ��������Ʒ��}
		local VacationItemsStart = {
		[0] = 10,--����
		[1] = 10,--���
		[5] = 1, --�ɿ�
		[6] = 2, --��ժ
		}

		local iPlayervacationid ={}
		for i,v in ipairs(OpenVacationId) do	--�����ѧ��ĸ�ְҵ�����iPlayervacationid{}
			if TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, v) then
				iPlayervacationid[#iPlayervacationid+1] = v
			end
		end

		--ѡ��һ�������ัְҵ

		local VacationId = 0 --��ְҵ���࣬Ĭ��Ϊ���𣬷�ֹȡ��
		local VacationLevel= 1 --��ְҵ����Ĭ��Ϊ1������ֹȡ��

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)   --��ҵȼ�

		--�̶����ÿ���浽�����ݣ�������ż��*��Ҵ�����ɫ��ʱ�� %#iPlayervacationid+1
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --ȡ����ҽ�ɫ����ʱ��

		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		VacationId = iPlayervacationid[ (timePackage.yday + RoleCreateTime ) % #iPlayervacationid + 1] --������ȡ��Ʒ���ڵĸ�ְҵ���
		VacationLevel = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER, VacationId)		--������ø�ְҵ����

		--��ֹ�����������ɵ���ĵ�ͼ�����ݣ�����ҵȼ��͸�ְҵ�ȼ���ȡ��Сֵ

		if VacationId == 5 then --�ɿ���30����ѧ��ģ�����Ҫ���⴦��
			if VacationLevel > math.floor(iPlayerLevel/10)-2 then
				VacationLevel = math.floor(iPlayerLevel/10)-2
			end
		else
			if VacationLevel > math.floor(iPlayerLevel/10) then
				VacationLevel = math.floor(iPlayerLevel/10)
			end
		end

		local iRandomR = VacationItemsStart[VacationId]		  		--����뾶
		local NeedItemsStart = 1+(VacationLevel-1)*iRandomR   		--��Ҫ�������Ʒ��ʼ��������

		local NeedItemId 											--��Ҫ����Ʒid

		if VacationId == 5 then --�ɿ�Ļ�û�в������
			NeedItemId = ChargeItems[VacationId][NeedItemsStart]
		else
			NeedItemId = ChargeItems[VacationId][NeedItemsStart + timePackage.yday * RoleCreateTime % iRandomR]
		end


		--������debug����start

		local tabNeedItem = {9654, 9655, 9660, 9662, 9659, 9661, 7143, 9652, 9653}

		for i , v in ipairs(tabNeedItem) do
			if v == NeedItemId then
				NeedItemId = 9704
			end
		end

		if NeedItemId == 12250 then --��⿵Ļ�ɳ�����Ϊ ֩�뵰��
			NeedItemId = 13439
		end

		if NeedItemId == 17195 then --��⿵Ĵ��ִ��ӻ��Ϊ ֩�뵰��
			NeedItemId = 13439
		end

		--������debug����end

		local  key1,key2 --��Ʒid�洢���� key1=id/200,key2=id%200,id=key1+key2
		key1 = math.floor(NeedItemId / 200)
		key2 = NeedItemId % 200

		--���������

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,7680, 1, VacationId)		--�洢��ְҵ����
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,7680, 2, VacationLevel)	--�洢��ְҵ�ȼ�

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,7680, 3, key1)				--�洢��Ʒid/200
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,7680, 4, key2)				--�洢��Ʒid%200

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 3)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 4)

		local NeedItemId = key1 * 200 + key2						--��������ȡ��Ʒid

		Method.CollectItem = { Item1={ID=NeedItemId, Num=3, Common=true},}

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 3)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,7680, 4)
		local ChargeItemId = key1 * 200 + key2						--��������ȡ��Ʒid

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,ChargeItemId, true) >= 3 then
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��

   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)
		--����1�Ÿ�ְҵ���࣬2�Ÿ�ְҵ�ȼ���3��4��Ϊ��Ʒid��3�ű���ֵ*200+4�ű���ֵ��

		local AwardMulti = 60--��Ž���ϵ��
		local AwardMultiply = {1,1.2,1.4,1.6,1.8,2,2.1,2.2,2.3,2.4}			--������������������

		local ChargeVacationId = ucRandomNum1 					--����ȡ����Ʒ���Եĸ�ְҵid
		local ChargeVacationLevel = ucRandomNum2 				--����ȡ����Ʒ���Եĸ�ְҵ�ȼ�

		local ChargeItemId = ucRandomNum3 * 200 + ucRandomNum4 --����ȡ����Ʒid

		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

		local AwardNum


		if bSuccess then
			--TaskCApi.DeliverSideOccupExp(TASKINTERFACE_POINTER,ucRandomNum1,10 * AwardMultiply[ChargeVacationLevel])--����ҷ��Ÿ�ְҵ����
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, ChargeItemId, 3)    	--��ȡ��ͨ��Ʒ3��

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMultiply[ChargeVacationLevel] * AwardMulti)--����ҷ��ž���

			--���Ź��ṱ�׶�1��
			TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, 1)

			--���Ź�ѫ1��
			TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, 1)

			--���Ÿ��ƽ���
			math.randomseed(os.time())
			AwardNum = math.random(1,100)

			--20%���ʷ�1���ű�
			if AwardNum <= 20 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 9049, 1,false)
			end

			--1%���ʷ�2���ű�

			if AwardNum == 21 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 9050, 1,false)
			end



		--else--ʧ�ܷ���һ������9748
			--TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,9748)
   		end

   		return 0
   	end
}

TaskList[7700] = --�罻�������������
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
  		bFinishWhenDelvier = true,--���ܼ����
		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--ÿ��������1��

  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.SheJiaoJia,--�������ͣ��罻��
  		iTopic = TaskTopic.YiBan,--һ����������

  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--�����ҵȼ�>=20
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--��������Ƿ����ظ�����id 7012-7036
		for j = 7012,7036 do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then
			return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

		--��Ҫ�罻�ҵȼ�����Ϊ2��

		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, 32) then
			return TASK_PREREQU_FAIL_LUA_TASK
		elseif TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER, 32) < 2 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

   		iRet = TASK_SUCC_FINISH

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		if bSuccess then
			local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 7012)
   	   		if iRet ~=0  then --�Ƿ���Է���������






   		   	   return TASK_PREREQU_FAIL_FULL

   	   		end
   		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

			math.randomseed(os.time())
			--�������id��7012-7036
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, math.random(7012,7036))--��7012-7036�����һ�������񲢿���

   		end

   		return 0
   	end
}

TaskList[7787] = --����������ʦ��ζ����
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, --��������ʧ�ܽ���

		iRetrieveIdx = 17,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 80,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--��Ž���ϵ��
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ


		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}

			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local ItemId

			if PlayerLevel < 30 then

				if PlayerLevel<20 then		--���10-19�����ϲݾ�12343
					ItemId = 12343
				else						--���20-29��������Ũ��17081
					ItemId = 17081
				end
			else
				if PlayerLevel < 40 then					--���30-39����˯������12235
					ItemId = 12235
				elseif PlayerLevel <50 then	--���40+������ݮ��12242
					ItemId = 12242
				elseif PlayerLevel < 60 then --���50-59������������17087
					ItemId = 17087
				elseif PlayerLevel < 70 then --���60-69�����������¶17088
					ItemId = 17088
				elseif PlayerLevel < 80 then --���70-79�������ξ�34163
					ItemId = 34163
				else--���80+�������ξ�34163
					ItemId = 34163
				end
			end


			items = {
						Item1 = {ID = ItemId, NUM = 4},--0ʱΪ��������������ʾ��Ʒ������
					}
			return items
		end
		,
		-- ��ְҵ����




		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			soe = {
						SOE1 = {ID = 1, EXP = 2},--idΪ��ְҵid��expΪ��ֵ��expΪ0��ʾ������
				  }
			return soe
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 15 then --�ȼ���Ҫ����15��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 2 then --��ͨ��������Ҫ2��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--[[
		math.randomseed(os.time())
		local iRandomMethod = math.random(1, 2) --����浽����������
		]]--

		--�޸ĵĲ��֣��̶����ÿ���浽�����ݣ�������ż��*��Ҵ�����ɫ��ʱ��mod2
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --ȡ����ҽ�ɫ����ʱ��

		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday
		local iRandomMethod =  ( timePackage.yday + RoleCreateTime )% 2 + 1 --��ҵ����浽����������

   		--�����߻���
		TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 20468, 1, true)     --�� ��������

		if iRandomMethod == 1 then
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 20469, 1, true) --�� �����

		else
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 20470, 1, true) --�� �˹�
		end

		--���������

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 7787, 1, iRandomMethod)
		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 7787, 1)

   		if iRandomMethod < 2 then
   		    Method.CollectItem = { Item1 = {ID=20468, Num=1, Common=true},
				Item2 = {ID=20469, Num=1, Common=true},
				Item3 = {ID=20484, Num=2, Common=true},
			} --��������,�����,������
			Method.iTimeLimit = 3600 --1Сʱû���������ʧ��
   		else
   		    Method.CollectItem = { Item1={ID=20468, Num=1, Common=true},
				Item2 = {ID=20470, Num=1, Common=true},
				Item3 = {ID=20487, Num=4, Common=true},
				}  --�����������˹������۹�¶
			Method.iTimeLimit = 3600 --1Сʱû���������ʧ��
		end

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��





   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iRetrieveIdx = 17

		local AwardMulti = 60									--��Ž���ϵ��
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

		local FuYunAward = {
					{pro = 30 , id1 = 27124 , id2 = 27135,}, --2�������䷽(10)1����ʦ
					{pro = 25 , id1 = 27125 , id2 = 27136,}, --3�������䷽(20)2����ʦ
					{pro = 20 , id1 = 27126 , id2 = 27137,}, --4�������䷽(30)3����ʦ
					{pro = 15 , id1 = 27127 , id2 = 27138,}, --5�������䷽(40)4����ʦ
					{pro = 10 , id1 = 27128 , id2 = 27139,}, --6�������䷽(50)5����ʦ
					{pro = 8 ,  id1 = 27129 , id2 = 27140,}, --7�������䷽(60)6����ʦ
					{pro = 6 ,  id1 = 27130 , id2 = 27141,}, --8�������䷽(65)7����ʦ
					{pro = 5 ,  id1 = 27131 , id2 = 27142,}, --9�������䷽(70)7����ʦ
					{pro = 4 ,  id1 = 27132 , id2 = 27143,}, --10�������䷽
					{pro = 3 ,  id1 = 27133 , id2 = 27144,}, --11�������䷽
				}

   		if bSuccess then
			if ucRandomNum1 == 1 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20468, 1)    --��ȡ�������� 1��
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20469, 1)    --��ȡ�����  1��
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20484, 2)    --��ȡ������  1��
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20509, 1)	 --��ȡ���˵�� 1��

			else
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20468, 1)    --��ȡ�������� 1��
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20470, 1)    --��ȡ�˹�  1��
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20487, 4)    --��ȡ��¶  1��
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20509, 1)	 --��ȡ���˵�� 1��
			end


			--����ҷ��Ÿ�ְҵ����
			TaskCApi.DeliverSideOccupExp(TASKINTERFACE_POINTER, 1,2)

			--����ҷ��ž���
			--TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)
			TaskCApi. DeliverRetrieveExp(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti,bRetrieve,iRetrieveIdx)

			--����ҷ��Ž���

			--�����е�&���ƽ���
			math.randomseed(os.time())
			AwardNum = math.random(1,1000)
			AwardNum2 = math.random(1,2)

			local ItemId

			if PlayerLevel < 30 then

				if PlayerLevel<20 then		--���10-19�����ϲݾ�12343
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 12343, 4, false)
					if AwardNum > 650 then
						ItemId = 27088 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --10-19��ʱ��27088�� 27100
					end
				else						--���20-29��������Ũ��17081
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 17081, 4, false)
					if AwardNum > 650  then
						ItemId = 27089 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --20-29��ʱ��27089�� 27101
					end
				end
			else
				if PlayerLevel < 40 then					--���30-39����˯������12235
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 12235, 4, false)
					if AwardNum > 650  then
						ItemId = 27090 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --30-39��ʱ��27090�� 27102
					end
				elseif PlayerLevel <50 then	--���40+������ݮ��12242
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 12242, 4, false)
					if AwardNum > 650  then
						ItemId = 27091 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --40-49��ʱ��27091�� 27103
					end
				elseif PlayerLevel < 60 then --���50-59������������17087
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 17087, 4, false)
					if AwardNum > 650  then
						ItemId = 27092 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --50-59��ʱ��27092�� 27104
					end
				elseif PlayerLevel < 70 then --���60-69�����������¶17088
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 17088, 4, false)
					if AwardNum > 650  then
						ItemId = 27093 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --50-59��ʱ��27093�� 27105
					end
				elseif PlayerLevel < 80 then --���70-79�������ξ�34163
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 34163, 4, false)
					if AwardNum > 650  then
						ItemId = 27094 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --50-59��ʱ��27094�� 27106
					end
				else--���80+�������ξ�34163
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 34163, 4, false)
					if AwardNum> 650  then
						ItemId = 27094 + (AwardNum2-1) * 12
						TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 6, false) --80+��ʱ��27094�� 27106
					end
				end
			end

			--���ƽ����������䷽

			local AwardLevel

			if AwardNum <= 30 then
				--�����������ֵ

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

			--�׶��Խ�������14016+1
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 14016, 1)

			--��ղ���ֵ
			TaskCApi. ClearRetrieveVal(TASKINTERFACE_POINTER,7787, iRetrieveIdx)

		else--ʧ���������
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20468, 1)    --��ȡ�������� 1��
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20469, 1)    --��ȡ�����  1��
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20470, 1)    --��ȡ�˹�  1��
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 20509, 1)	 --��ȡ���˵�� 1��
   		end

   		return 0
   	end
}


--[[
TaskList[7892] = --�ղ���������
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

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)

			return 100--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,
		-- �ǰ�Ǯ
		Gold = function(TASKINTERFACE_POINTER)
			return 200--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,
		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			return 300--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,
		-- SP
		SP = function(TASKINTERFACE_POINTER)
			return 400--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,
		-- ����
		Reputation = function(TASKINTERFACE_POINTER)
			return 500--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 7075, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������




						Item2 = {ID = 7076, NUM = 2},
					}
			return items
		end
		,
		-- ��ְҵ����




		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			soe = {
						SOE1 = {ID = 1, EXP = 10},--idΪ��ְҵid��expΪ��ֵ��expΪ0��ʾ������




						SOE2 = {ID = 2, EXP = 20},
				  }
			return soe
		end
		,

		-- ��������
		FriendShips = function(TASKINTERFACE_POINTER)
			local friendships = {}
			friendships = {
								FS1 = {ID = 1, VAL = 10},--idΪ����id��valΪ��ֵ��val=0 ����������id=-1�� ���� ��������val=0��




								FS2 = {ID = 2, VAL = 20},
						  }
			return friendships
		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 1 --���ṱ�׶�




			factionaward.money = 2   --�����ʽ�
			factionaward.melee = 3   --������װ
			factionaward.magic = 4   --����ħ��
			factionaward.economy = 5 -- ���ᾭ��
			factionaward.culture = 6 --��������
			factionaward.belief = 7  --��������
			factionaward.credit = 8  --���Ṧѫ
			factionaward.vitality = 9 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--����10��





	   	if iPlayerLev < 10 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		for i = 7893, 7896 do --�鿴�Ƿ��Ѿ���ɹ�7893-7896����
			if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, i, true) then
				break
			elseif i ==7896 then
				return TASK_PREREQU_FAIL_LUA_TASK	--ȫ����ɹ���
			end
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		local iRandomNum = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 7892, 1)

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

   	--��ɸ�����ʱ����������






   	OnAward = function(TASKINTERFACE_POINTER, Self, bSuccess)
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������





		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������






		if bSuccess then
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,AwardExpAdjust * AwardMultiply[ChargeVacationLevel] * AwardMulti)--����ҷ��ž���





   		end

   		return 0
   	end
}
]]--

TaskList[8089] = --����Ҫ����������8089
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = true,
		bHiddenTask = true, 		--��������

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

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)

			return 0--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
		-- ��Ǯ

		BindMoney = function(TASKINTERFACE_POINTER)
			return 0--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
						Item1 = {ID = 0, NUM = 0},--0ʱΪ��������������ʾ��Ʒ������
					}
			return items
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--����20��

	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end
   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		Method.iWaitTime = 0

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

		local ikey = math.floor(iValue/100) --180013������0��70-240��ȡֵ���̿���Ϊ0��1��2

		if bSuccess then

			if ikey == 0 then --����Ҫ������Ʒ�����������
				return 0

			else --��Ҫ������Ʒ





				if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then--��ͨ��������Ҫ1��





					return TASK_PREREQU_FAIL_GIVEN_ITEM
				end
			end
   		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--������1�������飬����Ϊ���߱���180013����ֵ����1.1����Ϊ���齱���������ȼ�90���Ǻ㶨�ȼ�
		--������2�������񷢵��ߣ����ݷ��߱���180013����ֵ����100���̣����Ϊ0�򲻷�����
		--����Ϊ1������8802,����Ϊ2������8803,����Ϊ3������8804,����Ϊ4������8805
		--������3������ϵ��Ϊ200,60�������ȼ�����Ǯ





		--180014Ϊ1ʱ������8620

		local iIndex = 180013
		local iIndex2 = 180014
		local iValue = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex)
		local iValue180014 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, iIndex2)

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAwardMutli = math.floor(iValue * 1.1)
		local iItemMutli = math.floor(iValue/100)
		local iMoneyMutli = 200

   		if bSuccess then

			if iPlayerLevel < 91 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[iPlayerLevel])
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMoneyMutli * TaskMoneyAdjust[iPlayerLevel])
			else
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpAwardMutli * TaskExpAdjust[90])
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMoneyMutli * TaskMoneyAdjust[90])
			end

			if iItemMutli > 0 then
				if iItemMutli >= 5 then
					iItemMutli = 4
				end
				local TaskID = 0
				if iPlayerLevel < 45 then
					TaskID = 12384 + iItemMutli					--С��45�����󶨾�������
				else
					TaskID = 8801 + iItemMutli					--����45�������󶨾�������
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

TaskList[8162] = --�����������8162
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

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{

	}
	,

   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		--��Ҫ��������8161

   		if not TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, 8161) then
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end


		--��������Ƿ����ظ�����id 8193.8194
		for j = 8193,8194 do
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then
			return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

   		return 0
   	end
   	,

   	OnDeliver = function(TASKINTERFACE_POINTER)
   		--18��ȫ�ֱ���������Ŀ��





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

		local QuestionNum = 11 --��ǰ���������Ŀ��
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
			if iRet ~=0  then --�Ƿ���Է���������





				return TASK_PREREQU_FAIL_FULL
			end
		end
   		return 0
   	end
   	,

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess, iParam)
   		if bSuccess then
			if iParam == 1 then
				--ѡ��A,16+1
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,8193)
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER,16, 1)
			else
				--ѡ��B,17+1
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,8194)
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER,17, 1)
			end
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) --ȡ����ҵȼ�
			local AwardExpAdjust = TaskExpAdjust[PlayerLevel]					--�ȼ�ϵ��
			local AwardExp = 45												--����ϵ��
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExp * AwardExpAdjust)
		end

   		return 0
   	end
}


TaskList[8193] = --���������������A
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,--���ɷ���

  		bShowPrompt = true,
  		bCanSeekOut = true,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,


	-- �ɹ�ʱ��Ч

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
		Method.iTimeLimit = 180 --3����û���������ʧ��
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
   	   		if iRet ~=0  then --�Ƿ���Է���������

   		   	   return TASK_PREREQU_FAIL_FULL
   	   		end
   		end

   		return 0
   	end
   	,

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		--�����������ʱѡ��A����ô�ж�ȫ�ֺ���16�Ƿ�С��ȫ�ֺ���17��
		--С���򷢷�����ͶƱ�ɹ�ID:8163�������Ÿ�л�ʡ���ϲ�㣬�����������ɣ�ѡA��������ѡB�������٣�ȫ�ֺ���17-16��ֵ������
		--���ڷ��š�����ʧ��ID:8164�������Ÿ�л�ʡ��ܿ�ϧ�������ڶ����ɣ�ѡA��������ѡB�������ࣨȫ�ֺ���16-17��ֵ������
		--��������������������������򷢷š�����ʧ��8164���������Ÿ�л�ʡ�
		local value16 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 16)
		local value17 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 17)
		local value20 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 20)--20�ű���Ϊ1ʱ��������ʤ��

   		if bSuccess then

			if value20 == 0 then --����ʤ
				if value16 < value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8163)

				elseif value16 > value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)

				else
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)
				end

			else	--����ʤ��
				if value16 < value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8163)

				elseif value16 > value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)

				else
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)
				end

			end
		else
			--ʧ�ܵ�����һ��
			local iItemsid = 21180
			local iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false) --������Ʒ

			if iItemsnum > 0 then
				--������ڣ�������������Ʒ
				TaskCApi.TakeAwayTaskItem(TASKINTERFACE_POINTER,iItemsid, 1)
			end

   		end

   		return 0
   	end
}


TaskList[8194] = --���������������B
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,
  		bCanGiveUp = false,--���ɷ���

  		bShowPrompt = true,
  		bCanSeekOut = true,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч




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
		Method.iTimeLimit = 180 --3����û���������ʧ��

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
   	   		if iRet ~=0  then --�Ƿ���Է���������





   		   	   return TASK_PREREQU_FAIL_FULL
   	   		end
   		end

   		return 0
   	end
   	,

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess, iParam)
		--�����������ʱѡ��B����ô�ж�ȫ�ֺ���17�Ƿ�С��ȫ�ֺ���16��





		--С���ڷ�������ͶƱ�ɹ��������Ÿ�л�ʡ���ϲ�㣬�����������ɣ�ѡB��������ѡA�������٣�ȫ�ֺ���16-17��ֵ������
		--���ڷ��š�����ʧ�ܡ������Ÿ�л�ʡ��ܿ�ϧ�������ڶ����ɣ�ѡB��������ѡA�������ࣨȫ�ֺ���17-16��ֵ������






		--��������������������������򷢷š�����ʧ��8164���������Ÿ�л�ʡ�





		local value16 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 16)
		local value17 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 17)
		local value20 = TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER, 20)--20�ű���Ϊ1ʱ��������ʤ��






   		if bSuccess then

			if value20 == 0 then --����ʤ





				if value16 > value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8163)

				elseif value16 < value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)

				else
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)
				end

			else	--����ʤ��
				if value16 < value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8163)

				elseif value16 > value17 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)

				else
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 8164)
				end

			end

		else
			--ʧ�ܵ�����һ��21180
			local iItemsid = 21180
			local iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false) --������Ʒ

			if iItemsnum > 0 then
				--������ڣ�������������Ʒ
				TaskCApi.TakeAwayTaskItem(TASKINTERFACE_POINTER,iItemsid, 1)
			end
   		end

   		return 0
   	end
}

TaskList[8204] = --Ϊ����ID8204:ʯ��õ��002��Ʒ������

{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
  		bCanSeekOut = true,--��������

		iRetrieveIdx = 24,--��ۼƽ�������ϵ��

  		bRecordFinishCount = true,--��¼��ɴ���
  		iMaxFinishCount = 3,--�����ɴ���Ϊ3
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--ÿ�����

  		iType  = TaskType.HuoDong,--�������ͣ�ʯ��õ��
  		iTopic = TaskTopic.YiBan,--һ����������
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 75										--����ϵ��
			local AwardMultiTab ={0.6 , 1 , 1.4 ,0,0,0,0,0}				--ÿ��3��

			local CompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8204) --�����Ѿ���ɴ���
			local AwardTimes = CompleteTimes + 1

			local PlayerLevel = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 1) 							--��������ʱ��ҵĵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel]

			local AwardExp = AwardExpAdjust * AwardMulti * AwardMultiTab[AwardTimes]	--����ҷ��ž���

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)   --��ҵȼ�
		--�����ҵȼ��Ƿ�>=35
		if iPlayerLev < 35 then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

   		return 0

   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local OpenVacationNum = 3 --��ǰ���ŵĿ���ȡ��Ʒ�ĸ�ְҵ����������չ

		--Ҫ��ȡ����Ʒ��񣬸�ְҵ�ȼ�Ϊ����

		--��������˳��Ϊ ������⿣����գ����ģ�
		local ChargeItems = {
			--1�ײ�Ʒ��ֻ���������

			[1] = {
				--1-10
				21432, --1������
				21419, --1�����
				21432, --1������
				21419, --1�����
				21432, --1������
				21419, --1�����
				21432, --1������
				21419, --1�����
				21432, --1������
				21419, --1�����
			},

			--2�ײ�Ʒ��ֻ���������

			[2] = {
				--1~5
				21433, --2������
				21420, --2�����
				21433, --2������
				21420, --2�����
				21433, --2������

				--6~10
				21420, --2�����
				21433, --2������
				21420, --2�����
				21433, --2������
				21420, --2�����
			},

			--3�ײ�Ʒ��ֻ��������⿡����ա�����

			[3] = {
				21434, --3������
				21421, --3�����
				11672, --1������
				21452, --1������
				21434, --3������

				21421, --3�����
				11672, --1������
				21452, --1������
			},

			--4�ײ�Ʒ��ֻ��������⿡����ա�����


			[4] = {
				--1~5
				21435, --4������
				21422, --4�����
				11673, --2������
				21453, --2������
				21435, --4������
				--6~10
				21422, --4�����
				11673, --2������
				21453, --2������
			},

			--5�ײ�Ʒ��ֻ��������⿡����ա�����

			[5] = {
				--1~5
				21436, --5������
				21423, --5�����
				11674, --3������
				21454, --3������
				21436, --5������
				--6~10
				21423, --5�����
				11674, --3������
				21454, --3������
			},

			--6�ײ�Ʒ��ֻ��������⿡����ա�����
			[6] = {
				--1~5
				21437, --6������
				21424, --6�����
				11675, --4������
				21455, --4������
				21437, --6������
				--6~10
				21424, --6�����
				11675, --4������
				21455, --4������
			},

			[7] = {
				--1~5
				28009, --7������
				28013, --7�����
				11676, --5������
				21455, --5������
				28009, --7������
				--6~10
				28013, --7�����
				11676, --5������
				21455, --5������
			},

			[8] = {
				--1~5
				28009, --7������
				28013, --7�����
				11676, --5������
				21455, --5������
				28009, --7������
				--6~10
				28013, --7�����
				11676, --5������
				21455, --5������
			},
		}


		local iRandomTotalType = 40 --ϵͳԤ���������п��������������ǵ��ڱ�TabRandomOrder������

		--ϵͳԤ������������Ԫ��n ��n/10 ȡ��Ϊ����뾶��������3����n%OpenVacationNumΪ�����������
		local TabRandomOrder = {
			[1]  = {11,21,31,},--����Ϊÿ�����ɴ���
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

		--�̶����ÿ���浽������
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --ȡ����ҽ�ɫ����ʱ��
		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		local iRandomType = ( timePackage.yday + RoleCreateTime ) % iRandomTotalType + 1 --��ҵ����浽����������,��TabRandomOrder{}������
		local iCompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8204) --8204�������Ѿ���ɴ���

		local iItemOrder = TabRandomOrder[iRandomType][ iCompleteTimes+1 ] --������Ʒ��ԭʼ���У�����ȷ������Ҫ��ȡ����Ʒ�������ĸ���

		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)   --��ҵȼ�
		local VacationHighLevel = math.floor(PlayerLevel / 10)

		local VacationLevel --��ȡ�Ĳ�Ʒ�ȼ�

		if VacationHighLevel > 2 then
			VacationLevel = VacationHighLevel - 3 + math.floor(iItemOrder/10)
		else
			VacationLevel = math.floor(iItemOrder/10) %	VacationHighLevel + 1 --������Ϊ10+������ȡ1����Ʒ��Ϊ20+������ȡ����Ϊ1������2��
		end

		local NeedItemId = 33 --ΪNeedItemId��ʼ��һ��ֵ����ֹȡ��
		NeedItemId = ChargeItems[VacationLevel][iItemOrder % OpenVacationNum+1]

		local  key1,key2 --��Ʒid�洢���� key1=id/200,key2=id%200,id=key1+key2
		key1 = math.floor(NeedItemId / 200)
		key2 = NeedItemId % 200

		--���������

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8204, 1, PlayerLevel)		--�洢��ҵȼ�
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8204, 2, key1)				--�洢��Ʒid/200
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8204, 3, key2)				--�洢��Ʒid%200

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 2)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 3)

		local NeedItemId = key1 * 200 + key2						--��������ȡ��Ʒid

		Method.CollectItem = { Item1={ID=NeedItemId, Num=1, Common=true},}

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 2)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8204, 3)
		local ChargeItemId = key1 * 200 + key2						--��������ȡ��Ʒid

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

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)
		--����1�Ž�������ʱ��ҵȼ���2��3��Ϊ��Ʒid��2�ű���ֵ*200+3�ű���ֵ��

		local AwardMulti = 75										--����ϵ��
		local AwardMultiTab ={0.6 , 1 , 1.4 ,0,0,0,0,0}				--ÿ��3��
		local iRetrieveIdx =24

		local CompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8204) --�����Ѿ���ɴ���
		local AwardTimes = CompleteTimes

		local PlayerLevel = ucRandomNum1 							--��������ʱ��ҵĵȼ�����������

		local ChargeItemId = ucRandomNum2 * 200 + ucRandomNum3  	--����ȡ����Ʒid

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel]

		if bSuccess then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, ChargeItemId, 1)    		--��ȡ��ͨ��Ʒ1��

			--TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti * AwardMultiTab[AwardTimes])	--����ҷ��ž���
			TaskCApi. DeliverRetrieveExp(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti * AwardMultiTab[AwardTimes],bRetrieve,iRetrieveIdx)

			--��ղ���ֵ
			TaskCApi. ClearRetrieveVal(TASKINTERFACE_POINTER,8204, iRetrieveIdx)


   		end

   		return 0
   	end
}


TaskList[8547] = --1��_����������������

{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --�����������

		bBuildTask = true, --���Ὠ������

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4��

  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����

  		iTopic = TaskTopic.YiBan,--һ����������
  	}
   	,

	-- �ɹ�ʱ��Ч

	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547) + 1--��������ɴ������������Σ�

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������

			local iExpAwardMutli = 1  --��������ϵ��
			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust
			return iExpAward --����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,

		-- ��Ǯ

		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
			--�󶨽�
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547) + 1--��������ɴ������������Σ�
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ
			local iMonAwardMutli = 1  --������Ǯϵ��
			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust
			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 1 --���ṱ�׶�
			factionaward.money = 0   --�����ʽ�
			factionaward.credit = 1  --���Ṧѫ
			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		--�����ҵȼ�>=200,����ر�
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--��������Ƿ�������������





		local MainTaskTable = {8548, 8549, 8550, 8551}		--�����������б�





		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}								--����һ���ԱȲο���

		local TaskTypeNum = 4								--�������������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
		if iPlayerLev < 60 then
		--60��������Ϊ��������




			for i = 1, 10 do
				AssistTaskTable20[i] = i + 8556
				AssistTaskTable40[i] = i + 8566
			end
		else
		--60+ֱ�ӽ������
			--�ȼ���20-59�Ļ�������
			for i = 1,20 do
				AssistTaskTable60[i] = i + 8556
				HelpTaskTable60[i] = i + 8556
 			end
			--����������




			table.insert(AssistTaskTable60,9622)
			table.insert(AssistTaskTable60,9623)

			table.insert(HelpTaskTable60,9622)
			table.insert(HelpTaskTable60,9623)
		end

		--��Ҫ������������ɾ����������͸߼�����

		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then

					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for n = 1 , 10 do
								if AssistTaskTable20[n] == j then
									table.remove(AssistTaskTable20,n)
								end
							end
						end
					end

				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





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


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}					--30+������ɱ������





			--20-29����Ҳ��������30+ɱ������




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 60 then
			local LowLevelBaseTable = {8567,8568,8570,8571}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576}	--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <=80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]

		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8547, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 8547, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������




		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8547, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 8547, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable = {
		--���׶�




				[1]=1,
				[2]=1,
				[3]=1,
				[4]=1,
			}

		local ExploitTable = {
		--��ѫ
				[1]=1,
				[2]=1,
				[3]=1,
				[4]=1,
			}

		local GuildMonTable = {
		--�����ʽ�
				[1]=0,
				[2]=0,
				[3]=0,
				[4]=0,
			}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ





		local iExpAwardMutli = 1  --��������ϵ��
		local iMonAwardMutli = 1  --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��
		local iZiYuanMutli1 = 1   --����1����Դ����ϵ��





		local iPersonalActive = 2		--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)--��������ɴ������������Σ�

		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable[FinishTime]) 					--���Ź��Ṧѫ��




				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��




				TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable[FinishTime]) 		--���Ź��׶�
				--TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable[FinishTime]*iGuildMoneyMuti)		--���Ź����ʽ�
				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)

					--Ƶ���㲥
					TaskCApi.Broadcast(TASKINTERFACE_POINTER, 8547, TaskBroadcastChannel.Kingdom)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����
					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end

				end
			end



		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 8547)
   		end

		--TaskCApi.Broadcast(TASKINTERFACE_POINTER, 8547, TaskBroadcastChannel.Local)
		--TaskCApi.Broadcast(TASKINTERFACE_POINTER, 8547, TaskBroadcastChannel.Kingdom)

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}


TaskList[8548] = --1��_��������_����Ǳ����
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --�����������

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������

  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����
  		iTopic = TaskTopic.YiBan,--һ����������

  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--4�Լ����¼���
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8548) + 1--��������ɴ������������Σ�

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������

			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8548) + 1--��������ɴ������������Σ�

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ

			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�

				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
				}
			local ContributionTable40 = {
			--���׶�

					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ContributionTable60 = {
			--���׶�
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			--3����Դ,4���Լ����µȼ�����

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
			--4����Դ,4���Լ����µȼ�����




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

			--1234����Դ,5������Ļ���
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

			--12345����Դ,6������Ļ���
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
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8548) + 1--��������ɴ������������Σ�

			local iGuildlevel = TaskCApi.GetFactionLev(TASKINTERFACE_POINTER)	--������ڹ���ȼ������صȼ�+3��

			local iGuildMoneyMuti = 1
			local factionaward = {}

			--[[
			10.12.6����bug
			5������Ǳ�����Ӧ����beliefֵ����������װֵ��

			--]]

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��
				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�

				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				if iGuildlevel <=4 then --4���Լ����»���

					factionaward.economy = GuildZiYuan320Lel4[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan420Lel4[FinishTime]		--����4#������Դ
				elseif iGuildlevel == 5 or iGuildlevel == 6 then--5/6������Ļ���
					factionaward.belief = GuildZiYuan20Lel5[FinishTime] 		--����5#������Դ
					factionaward.magic = GuildZiYuan20Lel5[FinishTime]			--����2#������Դ
					factionaward.economy = GuildZiYuan20Lel5[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan20Lel5[FinishTime]		--����4#������Դ
				elseif iGuildlevel == 7 then--7������Ļ���
					--factionaward.melee 	 = GuildZiYuan20Lel6[FinishTime] 		--����1#������Դ
					factionaward.magic	 = GuildZiYuan20Lel6[FinishTime]		--����2#������Դ
					factionaward.economy = GuildZiYuan20Lel6[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan20Lel6[FinishTime]		--����4#������Դ
					factionaward.belief  = GuildZiYuan20Lel6[FinishTime]		--����5#������Դ
				end

			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��

				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�


				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				if iGuildlevel <= 4 then --4���Լ����»���

					factionaward.economy = GuildZiYuan340Lel4[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan440Lel4[FinishTime]		--����4#������Դ
				elseif iGuildlevel == 5 or iGuildlevel == 6 then--5.6������Ļ���
					factionaward.magic = GuildZiYuan40Lel5[FinishTime]			--����2#������Դ
					factionaward.economy = GuildZiYuan40Lel5[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan40Lel5[FinishTime]		--����4#������Դ
					factionaward.belief = GuildZiYuan40Lel5[FinishTime] 		--����5#������Դ
				elseif iGuildlevel == 7 then--7������Ļ���
					--factionaward.melee 	 = GuildZiYuan40Lel6[FinishTime] 		--����1#������Դ
					factionaward.magic	 = GuildZiYuan40Lel6[FinishTime]		--����2#������Դ
					factionaward.economy = GuildZiYuan40Lel6[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan40Lel6[FinishTime]		--����4#������Դ
					factionaward.belief  = GuildZiYuan40Lel6[FinishTime]		--����5#������Դ
				end

			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��

				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�

				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				if iGuildlevel <= 4 then--4���Լ����»���


					factionaward.economy = GuildZiYuan360Lel4[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan460Lel4[FinishTime]		--����4#������Դ
				elseif iGuildlevel == 5 or iGuildlevel == 6 then--56������Ļ���
					factionaward.belief = GuildZiYuan60Lel5[FinishTime] 		--����5#������Դ
					factionaward.magic = GuildZiYuan60Lel5[FinishTime]			--����2#������Դ
					factionaward.economy = GuildZiYuan60Lel5[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan60Lel5[FinishTime]		--����4#������Դ
				elseif iGuildlevel == 7 then--7������Ļ���
					--factionaward.melee 	 = GuildZiYuan60Lel6[FinishTime] 		--����1#������Դ
					factionaward.magic	 = GuildZiYuan60Lel6[FinishTime]		--����2#������Դ
					factionaward.economy = GuildZiYuan60Lel6[FinishTime] 		--����3#������Դ
					factionaward.culture = GuildZiYuan60Lel6[FinishTime]		--����4#������Դ
					factionaward.belief  = GuildZiYuan60Lel6[FinishTime]		--����5#������Դ
				end

			end

			factionaward.vitality = 2 --�����Ծ��

			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8548 --ʡ���õġ���

		--�����ҵȼ�>=200
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8548 --ʡ���õġ���

		--��������Ƿ�������������

		local MainTaskTable = {8547, 8549, 8550, 8551}		--�����������б�
		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 ={}

		local TaskTypeNum = 4								--�������������

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��




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

		--׷�ӳǱ�ר�����񣨲����ڻ�������⣩
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


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}					--30+������ɱ������




			--�Ǳ�������ɫ��8577��8578���ǵͼ��������Բ�����

			--20-29����Ҳ��������30+ɱ������




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 60 then
			local LowLevelBaseTable = {8567,8568,8570,8571, 8585}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576, 8586}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������




		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 8548 --ʡ���õġ���

   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 8548 --ʡ���õġ���


		--4�Լ����¼���
		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ContributionTable40 = {
		--���׶�
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ContributionTable60 = {
		--���׶�
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local ExploitTable20 = {
		--��ѫ
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ExploitTable40 = {
		--��ѫ
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ExploitTable60 = {
		--��ѫ
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}


		local GuildMonTable20 = {
		--�����ʽ�
				[1]=500,
				[2]=1000,
				[3]=1500,
				[4]=2000,
			}
		local GuildMonTable40 = {
		--�����ʽ�
				[1]=1000,
				[2]=2000,
				[3]=3000,
				[4]=4000,
			}
		local GuildMonTable60 = {
		--�����ʽ�
				[1]=2000,
				[2]=3000,
				[3]=5000,
				[4]=6000,
			}

		--3����Դ,4���Լ����µȼ�����

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

		--4����Դ,4���Լ����µȼ�����

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

		--2345����Դ,5������Ļ���
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

		--12345����Դ,5������Ļ���
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

		local iGuildlevel = TaskCApi.GetFactionLev(TASKINTERFACE_POINTER)	--������ڹ���ȼ�

		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������

		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ


		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ


		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�

		--[[
			10.12.6����bug
			5������Ǳ�����Ӧ����beliefֵ����������װֵ��
		--]]

		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��
				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��

				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 					--���Ź��Ṧѫ��
					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�
					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�

					if iGuildlevel <= 4 then--4���Լ����»���

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320Lel4[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420Lel4[FinishTime]) 		--����4#������Դ

					elseif iGuildlevel == 5 or iGuildlevel == 6  then
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan20Lel5[FinishTime]) 		--����2#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan20Lel5[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan20Lel5[FinishTime]) 		--����4#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan20Lel5[FinishTime]) 		--����5#������Դ

					elseif iGuildlevel ==7 then
						--TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 0 ,GuildZiYuan20Lel6[FinishTime]) 		--����1#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan20Lel6[FinishTime]) 		--����2#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan20Lel6[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan20Lel6[FinishTime]) 		--����4#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan20Lel6[FinishTime]) 		--����5#������Դ

					end

				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 					--���Ź��Ṧѫ��

					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�

					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�

					if iGuildlevel <= 4 then--4���Լ����»���

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340Lel4[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440Lel4[FinishTime]) 		--����3#������Դ
					elseif iGuildlevel == 5 or iGuildlevel == 6  then
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan40Lel5[FinishTime]) 		--����2#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan40Lel5[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan40Lel5[FinishTime]) 		--����4#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan40Lel5[FinishTime]) 		--����5#������Դ

					elseif iGuildlevel ==7 then
						--TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 0 ,GuildZiYuan40Lel6[FinishTime]) 		--����1#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan40Lel6[FinishTime]) 		--����2#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan40Lel6[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan40Lel6[FinishTime]) 		--����4#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan40Lel6[FinishTime]) 		--����5#������Դ
					end

				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 					--���Ź��Ṧѫ��

					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�

					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�

					if iGuildlevel <= 4 then--4���Լ����»���

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360Lel4[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460Lel4[FinishTime]) 		--����3#������Դ
					elseif iGuildlevel == 5 or iGuildlevel == 6 then
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan60Lel5[FinishTime]) 		--����2#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan60Lel5[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan60Lel5[FinishTime]) 		--����4#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan60Lel5[FinishTime]) 		--����5#������Դ

					elseif iGuildlevel ==7 then
						--TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 0 ,GuildZiYuan60Lel6[FinishTime]) 		--����1#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan60Lel6[FinishTime]) 		--����2#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan60Lel6[FinishTime]) 		--����3#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan60Lel6[FinishTime]) 		--����4#������Դ
						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan60Lel6[FinishTime]) 		--����5#������Դ
					end
				end


				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����
					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[8549] = --1��_��������_ס���������
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����

  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --�����������

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��4�Σ���������������

  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����
  		iTopic = TaskTopic.YiBan,--һ����������
  	}
   	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8549 --ʡ���õġ����汾����id

		--�����ҵȼ�>=200
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--ÿ���һ��������ʱ����Ƿ�������id=22917
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
	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--4�Լ����¼���
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8549) + 1--��������ɴ������������Σ�

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������
			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ��Ǯ
		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8549) + 1--��������ɴ������������Σ�
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ
			local iMonAwardMutli = 1  --������Ǯϵ��
			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}

			local ContributionTable40 = {
			--���׶�
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ContributionTable60 = {
			--���׶�
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3����Դ
					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3����Դ
					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3����Դ
					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}

			local GuildZiYuan420 ={
			--4����Դ
					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan440 ={
			--4����Դ
					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan460 ={
			--4����Դ
					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8549) + 1--��������ɴ������������Σ�
			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��
				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�
				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				--4���Լ����»���
				factionaward.economy = GuildZiYuan320[FinishTime] 		--����3#������Դ
				factionaward.culture = GuildZiYuan420[FinishTime]		--����4#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��
				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�
				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				--4���Լ����»���
				factionaward.economy = GuildZiYuan360[FinishTime] 		--����3#������Դ
				factionaward.culture = GuildZiYuan460[FinishTime]		--����4#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��
				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�
				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				--4���Լ����»���

				factionaward.economy = GuildZiYuan360[FinishTime] 		--����3#������Դ
				factionaward.culture = GuildZiYuan460[FinishTime]		--����4#������Դ

			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,


   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8549 --ʡ���õġ���

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8550, 8551}		--�����������б�������������

		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������

				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷������ס��ר�����񣨲����ڻ�������⣩
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

				--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566,8579,8580}		--30+������ɱ������,��������ס����ɫ����

			--20-29����Ҳ��������30+ɱ������




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

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+������ɱ������




			--����8587��8588���ǵͼ�ɱ�֣����Բ�����

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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]

		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������





		end
		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 8549 --ʡ���õġ���






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, TaskCApi, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 8549 --ʡ���õġ���





		--4�Լ����¼���
		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}

		local ContributionTable40 = {
		--���׶�




				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ContributionTable60 = {
		--���׶�




				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}


		local ExploitTable20 = {
		--��ѫ
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ExploitTable40 = {
		--��ѫ
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ExploitTable60 = {
		--��ѫ
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local GuildMonTable20 = {
		--�����ʽ�
				[1]=500,
				[2]=1000,
				[3]=1500,
				[4]=2000,
			}
		local GuildMonTable40 = {
		--�����ʽ�
				[1]=1000,
				[2]=2000,
				[3]=3000,
				[4]=4000,
			}
		local GuildMonTable60 = {
		--�����ʽ�
				[1]=2000,
				[2]=3000,
				[3]=5000,
				[4]=6000,
			}

		local GuildZiYuan320 ={
		--3����Դ




				[1]=2,
				[2]=4,
				[3]=6,
				[4]=8,
			}
		local GuildZiYuan340 ={
		--3����Դ




				[1]=4,
				[2]=8,
				[3]=12,
				[4]=16,
			}
		local GuildZiYuan360 ={
		--3����Դ




				[1]=8,
				[2]=12,
				[3]=18,
				[4]=28,
			}

		local GuildZiYuan420 ={
		--4����Դ




				[1]=1,
				[2]=2,
				[3]=3,
				[4]=4,
			}
		local GuildZiYuan440 ={
		--4����Դ




				[1]=2,
				[2]=4,
				[3]=6,
				[4]=8,
			}
		local GuildZiYuan460 ={
		--4����Դ




				[1]=4,
				[2]=6,
				[3]=9,
				[4]=14,
			}

		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ






		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�

					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�

					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�

					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460[FinishTime]) 			--����4#������Դ
				end


				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)


   		return 0
   	end
}

TaskList[8550] = --1��_��������_������
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����





  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����





  		bCanGiveUp = true,--�ɷ���





  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --�����������

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����





  		iTopic = TaskTopic.YiBan,--һ����������





  	}
   	,
	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)

			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8550) + 1--��������ɴ������������Σ�





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������




			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8550) + 1--��������ɴ������������Σ�




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ




			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3����Դ




					[1]=3,
					[2]=6,
					[3]=9,
					[4]=12,
				}
			local GuildZiYuan340 ={
			--3����Դ




					[1]=6,
					[2]=12,
					[3]=18,
					[4]=24,
				}
			local GuildZiYuan360 ={
			--3����Դ




					[1]=12,
					[2]=18,
					[3]=27,
					[4]=42,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8550) + 1--��������ɴ������������Σ�




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�
				factionaward.economy = GuildZiYuan320[FinishTime] 					--����3#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�
				factionaward.economy = GuildZiYuan340[FinishTime] 					--����3#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�
				factionaward.economy = GuildZiYuan360[FinishTime] 					--����3#������Դ

			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8550 --ʡ���õġ����汾����id

		--�����ҵȼ�>=200
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8550 --�汾����id

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8549, 8551}		--�����������б�������������






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷�ӽ��ר�����񣨲����ڻ�������⣩
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

		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}					--30+������ɱ������




			--8581,8582��Ϊ20-30ɱ�ֽ�����񣬲�����





			--20-29����Ҳ��������30+ɱ������




			if iPlayerLev < 30 then
				for m =1 , #HighLevelBaseTable do
					local Tablelength20 = #AssistTaskTable20
					for j=1, Tablelength20 do
						if AssistTaskTable20[j] == HighLevelBaseTable[m] then
							table.remove(AssistTaskTable20,j)
						end

					end
				end

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571, 8589}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576, 8590}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������





		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 8550 --ʡ���õġ���






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end


		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 8550 --ʡ���õġ���





		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ContributionTable40 = {
		--���׶�




				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ContributionTable60 = {
		--���׶�




				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local ExploitTable20 = {
		--��ѫ
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ExploitTable40 = {
		--��ѫ
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ExploitTable60 = {
		--��ѫ
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local GuildMonTable20 = {
		--�����ʽ�
				[1]=500,
				[2]=1000,
				[3]=1500,
				[4]=2000,
			}
		local GuildMonTable40 = {
		--�����ʽ�
				[1]=1000,
				[2]=2000,
				[3]=3000,
				[4]=4000,
			}
		local GuildMonTable60 = {
		--�����ʽ�
				[1]=2000,
				[2]=3000,
				[3]=5000,
				[4]=6000,
			}

		local GuildZiYuan320 ={
		--3����Դ




				[1]=3,
				[2]=6,
				[3]=9,
				[4]=12,
			}
		local GuildZiYuan340 ={
		--3����Դ




				[1]=6,
				[2]=12,
				[3]=18,
				[4]=24,
			}
		local GuildZiYuan360 ={
		--3����Դ




				[1]=12,
				[2]=18,
				[3]=27,
				[4]=42,
			}

		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ






		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--����3#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--����3#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--����3#������Դ
				end

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[8551] = --1��_��������_������
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����





  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����





  		bCanGiveUp = true,--�ɷ���





  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --������ʧ��





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����





  		iTopic = TaskTopic.YiBan,--һ����������





  	}
   	,

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--4�Լ����¼���
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8551) + 1--��������ɴ������������Σ�





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������




			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8551) + 1--��������ɴ������������Σ�




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ




			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan340 ={
			--3����Դ




					[1]=4,
					[2]=8,
					[3]=1,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}

			local GuildZiYuan420 ={
			--4����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan460 ={
			--4����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 8551) + 1--��������ɴ������������Σ�




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.economy = GuildZiYuan320[FinishTime] 		--����3#������Դ
				factionaward.culture = GuildZiYuan420[FinishTime]		--����4#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.economy = GuildZiYuan340[FinishTime] 		--����3#������Դ
				factionaward.culture = GuildZiYuan440[FinishTime]		--����4#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.economy = GuildZiYuan360[FinishTime] 		--����3#������Դ
				factionaward.culture = GuildZiYuan460[FinishTime]		--����4#������Դ
			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8551 --ʡ���õġ����汾����id

		--�����ҵȼ�>=200
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 8551 --�汾����id

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8549, 8550}		--�����������б�������������






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷�����ר�����񣨲����ڻ�������⣩
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


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566,8583,8584}		--30+������ɱ������





			--20-29����Ҳ��������30+ɱ������




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

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571, 8592}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576, 8591}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������





		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 8551 --ʡ���õġ���






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 8551 --ʡ���õġ���





		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ContributionTable40 = {
		--���׶�




				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ContributionTable60 = {
		--���׶�




				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local ExploitTable20 = {
		--��ѫ
				[1]=0,
				[2]=1,
				[3]=1,
				[4]=2,
			}
		local ExploitTable40 = {
		--��ѫ
				[1]=1,
				[2]=2,
				[3]=2,
				[4]=3,
			}
		local ExploitTable60 = {
		--��ѫ
				[1]=2,
				[2]=3,
				[3]=4,
				[4]=4,
			}

		local GuildMonTable20 = {
		--�����ʽ�
				[1]=500,
				[2]=1000,
				[3]=1500,
				[4]=2000,
			}
		local GuildMonTable40 = {
		--�����ʽ�
				[1]=1000,
				[2]=2000,
				[3]=3000,
				[4]=4000,
			}
		local GuildMonTable60 = {
		--�����ʽ�
				[1]=2000,
				[2]=3000,
				[3]=5000,
				[4]=6000,
			}

		local GuildZiYuan320 ={
		--3����Դ




				[1]=1,
				[2]=2,
				[3]=3,
				[4]=4,
			}
		local GuildZiYuan340 ={
		--3����Դ




				[1]=4,
				[2]=8,
				[3]=12,
				[4]=16,
			}
		local GuildZiYuan360 ={
		--3����Դ




				[1]=8,
				[2]=12,
				[3]=18,
				[4]=28,
			}

		local GuildZiYuan420 ={
		--4����Դ




				[1]=2,
				[2]=4,
				[3]=6,
				[4]=8,
			}
		local GuildZiYuan440 ={
		--4����Դ




				[1]=2,
				[2]=4,
				[3]=6,
				[4]=8,
			}
		local GuildZiYuan460 ={
		--4����Դ




				[1]=4,
				[2]=6,
				[3]=9,
				[4]=14,
			}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ






		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460[FinishTime]) 			--����4#������Դ
				end

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[9968] = --ѱ��ʦιʳ�������������


{
  	Property =
  	{
  		bCanRedo = true,			--�ɹ����ظ����




  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����





		bHiddenTask = true, 		--��������

  		bCanGiveUp = true,			--�ɷ���





  		bShowPrompt = false,			--��ʾϵͳ��ʾ
  		bFinishWhenDelvier = true,--���ܼ����





		bRecordFinishCount = true,
  		iMaxFinishCount = 1,		--ÿ��������1��





  		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,	--�������ͣ��




  		iTopic = TaskTopic.YiBan,	--һ����������





  	}
   	,

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
		local iSideOccupId = 35 --ѱ��ʦid35
		local bHasSideOccup = TaskCApi. HasSideOccup (TASKINTERFACE_POINTER, iSideOccupId )	 --����Ƿ�ѧ��ѱ��ʦ�����ְҵ

		if bSuccess then
			if bHasSideOccup then

				local iSideOccupLev = TaskCApi. GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) --��ȡ��ҵ�ǰѱ��ʦ�ȼ�





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
												} --ÿ��ѱ��ʦ��Ӧ�ĳ��ﾭ��

				local iSideOccupExp = iSideOccupExpMultiTab[iSideOccupLev]


				TaskCApi.DeliverPetExperience(TASKINTERFACE_POINTER,iSideOccupExp) --���ų��ﾭ��


			end
		end

   		return 0
   	end
}

TaskList[10368] = --2��_��������_��԰
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����





  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����





  		bCanGiveUp = true,--�ɷ���





  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --������ʧ��





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����





  		iTopic = TaskTopic.YiBan,--һ����������





  	}
   	,

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--2������




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10368) + 1--��������ɴ������������Σ�





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������




			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10368) + 1--��������ɴ������������Σ�




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ




			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan240 ={
			--2����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan260 ={
			--2����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local GuildZiYuan420 ={
			--4����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan460 ={
			--4����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10368) + 1--��������ɴ������������Σ�




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan220[FinishTime] 		--����2#������Դ
				factionaward.culture = GuildZiYuan420[FinishTime]		--����4#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan240[FinishTime] 		--����2#������Դ
				factionaward.culture = GuildZiYuan440[FinishTime]		--����4#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan260[FinishTime] 		--����2#������Դ
				factionaward.culture = GuildZiYuan460[FinishTime]		--����4#������Դ
			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10368 --ʡ���õġ����汾����id

		--�����ҵȼ�>=200
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10368 --�汾����id

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10369, 10370, 10371, 10444, 10445}		--�����������б�������������






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷�ӻ�԰ר�����񣨲����ڻ�������⣩
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


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}		--30+������ɱ������





			--20-29����Ҳ��������30+ɱ������




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

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������





		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10368 --ʡ���õġ���






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10368 --ʡ���õġ���





		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan240 ={
			--2����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan260 ={
			--2����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local GuildZiYuan420 ={
			--4����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan460 ={
			--4����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ






		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan220[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan240[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan260[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460[FinishTime]) 			--����4#������Դ
				end

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10369] = --2��_��������_������

{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����





  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����





  		bCanGiveUp = true,--�ɷ���





  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --������ʧ��





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����





  		iTopic = TaskTopic.YiBan,--һ����������





  	}
   	,

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--2������




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10369) + 1--��������ɴ������������Σ�





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������




			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10369) + 1--��������ɴ������������Σ�




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ




			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan240 ={
			--2����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,

				}
			local GuildZiYuan260 ={
			--2����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}

			local GuildZiYuan320 ={
			--3����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan340 ={
			--3����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan360 ={
			--3����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10369) + 1--��������ɴ������������Σ�




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan220[FinishTime] 		--����2#������Դ
				factionaward.economy  = GuildZiYuan320[FinishTime]		--����3#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan240[FinishTime] 		--����2#������Դ
				factionaward.economy = GuildZiYuan340[FinishTime]		--����3#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan260[FinishTime] 		--����2#������Դ
				factionaward.economy  = GuildZiYuan360[FinishTime]		--����3#������Դ
			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10369 --ʡ���õġ����汾����id

		--�����ҵȼ�>=200
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10369 --�汾����id

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10370, 10371, 10444, 10445}		--�����������б�������������






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷�ӻ�԰ר�����񣨲����ڻ�������⣩
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


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}		--30+������ɱ������





			--20-29����Ҳ��������30+ɱ������




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

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������





		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10369 --ʡ���õġ���






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10369 --ʡ���õġ���





		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan240 ={
			--2����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,

				}
			local GuildZiYuan260 ={
			--2����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}

			local GuildZiYuan320 ={
			--3����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan340 ={
			--3����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan360 ={
			--3����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ






		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan220[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan240[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan260[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--����4#������Դ
				end

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10370] = --2��_��������_�泡
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����





  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����





  		bCanGiveUp = true,--�ɷ���





  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --������ʧ��





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����





  		iTopic = TaskTopic.YiBan,--һ����������





  	}
   	,

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--2������




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10370) + 1--��������ɴ������������Σ�





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������




			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10370) + 1--��������ɴ������������Σ�




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ




			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan240 ={
			--2����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan260 ={
			--2����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local GuildZiYuan320 ={
			--3����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10370) + 1--��������ɴ������������Σ�




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan220[FinishTime] 		--����2#������Դ
				factionaward.economy  = GuildZiYuan320[FinishTime]		--����3#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan240[FinishTime] 		--����2#������Դ
				factionaward.economy = GuildZiYuan340[FinishTime]		--����3#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan260[FinishTime] 		--����2#������Դ
				factionaward.economy  = GuildZiYuan360[FinishTime]		--����3#������Դ
			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10370 --ʡ���õġ����汾����id

		--�����ҵȼ�>=200
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10370 --�汾����id

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10369, 10371, 10444, 10445}		--�����������б�������������






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷���泡ר�����񣨲����ڻ�������⣩
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


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}		--30+������ɱ������





			--20-29����Ҳ��������30+ɱ������




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

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������





		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10370 --ʡ���õġ���






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10370 --ʡ���õġ���





		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan240 ={
			--2����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan260 ={
			--2����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local GuildZiYuan320 ={
			--3����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ






		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan220[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan240[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan260[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--����4#������Դ
				end

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10371] = --2��_��������_�ư�
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����





  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����





  		bCanGiveUp = true,--�ɷ���





  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --������ʧ��





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����





  		iTopic = TaskTopic.YiBan,--һ����������





  	}
   	,

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--2������




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10371) + 1--��������ɴ������������Σ�





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������




			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10371) + 1--��������ɴ������������Σ�




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ




			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan420 ={
			--4����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan460 ={
			--4����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan560 ={
			--5����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10371) + 1--��������ɴ������������Σ�




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.culture = GuildZiYuan420[FinishTime] 		--����4#������Դ
				factionaward.belief   = GuildZiYuan520[FinishTime]		--����5#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.culture = GuildZiYuan440[FinishTime] 		--����4#������Դ
				factionaward.belief  = GuildZiYuan540[FinishTime]		--����5#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.culture = GuildZiYuan460[FinishTime] 		--����4#������Դ
				factionaward.belief   = GuildZiYuan560[FinishTime]		--����5#������Դ
			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10371 --ʡ���õġ����汾����id

		--�����ҵȼ�>=200
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 200 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10371 --�汾����id

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10369, 10370, 10444, 10445}		--�����������б�������������






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 4								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷�Ӿư�ר�����񣨲����ڻ�������⣩
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


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}		--30+������ɱ������





			--20-29����Ҳ��������30+ɱ������




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

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������





		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10371 --ʡ���õġ���






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10371 --ʡ���õġ���





		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan420 ={
			--4����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan440 ={
			--4����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan460 ={
			--4����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan560 ={
			--5����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ






		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan420[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan520[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan440[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan540[FinishTime]) 			--����4#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,GuildZiYuan460[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan560[FinishTime]) 			--����4#������Դ
				end

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10444] = --2��_��������_����Э��
{
  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����





  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����





  		bCanGiveUp = true,--�ɷ���





  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = true, --������ʧ��





		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������





  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����





  		iTopic = TaskTopic.YiBan,--һ����������





  	}
   	,

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--2������




			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10444) + 1--��������ɴ������������Σ�





			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������




			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10444) + 1--��������ɴ������������Σ�




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ




			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan560 ={
			--5����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10444) + 1--��������ɴ������������Σ�




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.economy = GuildZiYuan320[FinishTime] 		--����3#������Դ
				factionaward.belief   = GuildZiYuan520[FinishTime]		--����5#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.economy = GuildZiYuan340[FinishTime] 		--����3#������Դ
				factionaward.belief  = GuildZiYuan540[FinishTime]		--����5#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.economy = GuildZiYuan360[FinishTime] 		--����3#������Դ
				factionaward.belief   = GuildZiYuan560[FinishTime]		--����5#������Դ
			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10444 --ʡ���õġ����汾����id

		--�����ҵȼ�>=400
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 400 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end


		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10444 --�汾����id

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10369, 10370, 10371, 10445}		--�����������б�������������






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 10								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷�ӵ���Э��ר�����񣨲����ڻ�������⣩
		if iPlayerLev < 60 then
			table.insert(AssistTaskTable40, 9418)
			table.insert(AssistTaskTable40, 9434)


		elseif iPlayerLev <= 80 then
			table.insert(AssistTaskTable60, 9418)
			table.insert(AssistTaskTable60, 9434)
			table.insert(AssistTaskTable60, 9954)
			table.insert(AssistTaskTable60, 9958)
		end


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}		--30+������ɱ������





			--20-29����Ҳ��������30+ɱ������




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

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������





		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10444 --ʡ���õġ���






   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10444 --ʡ���õġ���





		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan320 ={
			--3����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan340 ={
			--3����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan360 ={
			--3����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan560 ={
			--5����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������





		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ






		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�






		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��





				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��





				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan320[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan520[FinishTime]) 			--����5#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan340[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan540[FinishTime]) 			--����5#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,GuildZiYuan360[FinishTime]) 			--����3#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan560[FinishTime]) 			--����5#������Դ
				end

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}

TaskList[10445] = --2��_��������_ħ��
{


  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,
		bClearAsGiveup = true, --������ʧ��
		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4�Σ�����������

  		--iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.GongHui,--�������ͣ�����
  		iTopic = TaskTopic.YiBan,--һ����������
  	}
   	,

	-- �ɹ�ʱ��Ч




	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			--2������
			local ExpTable = {
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10445) + 1--��������ɴ������������Σ�
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������
			local iExpAwardMutli = 1  --��������ϵ��

			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust

			return iExpAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ��Ǯ




		BindMoney = function(TASKINTERFACE_POINTER)
			local MonTable = {
				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10445) + 1--��������ɴ������������Σ�




			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ




			local iMonAwardMutli = 1  --������Ǯϵ��

			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust

			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ




		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local ContributionTable20 = {
			--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan240 ={
			--2����Դ

					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan260 ={
			--2����Դ
					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5����Դ

					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5����Դ
					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan560 ={
			--5����Դ
					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 10445) + 1--��������ɴ������������Σ�




			local iGuildMoneyMuti = 1

			local factionaward = {}

			if iPlayerLevel < 40 then
				factionaward.credit = ExploitTable20[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable20[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable20[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan220[FinishTime] 		--����2#������Դ
				factionaward.belief   = GuildZiYuan520[FinishTime]		--����5#������Դ
			elseif iPlayerLevel < 60 then
				factionaward.credit = ExploitTable40[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable40[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable40[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan240[FinishTime] 		--����2#������Դ
				factionaward.belief  = GuildZiYuan540[FinishTime]		--����5#������Դ
			elseif iPlayerLevel <= 80 then
				factionaward.credit = ExploitTable60[FinishTime]					--���Ź��Ṧѫ��




				factionaward.contribution = ContributionTable60[FinishTime] 		--���Ź��׶�




				factionaward.money = GuildMonTable60[FinishTime]*iGuildMoneyMuti 	--���Ź����ʽ�

				factionaward.magic = GuildZiYuan260[FinishTime] 		--����2#������Դ
				factionaward.belief   = GuildZiYuan560[FinishTime]		--����5#������Դ
			end

			factionaward.vitality = 2 --�����Ծ��




			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10445 --ʡ���õġ����汾����id

		--�����ҵȼ�>=400
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 400 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER,9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		--ÿ���һ��������ʱ����Ƿ�������id=23911
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 10445 --�汾����id

		--��������Ƿ�������������





		local MainTaskTable = {8547, 8548, 8549, 8550, 8551, 10368, 10369, 10370, 10371, 10444}		--�����������б�������������






		local AssistTaskTable20 = {}
		local AssistTaskTable40 = {}
		local AssistTaskTable60 = {}

		local HelpTaskTable60 = {}

		local TaskTypeNum = 10								--������������𣨲�����������





		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 		--��ҵȼ�

		--��ʼ�����������AssistTable20:8557-8566;��ʼ�����������AssistTable40:8567-8576
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

		--��Ҫ������������ɾ����������





		for i,v in ipairs(MainTaskTable) do
			local bHasTask = TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v)
			if bHasTask then
			--��������Ƿ����ظ�����id,20-39;40+
			--8557-8566,8567-8576������





				if iPlayerLev < 40 then
					for j = 8557,8566 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then --�������������������н�����ɾ��





							for i = 1 , 10 do
								if AssistTaskTable20[i] == j then
									table.remove(AssistTaskTable20,i)
								end
							end
						end
					end
				elseif iPlayerLev < 60 then
					for j = 8567,8576 do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, j) then--�������������������н�����ɾ��





							for i = 1 , 20 do
								if AssistTaskTable40[i] == j then
									table.remove(AssistTaskTable40,i)
								end
							end
						end
					end
				elseif iPlayerLev <= 80 then
					for j,v in pairs(HelpTaskTable60) do
						if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER, v) then--�������������������н�����ɾ��





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

		--׷�ӵ���Э��ר�����񣨲����ڻ�������⣩
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


		--�������ɫ���⴦��




		if iPlayerLev < 40 then

			local LowLevelBaseTable = {8557,8558,8560,8563,8565}	--20-30������ɱ������




			local HighLevelBaseTable = {8562,8566}		--30+������ɱ������





			--20-29����Ҳ��������30+ɱ������




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

				--30+��Ҳ��������20-29ɱ������




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

		--40-49����Ҳ��������50+ɱ������




		if iPlayerLev >= 40 and iPlayerLev < 61 then
			local LowLevelBaseTable = {8567,8568,8570,8571,}			--40-50������ɱ������




			local HighLevelBaseTable = {8572,8573,8574,8575,8576,}		--50+������ɱ������





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

			--50+��Ҳ��������40-49ɱ������




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
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable20[key]
		elseif iPlayerLev < 60 then
			iRandomR = #AssistTaskTable40
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable40[key]
		elseif iPlayerLev <= 80 then
			iRandomR = #AssistTaskTable60
			key = math.random(1, iRandomR)--��Ҫ���ŵĸ���������id
			DeliverTaskID = AssistTaskTable60[key]
		end

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(DeliverTaskID /200)
		local key2 = DeliverTaskID % 200

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 2, key2)

		--��������ʱ����Ҫ�����������ȡ��Ʒ����һ��ʱ��ȡ��





		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
		if FinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 23911, 1) --����һ������
		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, DeliverTaskID)--���Ÿ�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
		local iTaskID = 10445 --ʡ���õġ���


   		local iRet = TASK_NO_FINISH
		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskID, 2)
		local DeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,true) then
			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,DeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������





   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iTaskID = 10445 --ʡ���õġ���





		local ExpTable = {
		--����
				[1]=20,
				[2]=35,
				[3]=50,
				[4]=75,
				}

		local MonTable = {
		--�󶨽�




				[1]=7,
				[2]=12,
				[3]=17,
				[4]=25,
			}

		local ContributionTable20 = {
		--���׶�




					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ContributionTable40 = {
			--���׶�




					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,

				}
			local ContributionTable60 = {
			--���׶�




					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local ExploitTable20 = {
			--��ѫ
					[1]=0,
					[2]=1,
					[3]=1,
					[4]=2,
				}
			local ExploitTable40 = {
			--��ѫ
					[1]=1,
					[2]=2,
					[3]=2,
					[4]=3,
				}
			local ExploitTable60 = {
			--��ѫ
					[1]=2,
					[2]=3,
					[3]=4,
					[4]=4,
				}

			local GuildMonTable20 = {
			--�����ʽ�
					[1]=500,
					[2]=1000,
					[3]=1500,
					[4]=2000,
				}
			local GuildMonTable40 = {
			--�����ʽ�
					[1]=1000,
					[2]=2000,
					[3]=3000,
					[4]=4000,
				}
			local GuildMonTable60 = {
			--�����ʽ�
					[1]=2000,
					[2]=3000,
					[3]=5000,
					[4]=6000,
				}

			local GuildZiYuan220 ={
			--2����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,
				}
			local GuildZiYuan240 ={
			--2����Դ




					[1]=4,
					[2]=8,
					[3]=12,
					[4]=16,
				}
			local GuildZiYuan260 ={
			--2����Դ




					[1]=8,
					[2]=12,
					[3]=18,
					[4]=28,
				}
			local GuildZiYuan520 ={
			--5����Դ




					[1]=1,
					[2]=2,
					[3]=3,
					[4]=4,
				}
			local GuildZiYuan540 ={
			--5����Դ




					[1]=2,
					[2]=4,
					[3]=6,
					[4]=8,

				}
			local GuildZiYuan560 ={
			--5����Դ




					[1]=4,
					[2]=6,
					[3]=9,
					[4]=14,
				}


		local DeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������
		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ
		local iExpAwardMutli = 1 --��������ϵ��
		local iMonAwardMutli = 1 --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 2	--��Ծ�Ƚ�����ֵ

		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)--��������ɴ������������Σ�

		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��

				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��

				if iPlayerLevel < 40 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable20[FinishTime]) 				--���Ź��Ṧѫ��

					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable20[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable20[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan220[FinishTime]) 			--����2#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan520[FinishTime]) 			--����5#������Դ
				elseif iPlayerLevel < 60 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable40[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable40[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable40[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan240[FinishTime]) 			--����2#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan540[FinishTime]) 			--����5#������Դ
				elseif iPlayerLevel <= 80 then
					TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable60[FinishTime]) 				--���Ź��Ṧѫ��




					TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable60[FinishTime]) 		--���Ź��׶�





					TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable60[FinishTime]*iGuildMoneyMuti)	--���Ź����ʽ�
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,GuildZiYuan260[FinishTime]) 			--����2#������Դ
					TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,GuildZiYuan560[FinishTime]) 			--����5#������Դ
				end

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����




					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end
				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskID)
   		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, DeliverTaskID)

   		return 0
   	end
}


TaskList[11265] = --���ͽڣ�ʥ��������֦
{
	--������ɷ�ʽ
	tabMethod =
	{
		[1]={0,32610,1,},--��ɷ�ʽ 0Ѱ�� 1ɱ�֣�Ŀ��id��������
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
  		bCanSeekOut = false,    --���ɲ���

		bClearAsGiveup = false, --��������ʧ�ܽ���

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 150,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 120									--��Ž���ϵ��
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local ItemId = 32499 --���ͽ�������
			items = {
						Item1 = {ID = ItemId, NUM = 2},--0ʱΪ��������������ʾ��Ʒ������
					}
			return items
		end
		,
	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 20 then --�ȼ���Ҫ����20��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--ǰ������11211���쵽��
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,11211,true) then
			return TASK_PREREQU_FAIL_LUA_TASK

		end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		local iRandNum = 3 --�����������ɷ�ʽ����
		--��ɷ�ʽ1��Ѱ������һ�����ӣ�id=32550)��ȥ�������ִ壨���˴��֣���ĳ�����������Ӻ󣬲�һ֧��ѿ����
		--��ɷ�ʽ2��Ѱ������һ���Բ�֮����������Ʒid=32555���������Լ����õ�ѪҺ���ʣ�������������������ι�Ѫ�����ִ��ĳ���������ٿ�ɼ���
		--��ɷ�ʽ3��Ѱ�ʹ������(������Ʒid=32556)ץסһֻС��������͸��������ִ��xxx����ȡһֻ��ѿ��������Ʒ����������

		--�޸ĵĲ��֣��̶����ÿ���浽�����ݣ�������ż��*��Ҵ�����ɫ��ʱ��mod2
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --ȡ����ҽ�ɫ����ʱ��

		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday
		local iRandomMethod =  ( timePackage.yday + RoleCreateTime )% iRandNum + 1 --��ҵ����浽����������


		--����������
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iRandomMethod = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end


   		--�����߻���

		local tabDeliverItem = {
					[1]=32550, --������������
					[2]=32555, --��Ѫ֮��
					[3]=32556, --���ﲶ׽��
					}

		if not iRandomMethod then --��ֹiRandomMethodȡ�գ�ǿ�Ƹ�ֵΪ��ʽ1
			iRandomMethod = 1
		end

		if tabDeliverItem[iRandomMethod] then
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, tabDeliverItem[iRandomMethod] , 1, true)

		end


		--���������
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 11265, 1, iRandomMethod)
		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 11265, 1)

		Method.CollectItem = { Item1 = {ID=TaskList[11265].tabMethod[iRandomMethod][2], Num=TaskList[11265].tabMethod[iRandomMethod][3], Common=true},} --����������ѿ

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
		local AwardMulti = 120									--��Ž���ϵ��
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

		local tabDeliverItem = {
					[1]=32550, --������������
					[2]=32555, --��Ѫ֮��
					[3]=32556, --���ﲶ׽��
					}

   		if bSuccess then
			local num = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[11265].tabMethod[ucRandomNum1][2], true)
			if not num then
				num = 1
			end

			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[11265].tabMethod[ucRandomNum1][2], num)

			--���Ŷ��ͽ�������2��
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 32499, 2, true)

			--����ҷ��ž���
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

		else--ʧ���������
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
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32551, num1)    --�������
			end

			local num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32611, true)
			if  num2 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32611, num2)    --�������
			end

   		end

   		return 0
   	end
}

TaskList[11303] = --���˵���ͽ���Ը��
{
	--������ɷ�ʽ
	tabMethod =
	{
		[1]={1,32652,1,},--1��ɷ�ʽɱ�֣�ɱ��id������
		[2]={1,32653,1,},
	}
	,

  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false, --���ɲ���

		bClearAsGiveup = false, --��������ʧ�ܽ���

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 150,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 100									--��Ž���ϵ��
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local ItemId = 32499 --���ͽ�������
			items = {
						Item1 = {ID = ItemId, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
					}
			return items
		end
		,
	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 20 then --�ȼ���Ҫ����20��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--ǰ������11211���쵽��
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,11211,true) then
			return TASK_PREREQU_FAIL_LUA_TASK

		end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		local iRandNum = 2 --�����������ɷ�ʽ����
		--��ɷ�ʽ1��ɱ�֡������һ��ˮ��������������������Ʒid=32553�����ɿ�õ�����ˮ�����������˴��ʯ������������id=32652��
		--��ɷ�ʽ2��ɱ�֡����ɱ����ͼ�Ĺ��������ܻ��棨������Ʒid=32554�����ڰ������ִ����һ���(id=32653)���ͷű��䶳����֦��

		--�޸ĵĲ��֣��̶����ÿ���浽�����ݣ�������ż��*��Ҵ�����ɫ��ʱ��mod2
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --ȡ����ҽ�ɫ����ʱ��

		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday
		local iRandomMethod =  ( timePackage.yday + RoleCreateTime )% iRandNum + 1 --��ҵ����浽����������


		--����������
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iRandomMethod = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end


   		--�����߻���
		local tabDeliverItem = {
					[1]=32553, --ˮ����������װ��
					[2]=0,
					}
		if tabDeliverItem[iRandomMethod] > 0 then
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, tabDeliverItem[iRandomMethod] , 1, true)
		end

		--���������
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 11303, 1, iRandomMethod)
		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iRandomMethod = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 11303, 1)

		Method.KillMonster = { Mons1={ID=TaskList[11303].tabMethod[iRandomMethod][2], Num=TaskList[11303].tabMethod[iRandomMethod][3]},}

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 2 then --��ͨ��������Ҫ1��
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
		local AwardMulti = 100									--��Ž���ϵ��
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

		local tabDeliverItem = {
					[1]=32553, --ˮ����������װ��
					[2]=0,
					}


   		if bSuccess then

			local iRandomBook  , iRandomBookId

			iRandomBook = 1

			--�����鼮����
			math.randomseed(os.time())
			iRandomBook = math.random(1,32)

			iRandomBookId = 32749 + iRandomBook

			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iRandomBookId, 1, true)

			--���Ŷ��ͽ�������1��
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 32499, 1, true)

			--����ҷ��ž���
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

   		end

		--����������۳ɹ�ʧ��
		if ucRandomNum1 ==1 then
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32553, true)
			if  num1 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32553, num1)    --�������
			end

			local num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32558, true)
			if  num2 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32558, num2)    --�������
			end


		elseif ucRandomNum1 ==2 then

			--ɱ�����������õ�32554�ڷ�������ʱ����Ӧ�����
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,32554, true)
			if  num1 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 32554, num1)    --�������
			end

		end

   		return 0
   	end
}



TaskList[12004] = --�������2����������Ͱ
{
  	Property =
  	{
  		bCanRedo = true,		--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,		--�ɷ���
  		bShowPrompt = false,	--����ʾϵͳ��ʾ
  		bFinishWhenDelvier = true,--���ܼ����
		bHiddenTask = true, 		--��������

  		iType  = TaskType.SheJiaoJia,--�������ͣ��罻��
  		iTopic = TaskTopic.YiBan,--һ����������

  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)

   		local iRet = TASK_NO_FINISH

		--10minʧ��
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

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��

			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end

		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local tabAwarditems = {
								[1] = 9056,--�����ξ� 9056
								[2] = 9057,--�����ξ� 9057
								[3] = 9058,--�����ξ� 9058
								[4] = 9059,--�Դ��ξ� 9059
								[5] = 9059,--�Ͼ��ξ� 9060������֮ǰֻ���ŲԴ��ξ���
								}

			local ItemId --���ŵĽ�����Ʒid

			local ilevel = math.floor( (iPlayerLevel+20) / 20)

			if ilevel == 1 then
				ItemId = tabAwarditems[ilevel]

			else
				math.randomseed(os.time())--����������ʣ�Ϊ2���ű�����Ϊ1���Ŵμ�
				iRate = math.random(1,2)

				ItemId = tabAwarditems[ilevel - 2 + iRate]
			end

			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, ItemId, 1, false)

   		end

   		return 0
   	end
}

TaskList[12641] = --������գ�����01
{
	--ÿ��������ӦҪ��ȡ����Ʒ����
	Tabweapon =
	{
		--[ְҵid]= {����id��������Ʒid}
		[1]= {36371,36339,},     --սʿ
		[2]= {36372,36339,},     --�ػ�
		[3]= {36373,36339,},     --�̿�
		[4]= {36374,36339,},     --��ǹ
		[5]= {36375,36339,},     --��ʦ
		[6]= {36376,36339,},     --��ʦ
		[7]= {36377,36339,},     --Ѫħ
		[8]= {36378,36339,},     --ʫ��

	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = false,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,

		iSuitableLevel = 80,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60			--��Ž���ϵ��
			local PlayerLevel = 75 			--�������ã������ȼ�75

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ


		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

	   	if iPlayerLev < 200 then --�ȼ���Ҫ����75�����޸�Ӣ���׻���Ѷȣ��������һ�����ܵȼ���ߣ����ٷ��ţ�
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--������ϱ����б�ְҵ��Ӧ���Ƶ�����
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[12641].Tabweapon[iOccupation][1], true) < 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end


   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		Method.CollectItem = { Item1 = {ID=TaskList[12641].Tabweapon[iOccupation][2], Num=1, Common=true},} --����������Ʒ������֮��

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12641].Tabweapon[iOccupation][2], true) >= 1 then--����������Ʒ�����龫��36232
				iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 60									--��Ž���ϵ��
		local PlayerLevel = 75 			--����������
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

   		if bSuccess then

			--��������ȼ�����Ϊ79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--������Ʒ
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12641].Tabweapon[iOccupation][2], 1)    --��ȡ���� 1��

			--����ҷ��ž���

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

   		end

   		return 0
   	end
}

TaskList[12666] = --������գ�ñ��01
{
	--ÿ��ְҵñ�Ӷ�ӦҪ��ȡ����Ʒ����
	Tabweapon =
	{
		--[ְҵid]= {ñ��id��������Ʒid}
		[1]= {36387,36340,},     --սʿ
		[2]= {36388,36340,},     --�ػ�
		[3]= {36389,36340,},     --�̿�
		[4]= {36390,36340,},     --��ǹ
		[5]= {36391,36340,},     --��ʦ
		[6]= {36392,36340,},     --��ʦ
		[7]= {36393,36340,},     --Ѫħ
		[8]= {36394,36340,},     --ʫ��

	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = false,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--��Ž���ϵ��
			local PlayerLevel = 75 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ


		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

	   	if iPlayerLev < 200 then --�ȼ���Ҫ����75�����޸�Ӣ���׻���Ѷȣ��������һ�����ܵȼ���ߣ����ٷ��ţ�
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--������ϱ����б�ְҵ��Ӧ���Ƶ�����
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[12666].Tabweapon[iOccupation][1], true) < 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end


   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		Method.CollectItem = { Item1 = {ID=TaskList[12666].Tabweapon[iOccupation][2], Num=1, Common=true},} --����������Ʒ������֮��

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12666].Tabweapon[iOccupation][2], true) >= 1 then--����������Ʒ�����龫��36232
				iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 60									--��Ž���ϵ��
		local PlayerLevel = 75 			--ȡ����ҵȼ�����������
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

   		if bSuccess then

			--��������ȼ�����Ϊ79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--������Ʒ
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12666].Tabweapon[iOccupation][2], 1)    --��ȡ���� 1��

			--����ҷ��ž���

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

   		end

   		return 0
   	end
}

TaskList[12669] = --������գ�����01
{
	--ÿ��ְҵ�����ӦҪ��ȡ����Ʒ����
	Tabweapon =
	{
		--[ְҵid]= {����id��������Ʒid}
		[1]= {36379,36341,},     --սʿ
		[2]= {36380,36341,},     --�ػ�
		[3]= {36381,36341,},     --�̿�
		[4]= {36382,36341,},     --��ǹ
		[5]= {36383,36341,},     --��ʦ
		[6]= {36384,36341,},     --��ʦ
		[7]= {36385,36341,},     --Ѫħ
		[8]= {36386,36341,},     --ʫ��
	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = false,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--��Ž���ϵ��
			local PlayerLevel = 75 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ


		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

	   	if iPlayerLev < 200 then --�ȼ���Ҫ����75�����޸�Ӣ���׻���Ѷȣ��������һ�����ܵȼ���ߣ����ٷ��ţ�
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--������ϱ����б�ְҵ��Ӧ���Ƶ�����
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[12669].Tabweapon[iOccupation][1], true) < 1 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end


   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		Method.CollectItem = { Item1 = {ID=TaskList[12669].Tabweapon[iOccupation][2], Num=1, Common=true},} --����������Ʒ������֮��

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12669].Tabweapon[iOccupation][2], true) >= 1 then--����������Ʒ�����龫��36232
				iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local AwardMulti = 60									--��Ž���ϵ��
		local PlayerLevel = 75 			--ȡ����ҵȼ�����������
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

   		if bSuccess then
			--��������ȼ�����Ϊ79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--������Ʒ
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12669].Tabweapon[iOccupation][2], 1)    --��ȡ���� 1��

			--����ҷ��ž���

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

   		end

   		return 0
   	end
}

TaskList[12650] = --������գ�����03�����ϴ
{
	--ÿ��ְҵ������ӦҪ��ȡ����Ʒ����
	Tabweapon =
	{
		--[ְҵid]= ��������id������������id
		[1]= {36371,36435,},     --սʿ
		[2]= {36372,36436,},     --�ػ�
		[3]= {36373,36437,},     --�̿�
		[4]= {36374,36438,},     --��ǹ
		[5]= {36375,36439,},     --��ʦ
		[6]= {36376,36440,},     --��ʦ
		[7]= {36377,36441,},     --Ѫħ
		[8]= {36378,36442,},     --ʫ��
	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 80									--��Ž���ϵ��
			local PlayerLevel = 75 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

			local ItemId = TaskList[12650].Tabweapon[iOccupation][2]

			items = {
						Item1 = {ID = ItemId, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
					}
			return items
		end
		,


	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local iPremiseTaskID = 12647 --ǰ������id

	   	if iPlayerLev < 75 then --�ȼ���Ҫ����75��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end


		--����Ƿ��Ѿ����ǰ������12647
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,iPremiseTaskID,true) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--�����������������ʾ׷��
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12650, 1, iOccupation)		--�洢���ְҵ

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		Method.SubmitItem = true --�ύ��Ʒ����ɷ�ʽ

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		--�ύ����Ʒid���ύ����Ʒ����
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12650)
		if itemIDSubmitted and itemNumberSubmitted then
			if itemIDSubmitted == TaskList[12650].Tabweapon[iOccupation][1] and itemNumberSubmitted == 1 then--����ύ���Ǳ�ְҵ�Ķ�Ӧ��������
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

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)

		local TaskID1 = 12641
		local TaskID2 = 12647

		local AwardMulti = 80									--��Ž���ϵ��
		local PlayerLevel = 75 			--ȡ����ҵȼ�����������
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

   		if bSuccess then

			--��������ȼ�����Ϊ79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--������Ʒ
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12650].Tabweapon[iOccupation][1], 1)    --��ȡ���� 1��

			--����ҷ��ž���

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

			--��������
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[12650].Tabweapon[iOccupation][2], 1,true)

			--���ǰ�������¼����ʼ�µ�ѭ��
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID1)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID2)

   		end

   		return 0
   	end
}

TaskList[12668] = --������գ�ñ��03
{
	--ÿ��ְҵ������ӦҪ��ȡ����Ʒ����
	Tabweapon =
	{
		--[ְҵid]= ����ñ��id��������ñ��id
		[1]= {36387,36451,},     --սʿ
		[2]= {36388,36452,},     --�ػ�
		[3]= {36389,36453,},     --�̿�
		[4]= {36390,36454,},     --��ǹ
		[5]= {36391,36455,},     --��ʦ
		[6]= {36392,36456,},     --��ʦ
		[7]= {36393,36457,},     --Ѫħ
		[8]= {36394,36458,},     --ʫ��

	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--��Ž���ϵ��
			local PlayerLevel = 75 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

			local ItemId = TaskList[12668].Tabweapon[iOccupation][2]

			items = {
						Item1 = {ID = ItemId, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
					}
			return items
		end
		,


	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local iPremiseTaskID = 12667 --ǰ������id

	   	if iPlayerLev < 75 then --�ȼ���Ҫ����75��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--����Ƿ��Ѿ����ǰ������12667
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,iPremiseTaskID,true) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--�����������������ʾ׷��
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12668, 1, iOccupation)		--�洢���ְҵ


		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		Method.SubmitItem = true --�ύ��Ʒ����ɷ�ʽ

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		--�ύ����Ʒid���ύ����Ʒ����
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12668)
		if itemIDSubmitted and itemNumberSubmitted then
			if itemIDSubmitted == TaskList[12668].Tabweapon[iOccupation][1] and itemNumberSubmitted == 1 then--����ύ���Ǳ�ְҵ�Ķ�Ӧ��������
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

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local TaskID1 = 12666
		local TaskID2 = 12667

		local AwardMulti = 60									--��Ž���ϵ��
		local PlayerLevel = 75 			--ȡ����ҵȼ�����������
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

   		if bSuccess then

			--��������ȼ�����Ϊ79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--������Ʒ
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12668].Tabweapon[iOccupation][1], 1)    --��ȡ���� 1��

			--����ҷ��ž���

			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

			--����ñ��
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[12668].Tabweapon[iOccupation][2], 1,true)

			--���ǰ�������¼����ʼ�µ�ѭ��
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID1)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID2)

   		end

   		return 0
   	end
}

TaskList[12671] = --������գ�����03
{
	--ÿ��ְҵ�����ӦҪ��ȡ����Ʒ����
	Tabweapon =
	{
		--[ְҵid]= ���ƻ���id�������Ļ���id
		[1]= {36379,36443,},     --սʿ
		[2]= {36380,36444,},     --�ػ�
		[3]= {36381,36445,},     --�̿�
		[4]= {36382,36446,},     --��ǹ
		[5]= {36383,36447,},     --��ʦ
		[6]= {36384,36448,},     --��ʦ
		[7]= {36385,36449,},     --Ѫħ
		[8]= {36386,36450,},     --ʫ��

	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,

		iSuitableLevel = 79,

  		iType  = TaskType.LiLian,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--��Ž���ϵ��
			local PlayerLevel = 75 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

			local ItemId = TaskList[12671].Tabweapon[iOccupation][2]

			items = {
						Item1 = {ID = ItemId, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
					}
			return items
		end
		,


	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local iPremiseTaskID = 12670 --ǰ������id

	   	if iPlayerLev < 75 then --�ȼ���Ҫ����75��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--����Ƿ��Ѿ����ǰ������12670
		if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,iPremiseTaskID,true) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		--�����������������ʾ׷��
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12671, 1, iOccupation)		--�洢���ְҵ

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

   		Method.SubmitItem = true --�ύ��Ʒ����ɷ�ʽ

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		--�ύ����Ʒid���ύ����Ʒ����
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12671)
		if itemIDSubmitted and itemNumberSubmitted then
			if itemIDSubmitted == TaskList[12671].Tabweapon[iOccupation][1] and itemNumberSubmitted == 1 then--����ύ���Ǳ�ְҵ�Ķ�Ӧ��������
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

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local TaskID1 = 12669
		local TaskID2 = 12670

		local AwardMulti = 60									--��Ž���ϵ��
		local PlayerLevel = 75 			--ȡ����ҵȼ�����������
		local iOccupation = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER)--��ȡ���ְҵ

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

   		if bSuccess then
			--������Ʒ
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, TaskList[12671].Tabweapon[iOccupation][1], 1)    --��ȡ���� 1��

			--��������ȼ�����Ϊ79
			if PlayerLevel >= 80 then
				PlayerLevel = 79
			end

			--����ҷ��ž���
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)

			--���Ż���
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,TaskList[12671].Tabweapon[iOccupation][2], 1,true)

			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID1)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, TaskID2)

   		end

   		return 0
   	end
}

TaskList[12760] = --����ʦ�ճ�
{
	--������ɷ�ʽһ����4���࣬�ֱ��Ӧ����1��2��3��4
	Tabtaskmethod =
	{
		--1��Ϊ��ȡ�������������еĲ�Ʒ.������Ϊ��ְҵ�ȼ�
		[1] = {
			--1������ʦ
			[1] = {
			--Ʒ��2=��ɫ��1=��ɫ����Ʒid
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

			--2������ʦ
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

			--3������ʦ
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

			--4������ʦ
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

			--5������ʦ
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

			--6������ʦ
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

			--7������ʦ(δ���ţ�80��װ��������
			[7] = {
					{1, 28925,},
				},

			},

		--2��Ϊɱ��ǰ�ȼ����������Ϊ�ȼ��ֶ�
		[2] = {
			--����id��������Ʒ36693=ħ���ֶ�
			[40] = {50, 36693} , 	--ʨ��,ħ���ֶ�
			[45] = {44, 36693} , 	--�Ļ�����,ħ���ֶ�
			[50] = {42, 36693} , 	--СħŮ,ħ���ֶ�
			[55] = {53, 36693} , 	--��ͷ����,ħ���ֶ�
			[60] = {10464, 36693} , --ʳ����,ħ���ֶ�
			[65] = {10463, 36693} , --���ֺڱ�,ħ���ֶ�
			[70] = {10449, 36693} , --��ľɱ��,ħ���ֶ�
			[75] = {10444, 36693} , --ҧֺ��,ħ���ֶ�
			[80] = {10444, 36693} , --ҧֺ��,ħ���ֶ�

			},

		--3������ض��������ɣ�������Ϊ��Ӧ������id
		[3] = {
				[1] = {12797, 12810,},
				[2] = {12798, 12812,},
				},

		--4��Ϊ��Ҫ��Ʒ,���ݸ�ְҵ�ȼ���ȡ����Ʒ��ͬ
		[4] = {
				--����
				[1] = {
						[1] = 9704,--9704	�μ�����ҩ����40
						[2] = 9719,--9719	��Ч����ҩ����50
						[3] = 9729,--9729	����ҩ����	  60
						[4] = 30987,--30987	ǿЧ����ҩ����70
						[5] = 30987,
						[6] = 30987,
						[7] = 30987,
						[8] = 30987,
					},
				--���
				[2] = {
						[1] = 12255,--12255	ҹ��������40
						[2] = 11688,--11688	�����ƣ�  50
						[3] = 12264,--12264	�������ƣ�60
						[4] = 34165,--34165	��¶�ƣ�  70
						[5] = 34165,
						[6] = 34165,
						[7] = 34165,
						[8] = 34165,
					}
			},
	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,
		iMaxFinishCount = 1,--�����ɴ���Ϊ1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--ÿ�����

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ��ְҵ����
		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			local tabSideOccupExp = {20,50,100,200,380,728,1000,1500,1500,1500}							--��Ÿ�ְҵ���齱��

			local iSideOccupId = 9 																		--����ʦ��ְҵid
			local iSideOccuplev = TaskCApi.GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) 		--��ȡ�������ʦ�ȼ�

			soe = {
						SOE1 = {ID = iSideOccupId, EXP = tabSideOccupExp[iSideOccuplev]},--idΪ��ְҵid��expΪ��ֵ��expΪ0��ʾ������
				  }
			return soe
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iSideOccupIdhighlevel = 8 --��ǰ��������ʦΪ8��	--2013.09.07��

		local iSideOccupId = 9 --����ʦ��ְҵid

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 40 then --�ȼ���Ҫ����40��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--����Ƿ�ѧ������ʦ
		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, iSideOccupId) then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

		--��ǰ��������ʦΪiSideOccupIdhighlevel��������iSideOccupIdhighlevel���Լ�iSideOccupIdhighlevel�����Ͻ�����ӵ�������
		if TaskCApi. GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) >= iSideOccupIdhighlevel then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iflagtaskid = 12761		--����ʦflag��������id
		local itaskmethodid = 1 		--��������������ͣ�Ĭ��Ϊ1�������ֵ
		local isubtaskmethodid = 1		--���cd�����������������ͣ�Ĭ��Ϊ1

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--��ҵȼ�

		--ȡ����ҽ�ɫ����ʱ��
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)

		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--ȡflag������ɴ��������7<=x<=8�����D�������
		local iflagtasktimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iflagtaskid) + 1
		if iflagtasktimes ==7 then
			itaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 3
		elseif iflagtasktimes >= 8 then
			itaskmethodid = 4
		else--flag����Ϊ1-6ʱ������abc���������ͨ��ʱ��ͽ�ɫid�Ӻ�ȡ�����̶���ҵ�����������
			itaskmethodid = ( RoleCreateTime + dayInYear) % 3 + 1
		end

		--����������,4493����itaskmethodid
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		if itaskmethodid == 3 then --C��������2������
			isubtaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 1

			--����������
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end

			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][1])--���ŷ�֧����

		elseif itaskmethodid == 4 then --D��������2������
			isubtaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 1

			--����������
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end
		end

		--����������,4493��4495��������id
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)

			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end
		end

		--��������������ڴ洢������ĵ�ǰ��������
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 1, itaskmethodid)		--�������ͣ�ABCD���ࣩ
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 2, isubtaskmethodid)		--���������ͣ����CD������⣩
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 3, 100)					--��������Ʒ�õ����������ֹȡ�գ�Ԥ��ֵ100
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 4, iPlayerLev)			--�洢��ҵȼ�,���ͻ�����ʾ׷����

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local itaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 1)		--ȡ���������ͣ�ABCD���ࣩ
		local isubtaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 2)	--ȡ�����������ͣ����CD������⣩
		local iPlayerLev = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 4)			--ȡ����ҽ�������ʱ������ȼ�

		local iSideOccupId = 9 																		--����ʦ��ְҵid
		local iSideOccuplev = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,iSideOccupId) 		--��ȡ�������ʦ�ȼ�

		if itaskmethodid == 1 then
			Method.SubmitItem = true--�ύ��Ʒ����ɷ�ʽ

		elseif itaskmethodid == 2 then
			local iPlayerLev2 = math.floor(iPlayerLev /5)*5
			--ɱ��

			Method.KillMonster = {
						Mons1={ID=TaskList[12760].Tabtaskmethod[itaskmethodid][iPlayerLev2][1], Num=0, DropItemID =TaskList[12760].Tabtaskmethod[itaskmethodid][iPlayerLev2][2], DropItemProbability = 1},
						}
			Method.CollectItem = {
						Item1={ID=TaskList[12760].Tabtaskmethod[itaskmethodid][iPlayerLev2][2], Num=1, Common=false},
						}

		elseif itaskmethodid == 3 then
			--cd����������ͨ������ض�����ķ�ʽ��ʵ��
			local iTaskid = TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][2]
			Method.CompleteTask = {TaskID = iTaskid , Num = 1}

		else
			local iItemID = TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][math.floor(iPlayerLev/10)-3]
			Method.CollectItem = {Item1={ID=iItemID, Num=5, Common=true}, }
		end

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local itaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 1)		--ȡ���������ͣ�ABCD���ࣩ
		local isubtaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 2)	--ȡ�����������ͣ����CD������⣩
		local iPlayerLev = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12760, 4)			--ȡ����ҽ�������ʱ������ȼ�						--��ҵȼ�

		local iSideOccupId = 9 																		--����ʦ��ְҵid
		local iSideOccuplev = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,iSideOccupId) 		--��ȡ�������ʦ�ȼ�

		if itaskmethodid == 1 then
		--�ύ��Ʒ�ķ�ʽ��ʵ��
			--�ύ����Ʒid���ύ����Ʒ����
			local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12760)

			if itemIDSubmitted and itemNumberSubmitted then

				for i,j in pairs(TaskList[12760].Tabtaskmethod[1][iSideOccuplev]) do
					if itemIDSubmitted == j[2] and  itemNumberSubmitted == 1 then
					--��������������ڴ洢��ҽ��ɵ���Ʒ����
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12760, 3, i)

					iRet = TASK_SUCC_FINISH

					return iRet

					elseif itemIDSubmitted == j[2] and itemNumberSubmitted > 1 then
					--��������
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12760, 29, 20001)
					end

					if i == 16 then --��Ʒ����
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12760, 28, 20000)
					end
				end
			end

		elseif itaskmethodid == 2 then

		--ɱ�ֻ��������Ʒ
			local iPlayerLev2 = math.floor(iPlayerLev /5)*5
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, TaskList[12760].Tabtaskmethod[itaskmethodid][iPlayerLev2][2],  false)  >= 1 then
   		           iRet = TASK_SUCC_FINISH
   		    end


		elseif itaskmethodid == 3 then
		--C�����ͨ���������ķ�ʽ��ʵ��
			local iTaskid = TaskList[12760].Tabtaskmethod[itaskmethodid][isubtaskmethodid][2]
			local TaskCompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskid)

			if TaskCompleteTimes >= 1 then
				iRet = TASK_SUCC_FINISH
			end

		else
		--D�����Ѱ��
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

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)

		local AwardMulti = 30																		--��Ž�ɫ���齱��ϵ��
		local tabSideOccupExp = {20,50,100,200,380,728,1000,1500,1500,1500}							--��Ÿ�ְҵ���齱��

		local PlayerLevel = ucRandomNum4												 			--ȡ����ҽ�������ʱ�ĵȼ�����������
		local iSideOccupId = 9 																		--����ʦ��ְҵid
		local iSideOccuplev = TaskCApi.GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) 		--��ȡ�������ʦ�ȼ�

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 											--��ҵȼ�����������

   		if bSuccess then

			if ucRandomNum1 == 1 then
				--[[
				--���ڹ������ƣ��˴���Ʒ������ȡ
				local iItemsid = TaskList[12760].Tabtaskmethod[1][iSideOccuplev][ucRandomNum3][2]
				--������Ʒ
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemsid, 1)    					--��ȡ���� 1��

				if TaskList[12760].Tabtaskmethod[1][iSideOccuplev][ucRandomNum3][1] == 2 then			--��ɫƷ����Ʒ���⽱��С�����ﾭ��
				--����ҷ��ž���
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)
				end
				]]--

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12761)--����flag�����Լ���

			elseif ucRandomNum1 == 2 then
				local iPlayerLev2 = math.floor(PlayerLevel /5)*5
				local iItemsid = TaskList[12760].Tabtaskmethod[2][iPlayerLev2][2]
				local iItemsnum = 1

				if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false) > 1 then
					iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false)
				end

				--����������Ʒ
				TaskCApi.TakeAwayTaskItem(TASKINTERFACE_POINTER,iItemsid, iItemsnum)

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12761)--����flag�����Լ���

			elseif ucRandomNum1 == 3 then

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12761)--����flag�����Լ���

				--��ո����������
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12797)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12798)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12810)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12812)


			elseif ucRandomNum1 == 4 then
				iItemsid = TaskList[12760].Tabtaskmethod[ucRandomNum1][ucRandomNum2][math.floor(PlayerLevel/10)-3]
				--����������Ʒ
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemsid, 5)

				--D��������ɣ����flag������ɴ���
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12761)
			end

			TaskCApi.DeliverSideOccupExp (TASKINTERFACE_POINTER, iSideOccupId, tabSideOccupExp[iSideOccuplev] )--���Ÿ�ְҵ����

		else
			--ʧ�ܵĻ���Ҫ��ֹC�����������
			if ucRandomNum1 == 3 then
				local iTaskID = TaskList[12760].Tabtaskmethod[ucRandomNum1][ucRandomNum2][1]
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iTaskID) then
				--������ڣ�����ֹ
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskID, false)
				end

				local iTaskID2 = TaskList[12760].Tabtaskmethod[ucRandomNum1][ucRandomNum2][2]
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iTaskID2) then
				--������ڣ�����ֹ
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskID2, false)
				end

			end

   		end

		--ʧ�ܻ��߷�����Ҫ����B����е�������Ʒ
		if ucRandomNum1 == 2 then
			local iPlayerLev2 = math.floor(PlayerLevel /5)*5

			local iItemsid = TaskList[12760].Tabtaskmethod[2][iPlayerLev2][2]
			local iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,iItemsid, false)

			if iItemsnum > 0 then
				--������ڣ�������������Ʒ
				TaskCApi.TakeAwayTaskItem(TASKINTERFACE_POINTER,iItemsid, iItemsnum)
			end

		--����ʧ�ܳɹ����߷������C�������������ɼ���
		elseif ucRandomNum1 == 3 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12797)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12798)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12810)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12812)
		end

   		return 0
   	end
}


TaskList[12763] = --����ʦ�ճ�
{
	--������ɷ�ʽһ����4���࣬�ֱ��Ӧ����1��2��3��4
	Tabtaskmethod =
	{
		--1��Ϊ��ȡ�������������еĲ�Ʒ.������Ϊ��ְҵ�ȼ�
		[1] = {
			--1������ʦ
			[1] = {
			--Ʒ��2=��ɫ��1=��ɫ����Ʒid

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

			--2������ʦ
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

			--3������ʦ
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

			--4������ʦ
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

			--5������ʦ
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

			--6������ʦ
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

			--7������ʦ(δ���ţ�80��װ��������
			[7] = {
					{1 , 29298,},
				},

			},

		--2��Ϊɱ��ǰ�ȼ����������Ϊ�ȼ��ֶ�
		[2] = {
			--����id
			[40] = 50 , 	--ʨ��
			[45] = 44 , 	--�Ļ�����
			[50] = 42 , 	--СħŮ
			[55] = 53 , 	--��ͷ����
			[60] = 10464 , --ʳ����
			[65] = 10463 , --���ֺڱ�
			[70] = 10449 , --��ľɱ��
			[75] = 10444 , --ҧֺ��
			[80] = 10444 , --ҧֺ��

			},

		--3������ض��������ɣ�������Ϊ��Ӧ������id
		[3] = {
				[1] = {12936, 12932,},--����������ɵ���������
				[2] = {12933, 12935,},
				},

		--4��Ϊ��Ҫ��Ʒ,���ݸ�ְҵ�ȼ���ȡ����Ʒ��ͬ
		[4] = {
				--����
				[1] = 36876,--����֮��
				--��ʯ�۳�
				[2] = 33661,
			},
	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,
		iMaxFinishCount = 1,--�����ɴ���Ϊ1
  		iClearFinishCountType = TaskClearFinishCountType.Daily,--ÿ�����

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ��ְҵ����
		SideOccupExp = function(TASKINTERFACE_POINTER)
			local soe = {}
			local tabSideOccupExp = {60,92,162,310,578,1098,1500,1500,1500,1500}						--��Ÿ�ְҵ���齱��

			local iSideOccupId = 10 																		--����ʦ��ְҵid
			local iSideOccuplev = TaskCApi.GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) 		--��ȡ�������ʦ�ȼ�

			soe = {
						SOE1 = {ID = iSideOccupId, EXP = tabSideOccupExp[iSideOccuplev]},--idΪ��ְҵid��expΪ��ֵ��expΪ0��ʾ������
				  }
			return soe
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iSideOccupIdhighlevel = 8 --��ǰ��������ʦΪ8��	--2013.09,07��

		local iSideOccupId = 10			 --����ʦ��ְҵid

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 40 then --�ȼ���Ҫ����40��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--����Ƿ�ѧ�����
		if not TaskCApi.HasSideOccup(TASKINTERFACE_POINTER, iSideOccupId) then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

		--��ǰ��������ʦΪiSideOccupIdhighlevel��������iSideOccupIdhighlevel���Լ�iSideOccupIdhighlevel�����Ͻ�����ӵ�������
		if TaskCApi. GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) >= iSideOccupIdhighlevel then
			return TASK_PREREQU_FAIL_BELOW_LEVEL
		end

		--D��������ռ�1��

		--ȡ����ҽ�ɫ����ʱ��
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)
		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--ȡflag����12764��ɴ��������7<=x<=8�����D�������
		local iflagtasktimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,12764) + 1

		local itaskmethodid = 1
		--3����ֵ������
		if RoleCreateTime and dayInYear and iflagtasktimes then
			if iflagtasktimes >=7 then
				itaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 3
			end
		end

		--����������,4493����itaskmethodid
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		if itaskmethodid == 4 then
			if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iflagtaskid = 12764		--����ʦflag��������id
		local itaskmethodid = 1 		--��������������ͣ�Ĭ��Ϊ1�������ֵ
		local isubtaskmethodid = 1		--���cd�����������������ͣ�Ĭ��Ϊ1

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)--��ҵȼ�

		--ȡ����ҽ�ɫ����ʱ��
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)

		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		--ȡflag������ɴ��������7<=x<=8�����D�������
		local iflagtasktimes = 	TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iflagtaskid) + 1

		if iflagtasktimes ==7 then
			itaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 3

		elseif iflagtasktimes >= 8 then
		--���������û��D�⣬��ô��8��һ����d��

			itaskmethodid = 4

		else--flag����Ϊ1-6ʱ������abc���������ͨ��ʱ��ͽ�ɫid�Ӻ�ȡ�����̶���ҵ�����������
			itaskmethodid = ( RoleCreateTime + dayInYear) % 3 + 1
		end

		--����������,4493����itaskmethodid
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		if itaskmethodid == 3 then --C��������2������
			isubtaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 1

			--����������
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end

			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid][1])--���ŷ�֧����

		elseif itaskmethodid == 4 then --D��������2������
			isubtaskmethodid = ( RoleCreateTime + dayInYear) % 2 + 1

			--����������
			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end

			--�������ʽ1��Ҫ���ⷢ���������
			if isubtaskmethodid == 1 then --�����������������36875��������
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 36875, 1, false)
			end

		end

		--����������,4493��4495��������id
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			itaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)

			if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true) > 0 then
			isubtaskmethodid = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4495, true)
			end
		end

		--��������������ڴ洢������ĵ�ǰ��������
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 1, itaskmethodid)		--�������ͣ�ABCD���ࣩ
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 2, isubtaskmethodid)		--���������ͣ����CD������⣩
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 3, 100)					--��������Ʒ�õ����������ֹȡ�գ�Ԥ��ֵ100
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 4, iPlayerLev)			--�洢��ҵȼ�,���ͻ�����ʾ׷����

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		local itaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 1)		--ȡ���������ͣ�ABCD���ࣩ
		local isubtaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 2)	--ȡ�����������ͣ����CD������⣩
		local iPlayerLev = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 4)			--ȡ����ҽ�������ʱ������ȼ�

		local iSideOccupId = 10 																		--����ʦ��ְҵid
		local iSideOccuplev = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,iSideOccupId) 		--��ȡ��ҷ���ʦ�ȼ�

		if itaskmethodid == 1 then
			Method.SubmitItem = true--�ύ��Ʒ����ɷ�ʽ

		elseif itaskmethodid == 2 then
			local iPlayerLev2 = math.floor(iPlayerLev /5)*5
			--ɱ��

			Method.KillMonster = {
						Mons1={ID=TaskList[12763].Tabtaskmethod[itaskmethodid][iPlayerLev2], Num=3,},
						}

		elseif itaskmethodid == 3 then
			--cd����������ͨ������ض�����ķ�ʽ��ʵ��
			local iTaskid = TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid][2]
			Method.CompleteTask = {TaskID = iTaskid , Num = 1}

		else
			local iItemID = TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid]
			Method.CollectItem = {Item1={ID=iItemID, Num=1, Common=true}, }
		end

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local itaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 1)		--ȡ���������ͣ�ABCD���ࣩ
		local isubtaskmethodid = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 2)	--ȡ�����������ͣ����CD������⣩
		local iPlayerLev = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, 12763, 4)			--ȡ����ҽ�������ʱ������ȼ�						--��ҵȼ�

		local iSideOccupId = 10 																		--����ʦ��ְҵid
		local iSideOccuplev = TaskCApi.GetSideOccupLev(TASKINTERFACE_POINTER,iSideOccupId) 				--��ȡ��ҷ���ʦ�ȼ�

		if itaskmethodid == 1 then
		--�ύ��Ʒ�ķ�ʽ��ʵ��
			--�ύ����Ʒid���ύ����Ʒ����
			local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,12763)

			if itemIDSubmitted and itemNumberSubmitted then

				for i,j in pairs(TaskList[12763].Tabtaskmethod[1][iSideOccuplev]) do
					if itemIDSubmitted == j[2] and  itemNumberSubmitted == 1 then
					--��������������ڴ洢��ҽ��ɵ���Ʒ����
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 12763, 3, i)

					iRet = TASK_SUCC_FINISH

					return iRet

					elseif itemIDSubmitted == j[2] and itemNumberSubmitted > 1 then
					--��������
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12763, 29, 20001)
					end

					if i == 112 then --��Ʒ����
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 12763, 28, 20000)
					end
				end
			end

		elseif itaskmethodid == 2 then
		--ɱ��
			if TaskCApi.GetMonstersKilled(TASKINTERFACE_POINTER, 12763, "Mons1") >= 3 then
   		        iRet = TASK_SUCC_FINISH
			    return iRet
   		    end


		elseif itaskmethodid == 3 then
		--C�����ͨ���������ķ�ʽ��ʵ��
			local iTaskid = TaskList[12763].Tabtaskmethod[itaskmethodid][isubtaskmethodid][2]
			local TaskCompleteTimes = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskid)

			if TaskCompleteTimes >= 1 then
				iRet = TASK_SUCC_FINISH
				return iRet

			end

		elseif itaskmethodid == 4 then
		--D�����Ѱ��
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

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3,ucRandomNum4)

		local AwardMulti = 30																		--��Ž�ɫ���齱��ϵ��
		local tabSideOccupExp = {60,92,162,310,578,1098,1500,1500,1500,1500}						--��Ÿ�ְҵ���齱��

		local PlayerLevel = ucRandomNum4												 			--ȡ����ҽ�������ʱ�ĵȼ�����������
		local iSideOccupId = 10 																	--����ʦ��ְҵid
		local iSideOccuplev = TaskCApi.GetSideOccupLev (TASKINTERFACE_POINTER,iSideOccupId ) 		--��ȡ��ҷ���ʦ�ȼ�

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 											--��ҵȼ�����������

   		if bSuccess then

			if ucRandomNum1 == 1 then
				--[[
				--���ڹ������ƣ��˴���Ʒ������ȡ
				local iItemsid = TaskList[12763].Tabtaskmethod[1][iSideOccuplev][ucRandomNum3][2]
				--������Ʒ
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemsid, 1)    					--��ȡ���� 1��

				if TaskList[12763].Tabtaskmethod[1][iSideOccuplev][ucRandomNum3][1] == 2 then			--��ɫƷ����Ʒ���⽱��С�����ﾭ��
				--����ҷ��ž���
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)
				end
				]]--
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12764)--����flag�����Լ���

			elseif ucRandomNum1 == 2 then

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12764)--����flag�����Լ���

			elseif ucRandomNum1 == 3 then

				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12764)--����flag�����Լ���

				--��ո����������
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12932)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12933)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12935)
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12936)


			elseif ucRandomNum1 == 4 then
				iItemsid = TaskList[12763].Tabtaskmethod[ucRandomNum1][ucRandomNum2]
				--����������Ʒ
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,iItemsid, 1)

				--D��������ɣ����flag������ɴ���
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12764)
			end

			TaskCApi.DeliverSideOccupExp (TASKINTERFACE_POINTER, iSideOccupId, tabSideOccupExp[iSideOccuplev] )--���Ÿ�ְҵ����
		else
			--ʧ�ܵĻ���Ҫ��ֹC�����������
			if ucRandomNum1 == 3 then
				local iTaskID = TaskList[12763].Tabtaskmethod[ucRandomNum1][ucRandomNum2][1]
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iTaskID) then
				--������ڣ�����ֹ
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskID, false)
				end

				local iTaskID2 = TaskList[12763].Tabtaskmethod[ucRandomNum1][ucRandomNum2][2]
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iTaskID2) then
				--������ڣ�����ֹ
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iTaskID2, false)
				end
			end

   		end

		--����ʧ�ܳɹ����߷������C�������������ɼ���
		if ucRandomNum1 == 3 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12932)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12933)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12935)
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 12936)

		--D�����������1�з��ŵ���Ʒ������ھ��ջ�
		elseif ucRandomNum1 == 4 and ucRandomNum2 == 1 then
			local iItemsnum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 36875, true)
			if iItemsnum > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,36875, 1)
			end

		end

   		return 0
   	end
}

TaskList[13520] = --���л������а������
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, --��������ʧ�ܽ���

		iRetrieveIdx = 27,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 100,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 30									--��Ž���ϵ��
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ


		end
		,

		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}

			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local ItemId1 = 38004	--����֮����
			local ItemId2 = 41074   --а�ܲл�

			if PlayerLevel>= 65 then
				items = {
							Item1 = {ID = ItemId1, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
							Item2 = {ID = ItemId2, NUM = 1},
						}
			else
				items = {
							Item1 = {ID = ItemId1, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
						}
			end

			return items
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 25 then --�ȼ���Ҫ����25��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

   		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

		--���������13589��ǰ����
		if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,13589) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		--��ƴΣ�7��(id=6)�����>0
		if TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,6) == 0 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		--�����20����λ����ѡ��һ��
		math.randomseed(os.time())
		local iRandomMethod = math.random(1, 20) --����浽����������

		local iItemID = 37774 + iRandomMethod  --��λ��id��37775-37794

   		--�����߻���
		TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, iItemID, 1, true)     --�� ��Ӧ��37775-37794
		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		Method.CollectItem = { Item1 = {ID=38037, Num = 3, Common= true},
				} --5����ͨ��Ʒа�ܺ��� 38037

		Method.iTimeLimit = 1800 --30min���������ʧ��

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 38037, true)   >= 3 then
			iRet = TASK_SUCC_FINISH
		end

		--��ʱ������ʧ��
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

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��

   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iRetrieveIdx = 27

		local AwardMulti = 30									--��Ž���ϵ��
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������


   		if bSuccess then
			--��������������Ʒ37753а�ܺ���
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,38037, true)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 38037, num1)

			--�����������ʣ��Ķ�λ��
			for i = 37775, 37794 do
				local num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,i, true)
				if num2> 0 then
					TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, i, num2)
				end
			end

			--���ݵȼ����Ž���38004���н��£�65�����Ϸ��ǰ�
			if PlayerLevel >= 65 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38004, 1, false)
				--������Ʒ�ǰ�41074а�ܲл�
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 41074, 1, false)
			else
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38004, 1, true)
			end

			--���ž���
			--TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)
			TaskCApi. DeliverRetrieveExp(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti,bRetrieve,iRetrieveIdx)

			--������Ʒ��38363������Ƭ
			--TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38363, 1, true)

			--�޸Ļ�ƴΣ�7�Ż����
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,6, -1)

			--0.35���ʷ���1��37708
			math.randomseed(os.time())
			local iRandomnum = math.random(1, 100) --����浽����������
			if iRandomnum <= 35 then
				TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 37708, 1, true)
			end

			--��ղ���ֵ
			TaskCApi. ClearRetrieveVal(TASKINTERFACE_POINTER,13520, iRetrieveIdx)

		else--ʧ���������

			--��������������Ʒ
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,38037, true)
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, 38037, num1)

			--�����������ʣ��Ķ�λ��
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

TaskList[13643] = --�����񲻻������
{
  	Property =
  	{
  		bCanRedo = true,
  		bCanRedoAfterFailure = true,

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, --��������ʧ�ܽ���

		iRetrieveIdx = 29,

  		bRecordFinishCount = true,
  		iMaxFinishCount = 1,

		iSuitableLevel = 200,

		iClearFinishCountType = TaskClearFinishCountType.Daily,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local AwardMulti = 60									--��Ž���ϵ��
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ


		end
		,

		FriendShips = function(TASKINTERFACE_POINTER)
			local friendships = {}
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�
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
								FS1 = {ID = 1, VAL = iPrestige},--idΪ����id,valΪ��ֵ��val=0 ,��������id=-1�� ���� ��������val=0��
						  }
			return friendships
		end	,

		Belief = function(TASKINTERFACE_POINTER)

			local iBelief = nil
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�
			if PlayerLevel >= 80 then
				iBelief= 9000
			end

			return iBelief--����0ʱΪ������,����Ϊ��ʾ��ֵ
		end	,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 60 then --�ȼ���Ҫ����60��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
			return TASK_PREREQU_FAIL_GIVEN_ITEM
		end

		--8��(id = 8)����� > 0
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

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iRandomNum = 3 --�ճ���������
		--1:NPC�����ȥ�󹤽�������һ����˿��38806��ȥ�ƹ�͵��38808
		--2:NPC�����һ�Ű�ֽ���������ȥƽ����һ�������Ĺ����������ĳ�˿��µ��֣���д�󽻸�npc
		--3:NPC�����ȥѧ�������������ڼ������ӣ�Ȼ��ȥ��Ȫ�������Ƶ���͵��㡣

		--�̶����ÿ���浽�����ݣ�������ż��*��Ҵ�����ɫ��ʱ�� %#iPlayervacationid+1
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --ȡ����ҽ�ɫ����ʱ��
		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday

		local iRandomMethod = (timePackage.yday + RoleCreateTime ) % iRandomNum + 1 --�����������һᷢ�ŵ��������

		--����������
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iRandomMethod = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		if iRandomMethod == 2 then
			--�����߻���
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38836, 1, true)     --�� ���� 38836 �հ׵�ֽ
		elseif iRandomMethod == 3 then
			--�����߻���
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, 38841, 1, true)     --�� ���� 38841 С�ɵ����
		end

		--���������
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 13643, 1, iRandomMethod)

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
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

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

   	    	if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			   return TASK_PREREQU_FAIL_GIVEN_ITEM
			end

		end
		]]--

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		local iRetrieveIdx = 29

		local AwardMulti = 60									--��Ž���ϵ��
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������
		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������

		local TabItem = {
						[1] = {38808 , 1},
						[2] = {38833 , 1},
						[3] = {38844 , 1},
						}

		--������ص���Ʒ
		--38806	������_��˿��	�󹤽�����˿��
		--38808	������_���Ѿ�	���Ѿ�
		--38810	������_������ĳ���	������ĳ���
		--38833	������_��������	��������
		--38836	������_�հ׵�ֽ	�հ׵�ֽ
		--38841	������_�������	С�ɵ����
		--38842	������_����������	����������
		--38843	������_��ȪӲ��	��ȪӲ��
		--38844	������_��Ȫˮ����	��Ȫ������

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
			--���ž���
			--TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti)
			TaskCApi. DeliverRetrieveExp(TASKINTERFACE_POINTER, AwardExpAdjust * AwardMulti,bRetrieve,iRetrieveIdx)

			local iPrestige
			--��������������
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

			--80����������ֵ������ͻ�����޵ķ�ʽ��9000
			if PlayerLevel>= 80 then
				--TaskCApi. DeliverBelief(TASKINTERFACE_POINTER,9000, true)
				TaskCApi. DeliverRetrieveBelief(TASKINTERFACE_POINTER, 9000, true, bRetrieve ,iRetrieveIdx)
			end

			--���ӻ�Ծ�� 13122 +1
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 13122, 1)
			--�޸���������ƴδ�����13646 +1
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 13646, 1)

			--�޸Ļ�ƴΣ�9�Ż����
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,8, -1)

			--���ڽ׶��Խ������޸�14007+1
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, 14007, 1)

			--��ղ���ֵ
			TaskCApi. ClearRetrieveVal(TASKINTERFACE_POINTER,13643, iRetrieveIdx)

		end


   		return 0
   	end
}

TaskList[14094] = --����̸��ȡ����
{
	--�����Զ����
	Tabtaskmethod =
	{
		--������ΪҪ���ɵ��鼮id

		[40876] = 14096, --�Ͼ�֮��
		[40877] = 14097, --����֮��
		[40878] = 14098, --��ʹ֮��
		[40879] = 14099, --ˮ����Ĺ
		[40880] = 14100, --����֮��
		[40881] = 14101, --�ƽ�����
		[40882] = 14102, --ͯ��Ц��
	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = true,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,
		iMaxFinishCount = 7,--�����ɴ���Ϊ7

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

   		return 0

   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		Method.SubmitItem = true

   		return Method

   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH
		local TabFlag = {} --������񣬴洢�Ѿ������鼮��״��

		--�ύ����Ʒid���ύ����Ʒ����
		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,14094)

		local key1
		local key2

		if itemIDSubmitted and itemNumberSubmitted then

			--����tabflag���洢����Ѿ����ɵ������������Ϊ��־����id
			for i= 14096, 14102 do
				--14096-14102�ֱ��Ӧ7���鼮�Ľ��ɽ��
				if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, i ,true) then
					TabFlag[i] = 1
				else
					TabFlag[i] = 0
				end
			end

			local iTaskID = TaskList[14094].Tabtaskmethod[itemIDSubmitted] --��ҽ��ɵ�������Ʒ����Ӧ�ı�־����id

			if iTaskID then --��־����id��Ϊ�գ�������Ҫ��������
				if TabFlag[iTaskID] == 1 then
					TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14094, 28, 20002)
					--�Ѿ����ɹ���
				elseif TabFlag[iTaskID] == 0 then

					--�����Ʒid�������������key1*200+key2 =itemIDSubmitted
					key1 = math.floor(itemIDSubmitted /200)
					key2 = itemIDSubmitted % 200

					--��������������ڴ洢��ҽ��ɵ���Ʒ
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 14094, 1, key1)
					TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, 14094, 2, key2)

					TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER, 14094, 1)

					iRet = TASK_SUCC_FINISH

				end

			else
				TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, 14094, 28, 20000)
				--��Ʒ����
			end

		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)

		local AwardMulti = 30																		--��Ž�ɫ���齱��ϵ��
		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 											--��ҵȼ�����������

   		if bSuccess then

			local iTaskId =TaskList[14094].Tabtaskmethod[ucRandomNum1*200+ucRandomNum2]--��Ҫ���ŵı�־����

			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskId)--����flag�����Լ���

   		end

   		return 0
   	end
}


TaskList[14262] = --2012���ڻ�ַ���
{
	--������ɷ�ʽ

	TabRuneExchage =
	{
		--[ְҵid] = {���ӷ��ģ��ջ����ģ��ջ�ĻƷ��ģ��ջ��������}

		--1��սʿ
		[1] = {
				{38933, 40045, 40053, 40061},
				{38941, 40117, 40125, 40133},
				{38973, 40045, 40053, 40061},
				{38981, 40117, 40125, 40133},
				{39013, 40045, 40053, 40061},
				{39021, 40117, 40125, 40133},
				{39997, 40045, 40053, 40061},
				{40005, 40045, 40053, 40061},
				{40013, 40045, 40053, 40061},
				{40021, 40045, 40053, 40061},
				{40029, 40045, 40053, 40061},
				{40037, 40045, 40053, 40061},
				{40045, 40045, 40053, 40061},
				{40053, 40045, 40053, 40061},
				{40061, 40045, 40053, 40061},
				{40069, 40117, 40125, 40133},
				{40077, 40117, 40125, 40133},
				{40085, 40117, 40125, 40133},
				{40093, 40117, 40125, 40133},
				{40101, 40117, 40125, 40133},
				{40109, 40117, 40125, 40133},
				{40117, 40117, 40125, 40133},
				{40125, 40117, 40125, 40133},
				{40133, 40117, 40125, 40133},
				{40141, 40237, 40245, 40253},
				{40149, 40237, 40245, 40253},
				{40157, 40237, 40245, 40253},
				{40165, 40237, 40245, 40253},
				{40173, 40237, 40245, 40253},
				{40181, 40237, 40245, 40253},
				{40189, 40237, 40245, 40253},
				{40197, 40237, 40245, 40253},
				{40205, 40237, 40245, 40253},
				{40213, 40237, 40245, 40253},
				{40221, 40237, 40245, 40253},
				{40229, 40237, 40245, 40253},
				{40237, 40237, 40245, 40253},
				{40245, 40237, 40245, 40253},
				{40253, 40237, 40245, 40253},
			},

		--2���ػ���
		[2] = {
				{38934, 40046, 40054, 40062},
				{38942, 40118, 40126, 40134},
				{38974, 40046, 40054, 40062},
				{38982, 40118, 40126, 40134},
				{39014, 40046, 40054, 40062},
				{39022, 40118, 40126, 40134},
				{39998, 40046, 40054, 40062},
				{40006, 40046, 40054, 40062},
				{40014, 40046, 40054, 40062},
				{40022, 40046, 40054, 40062},
				{40030, 40046, 40054, 40062},
				{40038, 40046, 40054, 40062},
				{40046, 40046, 40054, 40062},
				{40054, 40046, 40054, 40062},
				{40062, 40046, 40054, 40062},
				{40070, 40118, 40126, 40134},
				{40078, 40118, 40126, 40134},
				{40086, 40118, 40126, 40134},
				{40094, 40118, 40126, 40134},
				{40102, 40118, 40126, 40134},
				{40110, 40118, 40126, 40134},
				{40118, 40118, 40126, 40134},
				{40126, 40118, 40126, 40134},
				{40134, 40118, 40126, 40134},
				{40142, 40238, 40246, 40254},
				{40150, 40238, 40246, 40254},
				{40158, 40238, 40246, 40254},
				{40166, 40238, 40246, 40254},
				{40174, 40238, 40246, 40254},
				{40182, 40238, 40246, 40254},
				{40190, 40238, 40246, 40254},
				{40198, 40238, 40246, 40254},
				{40206, 40238, 40246, 40254},
				{40214, 40238, 40246, 40254},
				{40222, 40238, 40246, 40254},
				{40230, 40238, 40246, 40254},
				{40238, 40238, 40246, 40254},
				{40246, 40238, 40246, 40254},
				{40254, 40238, 40246, 40254},
			},

		--3 �̿�
		[3] = {
				{38935, 40047, 40055, 40063},
				{38943, 40119, 40127, 40135},
				{38975, 40047, 40055, 40063},
				{38983, 40119, 40127, 40135},
				{39015, 40047, 40055, 40063},
				{39023, 40119, 40127, 40135},
				{39999, 40047, 40055, 40063},
				{40007, 40047, 40055, 40063},
				{40015, 40047, 40055, 40063},
				{40023, 40047, 40055, 40063},
				{40031, 40047, 40055, 40063},
				{40039, 40047, 40055, 40063},
				{40047, 40047, 40055, 40063},
				{40055, 40047, 40055, 40063},
				{40063, 40047, 40055, 40063},
				{40071, 40119, 40127, 40135},
				{40079, 40119, 40127, 40135},
				{40087, 40119, 40127, 40135},
				{40095, 40119, 40127, 40135},
				{40103, 40119, 40127, 40135},
				{40111, 40119, 40127, 40135},
				{40119, 40119, 40127, 40135},
				{40127, 40119, 40127, 40135},
				{40135, 40119, 40127, 40135},
				{40143, 40239, 40247, 40255},
				{40151, 40239, 40247, 40255},
				{40159, 40239, 40247, 40255},
				{40167, 40239, 40247, 40255},
				{40175, 40239, 40247, 40255},
				{40183, 40239, 40247, 40255},
				{40191, 40239, 40247, 40255},
				{40199, 40239, 40247, 40255},
				{40207, 40239, 40247, 40255},
				{40215, 40239, 40247, 40255},
				{40223, 40239, 40247, 40255},
				{40231, 40239, 40247, 40255},
				{40239, 40239, 40247, 40255},
				{40247, 40239, 40247, 40255},
				{40255, 40239, 40247, 40255},
			},

		--4 ��ǹ
		[4] = {
				{38936, 40048, 40056, 40064},
				{38944, 40120, 40128, 40136},
				{38976, 40048, 40056, 40064},
				{38984, 40120, 40128, 40136},
				{39016, 40048, 40056, 40064},
				{39024, 40120, 40128, 40136},
				{40000, 40048, 40056, 40064},
				{40008, 40048, 40056, 40064},
				{40016, 40048, 40056, 40064},
				{40024, 40048, 40056, 40064},
				{40032, 40048, 40056, 40064},
				{40040, 40048, 40056, 40064},
				{40048, 40048, 40056, 40064},
				{40056, 40048, 40056, 40064},
				{40064, 40048, 40056, 40064},
				{40072, 40120, 40128, 40136},
				{40080, 40120, 40128, 40136},
				{40088, 40120, 40128, 40136},
				{40096, 40120, 40128, 40136},
				{40104, 40120, 40128, 40136},
				{40112, 40120, 40128, 40136},
				{40120, 40120, 40128, 40136},
				{40128, 40120, 40128, 40136},
				{40136, 40120, 40128, 40136},
				{40144, 40240, 40248, 40256},
				{40152, 40240, 40248, 40256},
				{40160, 40240, 40248, 40256},
				{40168, 40240, 40248, 40256},
				{40176, 40240, 40248, 40256},
				{40184, 40240, 40248, 40256},
				{40192, 40240, 40248, 40256},
				{40200, 40240, 40248, 40256},
				{40208, 40240, 40248, 40256},
				{40216, 40240, 40248, 40256},
				{40224, 40240, 40248, 40256},
				{40232, 40240, 40248, 40256},
				{40240, 40240, 40248, 40256},
				{40248, 40240, 40248, 40256},
				{40256, 40240, 40248, 40256},
			},

		--5 ��ʦ
		[5] = {
				{38937, 40049, 40057, 40065},
				{38945, 40121, 40129, 40137},
				{38977, 40049, 40057, 40065},
				{38985, 40121, 40129, 40137},
				{39017, 40049, 40057, 40065},
				{39025, 40121, 40129, 40137},
				{40001, 40049, 40057, 40065},
				{40009, 40049, 40057, 40065},
				{40017, 40049, 40057, 40065},
				{40025, 40049, 40057, 40065},
				{40033, 40049, 40057, 40065},
				{40041, 40049, 40057, 40065},
				{40049, 40049, 40057, 40065},
				{40057, 40049, 40057, 40065},
				{40065, 40049, 40057, 40065},
				{40073, 40121, 40129, 40137},
				{40081, 40121, 40129, 40137},
				{40089, 40121, 40129, 40137},
				{40097, 40121, 40129, 40137},
				{40105, 40121, 40129, 40137},
				{40113, 40121, 40129, 40137},
				{40121, 40121, 40129, 40137},
				{40129, 40121, 40129, 40137},
				{40137, 40121, 40129, 40137},
				{40145, 40241, 40249, 40257},
				{40153, 40241, 40249, 40257},
				{40161, 40241, 40249, 40257},
				{40169, 40241, 40249, 40257},
				{40177, 40241, 40249, 40257},
				{40185, 40241, 40249, 40257},
				{40193, 40241, 40249, 40257},
				{40201, 40241, 40249, 40257},
				{40209, 40241, 40249, 40257},
				{40217, 40241, 40249, 40257},
				{40225, 40241, 40249, 40257},
				{40233, 40241, 40249, 40257},
				{40241, 40241, 40249, 40257},
				{40249, 40241, 40249, 40257},
				{40257, 40241, 40249, 40257},
			},

		--6 ��ʦ
		[6] = {
				{38938, 40050, 40058, 40066},
				{38946, 40122, 40130, 40138},
				{38978, 40050, 40058, 40066},
				{38986, 40122, 40130, 40138},
				{39018, 40050, 40058, 40066},
				{39026, 40122, 40130, 40138},
				{40002, 40050, 40058, 40066},
				{40010, 40050, 40058, 40066},
				{40018, 40050, 40058, 40066},
				{40026, 40050, 40058, 40066},
				{40034, 40050, 40058, 40066},
				{40042, 40050, 40058, 40066},
				{40050, 40050, 40058, 40066},
				{40058, 40050, 40058, 40066},
				{40066, 40050, 40058, 40066},
				{40074, 40122, 40130, 40138},
				{40082, 40122, 40130, 40138},
				{40090, 40122, 40130, 40138},
				{40098, 40122, 40130, 40138},
				{40106, 40122, 40130, 40138},
				{40114, 40122, 40130, 40138},
				{40122, 40122, 40130, 40138},
				{40130, 40122, 40130, 40138},
				{40138, 40122, 40130, 40138},
				{40146, 40242, 40250, 40258},
				{40154, 40242, 40250, 40258},
				{40162, 40242, 40250, 40258},
				{40170, 40242, 40250, 40258},
				{40178, 40242, 40250, 40258},
				{40186, 40242, 40250, 40258},
				{40194, 40242, 40250, 40258},
				{40202, 40242, 40250, 40258},
				{40210, 40242, 40250, 40258},
				{40218, 40242, 40250, 40258},
				{40226, 40242, 40250, 40258},
				{40234, 40242, 40250, 40258},
				{40242, 40242, 40250, 40258},
				{40250, 40242, 40250, 40258},
				{40258, 40242, 40250, 40258},
			},

		--7 Ѫħ
		[7] = {
				{38939, 40051, 40059, 40067},
				{38947, 40123, 40131, 40139},
				{38979, 40051, 40059, 40067},
				{38987, 40123, 40131, 40139},
				{39019, 40051, 40059, 40067},
				{39027, 40123, 40131, 40139},
				{40003, 40051, 40059, 40067},
				{40011, 40051, 40059, 40067},
				{40019, 40051, 40059, 40067},
				{40027, 40051, 40059, 40067},
				{40035, 40051, 40059, 40067},
				{40043, 40051, 40059, 40067},
				{40051, 40051, 40059, 40067},
				{40059, 40051, 40059, 40067},
				{40067, 40051, 40059, 40067},
				{40075, 40123, 40131, 40139},
				{40083, 40123, 40131, 40139},
				{40091, 40123, 40131, 40139},
				{40099, 40123, 40131, 40139},
				{40107, 40123, 40131, 40139},
				{40115, 40123, 40131, 40139},
				{40123, 40123, 40131, 40139},
				{40131, 40123, 40131, 40139},
				{40139, 40123, 40131, 40139},
				{40147, 40243, 40251, 40259},
				{40155, 40243, 40251, 40259},
				{40163, 40243, 40251, 40259},
				{40171, 40243, 40251, 40259},
				{40179, 40243, 40251, 40259},
				{40187, 40243, 40251, 40259},
				{40195, 40243, 40251, 40259},
				{40203, 40243, 40251, 40259},
				{40211, 40243, 40251, 40259},
				{40219, 40243, 40251, 40259},
				{40227, 40243, 40251, 40259},
				{40235, 40243, 40251, 40259},
				{40243, 40243, 40251, 40259},
				{40251, 40243, 40251, 40259},
				{40259, 40243, 40251, 40259},
			},

		--8 ʫ��
		[8] = {
				{38940, 40052, 40060, 40068},
				{38948, 40124, 40132, 40140},
				{38980, 40052, 40060, 40068},
				{38988, 40124, 40132, 40140},
				{39020, 40052, 40060, 40068},
				{39028, 40124, 40132, 40140},
				{40004, 40052, 40060, 40068},
				{40012, 40052, 40060, 40068},
				{40020, 40052, 40060, 40068},
				{40028, 40052, 40060, 40068},
				{40036, 40052, 40060, 40068},
				{40044, 40052, 40060, 40068},
				{40052, 40052, 40060, 40068},
				{40060, 40052, 40060, 40068},
				{40068, 40052, 40060, 40068},
				{40076, 40124, 40132, 40140},
				{40084, 40124, 40132, 40140},
				{40092, 40124, 40132, 40140},
				{40100, 40124, 40132, 40140},
				{40108, 40124, 40132, 40140},
				{40116, 40124, 40132, 40140},
				{40124, 40124, 40132, 40140},
				{40132, 40124, 40132, 40140},
				{40140, 40124, 40132, 40140},
				{40148, 40244, 40252, 40260},
				{40156, 40244, 40252, 40260},
				{40164, 40244, 40252, 40260},
				{40172, 40244, 40252, 40260},
				{40180, 40244, 40252, 40260},
				{40188, 40244, 40252, 40260},
				{40196, 40244, 40252, 40260},
				{40204, 40244, 40252, 40260},
				{40212, 40244, 40252, 40260},
				{40220, 40244, 40252, 40260},
				{40228, 40244, 40252, 40260},
				{40236, 40244, 40252, 40260},
				{40244, 40244, 40252, 40260},
				{40252, 40244, 40252, 40260},
				{40260, 40244, 40252, 40260},
			},
	},

  	Property =
  	{
		bRecordFinish = true,			--��¼��ɽ��
  		bCanRedo = false,				--�ɹ��󲻿��ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}
			items = {
					Item1 = {ID = 41385, NUM = 1},--��ʾ�Ľ���Ϊһ��������ֵ���Ʒ41385����������ʾ������
					}

			return items
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

	   	if iPlayerLev < 45 then --�ȼ���Ҫ����45��
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--��ʱ����
		local timePackage = os.date("*t", os.time())
		local now_year = timePackage.year
		local now_month = timePackage.month
		local now_day = timePackage.day
		local now_hour = timePackage.hour

		if now_year == 2012 then
			if now_month == 1 then
				if now_day < 10 or now_day > 22 then
					return TASK_PREREQU_FAIL_LUA_TASK
				end
			else
				return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

		if now_year > 2012 then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

		local Method = {}
		Method.SubmitItem = true--�ύ��Ʒ����ɷ�ʽ
		Method.iTimeLimit = 3628800 --1Сʱû���������ʧ��

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iTaskId = 14262 --������id
		local iOccupationId = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER) --��ȡ���ְҵid

		--��ɫ 14267
		--��ɫ 14268
		--��ɫ 14269
		local bflagred = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,14267,true)
		local bflagyel = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,14268,true)
		local bflagblu = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,14269,true)

		local iRuneOccNum = 39 --ÿ��ְҵ����ȡ�ķ��ĸ���
		local bFlag = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER,iTaskId, 1)--1����������ڴ洢�Ƿ������ӷ��ģ����Ϊ0��Ϊδ����

		local itemIDSubmitted,itemNumberSubmitted = TaskCApi.GetSubmitItemInfo(TASKINTERFACE_POINTER,iTaskId)	--�ύ��Ʒ����Ϣ��id������

		if itemIDSubmitted and itemNumberSubmitted then

			if bFlag == 0 then		--��Ҳ�δ�ύ���ӷ���

				for i = 1 , iRuneOccNum do
					if itemIDSubmitted == TaskList[iTaskId].TabRuneExchage[iOccupationId][i][1] then--����ύ�������Ǳ�ְҵԭʼ����
						if itemNumberSubmitted == 1 then --������ȷ����ȡ���ύ
							TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,iTaskId, 1)

							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, iTaskId, 28, 15)

							bFlag = 1 --�Ѿ���ȡ��Ʒ
							--���������1�������ڴ洢����ύ�ķ�������
							TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1, i)

							--��������14264������
							TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,14264)

						else
							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, iTaskId, 29, 20001)--��������
						end
						break
					end

					if i == iRuneOccNum then--�ύ����Ʒ����
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, iTaskId, 28, 20000)
					end

				end

			else	--����Ѿ��ύ���ӷ���

				if itemIDSubmitted == 41302 then	--����ύ������ֲƾ֤
					if bflagred or bflagyel or bflagblu then --�Ѿ�ѡ����ɫ����һ��Ϊ��
						if itemNumberSubmitted == 1 then --�ύ������ȷ������Ʒ����
							TaskCApi.TakeAwaySubmitItem(TASKINTERFACE_POINTER,iTaskId, 1)
							iRet = TASK_SUCC_FINISH
						else--��������
							TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, iTaskId, 29, 20001)--��������
						end
					else--������û��ѡ����ɫ������ȡ����ʾһ���Զ��������Ϣ
						TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, iTaskId, 28, 6)--��ӡһ�������ʾ����֪���δѡ����ɫ
					end
				else--�ύ����Ʒ����
					TaskCApi.NotifySubmitItemErr(TASKINTERFACE_POINTER, iTaskId, 28, 20000)
				end
			end

		end

		local ulCurTime     = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
   		local ulDeliverTime = TaskCApi.GetTaskDeliverTime(TASKINTERFACE_POINTER, iTaskId)
   		if ulCurTime - ulDeliverTime > 3628800 then
   		    iRet = TASK_FAIL_FINISH
   		end


   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end
   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
		local iTaskId = 14262 --������id
		local iOccupationId = TaskCApi.GetPlayerOccupation(TASKINTERFACE_POINTER) --��ȡ���ְҵid

		--��ɫ 14267
		--��ɫ 14268
		--��ɫ 14269
		local bflagred = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,14267,true)
		local bflagyel = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,14268,true)
		local bflagblu = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,14269,true)

		local bflagcol = 2 --Ĭ��ѡ2�����ѡ�����ɫ��2Ϊ��ɫ��3Ϊ��ɫ��4Ϊ��ɫ
		local iAwardRuneId --Ҫ���ŵķ���id

		if bSuccess then
			if bflagred then
				bflagcol = 2
			elseif bflagyel then
				bflagcol = 3
			elseif bflagblu then
				bflagcol = 4
			end

			iAwardRuneId = TaskList[iTaskId].TabRuneExchage[iOccupationId][ucRandomNum1][bflagcol]
			TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iAwardRuneId, 1,true)

		end

		return 0
   	end
}


TaskList[14379] = --new_����_ͨ�ý�������

{
	--������id��
	TabSubTask =
	{
		--������⣬��
		[1] =	{
				[20] = {14409, 14411, 14412, 14413, 14414, 14415, 14416, 14417, 14418, 14419, 14420, 14421, 14422, 14423, 14424, 14425, 14427, 14428,} ,
				[25] = {14409, 14410, 14411, 14412, 14413, 14414, 14415, 14416, 14417, 14418, 14419, 14420, 14421, 14422, 14423, 14424, 14425, 14426, 14427, 14428, 14429, 14430, 14431, 14432, 14433, 14434, 14435, 14436, 14437, 14438, 14439, 14440, 14441, 14442, 14443, 14444, 14445, 14446, 14447, 14448, } ,
			},

		--������⣬��
		[2] =	{
				[20] = {8557, 8558, 8565, },
				[25] = {8557, 8558, 8565, },
				[30] = {8557, 8558, 8565, 8560},
				[35] = {8557, 8558, 8565, 8560, 8562,},

				[40] = {8568, 8571, },
				[45] = {8568, 8571, 8570},
				[50] = {8568, 8571, 8570, 8573, 8576},
				[55] = {8568, 8571, 8570, 8573, 8576, 8574},

				[60] = {9622, 9623, 9624, 9625,},
				[65] = {9622, 9623, 9624, 9625,},
				[70] = {9622, 9623, 9624, 9625,},
				[75] = {9622, 9623, 9624, 9625,},

				[80] = {9622, 9623, 9624, 9625,},
			},
	}
	,

  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = false, --��������ʧ�ܽ���

		bBuildTask = true, --���Ὠ������

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4��

		iSuitableLevel = 80,

  		iType  = TaskType.GongHui,--�������ͣ�����

  		iTopic = TaskTopic.YiBan,--һ����������
  	}
   	,

	-- �ɹ�ʱ��Ч

	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local iTaskId = 14379 --������id
			local ExpTable = {
								--����
								[1]=8,
								[2]=16,
								[3]=24,
								[4]=32,
								}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId) + 1--��������ɴ������������Σ�

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������

			local iExpAwardMutli = 1  --��������ϵ��
			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust
			return iExpAward --����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,

		-- ��Ǯ
		BindMoney = function(TASKINTERFACE_POINTER)
			local iTaskId = 14379 --������id
			local MonTable = {
								--�󶨽�
								[1]=3,
								[2]=6,
								[3]=9,
								[4]=12,
								}
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId) + 1--��������ɴ������������Σ�
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ
			local iMonAwardMutli = 1  --������Ǯϵ��
			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust
			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local factionaward = {}
			factionaward.contribution = 4 --���ṱ�׶�
			factionaward.credit = 4  --���Ṧѫ
			return factionaward
		end
		,

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iItemId = 23911 --�洢ǰ�����蹫�����ﺯid
		local iOldTaskId = 8547 --�ɵĽ�������id 8547
		local iTaskId = 14379 --������id

		--�����ҵȼ�>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

		--��ɵĽ������񻥳�
		if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iOldTaskId) then
			return TASK_PREREQU_FAIL_LUA_TASK
		end

		--ÿ���һ��������ʱ����Ƿ�������id=23911
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)
		local iOldFinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iOldTaskId) --�ɻ��ؽ���������ɴ���

		if FinishTime == 0 and iOldFinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, iItemId, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		local iTaskId = 14379   --������id 14379
		local iTaskId2 = 14380  --�µĻ��طǽ�������14380
		local iFlagTaskID = 14578 --������ʾ����׷�ٵ����񣬱�ʾ���������Ƿ����

		local iOldTaskId = 8547 --�ɵĽ�������id 8547
		local iItemId = 23911   --�������ﺯ 23911

		local iTaskType = 1     --�����Ѷ����ͣ�1Ϊ�򵥣�Ĭ�ϣ���2Ϊ��

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)	--��ҵȼ�

		--ÿ�֣�4�Σ����������״�ʱ����һ����������
		local iFinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId) --������������ɴ���
		local iOldFinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iOldTaskId) --�ͻ��ؽ���������ɴ���
		local iFlagFinishiTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iFlagTaskID)

		if iFinishTime == 0 and iOldFinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, iItemId, 1) --����һ���������ﺯ
		end

		--����ɵĽ������������0�����ɵ�������ɴ����̳е���������
		if iOldFinishTime > 0 then
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, iTaskId, iOldFinishTime)  --�޸��½�������14379������ɴ������̳о�����Ĵ�����
		end

		--��ձ�־���������������������ж�
		if iFlagFinishiTime >0 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,iFlagTaskID)   --�޸ı�־�������
		end

		--��վɽ�������Ĵ�������ֹ�´ν���ʱ�ظ��̳�
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,iOldTaskId)

		math.randomseed(os.time())
		local iRandomNum = math.random(1, 10)

		--2012.12.28�����޸ģ�������������ٷ��Ÿ�������
		if iRandomNum <= 0 then
		--20%���Ÿ�������
			iTaskType = 2
		end

		--����������
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iTaskType = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		local iPlayerLevIndex = 20

		if iTaskType == 1 then
			if iPlayerLev >= 25 then
				iPlayerLevIndex = 25
			end
		else
			--����80�Ľ�ɫ��û���µ�����⣬����
			if iPlayerLev >= 80 then
				iPlayerLevIndex = 80
			else
				iPlayerLevIndex = iPlayerLev-iPlayerLev%5
			end
		end

		local iRandomTaskNum = math.random(1, #TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex])--���Ѿ�ȷ�ϵĵȼ����������Χ
		local iDeliverTaskID = TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex][iRandomTaskNum]--��Ҫ���ŵ������id

		--������ǽ�������Ŀ�����������Ҫ���ⷢ���ظ�����,��iDeliverTaskID�����⴦��
		if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iDeliverTaskID) then
			if iRandomTaskNum < #TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex] then
				iDeliverTaskID = TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex][iRandomTaskNum +1]
			else
				iDeliverTaskID = TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex][1]
			end
		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, iDeliverTaskID)

		--���Ÿ�������
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iDeliverTaskID)

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(iDeliverTaskID /200)
		local key2 = iDeliverTaskID % 200

        --���������
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,iTaskId, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,iTaskId, 2, key2)

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,iTaskId, 3, iTaskType) --�����Ѷ�ϵ������3�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
		local iTaskId = 14379   --������id 14379
		local iFlagTaskID = 14578

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 2)

		local iDeliverTaskID = key1*200 + key2

   		local Method = {}

		Method.CompleteTask = {TaskID = iFlagTaskID, Num = 1}	--����ض�����1��

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iTaskId = 14379   --������id 14379
		local iFlagTaskID = 14578

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 2)

		local iDeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, iDeliverTaskID,true) then

			if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iFlagTaskID) == 0 then
				TaskCApi.ModifyTaskFinishCnt (TASKINTERFACE_POINTER, iFlagTaskID, 1)
			end

			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, iDeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

		local iTaskId = 14380   --������id 14380
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId) + 1--��������ɴ������������Σ�

		if FinishTime == 4 then
			if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)
		local ExpTable = {
		--����
				[1]=8,
				[2]=16,
				[3]=24,
				[4]=32,
				}

		local MonTable = {
		--�󶨽�
				[1]=3,
				[2]=6,
				[3]=9,
				[4]=12,
			}

		local ContributionTable = {
		--���׶�
				[1]=4,
				[2]=4,
				[3]=4,
				[4]=4,
			}

		local ExploitTable = {
		--��ѫ
				[1]=4,
				[2]=4,
				[3]=4,
				[4]=4,
			}

		local iTaskId = 14379   --������id 14379

		local iLucResourcetype = 9 --������Դֵid

		local iDeliverTaskID = ucRandomNum1*200 + ucRandomNum2
		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������
		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ

		local iExpAwardMutli = 1  --��������ϵ��
		local iMonAwardMutli = 1  --������Ǯϵ��
		local iGuildMoneyMuti = 1 --�����ʽ�ϵ��

		local iPersonalActive = 1		--��Ծ�Ƚ�����ֵ

		local iExpMuti = 400	--���⽱������ϵ��
		local iMonMuti = 150	--���⽱�����ϵ��

		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)--��������ɴ������������Σ�

		if bSuccess then

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAwardMutli*iMonAdjust)	--���Űﶨ��

				TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable[FinishTime]) 						--���Ź��Ṧѫ��
				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��
				TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable[FinishTime]) 			--���Ź��׶�

				if FinishTime == 4 then --4������ʱ���������ɴ���

					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 16106)--2013.1.4�����Ż����

					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)
					--Ƶ���㲥
					TaskCApi.Broadcast(TASKINTERFACE_POINTER, iTaskId, TaskBroadcastChannel.Kingdom)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����
					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end

					--ȡ14381��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����������Ϊ�콱�����ǰ�ᡣ
					local FirstTimeWeek = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 14381)
					if FirstTimeWeek == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 14381)
					end
				end
			end

			--�����������Ķ��⽱��
			if ucRandomNum3 == 1 then--2013.1.4�޸ģ������񴥷�����

				local iGuildCtrlIdlev1 = 103522 --����_��������1�Ƚ� ������id
				local iGuildCtrlIdlev2 = 103523 --����_��������2�Ƚ� ������id
				local iGuildCtrlIdlev3 = 103524 --����_��������3�Ƚ� ������id

				local iBroadTaskid1 = 14584 --����0-1
				local iBroadTaskid2 = 14585 --����0-2
				local iBroadTaskid3 = 14586 --����1-2
				local iBroadTaskid4 = 14587 --����2-3

				local iLucResourceVal = TaskCApi. GetFactionResourceVal(TASKINTERFACE_POINTER, iLucResourcetype)

				math.randomseed(os.time())
				local iAwardnum = math.random(1, 50000)   --���ᱦ����⿪�����������

				if iLucResourceVal == 0 then--Ŀǰδ�����κν���
					--1-200 0-1����201-210 0-2����
					if iAwardnum <= 200 then
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpMuti*iExpAdjust) 	--���ⷢ�ž���
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMonMuti*iMonAdjust)	--���ⷢ�Ż��

						--���Ÿ����㲥������й���㲥
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iBroadTaskid1)

						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev1, true) --���������1���Ŀ�����

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER,iLucResourcetype, 1) --����������Դֵ(0+1=1)����ʾ��������ĵȼ�
					elseif iAwardnum <= 210 and iAwardnum > 200 then
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpMuti*iExpAdjust) 	--���ⷢ�ž���
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMonMuti*iMonAdjust)	--���ⷢ�Ż��

						--���Ÿ����㲥������й���㲥
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iBroadTaskid2)

						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev2, true) 	 --���������2���Ŀ�����

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER,iLucResourcetype, 2) --����������Դֵ(0+2=2)����ʾ��������ĵȼ�
					end

				elseif iLucResourceVal == 1 then --Ŀǰ�Ѿ�����1�Ƚ�
					--0.5% 1��������2��
					if iAwardnum <= 50 then
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpMuti*iExpAdjust) 	--���ⷢ�ž���
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMonMuti*iMonAdjust)	--���ⷢ�Ż��

						--���Ÿ����㲥������й���㲥
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iBroadTaskid3)

						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev2, true) 	 --���������2���Ŀ�����
						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev1, false)  --�رտ�����1���Ŀ�����

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER,iLucResourcetype, 1) --����������Դֵ(1+1=2)����ʾ��������ĵȼ�
					end

				elseif iLucResourceVal == 2 then --Ŀǰ�Ѿ�����2�Ƚ�
					--0.15% 2��������3��
					if iAwardnum <= 15 then
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpMuti*iExpAdjust) 	--���ⷢ�ž���
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMonMuti*iMonAdjust)	--���ⷢ�Ż��

						--���Ÿ����㲥������й���㲥
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iBroadTaskid4)

						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev3, true) 	 --���������3���Ŀ�����
						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev2, false)  --�رտ�����2���Ŀ�����

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER,iLucResourcetype, 1) --����������Դֵ(2+1=3)����ʾ��������ĵȼ�
					end

				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)
			--����ɾ�������Ѿ����ŵ�iDeliverTaskID����
			TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iDeliverTaskID, false )

   		end
		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, iDeliverTaskID)

   		return 0
   	end
}

TaskList[14380] = --new_����_ͨ�÷ǽ�������

{
	--������id��
	TabSubTask =
	{
		--������⣬��
		[1] =	{
				[20] = {14409, 14411, 14412, 14413, 14414, 14415, 14416, 14417, 14418, 14419, 14420, 14421, 14422, 14423, 14424, 14425, 14427, 14428,} ,
				[25] = {14409, 14410, 14411, 14412, 14413, 14414, 14415, 14416, 14417, 14418, 14419, 14420, 14421, 14422, 14423, 14424, 14425, 14426, 14427, 14428, 14429, 14430, 14431, 14432, 14433, 14434, 14435, 14436, 14437, 14438, 14439, 14440, 14441, 14442, 14443, 14444, 14445, 14446, 14447, 14448, } ,
			},

		--������⣬��
		[2] =	{
				[20] = {8557, 8558, 8565, },
				[25] = {8557, 8558, 8565, },
				[30] = {8557, 8558, 8565, 8560},
				[35] = {8557, 8558, 8565, 8560, 8562,},

				[40] = {8568, 8571, },
				[45] = {8568, 8571, 8570},
				[50] = {8568, 8571, 8570, 8573, 8576},
				[55] = {8568, 8571, 8570, 8573, 8576, 8574},

				[60] = {9622, 9623, 9624, 9625,},
				[65] = {9622, 9623, 9624, 9625,},
				[70] = {9622, 9623, 9624, 9625,},
				[75] = {9622, 9623, 9624, 9625,},

				[80] = {9622, 9623, 9624, 9625,},
			},
	}
	,

	--��Դֵ�����б�
	TabResourceAward =
	{
		--����Ϊ��Դֵϵͳ�洢��id
		--ħ��
		[1] = {
				--����Ϊ��ҵȼ���
				[20] = {
						--����Ϊ����������
						[1] = 1,
						[2] = 1,
						[3] = 2,
						[4] = 3,
						},
				[40] = {
						--����Ϊ����������
						[1] = 1,
						[2] = 2,
						[3] = 3,
						[4] = 4,
						},
				[60] = {
						--����Ϊ����������
						[1] = 2,
						[2] = 3,
						[3] = 4,
						[4] = 5,
						},
			},

		--����
		[2] = {
				--����Ϊ��ҵȼ���
				[20] = {
						--����Ϊ����������
						[1] = 1,
						[2] = 1,
						[3] = 2,
						[4] = 3,
						},
				[40] = {
						--����Ϊ����������
						[1] = 3,
						[2] = 3,
						[3] = 4,
						[4] = 5,
						},
				[60] = {
						--����Ϊ����������
						[1] = 3,
						[2] = 5,
						[3] = 7,
						[4] = 9,
						},
			},

		--����
		[3] = {
				--����Ϊ��ҵȼ���
				[20] = {
						--����Ϊ����������
						[1] = 1,
						[2] = 1,
						[3] = 2,
						[4] = 3,
						},
				[40] = {
						--����Ϊ����������
						[1] = 3,
						[2] = 3,
						[3] = 4,
						[4] = 5,
						},
				[60] = {
						--����Ϊ����������
						[1] = 3,
						[2] = 5,
						[3] = 7,
						[4] = 9,
						},
			},


		--����
		[4] = {
				--����Ϊ��ҵȼ���
				[20] = {
						--����Ϊ����������
						[1] = 1,
						[2] = 1,
						[3] = 2,
						[4] = 3,
						},
				[40] = {
						--����Ϊ����������
						[1] = 3,
						[2] = 3,
						[3] = 4,
						[4] = 5,
						},
				[60] = {
						--����Ϊ����������
						[1] = 3,
						[2] = 5,
						[3] = 7,
						[4] = 9,
						},
			},

	}
	,

  	Property =
  	{
  		bCanRedo = true,--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,--�ɷ���
  		bShowPrompt = true,--��ʾϵͳ��ʾ
		bCanSeekOut = true,

		bClearAsGiveup = false, --�������񷢷�ʧ�ܽ���

		bRecordFinishCount = true,
  		iMaxFinishCount = 4,		--ÿ��������4��

		iSuitableLevel = 80,

  		iType  = TaskType.GongHui,--�������ͣ�����

  		iTopic = TaskTopic.YiBan,--һ����������
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local iTaskId = 14380 --������id
			local ExpTable = {
								--����
								[1]=8,
								[2]=16,
								[3]=24,
								[4]=32,
								}

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId) + 1--��������ɴ������������Σ�

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������

			local iExpAwardMutli = 1  --��������ϵ��
			local iExpAward = ExpTable[FinishTime]*iExpAwardMutli*iExpAdjust
			return iExpAward --����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,

		-- ��Ǯ
		BindMoney = function(TASKINTERFACE_POINTER)
			local iTaskId = 14380 --������id
			local MonTable = {
								--�󶨽�
								[1]=3,
								[2]=6,
								[3]=9,
								[4]=12,
								}
			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId) + 1--��������ɴ������������Σ�
			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ
			local iMonAwardMutli = 1  --������Ǯϵ��
			local iMonAward = MonTable[FinishTime]*iMonAwardMutli*iMonAdjust
			return iMonAward--����0ʱΪ������������Ϊ��ʾ��ֵ
		end
		,

		-- ���ά�����
		FactionAward = function(TASKINTERFACE_POINTER)
			local iTaskId = 14380 --������id
			local ExpTable = {
			--����
					[1]=8,
					[2]=16,
					[3]=24,
					[4]=32,
					}

			local MonTable = {
			--���
					[1]=3,
					[2]=6,
					[3]=9,
					[4]=12,
				}

			local ContributionTable = {
						[20] = {
								--���׶�20-39��
									[1]=0,
									[2]=1,
									[3]=1,
									[4]=2,
								},
						[40] = {
								--���׶�40-59��
									[1]=1,
									[2]=2,
									[3]=2,
									[4]=3,
								},
						[60] = {
								--���׶�60+
									[1]=2,
									[2]=3,
									[3]=4,
									[4]=4,
								},
					}

			local ExploitTable = {
						[20] = {
							--��ѫ20-39��
									[1]=0,
									[2]=1,
									[3]=1,
									[4]=2,
								},
						[40] = {
							--��ѫ40-59��
									[1]=1,
									[2]=2,
									[3]=2,
									[4]=3,
								},
						[60] = {
							--��ѫ60+��
									[1]=2,
									[2]=3,
									[3]=4,
									[4]=4,
								},
					}

			local GuildMonTable = {
						[20] = {
							--�����ʽ�20-39
									[1]=500,
									[2]=1000,
									[3]=1500,
									[4]=2000,
								},
						[40] = {
							--�����ʽ�40-59
									[1]=1000,
									[2]=2000,
									[3]=3000,
									[4]=4000,
								},
						[60] = {
							--�����ʽ�60+
									[1]=2000,
									[2]=3000,
									[3]=5000,
									[4]=6000,
								},
					}

			local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
			local iAwardPlayerLevel --20���������Ž����ĵȼ��Σ��ֱ�Ϊ20��40��60

			if iPlayerLevel >= 80 then
				iAwardPlayerLevel = 60
			else
				iAwardPlayerLevel = iPlayerLevel - iPlayerLevel % 20
			end

			local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId) + 1--��������ɴ������������Σ�

			local factionaward = {}

			factionaward.credit = ExploitTable[iAwardPlayerLevel][FinishTime]									--���Ź��Ṧѫ��
			factionaward.contribution = ContributionTable[iAwardPlayerLevel][FinishTime] 		--���Ź��׶�
			factionaward.money = GuildMonTable[iAwardPlayerLevel][FinishTime]					--���Ź����ʽ�
			factionaward.vitality = 1															--�����Ծ��

			factionaward.magic	 = TaskList[iTaskId].TabResourceAward[1][iAwardPlayerLevel][FinishTime]		--����2#������Դ
			factionaward.economy = TaskList[iTaskId].TabResourceAward[2][iAwardPlayerLevel][FinishTime] 	--����3#������Դ
			factionaward.culture = TaskList[iTaskId].TabResourceAward[3][iAwardPlayerLevel][FinishTime]		--����4#������Դ
			factionaward.belief  = TaskList[iTaskId].TabResourceAward[4][iAwardPlayerLevel][FinishTime]		--����5#������Դ

			return factionaward
		end
		,
	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iItemId = 23911 --�洢ǰ�����蹫�����ﺯid

		local TabOldTaskId = {8548,8549,8550,8551,10368,10369,10370,10371,10444,10445,} --�ɵķǽ�������id��
		local iTaskId = 14380 --������id

		local iFlagTaskID = 14579 --������ʾ����׷�ٵ����񣬱�ʾ���������Ƿ����

		--�����ҵȼ�>=20
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
	   	if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		--��������Ƿ����������
		local iRet = TaskCApi.CheckDeliverNewTask(TASKINTERFACE_POINTER, 9358)
		if iRet ~= 0  then
			return TASK_PREREQU_FAIL_FULL
   	   	end

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

		--ÿ���һ��������ʱ����Ƿ�������id=23911
		local iFinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)
		local iOldFinishTime = 0 --�ɻ��ؽ���������ɴ���

		for i,v in pairs(TabOldTaskId) do

			--��ɵ����񻥳�
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,v) then
				return TASK_PREREQU_FAIL_LUA_TASK
			end

			--�̳���ɴ���
			if iOldFinishTime < TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, v) then
				iOldFinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, v)
			end

		end

		if iFinishTime == 0 and iOldFinishTime == 0 then
			local iItemNum = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, iItemId, true)
			if iItemNum < 1 then
				return TASK_PREREQU_FAIL_NO_ITEM
			end
		end

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)

		local iTaskId = 14380   --������id 14380
		local iTaskId2 = 14379	 --�½�������id
		local TabOldTaskId = {8548,8549,8550,8551,10368,10369,10370,10371,10444,10445,} --�ɵķǽ�������id��

		local iFlagTaskID = 14579

		local iItemId = 23911   --�������ﺯ 23911

		local iTaskType = 1     --�����Ѷ����ͣ�1Ϊ�򵥣�Ĭ�ϣ���2Ϊ��

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)	--��ҵȼ�

		--ÿ�֣�4�Σ����������״�ʱ����һ����������
		local iFinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)
		local iOldFinishTime = 0 --�ɻ��ؽ���������ɴ���
		local iFlagFinishiTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iFlagTaskID)

		for i,v in pairs(TabOldTaskId) do
			if iOldFinishTime < TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, v) then
				iOldFinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, v)
			end
		end

		--��ձ�־���������������������ж�
		if iFlagFinishiTime >0 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,iFlagTaskID)   --�޸ı�־�������
		end

		if iFinishTime == 0 and iOldFinishTime == 0 then
			TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER, iItemId, 1) --����һ���������ﺯ
		end

		--����ɵķǽ������������0�����ɵ�������ɴ����̳е���������
		if iOldFinishTime > 0 then
			TaskCApi. ModifyTaskFinishCnt (TASKINTERFACE_POINTER, iTaskId, iOldFinishTime)  --�޸��½�������14380������ɴ������̳о�����Ĵ�����
		end

		--��վ�����Ĵ�������ֹ�´ν���ʱ�ظ��̳�

		for i,v in pairs(TabOldTaskId) do
			if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, v) > 0 then
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,v)
			end
		end


		math.randomseed(os.time())
		local iRandomNum = math.random(1, 10)

		--2012.12.28�����޸ģ�������������ٷ��Ÿ������񣬸�����20%��Ϊ0
		if iRandomNum <= 0 then
		--20%���Ÿ�������
			iTaskType = 2
		end

		--����������
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iTaskType = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

		local iPlayerLevIndex = 20

		if iTaskType == 1 then
			if iPlayerLev >= 25 then
				iPlayerLevIndex = 25
			end
		else
			--����80�Ľ�ɫ��û���µ�����⣬����
			if iPlayerLev >= 80 then
				iPlayerLevIndex = 80
			else
				iPlayerLevIndex = iPlayerLev-iPlayerLev%5
			end
		end

		local iRandomTaskNum = math.random(1, #TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex])--���Ѿ�ȷ�ϵĵȼ����������Χ
		local iDeliverTaskID = TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex][iRandomTaskNum]--��Ҫ���ŵ������id

		--�����뽨������Ŀ�����������Ҫ���ⷢ���ظ�����,��iDeliverTaskID�����⴦��
		if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iDeliverTaskID) then
			if iRandomTaskNum < #TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex] then
				iDeliverTaskID = TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex][iRandomTaskNum +1]
			else
				iDeliverTaskID = TaskList[iTaskId].TabSubTask[iTaskType][iPlayerLevIndex][1]
			end
		end

		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, iDeliverTaskID)

		--���Ÿ�������
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iDeliverTaskID)

		--�������id�������������key1*200+key2 =taskID
		local key1 = math.floor(iDeliverTaskID /200)
		local key2 = iDeliverTaskID % 200

        --���������
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,iTaskId, 1, key1)
		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,iTaskId, 2, key2)

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER,iTaskId, 3, iTaskType) --�����Ѷ�ϵ������3�������

		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
		local iTaskId = 14380   --������id 14380
		local iFlagTaskID = 14579

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 2)

		local iDeliverTaskID = key1*200 + key2

   		local Method = {}

		Method.CompleteTask = {TaskID = iFlagTaskID, Num = 1}	--����ض�����1��

   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iTaskId = 14380   --������id 14380
		local iFlagTaskID = 14579

		local key1 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1)
		local key2 = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 2)

		local iDeliverTaskID = key1*200 + key2

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, iDeliverTaskID,true) then
			if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iFlagTaskID) == 0 then
				TaskCApi.ModifyTaskFinishCnt (TASKINTERFACE_POINTER, iFlagTaskID, 1)
			end

			iRet = TASK_SUCC_FINISH
		end

		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER, iDeliverTaskID,false) then
			--����ҷ�����������ʱ����Ϊ������ʧ��
			iRet = TASK_FAIL_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
		local iTaskId = 14380   --������id 14380
		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId) + 1--��������ɴ������������Σ�

		if FinishTime == 4 then
			if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
				return TASK_PREREQU_FAIL_GIVEN_ITEM
			end
		end

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2,ucRandomNum3)
		local ExpTable = {
		--����
				[1]=8,
				[2]=16,
				[3]=24,
				[4]=32,
				}

		local MonTable = {
		--���
				[1]=3,
				[2]=6,
				[3]=9,
				[4]=12,
			}

		local ContributionTable = {
					[20] = {
							--���׶�20-39��
								[1]=0,
								[2]=1,
								[3]=1,
								[4]=2,
							},
					[40] = {
							--���׶�40-59��
								[1]=1,
								[2]=2,
								[3]=2,
								[4]=3,
							},
					[60] = {
							--���׶�60+
								[1]=2,
								[2]=3,
								[3]=4,
								[4]=4,
							},
				}

		local ExploitTable = {
					[20] = {
						--��ѫ20-39��
								[1]=0,
								[2]=1,
								[3]=1,
								[4]=2,
							},
					[40] = {
						--��ѫ40-59��
								[1]=1,
								[2]=2,
								[3]=2,
								[4]=3,
							},
					[60] = {
						--��ѫ60+��
								[1]=2,
								[2]=3,
								[3]=4,
								[4]=4,
							},
				}

		local GuildMonTable = {
					[20] = {
						--�����ʽ�20-39
								[1]=500,
								[2]=1000,
								[3]=1500,
								[4]=2000,
							},
					[40] = {
						--�����ʽ�40-59
								[1]=1000,
								[2]=2000,
								[3]=3000,
								[4]=4000,
							},
					[60] = {
						--�����ʽ�60+
								[1]=2000,
								[2]=3000,
								[3]=5000,
								[4]=6000,
							},
				}

		local iExpMuti = 400 --���ⴥ���Ľ���������ϵ��
		local iMonMuti = 150 --���ⴥ���Ľ��������ϵ��

		local iPersonalActive = 1		--��Ծ�Ƚ�����ֵ

		local iTaskId = 14380   --������id 14380
		local iLucResourcetype = 9  --����ֵ��Դֵid

		local iDeliverTaskID = ucRandomNum1*200 + ucRandomNum2

		local iPlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iAwardPlayerLevel --20���������Ž����ĵȼ��Σ��ֱ�Ϊ20��40��60

		local iExpAdjust = TaskExpAdjust[iPlayerLevel]--���ȼ���������
		local iMonAdjust = TaskMoneyAdjust[iPlayerLevel]--���ȼ�������Ǯ

		local FinishTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)--��������ɴ������������Σ�

		if bSuccess then

			if iPlayerLevel >= 80 then
				iAwardPlayerLevel = 60
			else
				iAwardPlayerLevel = iPlayerLevel - iPlayerLevel % 20
			end

			if FinishTime > 0 then
				TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, ExpTable[FinishTime]*iExpAdjust) 	--���ž���
				TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, MonTable[FinishTime]*iMonAdjust)	--���Ż��

				TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, ExploitTable[iAwardPlayerLevel][FinishTime]) 	--���Ź��Ṧѫ��
				TaskCApi.DeliverFactionVitality(TASKINTERFACE_POINTER, iPersonalActive) 							--���Ź����Ծ��

				TaskCApi.DeliverFactionContribution(TASKINTERFACE_POINTER, ContributionTable[iAwardPlayerLevel][FinishTime]) --���Ź��׶�

				TaskCApi.DeliverFactionMoney(TASKINTERFACE_POINTER, GuildMonTable[iAwardPlayerLevel][FinishTime])	--���Ź����ʽ�

				TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 1 ,TaskList[14380].TabResourceAward[1][iAwardPlayerLevel][FinishTime]) --����2#������Դ
				TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 2 ,TaskList[14380].TabResourceAward[2][iAwardPlayerLevel][FinishTime]) --����3#������Դ
				TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 3 ,TaskList[14380].TabResourceAward[2][iAwardPlayerLevel][FinishTime]) --����4#������Դ
				TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER, 4 ,TaskList[14380].TabResourceAward[2][iAwardPlayerLevel][FinishTime]) --����5#������Դ

				if FinishTime == 4 then --4������ʱ���������ɴ���
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 16106)--���������Ż�����16106��2013.1.4

					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)
					--Ƶ���㲥
					TaskCApi.Broadcast(TASKINTERFACE_POINTER, iTaskId, TaskBroadcastChannel.Kingdom)

					--ȡ9286��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����
					local FirstTime = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 9286)
					if FirstTime == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 9286)
					end

					--ȡ14381��ɴ����ж��Ƿ�ķ��Ŷ��⽱��,���û��ɹ��򷢷�����������Ϊ�콱�����ǰ�ᡣ
					local FirstTimeWeek = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, 14381)
					if FirstTimeWeek == 0 then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, 14381)
					end
				end
			end

			--�����������Ķ��⽱��
			if ucRandomNum3 == 1 then

				local iGuildCtrlIdlev1 = 103522 --����_��������1�Ƚ� ������id
				local iGuildCtrlIdlev2 = 103523 --����_��������2�Ƚ� ������id
				local iGuildCtrlIdlev3 = 103524 --����_��������3�Ƚ� ������id

				local iBroadTaskid1 = 14584 --����0-1
				local iBroadTaskid2 = 14585 --����0-2
				local iBroadTaskid3 = 14586 --����1-2
				local iBroadTaskid4 = 14587 --����2-3

				local iLucResourceVal = TaskCApi. GetFactionResourceVal(TASKINTERFACE_POINTER, iLucResourcetype)

				math.randomseed(os.time())
				local iAwardnum = math.random(1, 50000)   --���ᱦ����⿪�����������,ԭ�����Ϊ10000����������ָ���20%���ֽ����ʽ���Ϊԭ����1/5

				if iLucResourceVal == 0 then--Ŀǰδ�����κν���
					--1-200 0-1����201-210 0-2����
					if iAwardnum <= 200 then
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpMuti*iExpAdjust) 	--���ⷢ�ž���
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMonMuti*iMonAdjust)	--���ⷢ�Ż��

						--���Ÿ����㲥������й���㲥
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iBroadTaskid1)

						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev1, true) --���������1���Ŀ�����

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER,iLucResourcetype, 1) --����������Դֵ(0+1=1)����ʾ��������ĵȼ�
					elseif iAwardnum <= 210 and iAwardnum > 200 then
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpMuti*iExpAdjust) 	--���ⷢ�ž���
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMonMuti*iMonAdjust)	--���ⷢ�Ż��

						--���Ÿ����㲥������й���㲥
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iBroadTaskid2)

						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev2, true) 	 --���������2���Ŀ�����

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER,iLucResourcetype, 2) --����������Դֵ(0+2=2)����ʾ��������ĵȼ�
					end

				elseif iLucResourceVal == 1 then --Ŀǰ�Ѿ�����1�Ƚ�
					--0.5% 1��������2��
					if iAwardnum <= 50 then
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpMuti*iExpAdjust) 	--���ⷢ�ž���
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMonMuti*iMonAdjust)	--���ⷢ�Ż��

						--���Ÿ����㲥������й���㲥
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iBroadTaskid3)

						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev2, true) 	 --���������2���Ŀ�����
						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev1, false)  --�رտ�����1���Ŀ�����

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER,iLucResourcetype, 1) --����������Դֵ(1+1=2)����ʾ��������ĵȼ�
					end

				elseif iLucResourceVal == 2 then --Ŀǰ�Ѿ�����2�Ƚ�
					--0.15% 2��������3��
					if iAwardnum <= 15 then
						TaskCApi.DeliverExperience(TASKINTERFACE_POINTER, iExpMuti*iExpAdjust) 	--���ⷢ�ž���
						TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER, iMonMuti*iMonAdjust)	--���ⷢ�Ż��

						--���Ÿ����㲥������й���㲥
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER, iBroadTaskid4)

						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev3, true) 	 --���������3���Ŀ�����
						TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,iGuildCtrlIdlev2, false)  --�رտ�����2���Ŀ�����

						TaskCApi.DeliverFactionResourceVal(TASKINTERFACE_POINTER,iLucResourcetype, 1) --����������Դֵ(2+1=3)����ʾ��������ĵȼ�
					end

				end
			end

		else
			--�����������ѭ��������¼
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, iTaskId)

			--����ɾ�������Ѿ����ŵ�iDeliverTaskID����
			TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, iDeliverTaskID, false )
   		end
		--���������ɽ��
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, iDeliverTaskID)

   		return 0
   	end
}

TaskList[15201] = --���սڣ�����Ӣ��
{
	--�����Զ����
	TabItemID =
	{
			[1] = 43139, --���ս�_˿��_��ٺ�
			[2] = 43140, --���ս�_˿��_������
			[3] = 43141, --���ս�_˿��_������
			[4] = 43142, --���ս�_˿��_����
			[5] = 43143, --���ս�_˿��_������
			[6] = 43144, --���ս�_˿��_�ξ���
			[7] = 43145, --���ս�_˿��_�����
	},

	TabTaskID =
	{
			[1] = 15203,  --���ս�_˿��_��ٺ�
			[2] = 15204,  --���ս�_˿��_������
			[3] = 15205,  --���ս�_˿��_������
			[4] = 15206,  --���ս�_˿��_����
			[5] = 15207,  --���ս�_˿��_������
			[6] = 15208,  --���ս�_˿��_�ξ���
			[7] = 15209,  --���ս�_˿��_�����
	},

	TabComTaskID =
	{
			[1] = 15397,  --���ս�_˿��_��ٺ�
			[2] = 15398,  --���ս�_˿��_������
			[3] = 15399,  --���ս�_˿��_������
			[4] = 15400,  --���ս�_˿��_����
			[5] = 15401,  --���ս�_˿��_������
			[6] = 15402,  --���ս�_˿��_�ξ���
			[7] = 15403,  --���ս�_˿��_�����
	},

  	Property =
  	{
		bRecordFinish = false,
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,
		iMaxFinishCount = 1,--�����ɴ���Ϊ1
		iClearFinishCountType = TaskClearFinishCountType.Daily,--ÿ�����

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

			local AwardMulti = 200										--���齱��ϵ��
			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������
			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
		-- ��Ǯ
		BindMoney = function(TASKINTERFACE_POINTER)
			return 200000--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0

   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 15201

		--�޸ĵĲ��֣��̶����ÿ���浽�����ݣ�������ż��*��Ҵ�����ɫ��ʱ��mod2
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --ȡ����ҽ�ɫ����ʱ��

		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday
		local iRandomMethod =  ( timePackage.yday + RoleCreateTime )% 7 + 1 --��ҵ����浽����������(һ��7����Ʒ)

		--����������
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iRandomMethod = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

   		--�����߻���
		TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, TaskList[iTaskID].TabItemID[iRandomMethod], 1, true)     --�� ������Ʒ

		--�����������ж����������
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,TaskList[iTaskID].TabComTaskID[iRandomMethod])

		--���������

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, iRandomMethod)

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

		local iTaskId = 15201   --������id

		local key = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1)

   		local Method = {}

		Method.CompleteTask = {TaskID = TaskList[iTaskId].TabComTaskID[key], Num = 1}	--����ض�����1��

   		return Method

   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iTaskId = 15201   --������id
		local key = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1)

		if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[iTaskId].TabComTaskID[key]) == 1 then

			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		local AwardMulti = 200																		--��Ž�ɫ���齱��ϵ��
		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 											--��ҵȼ�����������
		local iBindMoneynum = 200000
		local iTitleID = 3128
		local iTaskId = 15201
		local iAwardTaskId = 15709																	--����������id

   		if bSuccess then

			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,iBindMoneynum)							--���Ű󶨻��
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,AwardMulti*AwardExpAdjust)				--���ž���

			if PlayerLevel >=65 then
				--0.5%���Ÿ��ƽ��� ����Զ��
				math.randomseed(os.time())
				AwardNum = math.random(1,1000)
				if AwardNum <= 5 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iAwardTaskId) --����������������Զ��
				end
			end

			local iTaskId2 = 15389	--��Ҫ���ŵı�־����

			if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskId2) < 6 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskId2)--������β��ǵ�7�Σ�����flag�����Լ���
			elseif TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,iTaskId2) == 6 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,iTaskId2)--��������ǵ�7�Σ�����flag�����Լ���
			end

			--���flag�������
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[iTaskId].TabComTaskID[ucRandomNum1])

		else
			--ʧ������������
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,TaskList[iTaskId].TabComTaskID[ucRandomNum1])

			--ʧ�ܻ��߷����Ļ���Ҫ����������ֹ����
			if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,TaskList[iTaskId].TabComTaskID[ucRandomNum1]) then
				TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, TaskList[iTaskId].TabComTaskID[ucRandomNum1], false)
			end

			--�������в���43212����
			local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,TaskList[iTaskId].TabItemID[ucRandomNum1], true)
			if num1 > 0 then
				TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,TaskList[iTaskId].TabItemID[ucRandomNum1], num1)
			end

   		end

   		return 0
   	end
}


TaskList[15294] = --���ս���ֲ�ջ�����
{

  	Property =
  	{
		bRecordFinish = false,
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = true,
  		bCanSeekOut = false,

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

  		bRecordFinishCount = true,
		iMaxFinishCount = 1,--�����ɴ���Ϊ7
		iClearFinishCountType = TaskClearFinishCountType.Daily,--ÿ�����

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ����
		Exp = function(TASKINTERFACE_POINTER)
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

			local AwardMulti = 200										--���齱��ϵ��
			local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 		--��ҵȼ�����������
			local AwardExp = AwardExpAdjust * AwardMulti

			return AwardExp--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
		-- ��Ǯ
		BindMoney = function(TASKINTERFACE_POINTER)
			return 100000--����0ʱΪ������������Ϊ��ʾ��ֵ

		end
		,
	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)

		if iPlayerLev < 20 then
	   	    return TASK_PREREQU_FAIL_LUA_TASK
	   	end

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

   		return 0

   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 15294
		local TabItemID ={43211, 43212,} --�����������Ʒ
		local tabFlagTaskID = { 15295, 15296,}

		--�޸ĵĲ��֣��̶����ÿ���浽�����ݣ�������ż��*��Ҵ�����ɫ��ʱ��mod2
		local RoleCreateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)  --ȡ����ҽ�ɫ����ʱ��

		--ȡ��������һ���ڵĵڼ��죬����dayInYear�У�1��1����1��12��31����365
		local timePackage = os.date("*t", os.time())
		local dayInYear = timePackage.yday
		local iRandomMethod =  ( timePackage.yday + RoleCreateTime )% 2 + 1 --��ҵ����浽����������

		--����������
		if TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true) > 0 then
			iRandomMethod = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER, 4493, true)
		end

   		--�����߻���
		TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER, TabItemID[iRandomMethod], 1, true)     --�� ������Ʒ

		--������ջ������������ɴ����󣬷��Ÿ�������15296
		if iRandomMethod == 2 then
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,tabFlagTaskID[iRandomMethod])
		end

		--���������

		TaskCApi.SetDataToActiveTaskList(TASKINTERFACE_POINTER, iTaskID, 1, iRandomMethod)

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local tabFlagTaskID = { 15295, 15296,}
		local iTaskId = 15294   --������id

		local key = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1)

   		local Method = {}

		Method.CompleteTask = {TaskID = tabFlagTaskID[key], Num = 1}	--����ض�����1��

   		return Method

   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_NO_FINISH

		local iTaskId = 15294   --������id
		local tabFlagTaskID = { 15295, 15296,}

		local key = TaskCApi.GetDataFromActiveTaskList(TASKINTERFACE_POINTER, iTaskId, 1)

		if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER, tabFlagTaskID[key]) > 0 then
			iRet = TASK_SUCC_FINISH
		end

   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)

   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1)
		local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)							--��ȡ��ҵȼ�

		local AwardMulti = 200																		--��Ž�ɫ���齱��ϵ��
		local AwardExpAdjust = TaskExpAdjust[PlayerLevel] 											--��ҵȼ�����������
		local iBindMoneynum = 100000

		local iTitleID1 = 3126		--��ֲ�ƺ�
		local iTitleID2 = 3127		--�ջ�ƺ�

		local iAwardItemID1 = 41463		--���վ�
		local iAwardItemID2 = 41464		--����

   		if bSuccess then
			TaskCApi.DeliverBindMoney(TASKINTERFACE_POINTER,iBindMoneynum)							--���Ű󶨻��
			TaskCApi.DeliverExperience(TASKINTERFACE_POINTER,AwardMulti*AwardExpAdjust)				--���ž���

			if PlayerLevel>= 65 then
				--0.5%���Ÿ��ƽ��� ����Զ��
				math.randomseed(os.time())
				AwardNum = math.random(1,100)
				if  AwardNum <= 1 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iAwardItemID1, 1,true)
				elseif AwardNum >= 98 then
					TaskCApi.DeliverCommonItem(TASKINTERFACE_POINTER,iAwardItemID2, 1,true)
				end
			end

			if ucRandomNum1 == 1 then
				if not TaskCApi.HasTitle(TASKINTERFACE_POINTER,iTitleID1) then
					TaskCApi.GiveOneTitle(TASKINTERFACE_POINTER, iTitleID1)
				end
				--��������15295����
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,15295)
			elseif ucRandomNum1 == 2 then
				--������������Ʒ43148
				local num = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,43148, true)
				if num > 0 then
					TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,43148, num)
				end
				if not TaskCApi.HasTitle(TASKINTERFACE_POINTER,iTitleID2) then
					TaskCApi.GiveOneTitle(TASKINTERFACE_POINTER, iTitleID2)
				end

				--��������15296����
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,15296)
			end

		else
			--�ջ���������������غۼ�
			if ucRandomNum1 == 1 then
				--������������43211����
				local num1 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,43211, true)
				if num1 > 0 then
					TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,43211, num1)
				end

				--ʧ�ܻ��߷����Ļ���Ҫ��������15295����
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,15295)

			elseif ucRandomNum1 == 2 then
				--ʧ�ܻ��߷����Ļ���Ҫ��������15296����
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,15296)
				--ʧ�ܻ��߷����Ļ���Ҫ����������ֹ����15296
				if TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,15296) then
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, 15296, false)
				end

				--�������в���43212����
				local num2 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,43212, true)
				if num2 > 0 then
					TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,43212, num2)
				end

				--�������й�ʵ43148����
				local num3 = TaskCApi.GetItemNumInPacket(TASKINTERFACE_POINTER,43148, true)
				if num3 > 0 then
					TaskCApi.TakeAwayCommonItem(TASKINTERFACE_POINTER,43148, num3)
				end

			end
   		end

   		return 0
   	end
}

TaskList[15295] = --���ս���ֲ:��������
{
	--�����Զ����
	TabImpValue =
	{
		--������Ϊ����ֲ�������򣬶�������Ϊ���ر�ţ�����Ϊ������id��������id��

		[1] = {
			--ů����ԭ ��ʿ��Ӫ��
				[1] = {161127, 621},
				[2] = {161128, 622},
				[3] = {161129, 623},
				[4] = {161130, 624},
				[5] = {161131, 625},
				[6] = {161132, 626},
				[7] = {161133, 627},
				[8] = {161134, 628},
			},

		[2] = {
			--�İ�ɭ�� ����ũ��
				[1] = {161135, 629},
				[2] = {161136, 630},
				[3] = {161137, 631},
				[4] = {161138, 632},
				[5] = {161139, 633},
				[6] = {161140, 634},
				[7] = {161141, 635},
				[8] = {161142, 636},

			},
		[3] = {
			--����ƽԭ ����ׯ԰
				[1] = {161143, 637},
				[2] = {161144, 638},
				[3] = {161145, 639},
				[4] = {161146, 640},
				[5] = {161147, 641},
				[6] = {161148, 642},
				[7] = {161149, 643},
				[8] = {161150, 644},
			},
	},

	TabLocation =
	{
		--������Ϊ����ֲ��������
		[1] = {
			--ů����ԭ ��ʿ��Ӫ��
				["mapid"] = 9    ,
				["min_x"] = -196 ,
				["min_y"] = 90   ,
				["min_z"] = 88   ,
				["max_x"] = -179 ,
				["max_y"] = 110  ,
				["max_z"] = 109  ,
			},

		[2] = {
			--�İ�ɭ�� ����ũ��
				["mapid"] = 2 ,
				["min_x"] = -282 ,
				["min_y"] = 270  ,
				["min_z"] = 607  ,
				["max_x"] = -267 ,
				["max_y"] = 295  ,
				["max_z"] = 617  ,
			},

		[3] = {
			--����ƽԭ ����ׯ԰
				["mapid"] = 26 ,
				["min_x"] = 126  ,
				["min_y"] = 225  ,
				["min_z"] = -145 ,
				["max_x"] = 155  ,
				["max_y"] = 245  ,
				["max_z"] = -92  ,
			},


	},

  	Property =
  	{
		bRecordFinish = false,
  		bCanRedo = true,				--�ɹ�����ظ����
  		bCanRedoAfterFailure = true,	--ʧ�ܺ���ظ����

  		bCanGiveUp = true,

  		bShowPrompt = false,		--����ʾ������ʾ
  		bCanSeekOut = false,		--���ɲ���
		bHiddenTask = true, 		--��������

		bClearAsGiveup = false, 		--��������ʧ�ܽ���

		bFinishWhenDelvier = true,--���ܼ����

  		bRecordFinishCount = true,
		iMaxFinishCount = 1,--�����ɴ���Ϊ1

		iSuitableLevel = 200,

  		iType  = TaskType.HuoDong,
  		iTopic = TaskTopic.YiBan,
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
		local iMainTaskID = 15294	--��ֲ�ջ�������
		local iTaskID = 15295		--������id

		if not TaskCApi.HasTaskInActiveTaskList(TASKINTERFACE_POINTER,iMainTaskID) then --��������15294��ֲ�ջ���Ҫ����
   			return TASK_PREREQU_FAIL_RELATION_TASK
   		end

		local iMapId, x, y, z = TaskCApi.GetPlayerCurSite(TASKINTERFACE_POINTER) --ȡ�������
		local index

		for i = 1 , #TaskList[iTaskID].TabLocation do
			--�ж�����Ƿ�������귶Χ
			if	iMapId == TaskList[iTaskID].TabLocation[i].mapid then
				if x >= TaskList[iTaskID].TabLocation[i].min_x and x <= TaskList[iTaskID].TabLocation[i].max_x then
					if y >= TaskList[iTaskID].TabLocation[i].min_y and y <= TaskList[iTaskID].TabLocation[i].max_y then
						if z >= TaskList[iTaskID].TabLocation[i].min_z and z <= TaskList[iTaskID].TabLocation[i].max_z then
						index = i 	--�洢�������
						break		--�����������������ж�ѭ��
						end
					end
				end
			end

			--���ѭ����⵽���һ�������ڵ�ͼ����Ȼ��������������Χ�����޷���������
			if i == #TaskList[iTaskID].TabLocation then
				return TASK_PREREQU_FAIL_LUA_TASK
			end
		end

		--������������Ҫ�󣬼�⵱ǰ�����Ƿ��пյ�
		for i = 1, #TaskList[iTaskID].TabImpValue[index] do
			if TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,TaskList[iTaskID].TabImpValue[index][i][1]) == 0 then
				break
			end

			--���ѭ����⵽���һ�������ڵ�ͼ�޿յ�
			if i == #TaskList[iTaskID].TabImpValue[index] then
				return TASK_PREREQU_FAIL_NO_MONEY
			end

		end

   		return 0

   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		local iTaskID = 15295
		local index

		local iMapId, x, y, z = TaskCApi.GetPlayerCurSite(TASKINTERFACE_POINTER) --ȡ�������

		for i = 1 , #TaskList[iTaskID].TabLocation do
			if	iMapId == TaskList[iTaskID].TabLocation[i].mapid then
				index = i
				break	--ȡ��indexֵ������ѭ��
			end
		end

		--�ӵ�ǰ���صĿյ���ѡ��һ��
		for i = 1, #TaskList[iTaskID].TabImpValue[index] do
			if TaskCApi.GetGlobalDataEx(TASKINTERFACE_POINTER ,TaskList[iTaskID].TabImpValue[index][i][1]) == 0 then
				TaskCApi.ModifyGlobalDataEx(TASKINTERFACE_POINTER ,TaskList[iTaskID].TabImpValue[index][i][1],1)--�޸�ȫ�ֱ���
				TaskCApi. MonsterCtrl (TASKINTERFACE_POINTER ,TaskList[iTaskID].TabImpValue[index][i][2], true)--����������
				break
			end

		end

		return 0
	end
	,

   	--������ɱ�֡�ȡ����Ʒ�������µ��ã��ͻ������������ʾʱ����
   	OnMethod = function(TASKINTERFACE_POINTER)

   		local Method = {}

		Method.iWaitTime = 0

   		return Method

   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
   	OnCheckFinish = function(TASKINTERFACE_POINTER)
   		local iRet = TASK_SUCC_FINISH
   		return iRet
   	end
   	,

   	OnCheckAward = function(TASKINTERFACE_POINTER, bSuccess)
   		return 0
   	end
   	,

   	--��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
   		return 0
   	end
}


TaskList[15963] = --���ͽ������ȡ��¼�������������
{
  	Property =
  	{
  		bCanRedo = true,		--�ɹ����ظ����
  		bCanRedoAfterFailure = true,--ʧ�ܿ��ظ����
  		bCanGiveUp = true,		--�ɷ���

  		bShowPrompt = false,	--����ʾϵͳ��ʾ

  		bFinishWhenDelvier = true,--���ܼ����

		bHiddenTask = true, 		--��������
  		iType  = TaskType.SheJiaoJia,--�������ͣ��罻��

  		iTopic = TaskTopic.YiBan,--һ����������
  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{

	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)

		--[[
		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end
		]]--

   		return 0
   	end
   	,

   	--��ҽ��ո�����ʱ����
   	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,

   	--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

   	--��ɸ�����ʱ����������

   	OnAward = function(TASKINTERFACE_POINTER, bSuccess)
   		if bSuccess then

			local TabTaskID = {
							[1] = 11142,
							[2] = 11143,
							[3] = 11144,
							[4] = 11145,
							[5] = 11146,
							[6] = 11147,
							[7] = 11148,
							[8] = 11149,
							[9] = 11150,
							[10] = 11151,
							[11] = 11152,
							[12] = 11153,
							[13] = 11154,
							[14] = 11155,
							[15] = 11156,
							[16] = 11157,
							[17] = 11158,
							[18] = 11159,
							[19] = 11160,
							[20] = 11161,
							[21] = 11162,
							[22] = 11163,
							[23] = 11164,
							[24] = 11165,
							[25] = 14109,
							[26] = 14110,
							[27] = 14111,
							[28] = 14112,
							[29] = 14113,
							[30] = 14114,
							[31] = 14115,
							[32] = 14116,
							} 			--��������б�

			for i, v in pairs(TabTaskID) do
				TaskCApi.ClearFinishRecordsOnly(TASKINTERFACE_POINTER, v)--���������
			end

   		end

   		return 0
   	end
}

TaskList[16353] = --���Ṧѫ�齱��yl
{
  	Property =
  	{
  		bCanRedo = true, --�Ƿ�ɹ�����ظ����
  		bCanRedoAfterFailure = true, --�Ƿ�ʧ�ܺ���ظ����
  		bShowPrompt = false,	--����ʾϵͳ��ʾ
  		bCanGiveUp = true, --�Ƿ��ܷ���
  		bFinishWhenDelvier = true,--���ܼ����
  		bShowPrompt = true, --�Ƿ���ʾʧ����ʾ
		bHiddenTask = true, 		--��������
        bRecordFinishCount = true,				--�Ƿ��¼��ɴ���
        iMaxFinishCount = 3,					--�����ɴ���
        iClearFinishCountType = TaskClearFinishCountType.Daily,  --ÿ�����
		bUIButtonTask = true

  	}
   	,

	-- �ɹ�ʱ��Ч
	AwardPreview =
	{
		-- ��Ʒ
		Items = function(TASKINTERFACE_POINTER)
			local items = {}

			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������

			local ItemId1 = 46576	--1��59���������id
			local ItemId2 = 46617 --60��74�������id
			local ItemId3 = 46618 --75�����Ͻ������ id

			if PlayerLevel < 60 then
				items =
				{
					Item1 = {ID = ItemId1, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
				}
			elseif PlayerLevel >= 60 and PlayerLevel < 75 then
				items = {
							Item1 = {ID = ItemId2, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
			      }
			else
				items = {
							Item1 = {ID = ItemId3, NUM = 1},--0ʱΪ��������������ʾ��Ʒ������
						}
			end
			return items
		end
		,
	}
	,

   	--���񷢷ż�飬�ͻ�����NPC��ʾ�����ȷ�Ͻ���ʱ���ã�����������Ӧ����ʱ����
   	OnCheckDeliver = function(TASKINTERFACE_POINTER)
	  local IsCrossServer = TaskCApi.IsCrossServer (TASKINTERFACE_POINTER)
	    if IsCrossServer == true or nil then
		    return 131
		end

   	  local iGuildlevel = TaskCApi.GetFactionLev(TASKINTERFACE_POINTER)   ---�������ڹ��ᣬ���ع���ȼ������򷵻�-1
	    if iGuildlevel < 3 then
		    return 11
        end

	  local iPlayerGong = TaskCApi.GetFactionContribution(TASKINTERFACE_POINTER)         ----- ȡ��ҹ��ṱ�׶�
   	    if iPlayerGong < 100 then
		    return 34
		end

	  local iPlayerGX = TaskCApi.GetFactionCredit(TASKINTERFACE_POINTER)  --ȡ��ҹ�ѫֵ
	    if iPlayerGX < 15 then
	        return 119
        end

		if TaskCApi.GetCommonPacketEmptySolts(TASKINTERFACE_POINTER)  < 1 then --��ͨ��������Ҫ1��
   			return TASK_PREREQU_FAIL_GIVEN_ITEM
   		end

      local iPlayerHYD = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,13122) --��ȡ��Ծ��������ɴ���
	    if TaskCApi.HasBuff(TASKINTERFACE_POINTER,2164) or iPlayerHYD >= 80 then --�����vip(bufid 2164)���߻�Ծ�ȴ��ڵ���80
			return 0
	    else
			return 130
	    end

	  return 0
   	end
   	,

	OnDeliver = function(TASKINTERFACE_POINTER)
		return 0
	end
	,

   	OnMethod = function(TASKINTERFACE_POINTER)
   		local Method = {}
   		    Method.iWaitTime = 0 --�ȴ�0s�Զ����
   		return Method
   	end
   	,


--����������,��ɱ�֡�ʰȡ��Ʒ��ÿ��һ��ʱ�䡢����ǰ����
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

 --��ɸ�����ʱ����������
   	OnAward = function(TASKINTERFACE_POINTER, bSuccess,iParam,bRetrieve,ucRandomNum1,ucRandomNum2)
		if bSuccess then
			local PlayerLevel = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER) 			--ȡ����ҵȼ�����������
			local iPlayerGX = TaskCApi.GetFactionCredit(TASKINTERFACE_POINTER)      --ȡ��ҹ�ѫֵ

			if PlayerLevel < 60 then
				TaskCApi.DeliverRandomGift(TASKINTERFACE_POINTER,46576)    ----��������
				TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, -15)
			elseif PlayerLevel >= 60 and PlayerLevel < 75 then
				TaskCApi.DeliverRandomGift(TASKINTERFACE_POINTER,46617)
				TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, -15)
			else
				TaskCApi.DeliverRandomGift(TASKINTERFACE_POINTER,46618)
				TaskCApi.DeliverFactionCredit(TASKINTERFACE_POINTER, -15)
			end
		end
	end
}
