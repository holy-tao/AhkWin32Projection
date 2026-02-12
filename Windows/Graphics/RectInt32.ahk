#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Defines the size and location of a rectangular surface.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.rectint32
 * @namespace Windows.Graphics
 * @version WindowsRuntime 1.4
 */
class RectInt32 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The X coordinate of the top-left corner of the rectangle.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The Y coordinate of the top-left corner of the rectangle.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The width of a rectangle.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The height of a rectangle.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
