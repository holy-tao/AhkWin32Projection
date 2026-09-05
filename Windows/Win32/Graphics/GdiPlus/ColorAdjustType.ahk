#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ColorAdjustType extends Win32Enum {

    /**
     * Native name: ColorAdjustTypeDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: ColorAdjustTypeBitmap
     * @type {Integer (Int32)}
     */
    static Bitmap => 1

    /**
     * Native name: ColorAdjustTypeBrush
     * @type {Integer (Int32)}
     */
    static Brush => 2

    /**
     * Native name: ColorAdjustTypePen
     * @type {Integer (Int32)}
     */
    static Pen => 3

    /**
     * Native name: ColorAdjustTypeText
     * @type {Integer (Int32)}
     */
    static Text => 4

    /**
     * Native name: ColorAdjustTypeCount
     * @type {Integer (Int32)}
     */
    static Count => 5

    /**
     * Native name: ColorAdjustTypeAny
     * @type {Integer (Int32)}
     */
    static Any => 6
}
