#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the [AnimationState](maptilesource_animationstate.md) of the [MapTileSource](maptilesource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileanimationstate
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileAnimationState extends Win32Enum{

    /**
     * The map tile animation is not playing or paused.
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * The map tile animation is paused. If the [MapTileSource](maptilesource.md) was playing an animation, it continues to display the current frame.
     * @type {Integer (Int32)}
     */
    static Paused => 1

    /**
     * The map tile animation is playing.
     * @type {Integer (Int32)}
     */
    static Playing => 2
}
