#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include .\D3DKMT_SCATTERBLT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_SCATTERBLTS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumBlts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<D3DKMT_SCATTERBLT>}
     */
    Blts{
        get {
            if(!this.HasProp("__BltsProxyArray"))
                this.__BltsProxyArray := Win32FixedArray(this.ptr + 8, 12, Primitive, "ptr")
            return this.__BltsProxyArray
        }
    }
}
