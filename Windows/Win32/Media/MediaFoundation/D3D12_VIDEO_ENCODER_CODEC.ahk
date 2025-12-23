#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies codecs for Direct3D 12 video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC extends Win32Enum{

    /**
     * H.264 video
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_H264 => 0

    /**
     * High Efficiency Video Coding (HEVC) video
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_HEVC => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_AV1 => 2
}
