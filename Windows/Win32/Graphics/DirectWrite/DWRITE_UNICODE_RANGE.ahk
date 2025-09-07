#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWRITE_UNICODE_RANGE structure specifies the range of Unicode code points.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_UNICODE_RANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The first code point in the Unicode range.
     * @type {Integer}
     */
    first {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The last code point in the Unicode range.
     * @type {Integer}
     */
    last {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
