#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEVINFO_D3DVERTEXSTATS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumRenderedTriangles {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumExtraClippingTriangles {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
