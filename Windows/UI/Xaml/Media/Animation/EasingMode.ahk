#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the animation associated with an easing function interpolates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingmode
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class EasingMode extends Win32Enum{

    /**
     * Interpolation follows 100% interpolation minus the output of the formula associated with the easing function.
     * @type {Integer (Int32)}
     */
    static EaseOut => 0

    /**
     * Interpolation follows the mathematical formula associated with the easing function.
     * @type {Integer (Int32)}
     */
    static EaseIn => 1

    /**
     * Interpolation uses **EaseIn** for the first half of the animation and **EaseOut** for the second half.
     * @type {Integer (Int32)}
     */
    static EaseInOut => 2
}
