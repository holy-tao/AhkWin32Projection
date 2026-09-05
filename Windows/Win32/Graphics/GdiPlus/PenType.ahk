#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class PenType extends Win32Enum {

    /**
     * Native name: PenTypeSolidColor
     * @type {Integer (Int32)}
     */
    static SolidColor => 0

    /**
     * Native name: PenTypeHatchFill
     * @type {Integer (Int32)}
     */
    static HatchFill => 1

    /**
     * Native name: PenTypeTextureFill
     * @type {Integer (Int32)}
     */
    static TextureFill => 2

    /**
     * Native name: PenTypePathGradient
     * @type {Integer (Int32)}
     */
    static PathGradient => 3

    /**
     * Native name: PenTypeLinearGradient
     * @type {Integer (Int32)}
     */
    static LinearGradient => 4

    /**
     * Native name: PenTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1
}
