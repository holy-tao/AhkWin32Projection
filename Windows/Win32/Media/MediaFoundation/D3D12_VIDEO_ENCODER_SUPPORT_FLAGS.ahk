#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_SUPPORT_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_GENERAL_SUPPORT_OK => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_RECONFIGURATION_AVAILABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RESOLUTION_RECONFIGURATION_AVAILABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_VBV_SIZE_CONFIG_AVAILABLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_FRAME_ANALYSIS_AVAILABLE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RECONSTRUCTED_FRAMES_REQUIRE_TEXTURE_ARRAYS => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_DELTA_QP_AVAILABLE => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SUBREGION_LAYOUT_RECONFIGURATION_AVAILABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_ADJUSTABLE_QP_RANGE_AVAILABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_INITIAL_QP_AVAILABLE => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_MAX_FRAME_SIZE_AVAILABLE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SEQUENCE_GOP_RECONFIGURATION_AVAILABLE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_MOTION_ESTIMATION_PRECISION_MODE_LIMIT_AVAILABLE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_EXTENSION1_SUPPORT => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_QUALITY_VS_SPEED_AVAILABLE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_READABLE_RECONSTRUCTED_PICTURE_LAYOUT_AVAILABLE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_PER_BLOCK_QP_MAP_METADATA_AVAILABLE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_PER_BLOCK_SATD_MAP_METADATA_AVAILABLE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_PER_BLOCK_RC_BIT_ALLOCATION_MAP_METADATA_AVAILABLE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SUBREGION_NOTIFICATION_ARRAY_OF_BUFFERS_AVAILABLE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SUBREGION_NOTIFICATION_SINGLE_BUFFER_AVAILABLE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_FRAME_PSNR_METADATA_AVAILABLE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SUBREGIONS_PSNR_METADATA_AVAILABLE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_SPATIAL_ADAPTIVE_QP_AVAILABLE => 8388608
}
