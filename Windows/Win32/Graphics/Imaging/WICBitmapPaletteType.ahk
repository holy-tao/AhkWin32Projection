#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of palette used for an indexed image format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmappalettetype
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapPaletteType extends Win32Enum{

    /**
     * An arbitrary custom palette provided by caller.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeCustom => 0

    /**
     * An optimal palette generated using a median-cut algorithm. Derived from the colors in an image.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeMedianCut => 1

    /**
     * A black and white palette.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedBW => 2

    /**
     * A palette that has its 8-color on-off primaries and the 16 system colors added. With duplicates removed, 16 colors are available.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedHalftone8 => 3

    /**
     * A palette that has 3 intensity levels of each primary: 27-color on-off primaries and the 16 system colors added. With duplicates removed, 35 colors are available.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedHalftone27 => 4

    /**
     * A palette that has 4 intensity levels of each primary: 64-color on-off primaries and the 16 system colors added. With duplicates removed, 72 colors are available.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedHalftone64 => 5

    /**
     * A palette that has 5 intensity levels of each primary: 125-color on-off primaries and the 16 system colors added. With duplicates removed, 133 colors are available.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedHalftone125 => 6

    /**
     * A palette that has 6 intensity levels of each primary: 216-color on-off primaries and the 16 system colors added. With duplicates removed, 224 colors are available. This is the same as <b>WICBitmapPaletteFixedHalftoneWeb</b>.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedHalftone216 => 7

    /**
     * A palette that has 6 intensity levels of each primary: 216-color on-off primaries and the 16 system colors added. With duplicates removed, 224 colors are available. This is the same as <b>WICBitmapPaletteTypeFixedHalftone216</b>.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedWebPalette => 7

    /**
     * A palette that has its 252-color on-off primaries and the 16 system colors added. With duplicates removed, 256 colors are available.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedHalftone252 => 8

    /**
     * A palette that has its 256-color on-off primaries and the 16 system colors added. With duplicates removed, 256 colors are available.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedHalftone256 => 9

    /**
     * A palette that has 4 shades of gray.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedGray4 => 10

    /**
     * A palette that has 16 shades of gray.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedGray16 => 11

    /**
     * A palette that has 256 shades of gray.
     * @type {Integer (Int32)}
     */
    static WICBitmapPaletteTypeFixedGray256 => 12
}
