

CommonTaskCount =
{

	--程序使用：每周第一次登陆时调用这个函数
	OnNewWeek = function(TASKINTERFACE_POINTER)
		----------------------------------------------------------------------------------------------------------------------------
		-- 获得时间流
		local timePackage = os.date("*t", os.time())
		local year = timePackage.year
		local month = timePackage.month
		local day = timePackage.day
		-----------------------------------------------------------------------------------------------------------------------------
		-- 取得国别码
		local RegionMask = TaskCApi.GetRegionMask(TASKINTERFACE_POINTER)
		-----------------------------------------------------------------------------------------------------------------------------
		-- 获得上周竞技场的参与次数
		local ArenaCount = TaskCApi.GetLastWeekPVP(TASKINTERFACE_POINTER)
		-----------------------------------------------------------------------------------------------------------------------------
		-- 定义取得每周进行调整的通用活动计数列表
		local TaskCount =
		{
			Myst_Beast_Task		=	{idx = 7, val = 0, limit = 7,   keyTask = 13615,},	--神兽令，上限7
		}
		-----------------------------------------------------------------------------------------------------------------------------
		-- 获得需要调整的通用活动计数的值
		for k,v in pairs(TaskCount) do
			v.val = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,v.idx)
		end
		------------------------------------------------------------------------------------------------------------------------------
		-- 定义活跃度相关奖励任务的id
		local ActivityAwardTasks =
		{
			13738,13739,13740,13741,13742,13743,13744,13745,13746,15388,						--活跃度向导任务
			13237,13238,13239,13240,13241,13242,13243,13244,13245,15385,16330,16331,			--活跃度物品奖励任务
		}
		local ActivityCountTaskID = 13122											--领奖任务\周活跃度\周活跃度计次


		------------------------------------------------------------------------------------------------------------------------------
		------*****************************        以下是各个具体操作，每个操作都有编号        **************************     --------
		------------------------------------------------------------------------------------------------------------------------------
		-- 01 竞技场代币：竞技点发放
		if ArenaCount >= 10 then
			local ArenaPoint = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,5)	--获得竞技场代币
			local ArenaActivity = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,6)	--获得竞技场活跃值
			local Arena_3v3 = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,7)	--获得竞技场3v3积分
			local Arena_6v6 = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,8)	--获得竞技场6v6积分
			local ArenaRepu = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,9)	--获得竞技场声望
			local ArenaVIP = 2307
			---------------------------------------------------------------------------------------------------------------------------
			--[[竞技场代币奖励规则：
			上一周参与10次以上竞技场，本周才能得到代币奖励

			每周结算时，个人最高积分（3v3和6v6中数值高的那个竞技场积分）和能获得的代币数之间的具体关系如下：
			代币数= 790.53256/(1+1123.9778×e^(-0.0035×个人竞技场积分) )×ε x u           (个人最高积分≥1687时)
			代币数=(0.02×个人竞技场积分+161 )×ε x u                 (个人最高积分<1687时)

			其中ε为一个与玩家等级段相关的参数：
			玩家等级段	45~59	60~69	70~74	75~80
			参数ε	0.75	1.5	3	15

			其中u为一个和竞技场活跃值有关的参数： u = 6号声望 / 100

			另外，每个等级段都有一个代币上限，结算时如果玩家身上的代币加上本周应获得代币大于这个值时，则置玩家身上的代币数为此值即可。
			玩家等级段	45~60	61~70	71~74	75~80
			代币上限	3000	4000	9000	20000

			--]]
			---------------------------------------------------------------------------------------------------------------------------
			local Highest = math.max(Arena_3v3,Arena_6v6)	--个人最高积分（3v3和6v6中数值高的那个竞技场积分）
			local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)		--角色等级
			local iParam = 0	--参数ε
			local iPointCeiling	 = 0	--代币上限
			local PointAward = 0	--应奖励的竞技场代币
			--根据级别设置参数和代币上限
			if iPlayerLev >= 45 and iPlayerLev < 60 then
				iParam = 0.75
				iPointCeiling = 3000
			elseif iPlayerLev >= 60 and iPlayerLev < 70 then
				iParam = 1.5
				iPointCeiling = 4000
			elseif iPlayerLev >= 70 and iPlayerLev <= 74 then
				iParam = 3
				iPointCeiling = 9000
			elseif iPlayerLev >= 75 then
				iParam = 15
				iPointCeiling = 20000
			end
			--计算应奖励的代币数量
			if Highest >= 1687 then
				PointAward = math.floor( 790.53256 / ( 1 + 1123.9778 * math.exp(-0.0035 * Highest)) * iParam * ArenaActivity / 100)
			else
				PointAward = math.floor(( 0.02 * Highest +161 ) * iParam * ArenaActivity / 100)
			end
			--拥有竞技场VIP时增加5%代币
			if TaskCApi.HasBuff(TASKINTERFACE_POINTER,ArenaVIP) then
				PointAward = math.floor ( PointAward * 1.05 )
			end
			--判断上限，然后发出代币奖励
			if PointAward <= iPointCeiling - ArenaPoint then
				TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,5, PointAward)
			else
				TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,5, iPointCeiling - ArenaPoint)
			end
			--结算完毕后把竞技场活跃值清空
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,6, -9999)
		else
			--上周不够10场，仅把竞技场活跃值清空
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,6, -9999)
		end
		------------------------------------------------------------------------------------------------------------------------------
		-- 02 成就：斗魂之周	某一周参加50次竞技场（11525任务）
		if ArenaCount >= 50 then
			local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11525)	--取得一周参与50次竞技场成就是否达成
			if iCount < 1 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,11525)
			end
		end
		------------------------------------------------------------------------------------------------------------------------------
		-- 03 成就：数字游戏	一周参与的竞技场次数等于 结算日的月份数 乘以 日期数的个位数（12816任务）
		if ArenaCount == month * (day % 10) and  ArenaCount > 0 then
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12816)
		end

		------------------------------------------------------------------------------------------------------------------------------
		-- 04 重置神兽令次数
		--每周第一次上线，+7，加完后的结果不能超过7
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.Myst_Beast_Task.keyTask,true) then
			local MAX = TaskCount.Myst_Beast_Task.limit				--7
			local curVal = TaskCount.Myst_Beast_Task.val			--当前值
			local addedForMB = 7									--每周+7
			if addedForMB + curVal > MAX then
				addedForMB = math.max(MAX - curVal,0)
			end
			if addedForMB and addedForMB ~= 0 then
				TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Myst_Beast_Task.idx, addedForMB)
			end
		end
		-----------------------------------------------------------------------------------------------------------------------------
		-- 05 累计登陆180天后的奖励任务：每周清除记录结果
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 13214)	--经验嘉奖

		-----------------------------------------------------------------------------------------------------------------------------
		-- 06 悬赏信荣耀值每周清零，可抽取次数清零
		TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,14, -999999)
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,14723)

		-----------------------------------------------------------------------------------------------------------------------------
		-- 07 发任务用于拍卖行帮助
		TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,15299)

		-----------------------------------------------------------------------------------------------------------------------------
		-- 08 清空周活跃度计次
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, ActivityCountTaskID)

		-----------------------------------------------------------------------------------------------------------------------------
		-- 09 处理每周活跃度奖励任务的清零
		for k,v in ipairs(ActivityAwardTasks) do
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
			TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
		end
		-----------------------------------------------------------------------------------------------------------------------------
		-- 10 每周把信仰突破（八）悬赏信荣耀值领取苦修者之泪的任务清零
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15759)

		-- 11 每周把老玩家回归礼盒初始化
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15763)

		-- 12 每周把战神点数相关任务初始化
		TaskCApi.ClearFinishRecordsOnly(TASKINTERFACE_POINTER, 15770)
		TaskCApi.ClearFinishRecordsOnly(TASKINTERFACE_POINTER, 15771)

		-- 13 每周把魔石配方牌子相关任务初始化
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15785)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15787)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15788)
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,15786)	--降低活跃度门槛的任务

		-- 14 每周把地狱之路排行榜发奖任务初始化 & 地狱之路通关数初始化
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15847)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15848)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15849)
		-- i.	14904：记录玩家攻关进度(计次)
		-- ii.	15008：标记当前关卡是否完成
		-- iii.	15882：标记当前关卡是否需要重置
		-- iv.  15883：周四清除上2个任务结果的任务
		-- v.	14922：记录关卡可重置次数（计次）
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 14904)
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 14922)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15008)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15882)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15883)
		-- vi.	16054：脚本发出的任务，确认本周期内50关通关
		-- vi.	16053: 50关通关奖励
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 16054)
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER, 16053)

		-- 15 公会屠龙的周常任务清空,16717,16718,16719
		TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, 16717, false)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 16717)

		TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, 16718, false)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 16718)

		TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, 16719, false)
		TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 16719)

		-- 16 lujinghua需求的公会基地相关一些任务的周清空,18个
		local Faction_Base_Task_Weekly = {
				10463,10467,12093,16677,16678,16679,
				16680,16681,16682,16683,16684,16685,
				16686,16687,16688,16689,16690,16691,
				}
		for k,v in ipairs(Faction_Base_Task_Weekly) do
			TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
		end

		-- 17 lujinghua公会基地符文抽奖任务，每周清空,16868-16872
		local Faction_Base_Rune = {16868,16869,16870,16871,16872,}
		for k,v in ipairs(Faction_Base_Rune) do
			TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
		end

		-- 18 每周清空vip购买5级宝石合成符任务结果
		for k,v in ipairs({17044,17045}) do
			TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
		end

		-- 19 每周清除法师塔周常的记录结果
		for k,v in ipairs({17201,17202}) do
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
		end
		-----------------------------------------------------------------------------------------------------------------------------
		-- end:函数返回
		return 0
	end
	,

	--程序使用：角色每天第一次上线 和 每天过24：00时候调用这个函数
	OnNewDay = function(TASKINTERFACE_POINTER,iRoleAbsence, IsNewWeek, IsNewMonth)

		---------------------------------------------------------------------------------------------------------------------------
		-- 定义取得每天进行调整的通用活动计数列表
		local TaskCount =
		{
			Gods_Trial			=	{idx = 0, val = 0, limit = 3,   keyTask = 0,},	    --神之试炼：索引，值，上限，初始化任务id
			Life				=	{idx = 1, val = 0, limit = 30,  keyTask = 13172,},	--生活，此脚本可以获得的上限是30
			Luck				=	{idx = 2, val = 0, limit = 96,  keyTask = 13173,},	--幸运计次，上限96
			Login_Total			=	{idx = 3, val = 0, limit = 190, keyTask = 13174,},	--累计登陆，上限190
			Login_Consecutive	=	{idx = 4, val = 0, limit = 3,   keyTask = 13175,},	--连续登陆，上限3
			Flight				=	{idx = 6, val = 0, limit = 7,   keyTask = 13615,},	--飞行活动，上限7
			MainCity			=	{idx = 8, val = 0, limit = 7,   keyTask = 13665,},	--雷辛格日常活动，上限7
			MuGuang				=	{idx = 9, val = 0, limit = 1,   keyTask = 13799,},	--暮光之种卷轴的计次，上限1
			SalesPromotion		=	{idx = 11,val = 0, limit = 12,  keyTask = 0,},		--月度消费促限月，上限12
			Belief_Trial		=	{idx = 12,val = 0, limit = 3,   keyTask = 15957,},	--神之试炼2章：索引，值，上限，初始化任务id
			HunQi_Feed			=	{idx = 28,val = 0, limit = 250,  keyTask = 15392,},		--魂器每日喂食总次数，上限250
			HunQi_A				=	{idx = 29,val = 0, limit = 100,  keyTask = 15392,},		--攻击魂器每日重铸次数，上限100
			HunQi_D				=	{idx = 30,val = 0, limit = 100,  keyTask = 15392,},		--防御魂器每日重铸次数，上限100
			Yunying_BFG			=	{idx = 13,val = 0, limit = 1,    keyTask = 0,},			--运营活动冰风谷，上限1

		}
		--------------------------------------------------------------------------------------------------------------------------
		-- 取得需要调整的通用活动计数的当前值
		for k,v in pairs(TaskCount) do
			v.val = TaskCApi.GetCommonTaskCount(TASKINTERFACE_POINTER,v.idx)
		end
		--------------------------------------------------------------------------------------------------------------------------
		-- 获得时间流
		local timePackage = os.date("*t", os.time())
		local year = timePackage.year
		local yday = timePackage.yday
		local day  = timePackage.day
		local hour = timePackage.hour
		local month = timePackage.month

		--------------------------------------------------------------------------------------------------------------------------
		-- 取得角色等级
	    local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		-- 取得国别码
		local RegionMask = TaskCApi.GetRegionMask( TASKINTERFACE_POINTER)
		-------------------------------------------------------------------------------------------------------------------------


		--------------------------------------------------------------------------------------------------------------------------
		------*************************        以下是各个具体操作，每个操作都有编号        **************************     --------
		--------------------------------------------------------------------------------------------------------------------------
		-- 1 神之试炼次数的补偿：缺1天补1次，最多补到3次
		-- 新号第一次登陆
		if iRoleAbsence == 0 then
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Gods_Trial.idx, 1)	--把神之试炼次数增加1
		-- 除新号以外的角色每天第一次上线
		else
			--20级及以上的角色
			if iPlayerLev >= 20 then
				if iRoleAbsence == 1 then	--上次登陆时间和当前时间的前一天
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Gods_Trial.idx, 1)	--把神之试炼次数增加1
				elseif iRoleAbsence == 2 then	--上次登陆时间和当前时间相隔1天
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Gods_Trial.idx, 2)	--把神之试炼次数增加2
				elseif iRoleAbsence >= 3 then	--上次登陆时间和当前时间相隔2天以上
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Gods_Trial.idx, 3)	--把神之试炼次数增加3
				end
			--1-19级的角色
			else
				if TaskCount.Gods_Trial.val == 0 then	--试炼次数是0
					TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Gods_Trial.idx, 1)	--把次数增加1
				end
			end
		end
		-----------------------------------------------------------------
		-- 处理2012年5月24日版本的老玩家回归逻辑
		-----------------------------------------------------------------
		--former:2011年11月30日到2011年12月31日07：59做老玩家回归（第2次）
		--former:先遣服会率先开放女神节，从2011年11月17日开始
		--former:11月17日是2011年的第321天，11月30日是2011年的第334天，12月30日是2011年的第364天

		--【2012年5月25日-6月24日23：59女神节老玩家回归（第3次）】
		-- 5月25日是2012年的第 146 天，6月24日是2012年的第 176 天

		--如果是正常的大陆服
		if RegionMask == 1 or RegionMask == 17 or RegionMask == 18 or RegionMask == 19 or RegionMask == 24 then
			local keyTask = 14813					--标记任务：是否重置了上一次女神节任务（每次开女神节，需要创建一个新的id的任务）
			local allRecordTask = { 12435,12436,12431,12438,12439,12453 }		--需要清掉记录完成结果的所有任务
			local specialTask = 12430											--需要清空完成次数的任务，站着送经验
    		if (year == 2012 and yday >= 146 and yday <= 176) then

        		--如果标记任务没有完成过，那么重置女神节，并发放标记任务
				if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,keyTask,true) then
					for k,v in ipairs(allRecordTask) do
						TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER,v)
					end
					TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,specialTask)
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,keyTask)

					--自5月25日算，流失30-60天的50-80角色，测试用发生器36014
					if iRoleAbsence >= 30 + (yday-146) and iRoleAbsence <= 60 + (yday-146) then
						if iPlayerLev >= 50 and iPlayerLev <= 80 then
							TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12438)
						end
					--自5月25日算，流失天的61-280天的50-80角色，测试用发生器36015
					elseif iRoleAbsence >= 61 + (yday-146) and iRoleAbsence <= 360 + (yday-146) then
						if iPlayerLev >= 50 and iPlayerLev <= 80 then
							TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12439)
						end
					end
				end
    		end
		end
		-----------------------------------------------------------------
		-- 2 神之嘉宾buff：30-69级限制点金前必须在线1小时，海外版不做限制。1大陆17体验服18大陆新服19程序开发服24跨服服务器25先遣服
		if RegionMask == 1 or RegionMask == 17 or RegionMask == 18 or RegionMask == 19 or RegionMask == 24 or RegionMask == 25 then
			if iPlayerLev >= 30 and iPlayerLev <= 69 then
				TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,12637)
			end
		end

		-----------------------------------------------------------------
		-- 3 处理70级栖溪谷幸运计次任务的问题（12337）
		if TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,12337) >= 1 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,12337)
		end

		-----------------------------------------------------------------
		-- 4 生活
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.Life.keyTask,true) then
			local addedForLife
			if iRoleAbsence == 1 then
				addedForLife = math.min(TaskCount.Life.limit - TaskCount.Life.val, 10) --把生活计数增加10
			elseif iRoleAbsence == 2 then
				addedForLife = math.min(TaskCount.Life.limit - TaskCount.Life.val, 20) --把生活计数增加20
			elseif iRoleAbsence >= 3 then
				addedForLife = math.min(TaskCount.Life.limit - TaskCount.Life.val, 30) --把生活计数增加30
			end
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Life.idx, addedForLife )
		end

		-----------------------------------------------------------------
		-- 5 幸运
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.Luck.keyTask,true) then
			local addedForLuck
			local x = math.floor(TaskCount.Luck.val/10)
			local y
			if iRoleAbsence == 1 then
				y = math.min(7,x+1)				--把个人幸运次数增加1
				x = math.max(3,math.min(9,x+3)) --把幸运次数的积累增加3
			elseif iRoleAbsence == 2 then
				y = math.min(7,x+4)				--把个人幸运次数增加4
				x = math.max(3,math.min(9,x+6)) --把幸运次数的积累增加6
			elseif iRoleAbsence >= 3 then
				y = math.min(7,x+7)				--把个人幸运次数增加7
				x = math.max(3,math.min(9,x+9)) --把幸运次数的积累增加9
			end
			addedForLuck = 10 * x + y - TaskCount.Luck.val --修改幸运计次：百位及十位：幸运次数的积累；个位：待补偿次数
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Luck.idx, addedForLuck )
		end

		-----------------------------------------------------------------
		-- 6 累计登陆
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.Login_Total.keyTask,true) then
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Login_Total.idx, 1 )
		end

		-----------------------------------------------------------------
		-- 7 连续登陆
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.Login_Consecutive.keyTask,true) then
			local taskIDs = {13215,13216,13217,13306}				--连续登录的任务id,13306是用来开界面的
			local addedForLogin
			if iRoleAbsence == 1 then						--如果是连续登录，则+1，否则置为1
				addedForLogin = 1
			else
				addedForLogin = 1-TaskCount.Login_Consecutive.val
			end
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Login_Consecutive.idx, addedForLogin )
			for k,v in ipairs(taskIDs) do					--清除连续登录任务的完成结果
				TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
			end
		end

		-----------------------------------------------------------------
		-- 8 飞行活动
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.Flight.keyTask,true) then
			--上次登陆日期和今天相差几天就加几，最多+7，同时结果不能超过7
			local MAX = TaskCount.Flight.limit			--7
			local addedForFlight
			for i=1,MAX do
				if iRoleAbsence == i then
					addedForFlight = i
					break
				end
			end
			if iRoleAbsence > MAX then
				addedForFlight = MAX
			end
			--加完后的结果也不能超过7
			local curVal = TaskCount.Flight.val			--当前值
			if addedForFlight + curVal > MAX then
				addedForFlight = math.max(MAX - curVal,0)
			end
			if addedForFlight and addedForFlight ~= 0 then
				TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Flight.idx, addedForFlight)
			end
		end

		-----------------------------------------------------------------
		-- 9 雷辛格活动计次
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.MainCity.keyTask,true) then
		--上次登陆日期和今天相差几天就加几，但不超过上限
			local MAX = TaskCount.MainCity.limit			--1
			local addedForMainCity
			for i=1,MAX do
				if iRoleAbsence == i then
					addedForMainCity = i
					break
				end
			end
			if iRoleAbsence > MAX then
				addedForMainCity = MAX
			end
			--加完后的结果也不能超过上限
			local curVal = TaskCount.MainCity.val			--当前值
			if addedForMainCity + curVal > MAX then
				addedForMainCity = math.max(MAX - curVal,0)
			end
			if addedForMainCity and addedForMainCity ~= 0 then
				TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.MainCity.idx, addedForMainCity)
			end
		end

		-----------------------------------------------------------------
		-- 10 暮光之种的计次
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.MuGuang.keyTask,true) then
			--每天加1
			local addedForMuGuang = 1
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.MuGuang.idx, addedForMuGuang)
		end

		-----------------------------------------------------------------
		-- 11 2012欧洲杯竞猜每天清除任务的完成结果
		--2012-6-7：第159天，2012-6-30：第182天
		if (year == 2012 and yday >= 159 and yday <= 182) then
			local euroCupTasks = { 14868,14869,14870,14871,14872,14873,14874,14875,14876,}
			for k,v in ipairs(euroCupTasks) do
				if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v,true) then
					TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
				end
			end
		end

		------------------------------------------------------------------------------------------
