-------------------------------------------------------------------------------
-- Object class for emulating play context.
-- This class requires level 2 for the @{nwcut#nwcut.setlevel} property.
-- @module nwcPlayContext

-------------------------------------------------------------------------------
-- @type nwcPlayContext
-- @field #string ID Contains the name of the object type (nwcPlayContext)
-- @field #string Clef The current clef
-- @field #string ClefOctave The current clef octave
-- @field #number Transposition The current number of semitones of transposition applied during play back
-- @field #string KeyTonic The current key signature Tonic (a note name, one of C,D,E,F,G,A,B)
-- @field #number NextBarNum The current bar/measure number
-- @field #boolean PendingBarIncrement When on, the bar count needs to be incremented at the next note
-- @field #boolean Slur True when a slur is currently running
-- @field #boolean SeenFirstEnding Indicates when a first ending has been encountered and Ending1Context contains valid information to restore context in later endings
-- @field #table Ending1Context Contains needed context at the prior first ending, which is used for context in later endings
-- @field #table RunKey An associative array of note names, each tracking the number of semitone shift in the current measure that should be applied to notes without an accidental assigned
-- @field #table Key An associative array of note names, each tracking the number of semitone shift present in the current key signature
-- @field #table Ties A list of currently running note ties, stored as a string with the accidental and noteposition of each tie

-------------------------------------
-- Constructs a new nwcPlayContext object.
-- If the @{nwcut#nwcut.setlevel} property has not been previously set, then constructing
-- a nwcPlayContext object will set the default nwcItem level to 2.
-- @function [parent=#nwcPlayContext] new
-- @return #nwcPlayContext A new nwcPlayContext object.

-------------------------------------
-- Get the current bar/measure number.
-- @function [parent=#nwcPlayContext] GetBarNum
-- @param self an object.
-- @return #number The current bar number

-------------------------------------
-- Get the current clef octave shift.
-- @function [parent=#nwcPlayContext] GetOctaveShift
-- @param self an object.
-- @return #number The current octave shift (one of -1, 0, or 1)

-------------------------------------
-- Get the current pitch shift.
-- @function [parent=#nwcPlayContext] GetPlayPitchShift
-- @param self an object.
-- @return #number The current pitch shift (in + or - semitones)

-------------------------------------
-- Calculate the note name for the current @{nwcNotePos} object.
-- @function [parent=#nwcPlayContext] GetNoteName
-- @param self an object.
-- @param nwcNotePos#nwcNotePos notepos the note position object
-- @return #string The note name

-------------------------------------
-- Calculate the note accidental for the current @{nwcNotePos} object.
-- @function [parent=#nwcPlayContext] GetNoteAccidental
-- @param self an object.
-- @param nwcNotePos#nwcNotePos notepos the note position object
-- @return #string The note accidental charactacter

-------------------------------------
-- Calculate the octave for the current @{nwcNotePos} object.
-- @function [parent=#nwcPlayContext] GetScientificPitchOctave
-- @param self an object.
-- @param nwcNotePos#nwcNotePos notepos the note position object
-- @return #number The note octave

-------------------------------------
-- Calculate the Midi note number for the current @{nwcNotePos} object.
-- @function [parent=#nwcPlayContext] GetNoteMidiPitch
-- @param self an object.
-- @param nwcNotePos#nwcNotePos notepos the note position object
-- @return #number The Midi note number

-------------------------------------
-- Finds an existing note tie for the current @{nwcNotePos} object, or the string tie spec stored in the @{#nwcPlayContext.Ties} table.
-- @function [parent=#nwcPlayContext] FindTieIndex
-- @param self an object.
-- @param o the note position object @{nwcNotePos} or a accidental/position string
-- @return #number If found, the index into the @{#nwcPlayContext.Ties} table is returned
-- @return #boolean False is returned if a tie is not currently running at the position

-------------------------------------
-- Updates the running context with the current @{nwcItem}.
-- This should be called for each object returned from @{nwcut#nwcut.items}. 
-- This function requires a level 2 instance of @{nwcItem} (refer to the @{nwcut#nwcut.setlevel} property).
-- @function [parent=#nwcPlayContext] put
-- @param self an object.
-- @param nwcItem#nwcItem o the current nwc item


return nil