#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WCRANGE structure specifies a range of Unicode characters.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-wcrange
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class WCRANGE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Low Unicode code point in the range of supported Unicode code points.
     * @type {Integer}
     */
    wcLow {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Number of supported Unicode code points in this range.
     * @type {Integer}
     */
    cGlyphs {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
