#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the automatic image processing capabilities of the video processor.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_auto_stream_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS extends Win32Enum {

    /**
     * Denoise.
     * Native name: D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_DENOISE
     * @type {Integer (Int32)}
     */
    static DENOISE => 1

    /**
     * Deringing.
     * Native name: D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_DERINGING
     * @type {Integer (Int32)}
     */
    static DERINGING => 2

    /**
     * Edge enhancement.
     * Native name: D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_EDGE_ENHANCEMENT
     * @type {Integer (Int32)}
     */
    static EDGE_ENHANCEMENT => 4

    /**
     * Color correction.
     * Native name: D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_COLOR_CORRECTION
     * @type {Integer (Int32)}
     */
    static COLOR_CORRECTION => 8

    /**
     * Flesh-tone mapping.
     * Native name: D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_FLESH_TONE_MAPPING
     * @type {Integer (Int32)}
     */
    static FLESH_TONE_MAPPING => 16

    /**
     * Image stabilization.
     * Native name: D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_IMAGE_STABILIZATION
     * @type {Integer (Int32)}
     */
    static IMAGE_STABILIZATION => 32

    /**
     * Enhanced image resolution.
     * Native name: D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_SUPER_RESOLUTION
     * @type {Integer (Int32)}
     */
    static SUPER_RESOLUTION => 64

    /**
     * Anamorphic scaling.
     * Native name: D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS_ANAMORPHIC_SCALING
     * @type {Integer (Int32)}
     */
    static ANAMORPHIC_SCALING => 128
}
