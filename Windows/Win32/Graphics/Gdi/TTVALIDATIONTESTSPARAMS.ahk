#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TTVALIDATIONTESTSPARAMS structure contains parameters for testing a Microsoft OpenType font.
 * @see https://learn.microsoft.com/windows/win32/api/t2embapi/ns-t2embapi-ttvalidationtestsparams
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class TTVALIDATIONTESTSPARAMS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Size, in bytes, of this structure. The client should set this value to <b>sizeof</b>(TTVALIDATIONTESTSPARAMS).
     * @type {Integer}
     */
    ulStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * First character point size to test. This value is the smallest font size (lower bound) of the font sizes to test.
     * @type {Integer}
     */
    lTestFromSize {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Last character point size to test. This value is the largest font size (upper bound) of the font sizes to test.
     * @type {Integer}
     */
    lTestToSize {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    ulCharSet {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Currently not used.
     * @type {Integer}
     */
    usReserved1 {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * If zero, test over all glyphs.
     * @type {Integer}
     */
    usCharCodeCount {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Pointer to array of Unicode characters.
     * @type {Pointer<Integer>}
     */
    pusCharCodeSet {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
