#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the automatic image processing capabilities of the video processor.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_auto_stream_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS{

    /**
     * Denoise.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_DENOISE => 1

    /**
     * Deringing.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_DERINGING => 2

    /**
     * Edge enhancement.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_EDGE_ENHANCEMENT => 4

    /**
     * Color correction.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_COLOR_CORRECTION => 8

    /**
     * Flesh-tone mapping.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_FLESH_TONE_MAPPING => 16

    /**
     * Image stabilization.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_IMAGE_STABILIZATION => 32

    /**
     * Enhanced image resolution.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_SUPER_RESOLUTION => 64

    /**
     * Anamorphic scaling.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_ANAMORPHIC_SCALING => 128
}
