-------------------------------------------------------------------------------
-- An object representing a single item of clip text.
-- Each line returned by @{nwcut#nwcut.getitem} or @{nwcut#nwcut.items} can be used to construct a
-- nwcItem object, which includes properties and methods for analyzing, altering, and
-- reconstructing a line of NWC text.
-- @module nwcItem

-------------------------------------
-- @type nwcItem
-- @field #string ID Contains the name of the object type (nwcItem)
-- @field #string ObjType Indicates the type of NWC object, such as Clef, Key, Note, Chord, Rest, etc.
-- @field #string UserType Indicates the User Object Type when the ObjType is User
-- @field #table Opts Contains all of the options for the object referenced as a table of name,value pairs
-- @field #boolean Fake Defained as true when the item is a fake NWC item (use of the IsFake method is recommended)

-------------------------------------
-- nwcItem constructor.
-- Returns an object representation of a single clip item.
-- @function [parent=#nwcItem] new
-- @param #string cliptext A line of clip text returned by @{nwcut#nwcut.getitem} or @{nwcut#nwcut.items}
-- @param #number level Controls how many recursive levels of construction should be done (optional)
-- @return #nwcItem an object representation of a single line of NWC text.

-------------------------------------
-- NWC text output function with a user specified write function.
-- This method is used to reconstruct a line of NWC text and output it using a user-specified write function
-- @function [parent=#nwcItem] WriteUsing
-- @param #nwcItem self nwcItem object
-- @param writeFunc The function that will be used to write the pieces that constitute the NWC text

-------------------------------------
-- Converts an object to NWC text.
-- This method is used when the **tostring** operator is applied to a nwcItem object (refer to the @{global} section)
-- @function [parent=#nwcItem] __tostring
-- @param #nwcItem self an object.
-- @return #string a line of NWC text.

-------------------------------------
-- Get the subtype of a User object.
-- Only returns a valid user type when the ObjType is User.
-- @function [parent=#nwcItem] GetUserType
-- @param #nwcItem self an object.
-- @return #string the user type name or false

-------------------------------------
-- Safely retrieve any nested Opts value, or nil if it cannot be found.
-- This is the easiest way to retrieve any Opts value from the object. You can drill into the Opts table by adding
-- additional key names into the argument list. For example, the line:
-- 
-- `local stemDir = item:Get('Opts','Stem') or "Up"`
--
-- could be used to get the stem direction for a note, or assume it is Up if the stem direction is not set.
-- @function [parent=#nwcItem] Get
-- @param #nwcItem self an object.
-- @param ... One or more key names indexing into the Opts table.
-- @return the option value if it exists, or nil.

-------------------------------------
-- Safely retrieve any nested numeric Opts value, or nil if it cannot be found.
-- This is the easiest way to retrieve any numeric Opts value from the object. This behaves just like Get,
-- but returns a number or nil. For example, a dynamic velocity override could be retrieved like so:
-- `local noteVel = item:GetNum("Opts","Velocity") or -1`
--
-- @function [parent=#nwcItem] GetNum
-- @param #nwcItem self an object.
-- @param ... One or more key names indexing into the Opts table.
-- @return #number the numeric option value, or nil if it does not exist or is not a number.

-------------------------------------
-- Used to establish (if necessary) and return a named option field.
-- Use the Provide function to guarantee that an option field exists in the object and is
-- constructed of the correct option type. If the option type is an object (not opt_Raw), then it
-- can be used directly from the return of this function.
--
--		item = nwcItem.new("|Ending")
--		
--		-- Include a first ending
--		item:Provide("Endings")["1"] = ""
--		
--		-- Add a default visibility if one is not set
--		item:Provide("Visibility","Default")
--
-- @function [parent=#nwcItem] Provide
-- @param #nwcItem self an object.
-- @param lbl The name of the option (a key into the Opts table).
-- @param data Default data for the option if it does not yet exist (optional, default is an empty string).
-- @return the option object or value.

-------------------------------------
-- Iterate through all note positions.
-- @function [parent=#nwcItem] AllNotePositions
-- @param #nwcItem self an object.
-- @return An iterator of all note positions (from both Pos and Pos2), starting from the lowest note.

-------------------------------------
-- Indicates whether this object contains a one or more note positions.
-- @function [parent=#nwcItem] ContainsNotes
-- @param #nwcItem self an object.
-- @return #boolean Indicating whether this object contains a one or more note positions.

-------------------------------------
-- Returns true if this object has a play back duration.
-- Hint: grace notes do not have duration.
-- @function [parent=#nwcItem] HasDuration
-- @param #nwcItem self an object.
-- @return #boolean True when the object is a note or rest with duration

-------------------------------------
-- Determine the NWC object type.
-- @function [parent=#nwcItem] Is
-- @param #nwcItem self an object.
-- @param #string t A string, such as "Clef", "Note", or "Bar"
-- @return #boolean Returns true if this object's ObjType matches the specified string.

-------------------------------------
-- Is this object fake.
-- Fake objects do not need to be passed to the output of a user tool.
-- @function [parent=#nwcItem] IsFake
-- @param #nwcItem self an object.
-- @return #boolean True when the object is either fake or just context

-------------------------------------
-- Is this object a Note, Rest, or Chord.
-- @function [parent=#nwcItem] IsNoteRestChord
-- @param #nwcItem self an object.
-- @return #boolean 

-------------------------------------
-- @type list_nwcItem
-- @list <#nwcItem>

-------------------------------------
-- @type map_nwcItem
-- @map <#string,#nwcItem>

return nil