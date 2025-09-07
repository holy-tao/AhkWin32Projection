#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The RECT structure defines a rectangle by the coordinates of its upper-left and lower-right corners.
 * @remarks
 * The RECT structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/windef/ns-windef-rect
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class RECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the <i>x</i>-coordinate of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    left {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the <i>y</i>-coordinate of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    top {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the <i>x</i>-coordinate of the lower-right corner of the rectangle.
     * @type {Integer}
     */
    right {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies the <i>y</i>-coordinate of the lower-right corner of the rectangle.
     * @type {Integer}
     */
    bottom {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
