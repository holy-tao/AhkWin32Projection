#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Stores an ordered pair of floating-point values, typically the width and height of a rectangle.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_size_f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_SIZE_F extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The horizontal component of this size.
     * @type {Float}
     */
    width {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The vertical component of this size.
     * @type {Float}
     */
    height {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
