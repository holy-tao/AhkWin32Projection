#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DHAL_DP2SETCLIPPLANE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Single>}
     */
    plane{
        get {
            if(!this.HasProp("__planeProxyArray"))
                this.__planeProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "float")
            return this.__planeProxyArray
        }
    }
}
