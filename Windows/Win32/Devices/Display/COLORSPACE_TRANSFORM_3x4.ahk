#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GAMMA_RAMP_RGB.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class COLORSPACE_TRANSFORM_3x4 extends Win32Struct {
    static sizeof => 49204

    static packingSize => 4

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
     * @type {GAMMA_RAMP_RGB}
     */
    LookupTable1D {
        get {
            if(!this.HasProp("__LookupTable1DProxyArray"))
                this.__LookupTable1DProxyArray := Win32FixedArray(this.ptr + 52, 4096, GAMMA_RAMP_RGB, "")
            return this.__LookupTable1DProxyArray
        }
    }
}
