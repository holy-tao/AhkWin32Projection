#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the encoder profiles for H.264 encoding.
 * @remarks
 * Use this enumeration to specify the encoder profile in a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_profile_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PROFILE_H264{

    /**
     * Main profile.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_H264_MAIN => 0

    /**
     * High profile.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_H264_HIGH => 1

    /**
     * High 10 profile.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_H264_HIGH_10 => 2
}
