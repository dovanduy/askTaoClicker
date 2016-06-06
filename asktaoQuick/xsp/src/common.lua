local bb = require("badboy");
local json = bb.getJSON();
common = {};

function common.usefullRandom(n)
  math.randomseed(tostring(os.time()):reverse():sub(1, 6))
	local r = math.random(n);
	return r;
end

function common.tap(x,y)
	touchDown(1, x, y);
	mSleep(20);
	touchUp(1, x, y);
end

function common.useFullFindMultiColorInRegionFuzzy(arr)
--	if #arr ~= 7 then
		common.objectLog(arr);
--	end;

	x, y = findMultiColorInRegionFuzzy(arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7]);
	return x, y;
end

--将obj转换为json打印出来
function common.objectLog(obj)
	local jsonText = json.encode(obj);
	sysLog(jsonText);
end

return common;