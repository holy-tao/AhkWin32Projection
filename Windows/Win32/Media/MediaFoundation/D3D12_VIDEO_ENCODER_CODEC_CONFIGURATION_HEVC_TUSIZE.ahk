#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies possible values for luma transform block sizes for HEVC.
 * @remarks
 * These values can then be used to express HEVC variables such as MinTbLog2SizeY, MaxTbLog2SizeY.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_tusize
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE extends Win32Enum{

    /**
     * Indicates a luma transform block of pixel size 4.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE_4x4 => 0

    /**
     * Indicates a luma transform block of pixel size 8.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE_8x8 => 1

    /**
     * Indicates a luma transform block of pixel size 16.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE_16x16 => 2

    /**
     * Indicates a luma transform block of pixel size 32.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE_32x32 => 3
}
