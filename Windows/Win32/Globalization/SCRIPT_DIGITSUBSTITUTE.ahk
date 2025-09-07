#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains native digit and digit substitution settings.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_digitsubstitute
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_DIGITSUBSTITUTE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; initialize to 0.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
