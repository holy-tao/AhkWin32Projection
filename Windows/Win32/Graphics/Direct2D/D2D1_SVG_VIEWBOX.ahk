#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an SVG viewBox.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ns-d2d1svg-d2d1_svg_viewbox
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_VIEWBOX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * X coordinate of the view box.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Y coordinate of the view box.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Width of the view box.
     * @type {Float}
     */
    width {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Height of the view box.
     * @type {Float}
     */
    height {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
