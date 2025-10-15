#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_RESTORATION_CONFIG.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_WARPED_MOTION_INFO.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_DESCRIPTOR.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_DELTA_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_DELTA_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_CDEF_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEGMENT_DATA.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_CONFIG.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MAP.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_CODEC_DATA extends Win32Struct
{
    static sizeof => 832

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FrameType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CompoundPredictionType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    InterpolationFilter {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_RESTORATION_CONFIG}
     */
    FrameRestorationConfig{
        get {
            if(!this.HasProp("__FrameRestorationConfig"))
                this.__FrameRestorationConfig := D3D12_VIDEO_ENCODER_AV1_RESTORATION_CONFIG(this.ptr + 16)
            return this.__FrameRestorationConfig
        }
    }

    /**
     * @type {Integer}
     */
    TxMode {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    SuperResDenominator {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    OrderHint {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    PictureIndex {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    TemporalLayerIndexPlus1 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    SpatialLayerIndexPlus1 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Array<D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_DESCRIPTOR>}
     */
    ReferenceFramesReconPictureDescriptors{
        get {
            if(!this.HasProp("__ReferenceFramesReconPictureDescriptorsProxyArray"))
                this.__ReferenceFramesReconPictureDescriptorsProxyArray := Win32FixedArray(this.ptr + 64, 8, D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_DESCRIPTOR, "")
            return this.__ReferenceFramesReconPictureDescriptorsProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    ReferenceIndices{
        get {
            if(!this.HasProp("__ReferenceIndicesProxyArray"))
                this.__ReferenceIndicesProxyArray := Win32FixedArray(this.ptr + 128, 7, Primitive, "uint")
            return this.__ReferenceIndicesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    PrimaryRefFrame {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    RefreshFrameFlags {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_CONFIG}
     */
    LoopFilter{
        get {
            if(!this.HasProp("__LoopFilter"))
                this.__LoopFilter := D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_CONFIG(this.ptr + 168)
            return this.__LoopFilter
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_DELTA_CONFIG}
     */
    LoopFilterDelta{
        get {
            if(!this.HasProp("__LoopFilterDelta"))
                this.__LoopFilterDelta := D3D12_VIDEO_ENCODER_CODEC_AV1_LOOP_FILTER_DELTA_CONFIG(this.ptr + 312)
            return this.__LoopFilterDelta
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_CONFIG}
     */
    Quantization{
        get {
            if(!this.HasProp("__Quantization"))
                this.__Quantization := D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_CONFIG(this.ptr + 336)
            return this.__Quantization
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_DELTA_CONFIG}
     */
    QuantizationDelta{
        get {
            if(!this.HasProp("__QuantizationDelta"))
                this.__QuantizationDelta := D3D12_VIDEO_ENCODER_CODEC_AV1_QUANTIZATION_DELTA_CONFIG(this.ptr + 416)
            return this.__QuantizationDelta
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_CDEF_CONFIG}
     */
    CDEF{
        get {
            if(!this.HasProp("__CDEF"))
                this.__CDEF := D3D12_VIDEO_ENCODER_AV1_CDEF_CONFIG(this.ptr + 432)
            return this.__CDEF
        }
    }

    /**
     * @type {Integer}
     */
    QPMapValuesCount {
        get => NumGet(this, 704, "uint")
        set => NumPut("uint", value, this, 704)
    }

    /**
     * @type {Pointer<Int16>}
     */
    pRateControlQPMap {
        get => NumGet(this, 712, "ptr")
        set => NumPut("ptr", value, this, 712)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_CONFIG}
     */
    CustomSegmentation{
        get {
            if(!this.HasProp("__CustomSegmentation"))
                this.__CustomSegmentation := D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_CONFIG(this.ptr + 720)
            return this.__CustomSegmentation
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MAP}
     */
    CustomSegmentsMap{
        get {
            if(!this.HasProp("__CustomSegmentsMap"))
                this.__CustomSegmentsMap := D3D12_VIDEO_ENCODER_AV1_SEGMENTATION_MAP(this.ptr + 816)
            return this.__CustomSegmentsMap
        }
    }
}
