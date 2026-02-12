#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the color space for interpolating color values in [ColorKeyFrameAnimation](colorkeyframeanimation.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncolorspace
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionColorSpace extends Win32Enum{

    /**
     * Use the default color space for interpolation.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Use the HSL color space for interpolation.
     * @type {Integer (Int32)}
     */
    static Hsl => 1

    /**
     * Use the ARGB color space for interpolation.
     * @type {Integer (Int32)}
     */
    static Rgb => 2

    /**
     * Use the linear HSL color space for interpolation.
     * @type {Integer (Int32)}
     */
    static HslLinear => 3

    /**
     * Use the linear ARGB color space for interpolation.
     * @type {Integer (Int32)}
     */
    static RgbLinear => 4
}
