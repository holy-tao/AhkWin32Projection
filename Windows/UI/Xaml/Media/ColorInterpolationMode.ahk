#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines how the colors in a gradient are interpolated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.colorinterpolationmode
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ColorInterpolationMode extends Win32Enum{

    /**
     * Colors are interpolated in the scRGB color space.
     * @type {Integer (Int32)}
     */
    static ScRgbLinearInterpolation => 0

    /**
     * Colors are interpolated in the sRGB color space.
     * @type {Integer (Int32)}
     */
    static SRgbLinearInterpolation => 1
}
