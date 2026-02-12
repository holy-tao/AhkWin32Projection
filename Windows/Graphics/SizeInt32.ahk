#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Defines the height and wide of a surface in a two-dimensional plane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.sizeint32
 * @namespace Windows.Graphics
 * @version WindowsRuntime 1.4
 */
class SizeInt32 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The width of a surface.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The height of a surface.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
