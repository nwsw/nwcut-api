--[[-------------------------------------------------------------------------
This NWC user tool loads a nwctxt file, then saves it back unchanged.

$NWCUT$CONFIG: FileText $
--]]-------------------------------------------------------------------------

local score = nwcut.loadFile()
score:save()
nwcut.warn("PassThru complete")
