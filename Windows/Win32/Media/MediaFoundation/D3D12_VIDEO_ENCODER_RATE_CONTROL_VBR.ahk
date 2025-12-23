#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a rate control structure definition for variable bitrate mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control_vbr
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_VBR extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * When [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_INITIAL_QP](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, allows the Initial QP to be used by the rate control algorithm.
     * @type {Integer}
     */
    InitialQP {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * When [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_QP_RANGE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, limits QP range of the rate control algorithm.
     * @type {Integer}
     */
    MinQP {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * When [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_QP_RANGE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, limits QP range of the rate control algorithm.
     * @type {Integer}
     */
    MaxQP {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum size, in bits, for each frame to be coded. When [D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_MAX_FRAME_SIZE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, limits each frame maximum size in the rate control algorithm.
     * @type {Integer}
     */
    MaxFrameBitSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Average bitrate to be used, in bits/second.
     * @type {Integer}
     */
    TargetAvgBitRate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The maximum bit rate that can be reached in bits/second.
     * @type {Integer}
     */
    PeakBitRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * When [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_VBV_SIZE_CONFIG_AVAILABLE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, specifies the capacity in bits of the Video Buffer Verifier to be used in the rate control algorithm.
     * @type {Integer}
     */
    VBVCapacity {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * When [D3D12_VIDEO_ENCODER_SUPPORT_FLAG_RATE_CONTROL_VBV_SIZE_CONFIG_AVAILABLE](ne-d3d12video-d3d12_video_encoder_rate_control_flags.md) is enabled, specifies the initial fullness in bits of the Video Buffer Verifier to be used in the rate control algorithm.
     * @type {Integer}
     */
    InitialVBVFullness {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
