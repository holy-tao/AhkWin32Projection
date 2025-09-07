#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the encoder tiers for High Efficiency Video Coding (HEVC) encoding.
 * @remarks
 * Use this enumeration to specify the encoder tier in a [D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC](ns-d3d12video-d3d12_video_encoder_level_tier_constraints_hevc.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_tier_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_TIER_HEVC{

    /**
     * Main tier.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_TIER_HEVC_MAIN => 0

    /**
     * High tier.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_TIER_HEVC_HIGH => 1
}
