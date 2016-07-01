--[[-------------------------------------------------------------------------
This is a sample NoteWorthy Composer Lua user tool.
This sample turns all items with a default color to "Highlight 4"

$NWCUT$CONFIG: ClipText $
--]]-------------------------------------------------------------------------

-- uncomment the next line to review your script's input and output within NWC
-- nwcut.status = nwcut.const.rc_Report

assert(nwcut.getprop("Mode") == nwcut.const.mode_ClipText,"Invalid input mode...this tool requires single staff clip text")

-- we want to work with high level nwcItem objects in this script
nwcut.setlevel(2)

for item in nwcut.items() do
	local c = item:GetNum('Color')

	if not c then
		item:Provide("Color",4)
	elseif c == 0 then
		item.Opts.Color = 4
	end

	nwcut.writeline(item)
end
