#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a rectangle defined by the coordinates of the upper-left corner (left, top) and the coordinates of the lower-right corner (right, bottom).
 * @see https://docs.microsoft.com/windows/win32/api//dcommon/ns-dcommon-d2d_rect_f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_RECT_F extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the upper-left corner of the rectangle.
     * @type {Float}
     */
    left {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the upper-left corner of the rectangle.
     * @type {Float}
     */
    top {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the lower-right corner of the rectangle.
     * @type {Float}
     */
    right {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the lower-right corner of the rectangle.
     * @type {Float}
     */
    bottom {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
