-------------------------------------------------------------------------------
-- A nwcItem supporting object class for simple text. 
-- @module nwcOptText

-------------------------------------
-- @type nwcOptText
-- @field #string ID Contains the name of the object type (nwcOptText)
-- @field #string Text Object property containing the actual option data

-------------------------------------
-- Constructs a new nwcOptText object.
-- @function [parent=#nwcOptText] new
-- @param #string fieldtxt The raw option field text.
-- @return #nwcOptText A new nwcOptText object.

-------------------------------------
-- Standard output function with a user specified write function.
-- @function [parent=#nwcOptText] WriteUsing
-- @param self an object.
-- @param writeFunc The function that will be used to write the pieces that constitute the reconstructed text.

-------------------------------------
-- Provides an automatic converting to string.
-- @function [parent=#nwcOptText] __tostring
-- @param self an object.
-- @return #string the raw string representation of the nwcOptText object.

return nil