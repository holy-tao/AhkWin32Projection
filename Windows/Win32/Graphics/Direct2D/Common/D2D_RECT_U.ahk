#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a rectangle defined by the upper-left corner pair of coordinates (left,top) and the lower-right corner pair of coordinates (right, bottom). These coordinates are expressed as a 32-bit integer values.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_rect_u
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_RECT_U extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The x-coordinate of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    left {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The y-coordinate of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    top {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The x-coordinate of the lower-right corner of the rectangle.
     * @type {Integer}
     */
    right {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The y-coordinate of the lower-right corner of the rectangle.
     * @type {Integer}
     */
    bottom {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
