#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_profile_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PROFILE_HEVC extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN10 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN12 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN10_422 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN12_422 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN_444 => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN10_444 => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN12_444 => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_PROFILE_HEVC_MAIN16_444 => 8
}
