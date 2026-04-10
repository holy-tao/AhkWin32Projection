#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_GAMMA_RAMP_RGB256x3x16 extends Win32Struct {
    static sizeof => 1536

    static packingSize => 2

    /**
     * @type {Array<Integer>}
     */
    Red {
        get {
            if(!this.HasProp("__RedProxyArray"))
                this.__RedProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "ushort")
            return this.__RedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Green {
        get {
            if(!this.HasProp("__GreenProxyArray"))
                this.__GreenProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "ushort")
            return this.__GreenProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Blue {
        get {
            if(!this.HasProp("__BlueProxyArray"))
                this.__BlueProxyArray := Win32FixedArray(this.ptr + 1024, 256, Primitive, "ushort")
            return this.__BlueProxyArray
        }
    }
}
