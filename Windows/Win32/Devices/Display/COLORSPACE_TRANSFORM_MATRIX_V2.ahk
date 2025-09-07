#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GAMMA_RAMP_RGB.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_MATRIX_V2 extends Win32Struct
{
    static sizeof => 65592

    static packingSize => 8

    /**
     * @type {Integer}
     */
    StageControlLookupTable1DDegamma {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<GAMMA_RAMP_RGB>}
     */
    LookupTable1DDegamma{
        get {
            if(!this.HasProp("__LookupTable1DDegammaProxyArray"))
                this.__LookupTable1DDegammaProxyArray := Win32FixedArray(this.ptr + 8, 8, GAMMA_RAMP_RGB, "")
            return this.__LookupTable1DDegammaProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    StageControlColorMatrix3x3 {
        get => NumGet(this, 32776, "int")
        set => NumPut("int", value, this, 32776)
    }

    /**
     * @type {Array<Single>}
     */
    ColorMatrix3x3{
        get {
            if(!this.HasProp("__ColorMatrix3x3ProxyArray"))
                this.__ColorMatrix3x3ProxyArray := Win32FixedArray(this.ptr + 32780, 4, Primitive, "float")
            return this.__ColorMatrix3x3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    StageControlLookupTable1DRegamma {
        get => NumGet(this, 32816, "int")
        set => NumPut("int", value, this, 32816)
    }

    /**
     * @type {Array<GAMMA_RAMP_RGB>}
     */
    LookupTable1DRegamma{
        get {
            if(!this.HasProp("__LookupTable1DRegammaProxyArray"))
                this.__LookupTable1DRegammaProxyArray := Win32FixedArray(this.ptr + 32824, 8, GAMMA_RAMP_RGB, "")
            return this.__LookupTable1DRegammaProxyArray
        }
    }
}
