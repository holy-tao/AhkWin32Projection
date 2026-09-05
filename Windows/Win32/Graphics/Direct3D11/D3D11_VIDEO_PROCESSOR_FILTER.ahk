#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies a video processor filter.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_filter
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_PROCESSOR_FILTER extends Win32Enum {

    /**
     * Brightness filter.
     * Native name: D3D11_VIDEO_PROCESSOR_FILTER_BRIGHTNESS
     * @type {Integer (Int32)}
     */
    static BRIGHTNESS => 0

    /**
     * Contrast filter.
     * Native name: D3D11_VIDEO_PROCESSOR_FILTER_CONTRAST
     * @type {Integer (Int32)}
     */
    static CONTRAST => 1

    /**
     * Hue filter.
     * Native name: D3D11_VIDEO_PROCESSOR_FILTER_HUE
     * @type {Integer (Int32)}
     */
    static HUE => 2

    /**
     * Saturation filter.
     * Native name: D3D11_VIDEO_PROCESSOR_FILTER_SATURATION
     * @type {Integer (Int32)}
     */
    static SATURATION => 3

    /**
     * Noise reduction filter.
     * Native name: D3D11_VIDEO_PROCESSOR_FILTER_NOISE_REDUCTION
     * @type {Integer (Int32)}
     */
    static NOISE_REDUCTION => 4

    /**
     * Edge enhancement filter.
     * Native name: D3D11_VIDEO_PROCESSOR_FILTER_EDGE_ENHANCEMENT
     * @type {Integer (Int32)}
     */
    static EDGE_ENHANCEMENT => 5

    /**
     * Anamorphic scaling filter.
     * Native name: D3D11_VIDEO_PROCESSOR_FILTER_ANAMORPHIC_SCALING
     * @type {Integer (Int32)}
     */
    static ANAMORPHIC_SCALING => 6

    /**
     * Stereo adjustment filter. When stereo 3D video is enabled, this filter adjusts the offset between the left and right views, allowing the user to reduce potential eye strain. 
     * 
     * The filter value indicates the amount by which the left and right views are adjusted.  A positive value shifts the images away from each other: the left image toward the left, and the right image toward the right. A negative value shifts the images in the opposite directions, closer to each other.
     * Native name: D3D11_VIDEO_PROCESSOR_FILTER_STEREO_ADJUSTMENT
     * @type {Integer (Int32)}
     */
    static STEREO_ADJUSTMENT => 7
}
