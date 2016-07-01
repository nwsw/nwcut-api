-------------------------------------------------------------------------------
-- A supporting object class for note position data.
-- An object of this type contains all of the information from a single note position on a staff.
-- Only non-default properties are generally contained in the object.
-- @module nwcNotePos

-------------------------------------
-- @type nwcNotePos
-- @field #string ID Contains the name of the object type (nwcNotePos)
-- @field #number Position Contains the numeric position for a note (required)
-- @field #string Accidental Contains a character reflecting the accidental
-- @field #string Notehead Contains a character reflecting the notehead 
-- @field #boolean Tied Set to true when the note position includes an outward tie
-- @field #number Color Contains the numeric color for the notehead

-------------------------------------
-- Constructs a new nwcNotePos object.
-- @function [parent=#nwcNotePos] new
-- @param #string fieldtxt The raw note position text.
-- @return #nwcNotePos A new nwcNotePos object.

-------------------------------------
-- Standard output function with a user specified write function.
-- @function [parent=#nwcNotePos] WriteUsing
-- @param self an object.
-- @param writeFunc The function that will be used to write the pieces that constitute the reconstructed text.

-------------------------------------
-- Provides an automatic converting to string.
-- @function [parent=#nwcNotePos] __tostring
-- @param self an object.
-- @return #string the raw string representation of the object.



return nil