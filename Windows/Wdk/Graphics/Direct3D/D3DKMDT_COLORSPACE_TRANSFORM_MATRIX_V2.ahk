#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_COLORSPACE_TRANSFORM_MATRIX_V2 extends Win32Struct {
    static sizeof => 65592

    static packingSize => 8

    /**
     * @type {D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL}
     */
    StageControlLookupTable1DDegamma {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<Pointer>}
     */
    LookupTable1DDegamma {
        get {
            if(!this.HasProp("__LookupTable1DDegammaProxyArray"))
                this.__LookupTable1DDegammaProxyArray := Win32FixedArray(this.ptr + 8, 4096, Primitive, "ptr")
            return this.__LookupTable1DDegammaProxyArray
        }
    }

    /**
     * @type {D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL}
     */
    StageControlColorMatrix3x3 {
        get => NumGet(this, 32776, "int")
        set => NumPut("int", value, this, 32776)
    }

    /**
     * @type {Array<Float>}
     */
    ColorMatrix3x3 {
        get {
            if(!this.HasProp("__ColorMatrix3x3ProxyArray"))
                this.__ColorMatrix3x3ProxyArray := Win32FixedArray(this.ptr + 32780, 9, Primitive, "float")
            return this.__ColorMatrix3x3ProxyArray
        }
    }

    /**
     * @type {D3DKMDT_COLORSPACE_TRANSFORM_STAGE_CONTROL}
     */
    StageControlLookupTable1DRegamma {
        get => NumGet(this, 32816, "int")
        set => NumPut("int", value, this, 32816)
    }

    /**
     * @type {Array<Pointer>}
     */
    LookupTable1DRegamma {
        get {
            if(!this.HasProp("__LookupTable1DRegammaProxyArray"))
                this.__LookupTable1DRegammaProxyArray := Win32FixedArray(this.ptr + 32824, 4096, Primitive, "ptr")
            return this.__LookupTable1DRegammaProxyArray
        }
    }
}
