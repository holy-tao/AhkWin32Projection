#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the behavior of a [MapIcon](mapicon.md) when it collides with other map features due to zoom level.
 * @remarks
 * **RemainVisible** applies to the [MapIcon](mapicon.md) image only. Text from the map icon may still be hidden at times, even when the map icon's [CollisionBehaviorDesired](mapicon_collisionbehaviordesired.md) property is set to **RemainVisible**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementcollisionbehavior
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapElementCollisionBehavior extends Win32Enum{

    /**
     * Hide the [MapIcon](mapicon.md) when it collides with other map features.
     * @type {Integer (Int32)}
     */
    static Hide => 0

    /**
     * Show the [MapIcon](mapicon.md) at all zoom levels.
     * @type {Integer (Int32)}
     */
    static RemainVisible => 1
}
