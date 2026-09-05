#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the encoder tiers for High Efficiency Video Coding (HEVC) encoding.
 * @remarks
 * Use this enumeration to specify the encoder tier in a [D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC](ns-d3d12video-d3d12_video_encoder_level_tier_constraints_hevc.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_tier_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_TIER_HEVC extends Win32Enum {

    /**
     * Main tier.
     * Native name: D3D12_VIDEO_ENCODER_TIER_HEVC_MAIN
     * @type {Integer (Int32)}
     */
    static MAIN => 0

    /**
     * High tier.
     * Native name: D3D12_VIDEO_ENCODER_TIER_HEVC_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 1
}
