#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a rectangle.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3drect
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DRECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: **[**LONG**](../winprog/windows-data-types.md)**
     * 
     * 
     * The x-coordinate of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    x1 {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[**LONG**](../winprog/windows-data-types.md)**
     * 
     * 
     * The y-coordinate of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    y1 {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **[**LONG**](../winprog/windows-data-types.md)**
     * 
     * 
     * The x-coordinate of the lower-right corner of the rectangle.
     * @type {Integer}
     */
    x2 {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: **[**LONG**](../winprog/windows-data-types.md)**
     * 
     * 
     * The y-coordinate of the lower-right corner of the rectangle.
     * @type {Integer}
     */
    y2 {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
