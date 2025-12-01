#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PenType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PenTypeSolidColor => 0

    /**
     * @type {Integer (Int32)}
     */
    static PenTypeHatchFill => 1

    /**
     * @type {Integer (Int32)}
     */
    static PenTypeTextureFill => 2

    /**
     * @type {Integer (Int32)}
     */
    static PenTypePathGradient => 3

    /**
     * @type {Integer (Int32)}
     */
    static PenTypeLinearGradient => 4

    /**
     * @type {Integer (Int32)}
     */
    static PenTypeUnknown => -1
}
