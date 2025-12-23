#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the size of an object.
 * @remarks
 * The measurement units are not specified in the structure.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_SIZE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A non-negative value that represents the  object's size in the horizontal (x) dimension.
     * @type {Float}
     */
    width {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * A non-negative value that represents the  object's size in the vertical (y) dimension.
     * @type {Float}
     */
    height {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
