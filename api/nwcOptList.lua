-------------------------------------------------------------------------------
-- A nwcItem supporting object class for option lists.
-- An object of this type is actually just a simple Lua list containing all of the values.
-- Options can be retrieved from it like any other Lua list/table.
-- You can use the standard @{table} methods on nwcOptList objects.
-- @module nwcOptList

-------------------------------------
-- @type nwcOptList
-- @field #string ID Contains the name of the object type (nwcOptList)

-------------------------------------
-- Constructs a new nwcOptList object.
-- @function [parent=#nwcOptList] new
-- @param #string fieldtxt The raw option field text.
-- @return #nwcOptList A new nwcOptList object.

-------------------------------------
-- Standard output function with a user specified write function.
-- @function [parent=#nwcOptList] WriteUsing
-- @param self an object.
-- @param writeFunc The function that will be used to write the pieces that constitute the reconstructed text.

-------------------------------------
-- Provides an automatic converting to string.
-- @function [parent=#nwcOptList] __tostring
-- @param self an object.
-- @return #string the raw string representation of the object.

-------------------------------------
-- Find an option value in the list.
-- @function [parent=#nwcOptList] Find
-- @param self an object.
-- @param a The option value/text to match in the list.
-- @return #number the index of the matching option, or false



return nil