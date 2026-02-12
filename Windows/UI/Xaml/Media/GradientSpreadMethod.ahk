#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to draw the gradient outside a gradient brush's gradient vector or space.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientspreadmethod
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class GradientSpreadMethod extends Win32Enum{

    /**
     * The color values at the ends of the gradient vector fill the remaining space.
     * @type {Integer (Int32)}
     */
    static Pad => 0

    /**
     * The gradient is repeated in the reverse direction until the space is filled.
     * @type {Integer (Int32)}
     */
    static Reflect => 1

    /**
     * The gradient is repeated in the original direction until the space is filled.
     * @type {Integer (Int32)}
     */
    static Repeat => 2
}
