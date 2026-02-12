#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes the potential states of an animation.
 * @remarks
 * This enumeration is not typically used in XAML.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.clockstate
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ClockState extends Win32Enum{

    /**
     * The current animation changes in direct relation to the animation of its parent.
     * @type {Integer (Int32)}
     */
    static Active => 0

    /**
     * The animation continues and does not change in relation to the animation of its parent.
     * @type {Integer (Int32)}
     */
    static Filling => 1

    /**
     * The animation is stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 2
}
