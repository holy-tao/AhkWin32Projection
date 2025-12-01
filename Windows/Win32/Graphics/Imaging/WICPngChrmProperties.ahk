#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) cHRM chunk metadata properties for CIE XYZ chromaticity.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngchrmproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngChrmProperties extends Win32Enum{

    /**
     * [VT_UI4] Indicates the whitepoint x value ratio.
     * @type {Integer (Int32)}
     */
    static WICPngChrmWhitePointX => 1

    /**
     * [VT_UI4] Indicates the whitepoint y value ratio.
     * @type {Integer (Int32)}
     */
    static WICPngChrmWhitePointY => 2

    /**
     * [VT_UI4] Indicates the red x value ratio.
     * @type {Integer (Int32)}
     */
    static WICPngChrmRedX => 3

    /**
     * [VT_UI4] Indicates the red y value ratio.
     * @type {Integer (Int32)}
     */
    static WICPngChrmRedY => 4

    /**
     * [VT_UI4] Indicates the green x value ratio.
     * @type {Integer (Int32)}
     */
    static WICPngChrmGreenX => 5

    /**
     * [VT_UI4] Indicates the green y value ratio.
     * @type {Integer (Int32)}
     */
    static WICPngChrmGreenY => 6

    /**
     * [VT_UI4] Indicates the blue x value ratio.
     * @type {Integer (Int32)}
     */
    static WICPngChrmBlueX => 7

    /**
     * [VT_UI4] Indicates the blue y value ratio.
     * @type {Integer (Int32)}
     */
    static WICPngChrmBlueY => 8
}
