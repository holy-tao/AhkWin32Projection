#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_3x4_COLORSPACE_TRANSFORM extends Win32Struct {
    static sizeof => 32824

    static packingSize => 8

    /**
     * @type {Array<Float>}
     */
    ColorMatrix3x4 {
        get {
            if(!this.HasProp("__ColorMatrix3x4ProxyArray"))
                this.__ColorMatrix3x4ProxyArray := Win32FixedArray(this.ptr + 0, 12, Primitive, "float")
            return this.__ColorMatrix3x4ProxyArray
        }
    }

    /**
     * @type {Float}
     */
    ScalarMultiplier {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }

    /**
     * @type {Array<Pointer>}
     */
    LookupTable1D {
        get {
            if(!this.HasProp("__LookupTable1DProxyArray"))
                this.__LookupTable1DProxyArray := Win32FixedArray(this.ptr + 56, 4096, Primitive, "ptr")
            return this.__LookupTable1DProxyArray
        }
    }
}
