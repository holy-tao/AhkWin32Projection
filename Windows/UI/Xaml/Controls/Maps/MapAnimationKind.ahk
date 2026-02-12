#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the animation to use when you change the view of the map. For example, you can specify animation when calling the [TrySetViewAsync](mapcontrol_trysetviewasync_2106504554.md) or [TrySetViewBoundsAsync](mapcontrol_trysetviewboundsasync_1104525723.md) methods.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapanimationkind
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapAnimationKind extends Win32Enum{

    /**
     * The default animation.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * No animation
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * A linear animation.
     * @type {Integer (Int32)}
     */
    static Linear => 2

    /**
     * A parabolic animation.
     * @type {Integer (Int32)}
     */
    static Bow => 3
}
