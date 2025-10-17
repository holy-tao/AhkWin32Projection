#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_DELTA_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_DELTA_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_CDEF_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_CONFIG.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_POST_ENCODE_VALUES extends Win32Struct
{
    static sizeof => 704

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CompoundPredictionType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_CONFIG}
     */
    LoopFilter{
        get {
            if(!this.HasProp("__LoopFilter"))
                this.__LoopFilter := D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_CONFIG(8, this)
            return this.__LoopFilter
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_DELTA_CONFIG}
     */
    LoopFilterDelta{
        get {
            if(!this.HasProp("__LoopFilterDelta"))
                this.__LoopFilterDelta := D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_DELTA_CONFIG(152, this)
            return this.__LoopFilterDelta
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_CONFIG}
     */
    Quantization{
        get {
            if(!this.HasProp("__Quantization"))
                this.__Quantization := D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_CONFIG(176, this)
            return this.__Quantization
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_DELTA_CONFIG}
     */
    QuantizationDelta{
        get {
            if(!this.HasProp("__QuantizationDelta"))
                this.__QuantizationDelta := D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_DELTA_CONFIG(256, this)
            return this.__QuantizationDelta
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_CDEF_CONFIG}
     */
    CDEF{
        get {
            if(!this.HasProp("__CDEF"))
                this.__CDEF := D3D12_VIDEO_ENCODER_AV1_CDEF_CONFIG(272, this)
            return this.__CDEF
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_CONFIG}
     */
    SegmentationConfig{
        get {
            if(!this.HasProp("__SegmentationConfig"))
                this.__SegmentationConfig := D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_CONFIG(544, this)
            return this.__SegmentationConfig
        }
    }

    /**
     * @type {Integer}
     */
    PrimaryRefFrame {
        get => NumGet(this, 640, "uint")
        set => NumPut("uint", value, this, 640)
    }

    /**
     * @type {Array<UInt64>}
     */
    ReferenceIndices{
        get {
            if(!this.HasProp("__ReferenceIndicesProxyArray"))
                this.__ReferenceIndicesProxyArray := Win32FixedArray(this.ptr + 648, 7, Primitive, "uint")
            return this.__ReferenceIndicesProxyArray
        }
    }
}
