#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies flags for video encoder features.
 * @remarks
 * D3D12_VIDEO_ENCODER_SUPPORT_FLAG_GENERAL_SUPPORT_OK indicates that whether there is general support. The rest of the flags can be combined to convey further information.
  * 
  * General support always expected.
  * 
  * - There is support for all buffers to be allocated with [D3D12_MEMORY_POOL_L0](../d3d12/ne-d3d12-d3d12_memory_pool.md). This is always system memory, but still a D3D12 buffer.
  * - There is support for all buffers to be allocated with [D3D12_MEMORY_POOL_L1](../d3d12/ne-d3d12-d3d12_memory_pool.md)), the default pool, including those allocated with [D3D12_CPU_PAGE_PROPERTY_NOT_AVAILABLE](../d3d12/ne-d3d12-d3d12_cpu_page_property.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_support_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_SUPPORT_FLAGS{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_NONE => 0

    /**
     * Indicates whether the given configuration is supported by the encoder in combination with the rest of the flags to convey certain limitations or no general support. The Direct3D 12 Debug layer can provide further information.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_GENERAL_SUPPORT_OK => 1

    /**
     * Support for changing the rate control in the middle of the encoding session.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_RECONFIGURATION_AVAILABLE => 2

    /**
     * Support for changing the resolution in the middle of the encoding session.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RESOLUTION_RECONFIGURATION_AVAILABLE => 4

    /**
     * Support for configuring the VBV Initial fullness and capacity for rate control algorithms.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_VBV_SIZE_CONFIG_AVAILABLE => 8

    /**
     * Support for rate control modes that involve frame analysis to optimize the bitrate usage at the cost of a slower performance.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_FRAME_ANALYSIS_AVAILABLE => 16

    /**
     * When this flag is set, textures referring reconstructed pictures can only be referenced as a texture array, as opposed to an array of separate texture 2D resources with each resource having array size of 1. When this capability is not required, there is more flexibility for the host. This is important for scenarios where the resolution changes frequently and the DPB needs to be flushed for an IDR frame, because a texture array can only be allocated and deallocated as an single unit, but separate texture 2D resources can be allocated and deallocated individually.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RECONSTRUCTED_FRAMES_REQUIRE_TEXTURE_ARRAYS => 32

    /**
     * Support for Delta QP usage in rate control
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_DELTA_QP_AVAILABLE => 64

    /**
     * Support for dynamic subregion layout changes during an encoding session.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SUBREGION_LAYOUT_RECONFIGURATION_AVAILABLE => 128

    /**
     * Support for adjustable QP range in rate control.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_ADJUSTABLE_QP_RANGE_AVAILABLE => 256

    /**
     * Support for adjustable initial QP in rate control.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_INITIAL_QP_AVAILABLE => 512

    /**
     * Ssupport for setting a maximum cap in the bitrate algorithm per each encoded frame.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_MAX_FRAME_SIZE_AVAILABLE => 1024

    /**
     * Support for dynamic GOP changes during an encode session.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SUPPORT_FLAG_SEQUENCE_GOP_RECONFIGURATION_AVAILABLE => 2048

    /**
     * Support for the caller to limit the precision used for motion search on frame encode.
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
}
