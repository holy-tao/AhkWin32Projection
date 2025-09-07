#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents an x-coordinate and y-coordinate pair, expressed as an unsigned 32-bit integer value, in two-dimensional space.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_point_2u
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_POINT_2U extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The x-coordinate value of the point.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The y-coordinate value of the point.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
