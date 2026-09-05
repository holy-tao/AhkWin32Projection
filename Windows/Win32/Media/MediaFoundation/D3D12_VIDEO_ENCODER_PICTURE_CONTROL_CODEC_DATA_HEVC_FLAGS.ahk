#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies flags for the HEVC-specific picture control properties.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_picture_control_codec_data_hevc_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS extends Win32BitflagEnum {

    /**
     * None.
     * Native name: D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Requests slice constrained encoding for a frame, in which every slice in the frame is encoded independently from other slices in the same frame. Please check for support in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_FLAGS_HEVC_INTRA_SLICE_CONSTRAINED_ENCODING_SUPPORT](ne-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc_flags.md). This mode restricts the motion vector search range to the region box of the current slice, i.e. motion vectors outside the slice boundary can't be used.
     * Native name: D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_REQUEST_INTRA_CONSTRAINED_SLICES
     * @type {Integer (Int32)}
     */
    static FLAG_REQUEST_INTRA_CONSTRAINED_SLICES => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_REQUEST_NUM_REF_IDX_ACTIVE_OVERRIDE_FLAG_SLICE
     * @type {Integer (Int32)}
     */
    static FLAG_REQUEST_NUM_REF_IDX_ACTIVE_OVERRIDE_FLAG_SLICE => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_CROSS_COMPONENT_PREDICTION
     * @type {Integer (Int32)}
     */
    static FLAG_CROSS_COMPONENT_PREDICTION => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAG_CHROMA_QP_OFFSET_LIST
     * @type {Integer (Int32)}
     */
    static FLAG_CHROMA_QP_OFFSET_LIST => 8
}
