#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes a focus event in a console INPUT\_RECORD structure. These events are used internally and should be ignored.
 * @see https://learn.microsoft.com/windows/console/focus-event-record-str
 * @namespace Windows.Win32.System.Console
 */
export default struct FOCUS_EVENT_RECORD {
    #StructPack 4

    /**
     * Reserved.
     */
    bSetFocus : BOOL

}
