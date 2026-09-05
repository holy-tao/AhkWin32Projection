#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies possible values for luma coding block sizes for HEVC.
 * @remarks
 * These values can be used to express HEVC variables such as MinCbSizeY, CtbLog2SizeY.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_cusize
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE extends Win32Enum {

    /**
     * Luma coding block of pixel size 8.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_8x8
     * @type {Integer (Int32)}
     */
    static 8x8 => 0

    /**
     * Luma coding block of pixel size 16.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_16x16
     * @type {Integer (Int32)}
     */
    static 16x16 => 1

    /**
     * Luma coding block of pixel size 32.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_32x32
     * @type {Integer (Int32)}
     */
    static 32x32 => 2

    /**
     * Luma coding block of pixel size 64.
     * Native name: D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_64x64
     * @type {Integer (Int32)}
     */
    static 64x64 => 3
}
