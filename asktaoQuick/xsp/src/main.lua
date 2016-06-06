--init("com.gbit.atm.ios",1);
local bb = require("badboy");
local json = bb.getJSON();
local common = require("common");

require("autoMainTask");

pID = "com.gbit.atm.ios";

function useFullFindMultiColorInRegionFuzzy(arr)
	x, y = findMultiColorInRegionFuzzy(arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7]);
	return x, y;
end

-- 背包关闭按钮图标  0xe7c17b,"23|4|0x980f0c,43|2|0xe1c274,40|36|0xb25c1e,22|28|0x830f0a,21|47|0xb76623,14|12|0xf0e5c1,21|19|0xf2e6c2,30|28|0xf2e6c2", 95, 537, 3, 1157, 246
-- 地图按钮图标  0xd7ae7f,"2|10|0xc19a6f,-10|15|0xc4a57e,-22|10|0xb6966f,-9|24|0xa6855d,-23|32|0x917854,0|35|0x977a51,5|32|0x9d7f56", 95, 622, 4, 1148, 204
-- 收任务栏按钮  0xe4c5a6,"2|19|0xbc986f,10|19|0x997754,20|18|0xdbbb96,14|11|0xb49273,9|24|0x977251,3|31|0x987554", 90, 786, 0, 1138, 422
-- 展开任务按钮 0xeccba5,"7|-6|0xeecca4,19|-15|0xfadfbf,16|-1|0xfffee4,17|11|0xd2aa7f,10|2|0x987653,1|2|0xa88867,10|10|0xa58461,14|13|0xa48261,14|-5|0xf5d7b3", 95, 877, 75, 1134, 174
-- 任务按钮    0xe8c57d,"-5|3|0xbf7c4d,-12|30|0x634927,-3|12|0xc4744b,11|19|0xe3c78f,28|8|0x7e573f,29|25|0xe5b562,41|8|0xf9eec7,61|12|0xfff0be", 95, 840, 81, 1140, 467
-- NPC对话框主线 0x562902,"0|16|0x562902,64|17|0x562902,66|-1|0x562902,21|2|0x582b05,27|9|0x582b04", 90, 698, 267, 1133, 636
-- 对话点击任意地方继续 0x5d5241,"-10|19|0x615442,-2|19|0x665946,3|19|0x655845,10|19|0x635744,25|0|0x665946,128|20|0x625644,157|16|0x5d5140,171|12|0x564b3c", 95, 5, 10, 341, 115
-- 继续按钮位置 1080,68
init("0", 1);
sysLog("kaishi");
--local mainTaskBtnInfo = {0xe4c5a6,"2|19|0xbc986f,10|19|0x997754,20|18|0xdbbb96,14|11|0xb49273,9|24|0x977251,3|31|0x987554", 90, 786, 0, 1138, 422};
--	keepScreen(true);
--	x, y = useFullFindMultiColorInRegionFuzzy(mainTaskBtnInfo);
--	keepScreen(false);
--	if x > -1 then --已经打开
--		sysLog("找到了"..x..""..y);
--		common.tap(x, y);
--	else
--		sysLog("没找到"..x..""..y);
--	end
autoMainTask();
