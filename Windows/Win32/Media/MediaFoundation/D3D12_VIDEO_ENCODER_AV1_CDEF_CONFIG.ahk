#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_CDEF_CONFIG extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CdefBits {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CdefDampingMinus3 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<UInt64>}
     */
    CdefYPriStrength{
        get {
            if(!this.HasProp("__CdefYPriStrengthProxyArray"))
                this.__CdefYPriStrengthProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "uint")
            return this.__CdefYPriStrengthProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    CdefUVPriStrength{
        get {
            if(!this.HasProp("__CdefUVPriStrengthProxyArray"))
                this.__CdefUVPriStrengthProxyArray := Win32FixedArray(this.ptr + 80, 8, Primitive, "uint")
            return this.__CdefUVPriStrengthProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    CdefYSecStrength{
        get {
            if(!this.HasProp("__CdefYSecStrengthProxyArray"))
                this.__CdefYSecStrengthProxyArray := Win32FixedArray(this.ptr + 144, 8, Primitive, "uint")
            return this.__CdefYSecStrengthProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    CdefUVSecStrength{
        get {
            if(!this.HasProp("__CdefUVSecStrengthProxyArray"))
                this.__CdefUVSecStrengthProxyArray := Win32FixedArray(this.ptr + 208, 8, Primitive, "uint")
            return this.__CdefUVSecStrengthProxyArray
        }
    }
}
