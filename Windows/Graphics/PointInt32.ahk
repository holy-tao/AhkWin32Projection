#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Defines a point in a two-dimensional plane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.pointint32
 * @namespace Windows.Graphics
 * @version WindowsRuntime 1.4
 */
class PointInt32 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The X coordinate value of a point.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The Y coordinate value of a point.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
