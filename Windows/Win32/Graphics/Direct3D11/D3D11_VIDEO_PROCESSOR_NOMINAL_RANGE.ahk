#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies values for the luminance range of YUV data.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_nominal_range
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_NOMINAL_RANGE{

    /**
     * Driver defaults are used, which should be Studio luminance range [16-235],
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_NOMINAL_RANGE_UNDEFINED => 0

    /**
     * Studio luminance range [16-235]
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_NOMINAL_RANGE_16_235 => 1

    /**
     * Full luminance range [0-255]
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_PROCESSOR_NOMINAL_RANGE_0_255 => 2
}
