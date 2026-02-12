#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that describe the type of animation to play during a slide transition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.slidenavigationtransitioneffect
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class SlideNavigationTransitionEffect extends Win32Enum{

    /**
     * The exiting page fades out and the entering page enters from the bottom.
     * @type {Integer (Int32)}
     */
    static FromBottom => 0

    /**
     * The exiting page leaves to the right of the panel and the entering page enters from the left.
     * @type {Integer (Int32)}
     */
    static FromLeft => 1

    /**
     * The exiting page leaves to the left of the panel and the entering page enters from the right.
     * @type {Integer (Int32)}
     */
    static FromRight => 2
}
