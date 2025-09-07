#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Associates a level and a tier for High Efficiency Video Coding (HEVC) level-setting configuration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_level_tier_constraints_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A member of the [D3D12_VIDEO_ENCODER_LEVELS_HEVC](ne-d3d12video-d3d12_video_encoder_levels_hevc.md) enumeration specifying the encoder level.
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A member of the [D3D12_VIDEO_ENCODER_TIER_HEVC](ne-d3d12video-d3d12_video_encoder_tier_hevc.md) enumeration specifying the encoder level.
     * @type {Integer}
     */
    Tier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
