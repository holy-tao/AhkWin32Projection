#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The KERNINGPAIR structure defines a kerning pair.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-kerningpair
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class KERNINGPAIR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The character code for the first character in the kerning pair.
     * @type {Integer}
     */
    wFirst {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The character code for the second character in the kerning pair.
     * @type {Integer}
     */
    wSecond {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The amount this pair will be kerned if they appear side by side in the same font and size. This value is typically negative, because pair kerning usually results in two characters being set more tightly than normal. The value is specified in logical units; that is, it depends on the current mapping mode.
     * @type {Integer}
     */
    iKernAmount {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
