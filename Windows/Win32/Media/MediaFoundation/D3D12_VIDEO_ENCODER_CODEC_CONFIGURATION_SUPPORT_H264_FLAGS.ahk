#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies configuration support flags for H.264 video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec_configuration_support_h264_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAGS{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_NONE => 0

    /**
     * Support for context-adaptive binary arithmetic coding (CABAC) encoding.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_CABAC_ENCODING_SUPPORT => 1

    /**
     * Support for slice constrained encoding in which every slice in a frame is encoded independently from other slices in the same frame. This mode restricts the motion vector search range to the region box of the current slice, e.g. motion vectors outside the slice boundary can't be used.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_INTRA_SLICE_CONSTRAINED_ENCODING_SUPPORT => 2

    /**
     * Support for using B-frames and long term references at the same time.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_BFRAME_LTR_COMBINED_SUPPORT => 4

    /**
     * Support for using adaptive 8x8 transforms when encoding.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_ADAPTIVE_8x8_TRANSFORM_ENCODING_SUPPORT => 8

    /**
     * Support for spatial direct mode.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_DIRECT_SPATIAL_ENCODING_SUPPORT => 16

    /**
     * Support for temporal direct mode.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_DIRECT_TEMPORAL_ENCODING_SUPPORT => 32

    /**
     * Support for constrained intraprediction, that if activated will force the encoding of each intra-coded block with residual data only from other intra-coded blocks, e.g. not from inter-coded blocks. This refers to constrained_intra_pred_flag in the picture parameter set (PPS).
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_CONSTRAINED_INTRAPREDICTION_SUPPORT => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE_FLAG_SLICE_SUPPORT => 128
}
