#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * A vector of 2 FLOAT values (x, y).
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_vector_2f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_VECTOR_2F extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The x value of the vector.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The y value of the vector.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
