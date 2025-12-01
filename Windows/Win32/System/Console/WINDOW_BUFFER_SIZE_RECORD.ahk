#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk

/**
 * See reference information about the WINDOW_BUFFER_SIZE_RECORD structure, which describes a change in the size of the console screen buffer.
 * @remarks
 * Buffer size events are placed in the input buffer when the console is in window-aware mode (**ENABLE\_WINDOW\_INPUT**).
 * @see https://learn.microsoft.com/windows/console/window-buffer-size-record-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class WINDOW_BUFFER_SIZE_RECORD extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A [**COORD**](coord-str.md) structure that contains the size of the console screen buffer, in character cell columns and rows.
     * @type {COORD}
     */
    dwSize{
        get {
            if(!this.HasProp("__dwSize"))
                this.__dwSize := COORD(0, this)
            return this.__dwSize
        }
    }
}
