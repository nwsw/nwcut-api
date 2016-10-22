--[[-------------------------------------------------------------------------
This is a sample NoteWorthy Composer Lua user tool.
This sample turns all items with a default color to "Highlight 4"

$NWCUT$CONFIG: ClipText $
--]]-------------------------------------------------------------------------

local changed = 0

-- Set color to highlight 4 for all items that use default color
local function filterProc(item)
	if item:IsFake() then return end
	if (item:GetNum('Color') or 0) == 0 then
		item:Set('Color',4)
		changed = changed+1
	end
end

nwcut.loadFile()
	:forSelection(filterProc)
	:save()

nwcut.warn(('Change count: %d'):format(changed))
