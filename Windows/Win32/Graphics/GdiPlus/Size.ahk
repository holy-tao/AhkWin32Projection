#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an ordered pair of floating-point numbers that specify a height and width.
 * @see https://learn.microsoft.com/windows/win32/api/windows.foundation/ns-windows-foundation-size
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Size extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
