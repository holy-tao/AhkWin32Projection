#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of Unicode points (characters).
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-character_range
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class CHARACTER_RANGE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The low Unicode code point in the range of supported Unicode points.
     * @type {Integer}
     */
    wcLow {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The number of supported Unicode points in this range.
     * @type {Integer}
     */
    cChars {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
