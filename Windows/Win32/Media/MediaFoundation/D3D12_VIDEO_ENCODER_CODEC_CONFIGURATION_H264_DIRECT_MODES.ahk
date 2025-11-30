#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec_configuration_h264_direct_modes
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES_TEMPORAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_H264_DIRECT_MODES_SPATIAL => 2
}
