#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class TIME_STRUCT extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    hour {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    minute {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    second {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
