#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a point, radius pair that makes up part of a D2D1_INK_BEZIER_SEGMENT.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ns-d2d1_3-d2d1_ink_point
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_INK_POINT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The x-coordinate of the point.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The y-coordinate of the point.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The radius of this point. Corresponds to the width of the ink stroke at this point in the stroke.
     * @type {Float}
     */
    radius {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
