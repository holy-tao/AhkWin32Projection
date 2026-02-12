#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies if the pan gesture is recognized on the map.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappaninteractionmode
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapPanInteractionMode extends Win32Enum{

    /**
     * Panning touch gestures are recognized on the map.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Panning touch gestures are not recognized on the map.
     * @type {Integer (Int32)}
     */
    static Disabled => 1
}
