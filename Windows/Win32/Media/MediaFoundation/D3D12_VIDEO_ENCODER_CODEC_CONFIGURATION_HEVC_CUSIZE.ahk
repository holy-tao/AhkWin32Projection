#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies possible values for luma coding block sizes for HEVC.
 * @remarks
 * These values can be used to express HEVC variables such as MinCbSizeY, CtbLog2SizeY.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_cusize
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE{

    /**
     * Luma coding block of pixel size 8.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_8x8 => 0

    /**
     * Luma coding block of pixel size 16.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_16x16 => 1

    /**
     * Luma coding block of pixel size 32.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_32x32 => 2

    /**
     * Luma coding block of pixel size 64.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE_64x64 => 3
}
