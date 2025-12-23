#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an x- and y-coordinate pair in two-dimensional space. (XPS_POINT)
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_POINT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The x-coordinate of a point.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The y-coordinate of a point.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
