#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the encoder tiers for High Efficiency Video Coding (HEVC) encoding.
 * @remarks
 * Use this enumeration to specify the encoder tier in a [D3D12_VIDEO_ENCODER_LEVEL_TIER_CONSTRAINTS_HEVC](ns-d3d12video-d3d12_video_encoder_level_tier_constraints_hevc.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_tier_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_TIER_HEVC {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
