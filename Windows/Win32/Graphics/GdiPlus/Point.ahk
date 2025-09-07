#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an ordered pair of floating-point x- and y-coordinates that defines a point in a two-dimensional plane.
 * @see https://learn.microsoft.com/windows/win32/api/windows.foundation/ns-windows-foundation-point
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Point extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
