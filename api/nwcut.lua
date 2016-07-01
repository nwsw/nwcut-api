-------------------------------------------------------------------------------
-- NWC User Tool Execution Environment.
-- The nwcut library provides function for NWC clip text manipulation.
--
-- ## Getting Started
-- A typical user tool is constructed as shown below.
--
--		-- we want to work with high level nwcItem objects in this script
--		nwcut.setlevel(2)
--		
--		for item in nwcut.items() do
--			local c = item:GetNum('Color')
--		
--			if (not c) or (c == 0) then
--				item:Provide("Color")
--				item.Opts.Color = 4
--			end
--		
--			nwcut.writeline(item)
--		end
--
-- ## Some Important Object Types
--
-- * @{nwcut}: Contains the essential utilities that are used by the various support classes.
-- * @{nwcItem}: The primary object class for storing NWC items.
-- * @{nwcPlayContext}: An object class for tracking staff play back context, which is helpful in calculating note names, bar counts, etc.
-- * @{nwcNotePos}: A note position class that tracks the position, accidental, notehead, and other styles for each note
--
-- @module nwcut

-------------------------------------
-- @type nwcut

-------------------------------------
-- status return code.
-- Should be set to one of the following:
--
-- * @{#nwcut.const.rc_Success}
-- * @{#nwcut.const.rc_Report}
-- * @{#nwcut.const.rc_Error}
-- 
-- This field contains the return status code that will be used by NWC in determining how process any output from the user tool.
-- By default, in the absence of any errors, NWC will process the user tool output as a replacement clip or file. This behavior
-- can be changed by assigning one of the **nwcut.const** constants.
--
-- @field [parent=#nwcut] #number status

-------------------------------------
-- Returns the current NWC version.
--
-- @function [parent=#nwcut] nwcversion
-- @return #string A string describing the host NWC program release version

-------------------------------------
-- Returns the approximate number of CPU seconds used by the script.
-- This can be useful when benchmarking the performance of a script.
-- @function [parent=#nwcut] clock
-- @return #number CPU seconds used by script.

-------------------------------------
-- Retrieves the next item from the NWC clip text input.
-- This function opens the clip text input stream and returns the next notation
-- object as a single line of text.
-- 
-- @function [parent=#nwcut] getitem
-- @return nwcItem#nwcItem When the @{#nwcut.setlevel} property is set to 1 or more, a nwcItem object is returned for each line of clip text
-- @return #string When the @{#nwcut.setlevel} property is 0, each raw line of clip text is returned

-------------------------------------
-- NWC Clip Text item iterator.
-- Opens the clip text input stream and returns an iterator function that
-- returns a new notation object represented as a line of text. The 
-- construct:
-- 
--		for item in nwcut.items() do
--			*body*
--		end
-- 
-- will iterate over all clip text items. When the iterator function detects
-- the end of the clip text items, it returns nil (to finish the loop).
-- 
-- @function [parent=#nwcut] items
-- @return an iterator for cycling through NWC text (see @{#nwcut.getitem})

-------------------------------------
-- Retrieves a property of the current user tool environment.
-- The following propName properties are maintained for each running tool instance:
--
-- * FileName - the filename for the current input NWC text (if available)
-- * SavePending - indicates when a save is pending in the NWC editor
-- * StartingLine - the starting header for the input clip or file
-- * EndingLine - the expected ending footer for the input clip or file
-- * HdrVersion - the version designated within the input header
-- * Mode - the numeric input mode, which will be @{#nwcut.const.mode_ClipText} or @{#nwcut.const.mode_FileText}
-- * ReturnMode - indicates the tool's expected return mode (@{#nwcut.const.mode_ClipText} or @{#nwcut.const.mode_FileText})
-- * ItemLevel - the default level used by @{#nwcut.getitem}, @{#nwcut.items}, and the @{nwcItem} constructor
--
-- Most property values are set by the contents of the input stream. ItemLevel is the exception. It defaults
-- to 0, but can be set using @{#nwcut.setlevel}.
-- @function [parent=#nwcut] getprop
-- @param #string propName The name of the property to retrieve (from the above list).
-- @return The current value of the property is returned.

-------------------------------------
-- Sets the default construction level for @{#nwcut.getitem}, @{#nwcut.items}, or the @{nwcItem} constructor.
-- The level can currently be set from 0 through 2, with 2 creating the most
-- expanded version of a NWC text line. When set to 0, @{#nwcut.getitem} returns
-- the raw text stream of NWC text. When set to 1 or more, @{#nwcut.getitem} return
-- each NWC text line as a nwcItem object.
-- @function [parent=#nwcut] setlevel
-- @param #number lvl The default level that should be used by @{#nwcut.getitem}, @{#nwcut.items}, and the @{nwcItem} constructor.


-------------------------------------
-- Classifies a line of NWC text to assist in the processing the user tool input.
-- @function [parent=#nwcut] ClassifyLine
-- @param #string ln The line of input NWC text that should be classified.
-- @return #number Returns @{#nwcut.const.ltyp_FormatHeader}, @{#nwcut.const.ltyp_Comment}, or @{#nwcut.const.ltyp_Object}.

-------------------------------------
-- Classifies an object type to assist in further processing its contents.
-- @function [parent=#nwcut] ClassifyObjType
-- @param #string ObjType The object type that should be classified.
-- @return #number Returns @{#nwcut.const.objtyp_Error}, @{#nwcut.const.objtyp_FileProperty}, @{#nwcut.const.objtyp_StaffProperty}, @{#nwcut.const.objtyp_StaffLyric}, or @{#nwcut.const.objtyp_StaffNotation}.

-------------------------------------
-- Extract the object type froma line of NWC text.
-- @function [parent=#nwcut] objtyp
-- @param #string txtLine A line of NWC text representing a notation object.
-- @return #string Returns the object type, for example, Clef, Note, Rest, Bar, etc.

-------------------------------------
-- Classifies a NWC text field label to assist in further processing its contents.
-- @function [parent=#nwcut] ClassifyOptTag
-- @param #string ObjType The object type.
-- @param #string Tag The field label.
-- @return #number Returns @{#nwcut.const.opt_Raw}, @{#nwcut.const.opt_Num}, @{#nwcut.const.opt_Text}, @{#nwcut.const.opt_List}, or @{#nwcut.const.opt_Associative}.

-------------------------------------
-- Calculates the MIDI pitch value at the staff center line for the provided clef type.
-- @function [parent=#nwcut] GetClefStdCenterTone
-- @param #string clef The clef type.
-- @return #number Returns a MIDI pitch

-------------------------------------
-- Calculates the accidental that corresponds to a pitch offset.
-- @function [parent=#nwcut] GetOffsetAccidental
-- @param #number offset The pitch offset, which can be from -2 up to 2 semitones
-- @return #string Returns the accidental character that corresponds to the pitch offset

-------------------------------------
-- Calculates the pitch offset for the provided accidental character.
-- @function [parent=#nwcut] GetAccidentalOffset
-- @param #string acc The accidental character (as a string)
-- @return #number Returns the pitch offset for the associated accidental

-------------------------------------
-- Used to process NWC text option data as it is captured into a @{nwcItem} object.
-- @function [parent=#nwcut] CaptureOptData
-- @param #number Level The level of capure that will be performed.
-- @param #string ObjType The object type.
-- @param #string Tag The field label.
-- @param #string Data The actual field data.
-- @return Returns a suitable object that represents the field.

-------------------------------------
-- nwcut standard write function.
-- Writes the value of each of its arguments to the output. The arguments
-- must be strings or numbers. To write other values, use `tostring` or
-- `string.format` before `write`.
-- @function [parent=#nwcut] write
-- @param ... must be strings or a numbers.

-------------------------------------
-- User tool higher level output function.
-- Writes the value of each of its arguments to the output. The arguments
-- can include tables/objects that support the WriteUsing method. A new line
-- is automatically added to the output of this function.
-- @function [parent=#nwcut] writeline
-- @param ... Any object that supports WriteUsing or the tostring function.

-------------------------------------
-- nwcut output warning text.
-- Writes the value of each of its arguments to the standard error stream.
-- The arguments must be strings or numbers. To write other values, use 
-- `tostring` or `string.format`.
-- @function [parent=#nwcut] warn
-- @param ... must be strings or a numbers.

-------------------------------------
-- nwcut message box.
-- Issues a message to the user with a standard message box. The user is
-- given the opportunity to cancel the user tool.
-- @function [parent=#nwcut] msgbox
-- @param msg the message text to issue to the user
-- @param msgtitle the title for the message box (optional)
-- @return #number is always 0 when user does not cancel

-------------------------------------
-- nwcut question box.
-- Prompts the user with a standard message box. The user is given the 
-- opportunity to answer the question, or cancel the user tool.
-- @function [parent=#nwcut] askbox
-- @param msg the message text to issue to the user
-- @param msgtitle the title for the message box (optional)
-- @param #number flags assigns the default action, 1 for Yes (default),
--  and 2 for No
-- @return #number the answer, 1 for Yes, and 2 for No

-------------------------------------
-- nwcut user prompt.
-- Prompts the user for additional information. The user is given the 
-- opportunity to respond to the prompt, or cancel the user tool.
-- @function [parent=#nwcut] prompt
-- @param msg the message text to issue to the user
-- @param datatype What kind of control/data is expected (optional, default="*").
-- Supported types are:
-- 
-- * "*" indicates a text response
-- * "#" indicates a numeric/integer response; the range can be specified in brackets (e.g. "#[-2,5]" supports values from -2 through 5)
-- * "|" indicates a list of items, each separated by a vertical bar (e.g. "|Note|Bar|Rest" contains a list of three elements)
--
-- @param default The default data is the user simply accepts the prompt.
-- @return the user response


-------------------------------------------------------------------------------
-- nwcut constants.
-- The nwcut.const table contains constants used in processing lines/items from the input.
-- @type nwcut.const
-- @field mode_ClipText return value from nwcut.getprop('Mode') when a single staff clip is on the input
-- @field mode_FileText return value from nwcut.getprop('Mode') when an entire NWC file is on the input
-- @field rc_Success User tool return value when a new clip or file has been created (see @{#nwcut.status})
-- @field rc_Error User tool return value when an error occurs (see @{#nwcut.status})
-- @field rc_Report User tool return value that triggers a report back to the user (see @{#nwcut.status})
-- @field ltyp_Error line cannot be classified (see @{#nwcut.ClassifyLine})
-- @field ltyp_FormatHeader line contains header text  (see @{#nwcut.ClassifyLine})
-- @field ltyp_Comment line contains comment (see @{#nwcut.ClassifyLine})
-- @field ltyp_Object line contains a notation instruction (see @{#nwcut.ClassifyLine})
-- @field objtyp_Error Unrecognized object type (see @{#nwcut.ClassifyObjType})
-- @field objtyp_FileProperty Object describes a file property (see @{#nwcut.ClassifyObjType})
-- @field objtyp_StaffProperty Object describes one or more staff properties (see @{#nwcut.ClassifyObjType})
-- @field objtyp_StaffLyric Object describes a staff lyric (see @{#nwcut.ClassifyObjType})
-- @field objtyp_StaffNotation Object describes a staff notation item (see @{#nwcut.ClassifyObjType})
-- @field opt_Raw Object field contains raw data (see @{#nwcut.ClassifyOptTag})
-- @field opt_Num Object field contains a number (see @{#nwcut.ClassifyOptTag})
-- @field opt_Text Object field contains text (see @{#nwcut.ClassifyOptTag})
-- @field opt_List Object field contains list data (see @{#nwcut.ClassifyOptTag})
-- @field opt_Associative Object field contains associative data (see @{#nwcut.ClassifyOptTag})
-- @field opt_NotePos Object field contains note position data (see @{#nwcut.ClassifyOptTag})


return nil