--[[		--	12 月度消费促奖励任务	--	设定当月领当月奖励，且，当消费积分为0时清空本月领奖任务记录
		-- 单月，把TaskCount.SalesPromotion.val 的值设成：1
		if month == 8 or month == 10 or month == 12 or month == 2 or month == 4 or month == 6 then
			local val = TaskCount.SalesPromotion.val
			local change = 1 - val
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.SalesPromotion.idx, change)
			if	TaskCApi.GetConsumeScore(TASKINTERFACE_POINTER) == 0 then
				local tasks = { 15094,15095,15096,15097,15098,15099,15100,15101}
				for k,v in ipairs(tasks) do
					if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v,true) then
						TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
					end
				end
			end
		-- 双月，把TaskCount.SalesPromotion.val 的值设成：7
		elseif month == 9 or month == 11 or month == 1 or month == 3 or month == 5 or month == 7 then
			local val = TaskCount.SalesPromotion.val
			local change = 7 - val
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.SalesPromotion.idx, change)
			if	TaskCApi.GetConsumeScore(TASKINTERFACE_POINTER) == 0 then
				local tasks = { 15094,15095,15096,15097,15102,15103,15104,15105}
				for k,v in ipairs(tasks) do
					if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v,true) then
						TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
					end
				end
			end
		end
