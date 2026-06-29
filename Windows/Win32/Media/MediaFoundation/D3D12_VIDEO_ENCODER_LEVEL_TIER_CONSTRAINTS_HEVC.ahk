#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_LEVELS_HEVC.ahk" { D3D12_VIDEO_ENCODER_LEVELS_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_TIER_HEVC.ahk" { D3D12_VIDEO_ENCODER_TIER_HEVC }

/**
 * Associates a level and a tier for High Efficiency Video Coding (HEVC) level-setting configuration.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_level_tier_constraints_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC {
    #StructPack 4

    /**
     * A member of the [D3D12_VIDEO_ENCODER_LEVELS_HEVC](ne-d3d12video-d3d12_video_encoder_levels_hevc.md) enumeration specifying the encoder level.
     */
    Level : D3D12_VIDEO_ENCODER_LEVELS_HEVC

    /**
     * A member of the [D3D12_VIDEO_ENCODER_TIER_HEVC](ne-d3d12video-d3d12_video_encoder_tier_hevc.md) enumeration specifying the encoder level.
     */
    Tier : D3D12_VIDEO_ENCODER_TIER_HEVC

}
