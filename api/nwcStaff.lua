-------------------------------------------------------------------------------
-- nwcStaff object.
-- The nwcStaff object is used to encapsulate a NWC staff. The data is kept
-- in fields that match the nwctxt source lines. For example, the @{#nwcStaff.AddStaff} 
-- object contains the staff's *Name* and *Group* properties.
-- @module nwcStaff

----
-- @type nwcStaff
-- @field nwcItem#nwcItem AddStaff This contains the nwctxt AddStaff properties
-- @field nwcItem#nwcItem StaffProperties This contains the nwctxt StaffProperties
-- @field nwcItem#nwcItem StaffInstrument This contains the nwctxt StaffInstrument config
-- @field nwcItem#nwcItem Lyrics This contains the nwctxt Lyrics config
-- @field nwcItem#list_nwcItem Lyric This contains a list of lyric lines found in the staff, each as a @{nwcItem#nwcItem}
-- @field nwcItem#list_nwcItem Items This is a list of the @{nwcItem#nwcItem} notation items found in the staff, which includes notes, bars, and signatures.

----
-- nwcStaff constructor.
-- Returns an object representation of a NWC staff.
-- @function [parent=#nwcStaff] new
-- @return #nwcStaff an object representation of a NWC staff.

----
-- nwcStaff add a line of nwctxt to the staff.
-- @function [parent=#nwcStaff] add
-- @param #nwcStaff self nwcStaff object
-- @param nwcItem#nwcItem item to add

----
-- nwcStaff output function which generates a nwctxt representation.
-- Writes an object representation of a NWC staff.
-- @function [parent=#nwcStaff] save
-- @param #nwcStaff self nwcStaff object
-- @param #function writeln function used to write the nwctxt data

----
-- @type list_nwcStaff
-- @list <nwcStaff#nwcStaff>

return nil