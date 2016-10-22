-------------------------------------------------------------------------------
-- Lua global variables.
-- The basic library provides core functions to Lua. If you do not include this
-- library in your application, you should check carefully whether you need to
-- provide implementations for some of its facilities. 
-- @module global

------------------------------------------------------------------------------
-- This library provides generic functions for bitwise manipulation.
-- This is a global variable which hold the preloaded @{bit32} module.
-- @field[parent = #global] bit32#bit32 bit32 preloaded module

------------------------------------------------------------------------------
-- This library provides generic functions for string manipulation.
-- This is a global variable which hold the preloaded @{string} module.
-- @field[parent = #global] string#string string preloaded module

------------------------------------------------------------------------------
-- This library provides generic functions for table manipulation.
-- This is a global variable which hold the preloaded @{table} module.
-- @field[parent = #global] table#table table preloaded module

------------------------------------------------------------------------------
-- This library is an interface to the standard C math library.
-- This is a global variable which hold the preloaded @{math} module.
-- @field[parent = #global] math#math math preloaded module

-------------------------------------------------------------------------------
-- Issues an error when the value of its argument `v` is false (i.e.,
-- **nil** or **false**); otherwise, returns all its arguments. `message` is an error
-- message; when absent, it defaults to *"assertion failed!"*.
-- @function [parent=#global] assert
-- @param v if this argument is false an error is issued.
-- @param #string message an error message (optional, *"assertion failed"* by default)
-- @return All its arguments.

-------------------------------------------------------------------------------
-- Terminates the last protected function called and returns `message`
-- as the error message. Function `error` never returns.
--
-- Usually, `error` adds some information about the error position at the
-- beginning of the message. The `level` argument specifies how to get the
-- error position.  
-- With level 1 (the default), the error position is where the
-- `error` function was called.  
-- Level 2 points the error to where the function
-- that called `error` was called; and so on.  
-- Passing a level 0 avoids the addition of error position information to the message.
-- @function [parent=#global] error
-- @param #string message an error message.
-- @param #number level specifies how to get the error position (optional, `1` by default).

-------------------------------------------------------------------------------
-- A global variable (not a function) that holds the global environment
-- (that is, `_G._G = _G`). Lua itself does not use this variable; changing
-- its value does not affect any environment, nor vice-versa.
-- @field [parent = #global] #table _G

-------------------------------------------------------------------------------
-- If `object` does not have a metatable, returns **nil**. Otherwise, if the
-- object's metatable has a `"__metatable"` field, returns the associated
-- value. Otherwise, returns the metatable of the given object.
-- @function [parent=#global] getmetatable
-- @param object
-- @return #table the metatable of object.
-- @return #nil if no metatable was found

-------------------------------------------------------------------------------
-- If t has a metamethod __ipairs, calls it with t as argument and returns the
-- first three results from the call.
-- Otherwise, returns three values: an iterator function, the table `t`, and `0`,
-- so that the construction
-- 
--      for i,v in ipairs(t) do body end
-- 
-- will iterate over the pairs `(1,t[1]), (2,t[2]), ...,` up to the first integer
-- key absent from the table. 
-- @function [parent=#global] ipairs
-- @param #table t a table by index.
-- @return iterator function, table `t`, the value `0`

-------------------------------------------------------------------------------
-- Allows a program to traverse all fields of a table. Its first argument is
-- a table and its second argument is an index in this table. `next` returns
-- the next index of the table and its associated value.
--
-- When called with **nil**
-- as its second argument, `next` returns an initial index and its associated
-- value. When called with the last index, or with nil in an empty table, `next`
-- returns nil.
--
-- If the second argument is absent, then it is interpreted as
-- nil. In particular, you can use `next(t)` to check whether a table is empty.
-- The order in which the indices are enumerated is not specified, *even for
-- numeric indices*. (To traverse a table in numeric order, use a numerical **for**.)
--
-- The behavior of `next` is undefined if, during the traversal, you assign
-- any value to a non-existent field in the table. You may however modify
-- existing fields. In particular, you may clear existing fields.
-- @function [parent=#global] next
-- @param #table table table to traverse.
-- @param index initial index (optional).
-- @return index, value
-- @return #nil if called on the last index or on an empty table

-------------------------------------------------------------------------------
-- If t has a metamethod `__pairs`, calls it with t as argument and returns the
-- first three results from the call.
-- 
-- Otherwise, returns three values: the `next` function, the table t, and nil,
-- so that the construction
-- 
--      for k,v in pairs(t) do body end
--  
-- will iterate over all key–value pairs of table `t`.
-- See function next for the caveats of modifying the table during its traversal. 
-- @function [parent=#global] pairs
-- @param #table t table to traverse.
-- @return iterator function, table `t`, the value `0`

-------------------------------------------------------------------------------
-- Calls function `f` with the given arguments in *protected mode*. This
-- means that any error inside `f` is not propagated; instead, `pcall` catches
-- the error and returns a status code. Its first result is the status code (a
-- boolean), which is true if the call succeeds without errors. In such case,
-- `pcall` also returns all results from the call, after this first result. In
-- case of any error, `pcall` returns **false** plus the error message.
-- @function [parent=#global] pcall
-- @param f function to be call in *protected mode*.
-- @param ... function arguments.
-- @return #boolean true plus the result of `f` function if its call succeeds without errors.
-- @return #boolean,#string false plus the error message in case of any error.

-------------------------------------------------------------------------------
-- Receives any number of arguments and prints their values to `stdout`, using the
-- `tostring` function to convert each argument to a string. print is not intended
-- for formatted output, but only as a quick way to show a value, for instance for
-- debugging. For complete control over the output, use `string.format` and `nwcut.write`. 
-- @function [parent=#global] print
-- @param ... values to print to `stdout`.

-------------------------------------------------------------------------------
-- If `index` is a number, returns all arguments after argument number
-- `index`. Otherwise, `index` must be the string `"#"`, and `select` returns
-- the total number of extra arguments it received.
-- @function [parent=#global] select
-- @param index a number or the string `"#"`
-- @param ...
-- @return all arguments after argument number `index`
-- @return total number of extra arguments

-------------------------------------------------------------------------------
-- Sets the metatable for the given table. (You cannot change the metatable
-- of other types from Lua, only from C.) If `metatable` is nil, removes the
-- metatable of the given table. If the original metatable has a `"__metatable"`
-- field, raises an error.  
-- This function returns `table`.
-- @function [parent=#global] setmetatable
-- @param #table table 
-- @param #table metatable
-- @return #table The first argument `table`.

-------------------------------------------------------------------------------
-- When called with no base, tonumber tries to convert its argument to a number.
-- If the argument is already a number or a string convertible to a number,
-- then tonumber returns this number; otherwise, it returns **nil**.
--  
-- When called with base, then e should be a string to be interpreted as an
-- integer numeral in that base. The base may be any integer between `2` and `36`,
-- inclusive. In bases above `10`, the letter 'A' (in either upper or lower case)
-- represents `10`, 'B' represents `11`, and so forth, with 'Z' representing `35`.
-- If the string `e` is not a valid numeral in the given base,
-- the function returns **nil**. 
-- @function [parent=#global] tonumber
-- @param e a number or string to convert to a number.
-- @param #number base the base to interpret the numeral, any integer between `2` and `36` (optional, `10` by default).
-- @return #number converted number
-- @return #nil if convertion fail.

-------------------------------------------------------------------------------
-- Receives an argument of any type and converts it to a string in a
-- reasonable format. (For complete control of how numbers are converted, use
-- `string.format`.)
--
-- If the metatable of `v` has a `"__tostring"` field, then `tostring` calls
-- the corresponding value with `v` as argument, and uses the result of the
-- call as its result.
-- @function [parent=#global] tostring
-- @param v an argument of any type.
-- @return #string a string in a reasonable format.

-------------------------------------------------------------------------------
-- Returns the type of its only argument, coded as a string. The possible
-- results of this function are "
-- `nil`" (a string, not the value **nil**), "`number`", "`string`", "`boolean`",
-- "`table`", "`function`", "`thread`", and "`userdata`".
-- @function [parent=#global] type
-- @param v any value.
-- @return #string the type of `v`.

-------------------------------------------------------------------------------
-- A global variable (not a function) that holds a string containing the
-- current interpreter version. The current contents of this variable is
-- "`Lua 5.2`".
-- @field [parent = #global] #string _VERSION

------------------------------------------------------------------------------
-- NWC User Tool Execution Environment.
-- This is the main @{nwcut} module.
-- @field[parent = #global] nwcut#nwcut nwcut preloaded module

------------------------------------------------------------------------------
-- nwcFile.
-- This is the @{nwcFile} class.
-- @field[parent = #global] nwcFile#nwcFile nwcFile preloaded module

------------------------------------------------------------------------------
-- nwcStaff.
-- This is the @{nwcStaff} class.
-- @field[parent = #global] nwcStaff#nwcStaff nwcStaff preloaded module

------------------------------------------------------------------------------
-- nwcItem.
-- This is the @{nwcItem} class.
-- @field[parent = #global] nwcItem#nwcItem nwcItem preloaded module

------------------------------------------------------------------------------
-- nwcPlayContext.
-- This is the @{nwcPlayContext} class.
-- @field[parent = #global] nwcPlayContext#nwcPlayContext nwcPlayContext preloaded module

------------------------------------------------------------------------------
-- nwcOptText.
-- This is the @{nwcOptText} class.
-- @field[parent = #global] nwcOptText#nwcOptText nwcOptText preloaded module

------------------------------------------------------------------------------
-- nwcOptList.
-- This is the @{nwcOptList} class.
-- @field[parent = #global] nwcOptList#nwcOptList nwcOptList preloaded module

------------------------------------------------------------------------------
-- nwcOptGroup.
-- This is the @{nwcOptGroup} class.
-- @field[parent = #global] nwcOptGroup#nwcOptGroup nwcOptGroup preloaded module

------------------------------------------------------------------------------
-- nwcNotePosList.
-- This is the @{nwcNotePosList} class.
-- @field[parent = #global] nwcNotePosList#nwcNotePosList nwcNotePosList preloaded module

------------------------------------------------------------------------------
-- nwcNotePos.
-- This is the @{nwcNotePos} class.
-- @field[parent = #global] nwcNotePos#nwcNotePos nwcNotePos preloaded module

------------------------------------------------------------------------------
-- StringBuilder.
-- This is the @{StringBuilder} class.
-- @field[parent = #global] StringBuilder#StringBuilder StringBuilder preloaded module


return nil
