#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents an x-coordinate and y-coordinate pair, expressed as floating-point values, in two-dimensional space.
 * @see https://docs.microsoft.com/windows/win32/api//dcommon/ns-dcommon-d2d_point_2f
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_POINT_2F extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The x-coordinate of the point.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The y-coordinate of the point.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
