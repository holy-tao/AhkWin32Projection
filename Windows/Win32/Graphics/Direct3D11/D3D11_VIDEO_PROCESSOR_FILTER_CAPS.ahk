#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines image filter capabilities for a Microsoft Direct3D 11 video processor.
 * @remarks
 * These capability flags indicate support for the image filters defined by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_filter">D3D11_VIDEO_PROCESSOR_FILTER</a> enumeration. To apply a particular filter, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamfilter">ID3D11VideoContext::VideoProcessorSetStreamFilter</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_filter_caps
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_FILTER_CAPS{

    /**
     * The video processor can adjust the brightness level.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CAPS_BRIGHTNESS => 1

    /**
     * The video processor can adjust the contrast level.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CAPS_CONTRAST => 2

    /**
     * The video processor can adjust hue.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CAPS_HUE => 4

    /**
     * The video processor can adjust the saturation level.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CAPS_SATURATION => 8

    /**
     * The video processor can perform noise reduction.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CAPS_NOISE_REDUCTION => 16

    /**
     * The video processor can perform edge enhancement.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CAPS_EDGE_ENHANCEMENT => 32

    /**
     * The video processor can perform anamorphic scaling. Anamorphic scaling can be used to stretch 4:3 content to a widescreen 16:9 aspect ratio.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CAPS_ANAMORPHIC_SCALING => 64

    /**
     * For stereo 3D video, the video processor can adjust the offset between the left and right views, allowing the user to reduce potential eye strain.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CAPS_STEREO_ADJUSTMENT => 128
}
