#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GAMMA_RAMP_RGB.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_3x4 extends Win32Struct
{
    static sizeof => 32824

    static packingSize => 8

    /**
     * @type {Array<Single>}
     */
    ColorMatrix3x4{
        get {
            if(!this.HasProp("__ColorMatrix3x4ProxyArray"))
                this.__ColorMatrix3x4ProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "float")
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
     * @type {Array<GAMMA_RAMP_RGB>}
     */
    LookupTable1D{
        get {
            if(!this.HasProp("__LookupTable1DProxyArray"))
                this.__LookupTable1DProxyArray := Win32FixedArray(this.ptr + 56, 8, GAMMA_RAMP_RGB, "")
            return this.__LookupTable1DProxyArray
        }
    }
}
