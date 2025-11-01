#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d10/d3d10-d3dvector
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DVECTOR extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    z {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
