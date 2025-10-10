#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) filters available for compression optimization.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicpngfilteroption
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngFilterOption{

    /**
     * Indicates an unspecified PNG filter. This enables WIC to algorithmically choose the best filtering option for the image.
     * @type {Integer (Int32)}
     */
    static WICPngFilterUnspecified => 0

    /**
     * Indicates no PNG filter.
     * @type {Integer (Int32)}
     */
    static WICPngFilterNone => 1

    /**
     * Indicates a PNG sub filter.
     * @type {Integer (Int32)}
     */
    static WICPngFilterSub => 2

    /**
     * Indicates a PNG up filter.
     * @type {Integer (Int32)}
     */
    static WICPngFilterUp => 3

    /**
     * Indicates a PNG average filter.
     * @type {Integer (Int32)}
     */
    static WICPngFilterAverage => 4

    /**
     * Indicates a PNG paeth filter.
     * @type {Integer (Int32)}
     */
    static WICPngFilterPaeth => 5

    /**
     * Indicates a PNG adaptive filter. This enables WIC to choose the best filtering mode on a per-scanline basis.
     * @type {Integer (Int32)}
     */
    static WICPngFilterAdaptive => 6
}
