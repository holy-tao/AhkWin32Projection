#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapToneMappingMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapToneMappingMode_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapToneMappingMode_Default => 1

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapToneMappingMode_D2D => 2

    /**
     * @type {Integer (Int32)}
     */
    static WICBitmapToneMappingMode_GainMap => 3
}
