#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags specifying unsupported encoder features.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_validation_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_VALIDATION_FLAGS extends Win32BitflagEnum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_NONE => 0

    /**
     * The specified codec is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_CODEC_NOT_SUPPORTED => 1

    /**
     * The specified input format is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_INPUT_FORMAT_NOT_SUPPORTED => 8

    /**
     * The specified codec configuration is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_CODEC_CONFIGURATION_NOT_SUPPORTED => 16

    /**
     * The specified rate control mode is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RATE_CONTROL_MODE_NOT_SUPPORTED => 32

    /**
     * The specified rate control configuration is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RATE_CONTROL_CONFIGURATION_NOT_SUPPORTED => 64

    /**
     * The specified intra refresh mode is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_INTRA_REFRESH_MODE_NOT_SUPPORTED => 128

    /**
     * The specified subregion layout mode is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_SUBREGION_LAYOUT_MODE_NOT_SUPPORTED => 256

    /**
     * The specified resolution is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_RESOLUTION_NOT_SUPPORTED_IN_LIST => 512

    /**
     * The specified GOP structure is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_GOP_STRUCTURE_NOT_SUPPORTED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_SUBREGION_LAYOUT_DATA_NOT_SUPPORTED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_QPMAP_NOT_SUPPORTED => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_DIRTY_REGIONS_NOT_SUPPORTED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_MOTION_SEARCH_NOT_SUPPORTED => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_VALIDATION_FLAG_FRAME_ANALYSIS_NOT_SUPPORTED => 65536
}
