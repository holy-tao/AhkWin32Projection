#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION_SUPPORT extends Win32Struct
{
    static sizeof => 84

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SupportedFeatureFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RequiredFeatureFlags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SupportedInterpolationFilters {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<Int32>}
     */
    SupportedRestorationParams{
        get {
            if(!this.HasProp("__SupportedRestorationParamsProxyArray"))
                this.__SupportedRestorationParamsProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "int")
            return this.__SupportedRestorationParamsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SupportedSegmentationModes {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Array<Int32>}
     */
    SupportedTxModes{
        get {
            if(!this.HasProp("__SupportedTxModesProxyArray"))
                this.__SupportedTxModesProxyArray := Win32FixedArray(this.ptr + 52, 4, Primitive, "int")
            return this.__SupportedTxModesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SegmentationBlockSize {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    PostEncodeValuesFlags {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    MaxTemporalLayers {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    MaxSpatialLayers {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
