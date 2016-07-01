-------------------------------------------------------------------------------
-- A nwcItem supporting object class for option groups.
-- An object of this type is actually a Lua table containing key/value pairs representing the options and their values.
-- Options can be retrieved from it like any other Lua table.
-- You can use the standard @{table} methods on nwcOptGroup objects.
-- @module nwcOptGroup

-------------------------------------
-- @type nwcOptGroup
-- @field #string ID Contains the name of the object type (nwcOptGroup)

-------------------------------------
-- Constructs a new nwcOptGroup object.
-- @function [parent=#nwcOptGroup] new
-- @param #string fieldtxt The raw option field text.
-- @return #nwcOptGroup A new nwcOptGroup object.

-------------------------------------
-- Standard output function with a user specified write function.
-- @function [parent=#nwcOptGroup] WriteUsing
-- @param self an object.
-- @param writeFunc The function that will be used to write the pieces that constitute the reconstructed text.

-------------------------------------
-- Provides an automatic converting to string.
-- @function [parent=#nwcOptGroup] __tostring
-- @param self an object.
-- @return #string the raw string representation of the object.


return nil