#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents all SVG preserveAspectRatio settings.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1svg/ns-d2d1svg-d2d1_svg_preserve_aspect_ratio
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SVG_PRESERVE_ASPECT_RATIO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Sets the 'defer' portion of the preserveAspectRatio settings. This field only has an effect on an 'image' element that references another SVG document. As
     *           this is not currently supported, the field has no impact on rendering.
     * @type {BOOL}
     */
    defer {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Sets the align portion of the preserveAspectRatio settings.
     * @type {Integer}
     */
    align {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Sets the meetOrSlice portion of the preserveAspectRatio settings.
     * @type {Integer}
     */
    meetOrSlice {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