--]]
		------------------------------------------------------------------------------------------
		-- 13 攻击和防御魂器的重铸次数+100	&&	魂器喂食次数+300
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.HunQi_A.keyTask,true) then
			local FeedTimesForHunQi = 250
			local addedForHunQi = 100
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.HunQi_Feed.idx, FeedTimesForHunQi)
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.HunQi_A.idx, addedForHunQi)
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.HunQi_D.idx, addedForHunQi)
		end
		------------------------------------------------------------------------------------------
		-- 14 神魔记忆魂叶礼盒任务-重置
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15520)

		------------------------------------------------------------------------------------------
		-- 15 北美签到任务次数重置
		if iRoleAbsence > 1 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,15706)
		elseif iRoleAbsence == 1 then
			local selfCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,15706)		-- 本任务次数
			if selfCount >= 20 then
				TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,15706)
			end
		end

		------------------------------------------------------------------------------------------
		-- 16 神魔二周年老玩家回归逻辑【修改区域码和三（3）个时间段后可以重复利用】

		--[[	回归玩家的处理
			● <正式服和体验服>回归玩家在【2012年10月18日-10月31日】期间登入游戏后，
			将发放一个记录结果的隐藏任务【id：15761】。
			任务获得称号：【称号名称：勇者归来】

			拥有该称号时会自动接到另一个记录结果的指引任务【id：15762】【对回归勇者的见面礼】，
			引导玩家前往雷辛格皇宫找到npc【id：44127】【弗莱•故乡之云】【坐标】
			领取8个回归礼盒【勇者回归礼盒】【id：44130】，礼盒有效期为60天。
			并领取1个【来自战友的纪念品】【id：44351】，有效期为15天

			在上述时间以外的时间登录，将自动清除掉上述2个任务的结果，使得下一次做老玩家回归时可以重复开放。

		--]]
		--[[ 	固有玩家的处理
			等级50级以上，在【2012年10月18日-10月25日】期间登录游戏，不满足回归玩家的缺席天数条件，且，没完成过回归玩家的标记任务。
			● 固有玩家的任务
			上线得到一个记录结果的隐藏任务【id：15807】，用于标记固有玩家
			任务获得新称号【称号名称：笑看风生水起】

			完成上述任务后会自动接到另一个记录结果的指引任务【id：15808】【维多利亚的时光见证】，
			引导玩家前往自由港广场找到npc【维多利亚•树】，
			任务奖励6个绑定的魔盒【id：40732】，经验系数480无上限。

			在【2012年10月18日-11月17日】以外的时间登录，将自动清除上述2个任务的结果，使得下一次老玩家回归活动可再次开放。
		--]]

		--[[	【new】	2013年11月资料片老玩家回归所做的修改：
				回归玩家和活跃玩家的登录和领奖时间修改为【2013年10月30日0：00至11月31日23：59】
				重置任务的时间段修改为【2013年10月、11月】以外的时间
				回归称号修改为：【冰火王座·勇者归来】，活跃称号修改为：【冰火王座·岁月无痕人有情】
				回归礼盒修改为【聚宝盆】，活跃礼盒修改为【活跃礼包】。
				玩家需求等级修改为【60级】。
		--]]
		-- 如果是正常的大陆服
		if RegionMask == 1 or RegionMask == 17 or RegionMask == 18 or RegionMask == 19 or RegionMask == 24 then
			local titleTask = 15761
			local neviTask = 15762
			if iRoleAbsence > 30 and iPlayerLev >= 60 then
				if (year == 2013 and month == 10 and day >= 30) or (year == 2013 and month == 11 and day <= 31) then
					if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,titleTask,true) then
						TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,titleTask)
					end
				else
					TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, titleTask)
					TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, neviTask)
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, titleTask, false)
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, neviTask, false)
				end
			elseif iPlayerLev >= 60 then
				local titleTask_ActivePlayer = 15807
				local neviTask_ActivePlayer = 15808
				local activeKeyValue = 800			-- 累计活跃度
				local playerActiveValue  = TaskCApi.GetRegionReputation(TASKINTERFACE_POINTER,36)
				local bReturnee = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,titleTask,true)
				local bActivePlayer = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,titleTask_ActivePlayer,true)
				if (year == 2013 and month == 10 and day >= 30) or (year == 2013 and month == 11 and day <= 31) then
					if (not bReturnee) and playerActiveValue >= activeKeyValue then
						if not bActivePlayer then
							TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,titleTask_ActivePlayer)
						end
					end
				elseif (year == 2013 and month == 10) or (year == 2013 and month == 11) then
				else
					TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, titleTask_ActivePlayer)
					TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, neviTask_ActivePlayer)
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, titleTask_ActivePlayer, false)
					TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, neviTask_ActivePlayer, false)
				end

			end
		end

		------------------------------------------------------------------------------------------
		-- 17 神之试炼2章：信仰试炼，每天增加1次
		if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,TaskCount.Belief_Trial.keyTask,true) then
