#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPEG_DATE structure specifies a date.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_date
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_DATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Specifies the day of the month. The value can range from 1 to 31, inclusive.
     * @type {Integer}
     */
    Date {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the month. The value can range from 1 to 12, inclusive.
     * @type {Integer}
     */
    Month {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the year.
     * @type {Integer}
     */
    Year {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
