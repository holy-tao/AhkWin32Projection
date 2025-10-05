#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a focus event in a console INPUT\_RECORD structure. These events are used internally and should be ignored.
 * @see https://learn.microsoft.com/windows/console/focus-event-record-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class FOCUS_EVENT_RECORD extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Reserved.
     * @type {Integer}
     */
    bSetFocus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