--			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 15916)	--试炼二章主任务
--			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,16118)	--公会事务
			--每天加1
			local addOn = 1
			TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Belief_Trial.idx, addOn)
		end

		-- 18 噩梦冒险岛签到任务次数重置
		if iRoleAbsence > 1 then
			TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,16103)
		end

		-- 19 修复信仰突破任务被卡
		if true then
			local tasks = 			--信仰突破任务，快捷突破任务
			{
				[1] = { nomal = 13917, shortcut = 15152, finish = 15121,},
				[2] = { nomal = 13918, shortcut = 15153, finish = 15122,},
				[3] = { nomal = 13919, shortcut = 15154, finish = 15123,},
				[4] = { nomal = 13920, shortcut = 15155, finish = 15124,},
				[5] = { nomal = 13921, shortcut = 15156, finish = 15125,},
				[6] = { nomal = 13922, shortcut = 15157, finish = 15126,},
				[7] = { nomal = 13923, shortcut = 15158, finish = 15127,},
				[8] = { nomal = 15711, shortcut = 15712, finish = 15713,},
			}
			for k,v in ipairs(tasks) do
				local record1 = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v.shortcut,true)
				local record2 = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v.shortcut,false)
				local record3 = TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v.finish,true)
				if (record1 or record2) and not record3 then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,v.finish)
				end
			end

		end

		-- 20 处理zangchunyu每周狮心骑士团副本挑战任务的清空
		if true then
			local tasksLionHeart60	=	{ 16781,16782,16783,16784,16785,16786,16787,16788,16789,16790 }		-- 60级
			local tasksLionHeart40	= 	{ 16814,16815,16816,16817,16818,16819,16820,16821,16822,16823 }		-- 40级
			for k,v in ipairs(tasksLionHeart60) do
				TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
				TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
			end
			for k,v in ipairs(tasksLionHeart40) do
				TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
				TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
			end
		end

		-- 21 处理运营活动冰风谷的每日清零
		TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.Yunying_BFG.idx, -1)

		-- 22 处理mutonglin(牟彤林) 15:19:05求每天0时清楚以下跑商任务的结果：16983,16988-16993,16984，16994-16999，共计14个任务
		if true then
			local taskToClear = {16983,16988,16989,16990,16991,16992,16993,16984,16994,16995,16996,16997,16998,16999}
			for k,v in ipairs(taskToClear) do
				TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
				TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
			end
		end

		-- 23 处理天天领宝石卡的每日清除结果
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 17072)
			TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, 17107)

		-- 24 处理mutonglin(牟彤林) 15:05:52每日0时求清以下狮心训练营任务结果	16861,16862,16873-16880，17085
		if true then
			local taskLionHeart60 = {16861,16862,16873,16874,16875,16876,16877,16878,16879,16880,17085}
			for k,v in ipairs(taskLionHeart60) do
				TaskCApi.FinishPlayerTask(TASKINTERFACE_POINTER, v, false)
				TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
			end
		end
		-- 25 处理发微博送大礼活动
		--	【肖志宇】 11月7日-11月30日期间上线的角色，如果是在11月7日10:00（含）之后创建的新角色，
		--	将会获得隐藏任务A【id：17267】，接到即完成，记录结果。
		if year == 2013 and month == 11 and ( day >= 7 and day <= 30 ) then
			local taskID = 17267
			local roleCrateTime = TaskCApi.GetRoleCreateTime(TASKINTERFACE_POINTER)
			local serverTime = TaskCApi.GetCurTime(TASKINTERFACE_POINTER)
			local dayDifference = day - 7		-- 上线当天日期和11月7日之间的日期差
			if serverTime - roleCrateTime <= (3600 * 14) + 3600 * hour * dayDifference then
				if not TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,taskID,true) then
					TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,taskID)
				end
			end
		end

		-- 26 [debug] 黑焰石使用10次后未能每天清空的问题
		TaskCApi.ClearTaskCompleteTimesInFinishTimeTaskList(TASKINTERFACE_POINTER,16332)


		--	--	--	--  --  --
		--	--	--	--  --  --
		--	--	--	--  --  --
		--	处理每月第一次登陆的情况：
		if IsNewMonth then
			-- 月度消费促奖励任务	--	设定当月领当月奖励，且，当消费积分为0时清空本月领奖任务记录
			-- 单月，把TaskCount.SalesPromotion.val 的值设成：1
			if month == 8 or month == 10 or month == 12 or month == 2 or month == 4 or month == 6 then
				local val = TaskCount.SalesPromotion.val
				local change = 1 - val
				TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.SalesPromotion.idx, change)
				if	TaskCApi.GetConsumeScore(TASKINTERFACE_POINTER) == 0 then
					local tasks = { 15094,15095,15096,15097,15098,15099,15100,15101}
					for k,v in ipairs(tasks) do
						if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v,true) then
							TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
						end
					end
				end
			-- 双月，把TaskCount.SalesPromotion.val 的值设成：7
			elseif month == 9 or month == 11 or month == 1 or month == 3 or month == 5 or month == 7 then
				local val = TaskCount.SalesPromotion.val
				local change = 7 - val
				TaskCApi.ModifyCommonTaskCount(TASKINTERFACE_POINTER,TaskCount.SalesPromotion.idx, change)
				if	TaskCApi.GetConsumeScore(TASKINTERFACE_POINTER) == 0 then
					local tasks = { 15094,15095,15096,15097,15102,15103,15104,15105}
					for k,v in ipairs(tasks) do
						if TaskCApi.HasTaskInFinsihTaskList(TASKINTERFACE_POINTER,v,true) then
							TaskCApi.ClearFinishRecords(TASKINTERFACE_POINTER, v)
						end
					end
				end
			end
		end

		-- end：返回 --
		return 0
	end
	,
	--在竞技场胜负结算的时候，且，人在竞技场内的时候调用，返回 本场竞技结果 和 本场杀人数
	--iResult: 1代表本场获胜，-1代表本场失败 iKillPlayers： 本场杀人数
	OnPVPFinish = function(TASKINTERFACE_POINTER, iResult, iKillPlayers)
		--获得声望=int (2000*0.667 /(1+170*e^(-0.1× (玩家等级-40))))
		local RepuAward = 0
		local iPlayerLev = TaskCApi.GetPlayerLevel(TASKINTERFACE_POINTER)
		local iCount = TaskCApi.GetTaskCompleteTimesFromFinishTimeTaskList(TASKINTERFACE_POINTER,11521)	--取得竞技场计次任务的次数
		--只有每天第1次才发声望
		if iCount <= 1 then
			RepuAward = math.floor( 2000 * 0.667 / ( 1 + 170 * math.exp( -0.1 * ( iPlayerLev - 40 ))))
			TaskCApi.DeliverRegionReputation(TASKINTERFACE_POINTER,9, math.max(1,RepuAward))
		end
		--9人斩成就
		if iKillPlayers >= 9 then
			TaskCApi.DeliverNewTask(TASKINTERFACE_POINTER,11530)
		end

		return 0
	end
	,
}

