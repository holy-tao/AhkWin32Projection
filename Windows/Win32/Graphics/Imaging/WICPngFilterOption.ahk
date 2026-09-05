#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) filters available for compression optimization.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngfilteroption
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICPngFilterOption extends Win32Enum {

    /**
     * Indicates an unspecified PNG filter. This enables WIC to algorithmically choose the best filtering option for the image.
     * Native name: WICPngFilterUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Indicates no PNG filter.
     * Native name: WICPngFilterNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Indicates a PNG sub filter.
     * Native name: WICPngFilterSub
     * @type {Integer (Int32)}
     */
    static Sub => 2

    /**
     * Indicates a PNG up filter.
     * Native name: WICPngFilterUp
     * @type {Integer (Int32)}
     */
    static Up => 3

    /**
     * Indicates a PNG average filter.
     * Native name: WICPngFilterAverage
     * @type {Integer (Int32)}
     */
    static Average => 4

    /**
     * Indicates a PNG paeth filter.
     * Native name: WICPngFilterPaeth
     * @type {Integer (Int32)}
     */
    static Paeth => 5

    /**
     * Indicates a PNG adaptive filter. This enables WIC to choose the best filtering mode on a per-scanline basis.
     * Native name: WICPngFilterAdaptive
     * @type {Integer (Int32)}
     */
    static Adaptive => 6
}
