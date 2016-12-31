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
-- Retrieves the relative MIDI pitch offset associated with any accidental on the position.
-- The offset table looks like this: `{v=-2,b=-1,n=0,['#']=1,x=2}`
-- @function [parent=#nwcNotePos] GetAccidentalPitchOffset
-- @param self an object.
-- @return #string An integer offset to be applied to MIDI pitch

-------------------------------------
-- Extract the note name for the position, given the `clef` provided.
-- @function [parent=#nwcNotePos] GetNoteName
-- @param self an object.
-- @param #string clef the clef type.
-- @return #string A note name letter.

-------------------------------------
-- Provides an automatic converting to string.
-- @function [parent=#nwcNotePos] __tostring
-- @param self an object.
-- @return #string the raw string representation of the object.



return nil