#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies a video processor filter.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_video_processor_filter
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_FILTER{

    /**
     * Brightness filter.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_BRIGHTNESS => 0

    /**
     * Contrast filter.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_CONTRAST => 1

    /**
     * Hue filter.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_HUE => 2

    /**
     * Saturation filter.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_SATURATION => 3

    /**
     * Noise reduction filter.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_NOISE_REDUCTION => 4

    /**
     * Edge enhancement filter.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_EDGE_ENHANCEMENT => 5

    /**
     * Anamorphic scaling filter.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_ANAMORPHIC_SCALING => 6

    /**
     * Stereo adjustment filter. When stereo 3D video is enabled, this filter adjusts the offset between the left and right views, allowing the user to reduce potential eye strain. 
 * 
 * The filter value indicates the amount by which the left and right views are adjusted.  A positive value shifts the images away from each other: the left image toward the left, and the right image toward the right. A negative value shifts the images in the opposite directions, closer to each other.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_FILTER_STEREO_ADJUSTMENT => 7
}
