#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ENUMADAPTERS extends Win32Struct {
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumAdapters {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Pointer>}
     */
    Adapters {
        get {
            if(!this.HasProp("__AdaptersProxyArray"))
                this.__AdaptersProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "ptr")
            return this.__AdaptersProxyArray
        }
    }
}
