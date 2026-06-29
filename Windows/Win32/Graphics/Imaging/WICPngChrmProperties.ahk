#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) cHRM chunk metadata properties for CIE XYZ chromaticity.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpngchrmproperties
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICPngChrmProperties {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
