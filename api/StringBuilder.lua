-------------------------------------------------------------------------------
-- An object class used for efficiently converting a table to a string.
-- Lua is more efficient at building strings using an intermediate sequential table of elements that are later 
-- concatenated together. This object class is provided for this purpose.
-- @module StringBuilder

-------------------------------------------------------------------------------
-- @type StringBuilder
-- @field #string ID Contains the name of the object type (StringBuilder)

-------------------------------------
-- Constructs a new StringBuilder object.
-- @function [parent=#StringBuilder] new
-- @param ... A series of items that will be included in the initial StringBuilder list.
-- @return #StringBuilder A new StringBuilder object.

-------------------------------------
-- Empties the StringBuilder contents.
-- @function [parent=#StringBuilder] reset
-- @param self an object

-------------------------------------
-- Adds one or more items to the end of the StringBuilder list.
-- @function [parent=#StringBuilder] add
-- @param self an object
-- @param ... A list of items to add.

-------------------------------------
-- Adds one or more items to the beginining of the StringBuilder list.
-- @function [parent=#StringBuilder] prepend
-- @param self an object
-- @param ... A list of items to add.

-------------------------------------
-- Constructs the concatenated string representing all of the added elements.
-- @function [parent=#StringBuilder] __tostring
-- @param self an object
-- @return #string A single string with all added elements concatenated together.

-------------------------------------
-- Efficiently convert any object that has a WriteUsing method into a string.
-- This is a static function that can be used to quickly convert any object into its string representation. The
-- object **must** have its own WriteUsing method that handles the technical details of the conversion to string.
-- @function [parent=#StringBuilder] Writer
-- @param anyObj Any object that supports the WriteUsing method call.
-- @return #string A single string representing the provided object.


return nil