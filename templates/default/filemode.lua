--[[-------------------------------------------------------------------------
This NWC user tool loads all of a nwctxt file, changing all default color
items to color hightlight 3.

$NWCUT$CONFIG: FileText $
--]]-------------------------------------------------------------------------
local changed = 0

-- Set color to highlight for all items that use default color
local function filterProc(item,inum)
	if (item:GetNum('Color') or 0) == 0 then
		item:Set('Color',3)
		changed = changed+1
	end
end

local score = nwcut.loadFile()
local selstaff,sel1,sel2 = score:getSelection()

for i=1,#score.Staff do
	score:setSelection(score.Staff[i])
	score:forSelection(filterProc)
end

-- restore original user selection
score:setSelection(selstaff,sel1,sel2)
score:save()

nwcut.warn(('Change count: %d'):format(changed))
