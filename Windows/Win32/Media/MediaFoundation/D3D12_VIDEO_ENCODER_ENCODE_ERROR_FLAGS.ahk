#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies errors encountered during the ID3D12VideoEncodeCommandList2::EncodeFrame operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_encode_error_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAGS extends Win32BitflagEnum {

    /**
     * No error.
     * Native name: D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_NO_ERROR
     * @type {Integer (Int32)}
     */
    static FLAG_NO_ERROR => 0

    /**
     * Specified codec picture control not supported.
     * Native name: D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_CODEC_PICTURE_CONTROL_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_CODEC_PICTURE_CONTROL_NOT_SUPPORTED => 1

    /**
     * Specified subregion layout subregion not supported.
     * Native name: D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_SUBREGION_LAYOUT_CONFIGURATION_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_SUBREGION_LAYOUT_CONFIGURATION_NOT_SUPPORTED => 2

    /**
     * Invalid reference pictures provided.
     * Native name: D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_INVALID_REFERENCE_PICTURES
     * @type {Integer (Int32)}
     */
    static FLAG_INVALID_REFERENCE_PICTURES => 4

    /**
     * Reconfiguration request is unsupported.
     * Native name: D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_RECONFIGURATION_REQUEST_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_RECONFIGURATION_REQUEST_NOT_SUPPORTED => 8

    /**
     * Invalid metadata buffer source.
     * Native name: D3D12_VIDEO_ENCODER_ENCODE_ERROR_FLAG_INVALID_METADATA_BUFFER_SOURCE
     * @type {Integer (Int32)}
     */
    static FLAG_INVALID_METADATA_BUFFER_SOURCE => 16
}
