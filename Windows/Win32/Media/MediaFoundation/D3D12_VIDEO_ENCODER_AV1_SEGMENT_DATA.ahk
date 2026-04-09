#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EnabledFeatures {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    FeatureValue {
        get {
            if(!this.HasProp("__FeatureValueProxyArray"))
                this.__FeatureValueProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "int64")
            return this.__FeatureValueProxyArray
        }
    }
}
