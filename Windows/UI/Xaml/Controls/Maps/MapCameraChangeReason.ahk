#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the reason the position of the map's camera has changed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcamerachangereason
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapCameraChangeReason extends Win32Enum{

    /**
     * The system changed the position of the map's camera.
     * @type {Integer (Int32)}
     */
    static System => 0

    /**
     * The user manually changed the position of the map's camera.
     * @type {Integer (Int32)}
     */
    static UserInteraction => 1

    /**
     * The position of the map's camera changed programmatically.
     * @type {Integer (Int32)}
     */
    static Programmatic => 2
}
