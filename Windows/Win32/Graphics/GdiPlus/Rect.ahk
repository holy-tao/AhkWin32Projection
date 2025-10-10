#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A Rect object stores the upper-left corner, width, and height of a rectangle.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/nl-gdiplustypes-rect
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Rect extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
