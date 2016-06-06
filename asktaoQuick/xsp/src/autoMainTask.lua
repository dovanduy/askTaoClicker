

local common =  require("common");

--关闭NPC对话框
local function closeNPCDialog()
	x, y = findMultiColorInRegionFuzzy(0x562902,"0|16|0x562902,64|17|0x562902,66|-1|0x562902,21|2|0x582b05,27|9|0x582b04", 90, 698, 267, 1133, 636)
	if x > -1 then
        common.tap(x, y);
        mSleep(200);
    end
end

function isInMainScreen() --是否在主屏幕
    local isInMainScreenValue = false;
    local mainScreenExppandBtnInfo = {0xfdbf16, "-30|20|0xfcc117,-38|26|0xddbd62,-32|30|0xafa04c,-8|28|0xecd7ae,0|46|0xfee564,-6|48|0x639e60,-5|60|0xfee897", 95, 892, 549, 1139, 649};
    local mainScreenCloseBtnInfo = {0xffdf3c, "5|22|0x7a3617,35|23|0xffe137,18|13|0xfabe21,18|25|0xa8693d,30|26|0xae611c,3|41|0xb5732c,14|38|0xa27a44,10|22|0xfce983", 95, 872, 524, 1139, 646};
    local x3, y3 = common.useFullFindMultiColorInRegionFuzzy(mainScreenExppandBtnInfo);
    if x3 ~= -1 then -- 显示主页的展开按钮了,说明已经进入主屏幕
        isInMainScreenValue = true;
    end
    --收起按钮
    local x4, y4 = common.useFullFindMultiColorInRegionFuzzy(mainScreenCloseBtnInfo);
    if x4 ~= -1 then --显示了收起按钮
        isInMainScreenValue = true;
    end

    if isInMainScreenValue then
        sysLog("在主屏幕");
    else
        sysLog("不在主屏幕");
    end
    
    return isInMainScreenValue;
end

--回到主屏幕
function backToMainScreen()
	while (true) do
        local closeBtnInfo = {0xe7c17b,"23|4|0x980f0c,43|2|0xe1c274,40|36|0xb25c1e,22|28|0x830f0a,21|47|0xb76623,14|12|0xf0e5c1,21|19|0xf2e6c2,30|28|0xf2e6c2", 95, 537, 3, 1157, 246};
        --关闭地图或者NPC对话的x
        local mapCloseBtnInfo = {0xd7ae7f,"2|10|0xc19a6f,-10|15|0xc4a57e,-22|10|0xb6966f,-9|24|0xa6855d,-23|32|0x917854,0|35|0x977a51,5|32|0x9d7f56", 95, 622, 4, 1148, 204};
        local x, y = common.useFullFindMultiColorInRegionFuzzy(closeBtnInfo);
        if x ~= -1 then
            common.tap(x, y);
        else
            sysLog("没有找到普通关闭按钮");
        end;

        local x2, y2 = common.useFullFindMultiColorInRegionFuzzy(mapCloseBtnInfo);
        if x2 ~= -1 then
            common.tap(x2, y2);
        end;

        if isInMainScreen() then
						sysLog("跳出回到主屏幕循环");
            break;
        end;

        --可能在战斗或者剧情对话, 等待会到主屏幕

        mSleep(1500);
	end
end



--阻塞直到打开任务栏
function openTaskIfNeeded()
    while true do
        local needContinue = false;
        local closeTaskBtnInfo = {0xe4c5a6,"2|19|0xbc986f,10|19|0x997754,20|18|0xdbbb96,14|11|0xb49273,9|24|0x977251,3|31|0x987554", 90, 786, 0, 1138, 422};
        local x, y = common.useFullFindMultiColorInRegionFuzzy(closeTaskBtnInfo);
        if x == -1 then --没有打开
						sysLog("没有找到收起任务按钮");
            local openTaskBtnInfo = {0xeccba5,"7|-6|0xeecca4,19|-15|0xfadfbf,16|-1|0xfffee4,17|11|0xd2aa7f,10|2|0x987653,1|2|0xa88867,10|10|0xa58461,14|13|0xa48261,14|-5|0xf5d7b3", 95, 877, 75, 1134, 174};
            local x2, y2 = common.useFullFindMultiColorInRegionFuzzy(openTaskBtnInfo);
            if  x2 == -1 then --没有任务展开任务按钮,可能不在主界面
                backToMainScreen();
                needContinue = true;-- 回到主屏幕重新执行操作
            else
                common.tap(x2, y2); --点击任务展开按钮
                mSleep(50);
            end
        end --任务栏已经展开
        if not needContinue then-- 已经在主屏幕 不需要继续
            local taskBtnInfo = {0xe8c57d,"-5|3|0xbf7c4d,-12|30|0x634927,-3|12|0xc4744b,11|19|0xe3c78f,28|8|0x7e573f,29|25|0xe5b562,41|8|0xf9eec7,61|12|0xfff0be", 95, 840, 81, 1140, 467};
            local taskX, taskY = common.useFullFindMultiColorInRegionFuzzy(taskBtnInfo);
            if taskX ~= -1 then
                common.tap(taskX, taskY);
                backToMainScreen();
            end
            break;
        end;
    end

end

--打开活动按钮，只能在主屏幕调用
function openActivity()
	local activityBtnInfo = {0xf2744b,"-10|11|0xd7a364,11|9|0xc9a06c,8|20|0xd5300c,26|4|0xdea262,35|23|0x9a372d", 95, 50, 1, 482, 99};
    local x, y = common.useFullFindMultiColorInRegionFuzzy(activityBtnInfo);
    if x ~= -1 then
        common.tap(x, y);
    end;
end

function stepOutDialogue()
    -- 点击任意地方继续
    local dialogTitleBtnInfo = {0x5d5241,"-10|19|0x615442,-2|19|0x665946,3|19|0x655845,10|19|0x635744,25|0|0x665946,128|20|0x625644,157|16|0x5d5140,171|12|0x564b3c", 95, 5, 10, 341, 115};
    local jumpX, jumpY = 1080, 68;-- 跳过按钮坐标
    local x, y = common.useFullFindMultiColorInRegionFuzzy(dialogTitleBtnInfo);
    if x ~= -1 then
        common.tap(jumpX, jumpY);
    end
end

--处理任务可能出现的对话框等
local function continueMainTask()
    while true do
        closeNPCDialog();
        mSleep(100);
        stepOutDialogue();--点击继续对话框
        mSleep(1000);
        if isInMainScreen() then
            break;
        end;
    end
end

function autoMainTask()
    openTaskIfNeeded();
		
	while (true) do--主线任务循环
		sysLog("进入主线任务循环");
        if not isInMainScreen() then
            continueMainTask();
				else
					local mainTaskBtnInfo = {0xc1bfbe,"1|0|0xc6c5c4,13|0|0xcac9c8,3|6|0xcecccc,13|6|0xcbcac8,8|11|0xfafafa,0|12|0xb5b3b2,15|12|0xb9b7b6,23|2|0xeae9e9", 95, 856, 130, 1145, 468};
					local x, y = common.useFullFindMultiColorInRegionFuzzy(mainTaskBtnInfo);
					if x == -1 then --任务栏没有主线任务
					--主线任务已经完成
            return;
					else
            common.tap(x, y);--点击任务
            mSleep(200);
					end;
        end;
        mSleep(1500);
	end
end
