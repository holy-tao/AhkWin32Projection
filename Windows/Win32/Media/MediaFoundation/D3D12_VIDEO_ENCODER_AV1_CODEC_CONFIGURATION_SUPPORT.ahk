#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_RESTORATION_SUPPORT_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_TX_MODE_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_BLOCK_SIZE.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAGS.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_AV1_CODEC_CONFIGURATION_SUPPORT extends Win32Struct {
    static sizeof => 84

    static packingSize => 4

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS}
     */
    SupportedFeatureFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_FEATURE_FLAGS}
     */
    RequiredFeatureFlags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_INTERPOLATION_FILTERS_FLAGS}
     */
    SupportedInterpolationFilters {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<D3D12_VIDEO_ENCODER_AV1_RESTORATION_SUPPORT_FLAGS>}
     */
    SupportedRestorationParams {
        get {
            if(!this.HasProp("__SupportedRestorationParamsProxyArray"))
                this.__SupportedRestorationParamsProxyArray := Win32FixedArray(this.ptr + 12, 9, Primitive, "int")
            return this.__SupportedRestorationParamsProxyArray
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MODE_FLAGS}
     */
    SupportedSegmentationModes {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Array<D3D12_VIDEO_ENCODER_AV1_TX_MODE_FLAGS>}
     */
    SupportedTxModes {
        get {
            if(!this.HasProp("__SupportedTxModesProxyArray"))
                this.__SupportedTxModesProxyArray := Win32FixedArray(this.ptr + 52, 4, Primitive, "int")
            return this.__SupportedTxModesProxyArray
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_BLOCK_SIZE}
     */
    SegmentationBlockSize {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES_FLAGS}
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
