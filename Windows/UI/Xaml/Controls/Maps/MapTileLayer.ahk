#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the [Layer](maptilesource_layer.md) type of a [MapTileSource](maptilesource.md).
 * @remarks
 * You can specify one of the named layers of map content to contain the tiles that you overlay on the map. The values of the MapTileLayer enumeration are similar to a range of z-index values, from foreground to background. If you don't specify a value for the [Layer](maptilesource_layer.md) property, the tiles are overlaid in the foreground layer.
 * 
 * To replace the default map entirely:
 * 
 * 
 * + Specify MapTileLayer.**BackgroundReplacement** as the value of the [Layer](maptilesource_layer.md) property of the [MapTileSource](maptilesource.md).
 * + Specify [MapStyle](mapstyle.md).**None** as the value of the [Style](mapcontrol_style.md) property of the [MapControl](mapcontrol.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilelayer
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileLayer extends Win32Enum{

    /**
     * The [MapTileSource](maptilesource.md) is a label overlay.
     * @type {Integer (Int32)}
     */
    static LabelOverlay => 0

    /**
     * The [MapTileSource](maptilesource.md) is a road overlay.
     * @type {Integer (Int32)}
     */
    static RoadOverlay => 1

    /**
     * The [MapTileSource](maptilesource.md) is an area overlay.
     * @type {Integer (Int32)}
     */
    static AreaOverlay => 2

    /**
     * The [MapTileSource](maptilesource.md) is a background overlay.
     * @type {Integer (Int32)}
     */
    static BackgroundOverlay => 3

    /**
     * The [MapTileSource](maptilesource.md) is a background replacement overlay.
     * @type {Integer (Int32)}
     */
    static BackgroundReplacement => 4
}
