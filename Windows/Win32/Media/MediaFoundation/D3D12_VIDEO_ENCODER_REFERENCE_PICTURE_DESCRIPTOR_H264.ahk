#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a reference picture descriptor for H.264 video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_reference_picture_descriptor_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264 {
    #StructPack 4

    /**
     * Maps the current reference picture described by this structure to a resource in the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md) array.
     */
    ReconstructedPictureResourceIndex : UInt32

    /**
     * Set when the described reference frame is being used as a long-term reference picture.
     */
    IsLongTermReference : BOOL

    /**
     * If used as a long term reference, indicates the long-term reference index number.
     */
    LongTermPictureIdx : UInt32

    /**
     * The described reference frame display order.
     */
    PictureOrderCountNumber : UInt32

    /**
     * The frame decode order with semantic as indicated by the slice header *frame_num* syntax element associated with the encoded reference picture.
     */
    FrameDecodingOrderNumber : UInt32

    /**
     * Picture layer number in temporal hierarchy. Please check for maximum number of layers in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_h264.md).
     */
    TemporalLayerIndex : UInt32

}
