#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) cHRM chunk metadata properties for CIE XYZ chromaticity.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngchrmproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICPngChrmProperties extends Win32Enum {

    /**
     * [VT_UI4] Indicates the whitepoint x value ratio.
     * Native name: WICPngChrmWhitePointX
     * @type {Integer (Int32)}
     */
    static WhitePointX => 1

    /**
     * [VT_UI4] Indicates the whitepoint y value ratio.
     * Native name: WICPngChrmWhitePointY
     * @type {Integer (Int32)}
     */
    static WhitePointY => 2

    /**
     * [VT_UI4] Indicates the red x value ratio.
     * Native name: WICPngChrmRedX
     * @type {Integer (Int32)}
     */
    static RedX => 3

    /**
     * [VT_UI4] Indicates the red y value ratio.
     * Native name: WICPngChrmRedY
     * @type {Integer (Int32)}
     */
    static RedY => 4

    /**
     * [VT_UI4] Indicates the green x value ratio.
     * Native name: WICPngChrmGreenX
     * @type {Integer (Int32)}
     */
    static GreenX => 5

    /**
     * [VT_UI4] Indicates the green y value ratio.
     * Native name: WICPngChrmGreenY
     * @type {Integer (Int32)}
     */
    static GreenY => 6

    /**
     * [VT_UI4] Indicates the blue x value ratio.
     * Native name: WICPngChrmBlueX
     * @type {Integer (Int32)}
     */
    static BlueX => 7

    /**
     * [VT_UI4] Indicates the blue y value ratio.
     * Native name: WICPngChrmBlueY
     * @type {Integer (Int32)}
     */
    static BlueY => 8
}
