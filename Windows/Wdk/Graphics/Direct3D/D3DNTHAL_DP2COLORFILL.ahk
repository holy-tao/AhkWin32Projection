#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\RECTL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DNTHAL_DP2COLORFILL extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSurface {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {RECTL}
     */
    rRect{
        get {
            if(!this.HasProp("__rRect"))
                this.__rRect := RECTL(4, this)
            return this.__rRect
        }
    }

    /**
     * @type {Integer}
     */
    Color {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
