#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_HDR_METADATA_HDR10PLUS extends Win32Struct {
    static sizeof => 72

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 0, 72, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
