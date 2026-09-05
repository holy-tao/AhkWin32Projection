#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of palette used for an indexed image format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicbitmappalettetype
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapPaletteType extends Win32Enum {

    /**
     * An arbitrary custom palette provided by caller.
     * Native name: WICBitmapPaletteTypeCustom
     * @type {Integer (Int32)}
     */
    static Custom => 0

    /**
     * An optimal palette generated using a median-cut algorithm. Derived from the colors in an image.
     * Native name: WICBitmapPaletteTypeMedianCut
     * @type {Integer (Int32)}
     */
    static MedianCut => 1

    /**
     * A black and white palette.
     * Native name: WICBitmapPaletteTypeFixedBW
     * @type {Integer (Int32)}
     */
    static FixedBW => 2

    /**
     * A palette that has its 8-color on-off primaries and the 16 system colors added. With duplicates removed, 16 colors are available.
     * Native name: WICBitmapPaletteTypeFixedHalftone8
     * @type {Integer (Int32)}
     */
    static FixedHalftone8 => 3

    /**
     * A palette that has 3 intensity levels of each primary: 27-color on-off primaries and the 16 system colors added. With duplicates removed, 35 colors are available.
     * Native name: WICBitmapPaletteTypeFixedHalftone27
     * @type {Integer (Int32)}
     */
    static FixedHalftone27 => 4

    /**
     * A palette that has 4 intensity levels of each primary: 64-color on-off primaries and the 16 system colors added. With duplicates removed, 72 colors are available.
     * Native name: WICBitmapPaletteTypeFixedHalftone64
     * @type {Integer (Int32)}
     */
    static FixedHalftone64 => 5

    /**
     * A palette that has 5 intensity levels of each primary: 125-color on-off primaries and the 16 system colors added. With duplicates removed, 133 colors are available.
     * Native name: WICBitmapPaletteTypeFixedHalftone125
     * @type {Integer (Int32)}
     */
    static FixedHalftone125 => 6

    /**
     * A palette that has 6 intensity levels of each primary: 216-color on-off primaries and the 16 system colors added. With duplicates removed, 224 colors are available. This is the same as <b>WICBitmapPaletteFixedHalftoneWeb</b>.
     * Native name: WICBitmapPaletteTypeFixedHalftone216
     * @type {Integer (Int32)}
     */
    static FixedHalftone216 => 7

    /**
     * A palette that has 6 intensity levels of each primary: 216-color on-off primaries and the 16 system colors added. With duplicates removed, 224 colors are available. This is the same as <b>WICBitmapPaletteTypeFixedHalftone216</b>.
     * Native name: WICBitmapPaletteTypeFixedWebPalette
     * @type {Integer (Int32)}
     */
    static FixedWebPalette => 7

    /**
     * A palette that has its 252-color on-off primaries and the 16 system colors added. With duplicates removed, 256 colors are available.
     * Native name: WICBitmapPaletteTypeFixedHalftone252
     * @type {Integer (Int32)}
     */
    static FixedHalftone252 => 8

    /**
     * A palette that has its 256-color on-off primaries and the 16 system colors added. With duplicates removed, 256 colors are available.
     * Native name: WICBitmapPaletteTypeFixedHalftone256
     * @type {Integer (Int32)}
     */
    static FixedHalftone256 => 9

    /**
     * A palette that has 4 shades of gray.
     * Native name: WICBitmapPaletteTypeFixedGray4
     * @type {Integer (Int32)}
     */
    static FixedGray4 => 10

    /**
     * A palette that has 16 shades of gray.
     * Native name: WICBitmapPaletteTypeFixedGray16
     * @type {Integer (Int32)}
     */
    static FixedGray16 => 11

    /**
     * A palette that has 256 shades of gray.
     * Native name: WICBitmapPaletteTypeFixedGray256
     * @type {Integer (Int32)}
     */
    static FixedGray256 => 12
}
