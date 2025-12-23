#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies capabilities of the video decoder.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_video_decoder_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_DECODER_CAPS extends Win32Enum{

    /**
     * Indicates that the graphics driver supports at least a subset of downsampling operations.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_CAPS_DOWNSAMPLE => 1

    /**
     * Indicates that the decoding hardware cannot support the decode operation in real-time. Decoding is still supported for transcoding scenarios.
     * 
     * With this capability, it is possible that decoding can occur in real-time if downsampling is enabled.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_CAPS_NON_REAL_TIME => 2

    /**
     * Indicates that the driver supports changing down sample parameters after the initial down sample parameters have been applied. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-decoderupdatedownsampling">ID3D11VideoContext1::DecoderUpdateDownsampling</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_CAPS_DOWNSAMPLE_DYNAMIC => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_CAPS_DOWNSAMPLE_REQUIRED => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_CAPS_UNSUPPORTED => 16
}
