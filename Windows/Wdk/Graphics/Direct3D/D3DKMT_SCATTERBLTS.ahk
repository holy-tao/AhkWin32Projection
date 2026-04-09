#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_SCATTERBLTS extends Win32Struct {
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
     * @type {Array<Pointer>}
     */
    Blts {
        get {
            if(!this.HasProp("__BltsProxyArray"))
                this.__BltsProxyArray := Win32FixedArray(this.ptr + 8, 12, Primitive, "ptr")
            return this.__BltsProxyArray
        }
    }
}
