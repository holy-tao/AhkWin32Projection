#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * A vector of 4 FLOAT values (x, y, z, w).
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_vector_4f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_VECTOR_4F extends Win32Struct
{
    static sizeof => 16

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

    /**
     * The z value of the vector.
     * @type {Float}
     */
    z {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The w value of the vector.
     * @type {Float}
     */
    w {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
