#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a reference picture descriptor for H.264 video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_reference_picture_descriptor_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Maps the current reference picture described by this structure to a resource in the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md) array.
     * @type {Integer}
     */
    ReconstructedPictureResourceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Set when the described reference frame is being used as a long-term reference picture.
     * @type {BOOL}
     */
    IsLongTermReference {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * If used as a long term reference, indicates the long-term reference index number.
     * @type {Integer}
     */
    LongTermPictureIdx {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The described reference frame display order.
     * @type {Integer}
     */
    PictureOrderCountNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The frame decode order with semantic as indicated by the slice header *frame_num* syntax element associated with the encoded reference picture.
     * @type {Integer}
     */
    FrameDecodingOrderNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Picture layer number in temporal hierarchy. Please check for maximum number of layers in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_h264.md).
     * @type {Integer}
     */
    TemporalLayerIndex {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
