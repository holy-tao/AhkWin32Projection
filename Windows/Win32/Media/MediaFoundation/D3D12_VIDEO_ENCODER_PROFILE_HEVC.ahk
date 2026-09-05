#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the encoder profiles for High Efficiency Video Coding (HEVC) encoding.
 * @remarks
 * Use this enumeration to specify the encoder profile in a [D3D12_VIDEO_ENCODER_PROFILE_DESC](ns-d3d12video-d3d12_video_encoder_profile_desc.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_profile_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_PROFILE_HEVC extends Win32Enum {

    /**
     * Main profile.
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN
     * @type {Integer (Int32)}
     */
    static MAIN => 0

    /**
     * Main 10 profile.
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN10
     * @type {Integer (Int32)}
     */
    static MAIN10 => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN12
     * @type {Integer (Int32)}
     */
    static MAIN12 => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN10_422
     * @type {Integer (Int32)}
     */
    static MAIN10_422 => 3

    /**
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN12_422
     * @type {Integer (Int32)}
     */
    static MAIN12_422 => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN_444
     * @type {Integer (Int32)}
     */
    static MAIN_444 => 5

    /**
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN10_444
     * @type {Integer (Int32)}
     */
    static MAIN10_444 => 6

    /**
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN12_444
     * @type {Integer (Int32)}
     */
    static MAIN12_444 => 7

    /**
     * Native name: D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN16_444
     * @type {Integer (Int32)}
     */
    static MAIN16_444 => 8
}
