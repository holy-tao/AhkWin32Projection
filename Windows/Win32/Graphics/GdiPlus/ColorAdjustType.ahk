#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorAdjustType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeBitmap => 1

    /**
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeBrush => 2

    /**
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypePen => 3

    /**
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeText => 4

    /**
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeCount => 5

    /**
     * @type {Integer (Int32)}
     */
    static ColorAdjustTypeAny => 6
}
