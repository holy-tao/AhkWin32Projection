#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapChainType extends Win32Enum {

    /**
     * Native name: WICBitmapChainType_Alternate
     * @type {Integer (Int32)}
     */
    static Alternate => 1

    /**
     * Native name: WICBitmapChainType_Layer
     * @type {Integer (Int32)}
     */
    static Layer => 2

    /**
     * Native name: WICBitmapChainType_Preview
     * @type {Integer (Int32)}
     */
    static Preview => 3

    /**
     * Native name: WICBitmapChainType_Thumbnail
     * @type {Integer (Int32)}
     */
    static Thumbnail => 4

    /**
     * Native name: WICBitmapChainType_AlphaMap
     * @type {Integer (Int32)}
     */
    static AlphaMap => 5

    /**
     * Native name: WICBitmapChainType_DepthMap
     * @type {Integer (Int32)}
     */
    static DepthMap => 6

    /**
     * Native name: WICBitmapChainType_GainMap
     * @type {Integer (Int32)}
     */
    static GainMap => 7
}
