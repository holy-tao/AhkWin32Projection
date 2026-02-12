#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies how a [Timeline](timeline.md) behaves when it is outside its active period but its parent is inside its active or hold period.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.fillbehavior
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class FillBehavior extends Win32Enum{

    /**
     * After it reaches the end of its active period, the timeline holds its progress until the end of its parent's active and hold periods.
     * @type {Integer (Int32)}
     */
    static HoldEnd => 0

    /**
     * The timeline stops if it is outside its active period while its parent is inside its active period.
     * @type {Integer (Int32)}
     */
    static Stop => 1
}
