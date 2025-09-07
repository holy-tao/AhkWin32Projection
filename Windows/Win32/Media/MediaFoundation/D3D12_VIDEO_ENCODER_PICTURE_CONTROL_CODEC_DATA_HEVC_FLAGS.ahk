#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies flags for the HEVC-specific picture control properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_picture_control_codec_data_hevc_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_NONE => 0

    /**
     * Requests slice constrained encoding for a frame, in which every slice in the frame is encoded independently from other slices in the same frame. Please check for support in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_FLAGS_HEVC_INTRA_SLICE_CONSTRAINED_ENCODING_SUPPORT](ne-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc_flags.md). This mode restricts the motion vector search range to the region box of the current slice, i.e. motion vectors outside the slice boundary can't be used.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_REQUEST_INTRA_CONSTRAINED_SLICES => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_REQUEST_NUM_REF_IDX_ACTIVE_OVERRIDE_FLAG_SLICE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_CROSS_COMPONENT_PREDICTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_CHROMA_QP_OFFSET_LIST => 8
}
