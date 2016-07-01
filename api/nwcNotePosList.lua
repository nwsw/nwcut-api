-------------------------------------------------------------------------------
-- A nwcItem supporting object class for a list of note position data.
-- An object of this type contains a list of nwcNotePos objects reflecting one or more note positions on a staff.
-- Note positions can be retrieved using array offsets similar to other Lua tables.
-- @module nwcNotePosList

-------------------------------------
-- @type nwcNotePosList
-- @field #string ID Contains the name of the object type (nwcNotePosList)

-------------------------------------
-- Constructs a new nwcNotePosList object.
-- @function [parent=#nwcNotePosList] new
-- @param #string fieldtxt The raw note Pos or Pos2 field text.
-- @return #nwcNotePosList A new nwcNotePosList object.

-------------------------------------
-- Standard output function with a user specified write function.
-- @function [parent=#nwcNotePosList] WriteUsing
-- @param self an object.
-- @param writeFunc The function that will be used to write the pieces that constitute the reconstructed text.

-------------------------------------
-- Provides an automatic converting to string.
-- @function [parent=#nwcNotePosList] __tostring
-- @param self an object.
-- @return #string the raw string representation of the object.


return nil