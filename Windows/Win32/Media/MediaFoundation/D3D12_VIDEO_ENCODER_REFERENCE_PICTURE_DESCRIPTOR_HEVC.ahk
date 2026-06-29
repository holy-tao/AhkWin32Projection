#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a reference picture descriptor for HEVC video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_reference_picture_descriptor_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC {
    #StructPack 4

    /**
     * A **UINT** that maps the current reference picture described by this structure to a resource in the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md) array.
     */
    ReconstructedPictureResourceIndex : UInt32

    /**
     * A **BOOL** indicating whether this descriptor entry is being used by the current picture by being indexed from either L0 and/or L1 lists.
     */
    IsRefUsedByCurrentPic : BOOL

    /**
     * A **BOOL** that is set to true when the described reference frame is being used as a long-term reference picture.
     */
    IsLongTermReference : BOOL

    /**
     * A **UINT** specifying the described reference frame display order.
     */
    PictureOrderCountNumber : UInt32

    /**
     * A **UINT** specifying the picture layer number in temporal hierarchy. Check for maximum number of layers in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc.md).
     */
    TemporalLayerIndex : UInt32

}
