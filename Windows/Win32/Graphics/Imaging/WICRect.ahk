#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a rectangle for Windows Imaging Component (WIC) API.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicrect
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICRect extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>INT</b>
     * 
     * The horizontal coordinate of the rectangle.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>INT</b>
     * 
     * The vertical coordinate of the rectangle.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>INT</b>
     * 
     * The width of the rectangle.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>INT</b>
     * 
     * The height of the rectangle.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
