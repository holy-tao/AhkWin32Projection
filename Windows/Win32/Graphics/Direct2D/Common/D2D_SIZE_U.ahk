#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Stores an ordered pair of integers, typically the width and height of a rectangle.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_size_u
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D_SIZE_U extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The horizontal component of this size.
     * @type {Integer}
     */
    width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The vertical component of this size.
     * @type {Integer}
     */
    height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
