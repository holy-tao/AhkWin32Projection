#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a rate control structure definition for constant bitrate mode.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control_cbr
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RATE_CONTROL_CBR {
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
     * Specifies the constant bitrate to be used in bits/second.
     */
    TargetBitRate : Int64

    /**
     * When [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_VBV_SIZE_CONFIG_AVAILABLE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, specifies the capacity in bits of the Video Buffer Verifier to be used in the rate control algorithm.
     */
    VBVCapacity : Int64

    /**
     * When [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_VBV_SIZE_CONFIG_AVAILABLE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, specifies the initial fullness in bits of the Video Buffer Verifier to be used in the rate control algorithm.
     */
    InitialVBVFullness : Int64

}
