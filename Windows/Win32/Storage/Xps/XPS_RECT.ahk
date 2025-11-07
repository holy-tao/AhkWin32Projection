#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the width, height, and location of a rectangle.
 * @remarks
 * 
 * The measurement units depend on the context and are not specified in the structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ns-xpsobjectmodel-xps_rect
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_RECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The x-coordinate of the rectangle's left side.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The y-coordinate of the rectangle's top side.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * A non-negative value that represents the  object's size in the horizontal (x) dimension.
     * @type {Float}
     */
    width {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * A non-negative value that represents the  object's size in the vertical (y) dimension.
     * @type {Float}
     */
    height {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
