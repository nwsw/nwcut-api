-------------------------------------------------------------------------------
-- An object representing a nwc file or staff selection.
-- The nwcFile object is used to encapsulate NWC input. The data is kept
-- in fields that match the nwctxt source lines. For example, 
-- the @{#nwcFile.SongInfo} object contains the file's *Title*, *Author*, 
-- and *Copyright* text.
-- @module nwcFile

-------------------------------------
-- @type nwcFile
-- @field nwcItem#nwcItem Editor This contains the nwctxt Editor properties
-- @field nwcItem#nwcItem SongInfo This contains the nwctxt SongInfo properties
-- @field nwcItem#nwcItem PgSetup This contains the nwctxt PgSetup properties
-- @field nwcItem#nwcItem PgMargins This contains the nwctxt PgMargins properties
-- @field nwcItem#map_nwcItem Font This contains a table map of Font entries. Each entry is mapped by its *Style* name, and stored as a @{nwcItem#nwcItem}
-- @field nwcStaff#list_nwcStaff Staff This is a list of the @{nwcStaff#nwcStaff} objects contained in the file.

----
-- nwcFile constructor.
-- Returns an object representation of a NWCTXT file.
-- @function [parent=#nwcFile] new
-- @return #nwcFile an object representation of a NWCTXT file.

----
-- nwcFile load function.
-- Loads an object representation of a NWC clip or file.
-- @function [parent=#nwcFile] load
-- @param #nwcFile self nwcFile object
-- @param #function itemIterator Item iterator function used to receive the nwctxt data

----
-- nwcFile save function which generates a nwctxt representation.
-- Writes an object representation of a NWC clip or file.
-- @function [parent=#nwcFile] save
-- @param #nwcFile self nwcFile object
-- @param #function writeln function used to write the nwctxt data

----
-- nwcFile getSelection function returns the staff and index range for the editor selection.
-- This function assumes an empty selection should be treated as though the entire contents of the staff is selected.
-- @function [parent=#nwcFile] getSelection
-- @param #nwcFile self nwcFile object
-- @return #nwcStaff,#number,#number the active staff and selection range from left to right.

----
-- nwcFile setSelection function can be used to change the editor selection.
-- This function supports selecting a @{nwcStaff#nwcStaff} object or index.
-- Using a numeric staff index requires that the start and end selection index are also be provided.
-- @function [parent=#nwcFile] setSelection
-- @param #nwcFile self nwcFile object
-- @param p1 An optional staff index or @{nwcStaff#nwcStaff} object, or the starting selection index.
-- @param ... The starting and ending selection index, or just the ending index if staff is not specified.

----
-- nwcFile forSelection function can be used apply a callback filter to all items in the selection.
-- The callback function will be called for every item in the selection. In `clipmode`, the selection
-- will include fake items that provide context. The filterproc callback function is provided with the item object,
-- its selection index, and a flag indicating the last item in the selection:
--
-- `filterproc(o,selIndex,isLastItem)`
--
-- The callback filter can return one of:
--
-- - a replacement item object
-- - a list of objects that should replace the item
-- - the string 'delete' which will cause the item to be removed from the selection
--
-- Here is an example:
--
--		local function MarkAndMuteFinalNote(o,seln,last)
--			-- only work on last item that is a note
--			if not (last and o:ContainsNotes()) then return end
--		
--			-- do nothing if note is already Muted
--			if o:Get('Opts','Muted') then return end
--		
--			local txt = nwcItem.new('|Text')
--			txt:Set('Text','Muted')
--			o:Provide('Opts').Muted = ''
--			return {txt,o}
--		end
--		
--		score:forSelection(MarkAndMuteFinalNote)
--
-- @function [parent=#nwcFile] forSelection
-- @param #nwcFile self nwcFile object
-- @param #function filterproc The callback filter function.
-- @return #nwcFile itself.

return nil