#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_REFERENCE_WARPED_MOTION_TRANSFORMATION_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_COMP_PREDICTION_TYPE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_CODEC_AV1_PICTURE_CONTROL_SUPPORT extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_COMP_PREDICTION_TYPE}
     */
    PredictionMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaxUniqueReferencesPerFrame {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_FRAME_TYPE_FLAGS}
     */
    SupportedFrameTypes {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_REFERENCE_WARPED_MOTION_TRANSFORMATION_FLAGS}
     */
    SupportedReferenceWarpedMotionFlags {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
