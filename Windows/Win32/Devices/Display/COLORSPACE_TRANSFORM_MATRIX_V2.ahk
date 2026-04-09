#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COLORSPACE_TRANSFORM_STAGE_CONTROL.ahk
#Include .\GAMMA_RAMP_RGB.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class COLORSPACE_TRANSFORM_MATRIX_V2 extends Win32Struct {
    static sizeof => 98352

    static packingSize => 4

    /**
     * @type {COLORSPACE_TRANSFORM_STAGE_CONTROL}
     */
    StageControlLookupTable1DDegamma {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {GAMMA_RAMP_RGB}
     */
    LookupTable1DDegamma {
        get {
            if(!this.HasProp("__LookupTable1DDegammaProxyArray"))
                this.__LookupTable1DDegammaProxyArray := Win32FixedArray(this.ptr + 4, 4096, GAMMA_RAMP_RGB, "")
            return this.__LookupTable1DDegammaProxyArray
        }
    }

    /**
     * @type {COLORSPACE_TRANSFORM_STAGE_CONTROL}
     */
    StageControlColorMatrix3x3 {
        get => NumGet(this, 49156, "int")
        set => NumPut("int", value, this, 49156)
    }

    /**
     * @type {Array<Float>}
     */
    ColorMatrix3x3 {
        get {
            if(!this.HasProp("__ColorMatrix3x3ProxyArray"))
                this.__ColorMatrix3x3ProxyArray := Win32FixedArray(this.ptr + 49160, 9, Primitive, "float")
            return this.__ColorMatrix3x3ProxyArray
        }
    }

    /**
     * @type {COLORSPACE_TRANSFORM_STAGE_CONTROL}
     */
    StageControlLookupTable1DRegamma {
        get => NumGet(this, 49196, "int")
        set => NumPut("int", value, this, 49196)
    }

    /**
     * @type {GAMMA_RAMP_RGB}
     */
    LookupTable1DRegamma {
        get {
            if(!this.HasProp("__LookupTable1DRegammaProxyArray"))
                this.__LookupTable1DRegammaProxyArray := Win32FixedArray(this.ptr + 49200, 4096, GAMMA_RAMP_RGB, "")
            return this.__LookupTable1DRegammaProxyArray
        }
    }
}
