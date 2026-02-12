#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the [Style](mapcontrol_style.md) of the [MapControl](mapcontrol.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstyle
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapStyle extends Win32Enum{

    /**
     * A style is not specified.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A road map.
     * @type {Integer (Int32)}
     */
    static Road => 1

    /**
     * An aerial map.
     * @type {Integer (Int32)}
     */
    static Aerial => 2

    /**
     * A hybrid map that combines an aerial map with roads.
     * @type {Integer (Int32)}
     */
    static AerialWithRoads => 3

    /**
     * A terrain map.
     * @type {Integer (Int32)}
     */
    static Terrain => 4

    /**
     * An aerial 3D map.
     * @type {Integer (Int32)}
     */
    static Aerial3D => 5

    /**
     * A hybrid map that combines an aerial 3D map with roads.
     * @type {Integer (Int32)}
     */
    static Aerial3DWithRoads => 6

    /**
     * A map that uses a custom [Style](mapcontrol_style.md).
     * @type {Integer (Int32)}
     */
    static Custom => 7
}
