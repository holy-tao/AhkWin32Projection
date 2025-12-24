#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_WARPED_MOTION_INFO.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ReconstructedPictureResourceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TemporalLayerIndexPlus1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SpatialLayerIndexPlus1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FrameType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_WARPED_MOTION_INFO}
     */
    WarpedMotionInfo{
        get {
            if(!this.HasProp("__WarpedMotionInfo"))
                this.__WarpedMotionInfo := D3D12_VIDEO_ENCODER_AV1_REFERENCE_PICTURE_WARPED_MOTION_INFO(16, this)
            return this.__WarpedMotionInfo
        }
    }

    /**
     * @type {Integer}
     */
    OrderHint {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    PictureIndex {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
