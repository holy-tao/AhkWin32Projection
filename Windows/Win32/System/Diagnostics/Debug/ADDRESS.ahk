#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Is obsolete and should not be used.
 * @see https://learn.microsoft.com/windows/win32/NetMon2/address
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class ADDRESS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Segment {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
