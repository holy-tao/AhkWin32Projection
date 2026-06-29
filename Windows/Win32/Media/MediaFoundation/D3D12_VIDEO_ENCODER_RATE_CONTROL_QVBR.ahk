#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a rate control structure definition for constant quality target with constrained bitrate.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control_qvbr
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RATE_CONTROL_QVBR {
    #StructPack 8

    /**
     * When [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_INITIAL_QP](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, allows the Initial QP to be used by the rate control algorithm.
     */
    InitialQP : UInt32

    /**
     * When [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_QP_RANGE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, limits QP range of the rate control algorithm.
     */
    MinQP : UInt32

    /**
     * When [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_QP_RANGE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, limits QP range of the rate control algorithm.
     */
    MaxQP : UInt32

    /**
     * Maximum size in bits for each frame to be coded. When [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_MAX_FRAME_SIZE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, limits each frame maximum size in the rate control algorithm.
     */
    MaxFrameBitSize : Int64

    /**
     * Indicates the target average bit rate, in bits/second.
     */
    TargetAvgBitRate : Int64

    /**
     * Indicates the maximum bit rate that can be reached in bits/second while using this rate control mode.
     */
    PeakBitRate : Int64

    /**
     * The quality level target. The values are codec-specific as each standard defines the range for this argument.
     */
    ConstantQualityTarget : UInt32

}
