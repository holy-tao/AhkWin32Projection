#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an SVG length.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ns-d2d1svg-d2d1_svg_length
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_LENGTH extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Float}
     */
    value {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    units {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
