#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class BrushType extends Win32Enum {

    /**
     * Native name: BrushTypeSolidColor
     * @type {Integer (Int32)}
     */
    static SolidColor => 0

    /**
     * Native name: BrushTypeHatchFill
     * @type {Integer (Int32)}
     */
    static HatchFill => 1

    /**
     * Native name: BrushTypeTextureFill
     * @type {Integer (Int32)}
     */
    static TextureFill => 2

    /**
     * Native name: BrushTypePathGradient
     * @type {Integer (Int32)}
     */
    static PathGradient => 3

    /**
     * Native name: BrushTypeLinearGradient
     * @type {Integer (Int32)}
     */
    static LinearGradient => 4
}
