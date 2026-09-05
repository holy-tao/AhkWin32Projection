#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapToneMappingMode extends Win32Enum {

    /**
     * Native name: WICBitmapToneMappingMode_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: WICBitmapToneMappingMode_Default
     * @type {Integer (Int32)}
     */
    static Default => 1

    /**
     * Native name: WICBitmapToneMappingMode_D2D
     * @type {Integer (Int32)}
     */
    static D2D => 2

    /**
     * Native name: WICBitmapToneMappingMode_GainMap
     * @type {Integer (Int32)}
     */
    static GainMap => 3
}
