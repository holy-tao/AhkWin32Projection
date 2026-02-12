#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the minimum and maximum zoom level for a [MapTileSource](maptilesource.md). This structure is used by the [ZoomLevelRange](maptilesource_zoomlevelrange.md) property of a [MapTileSource](maptilesource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapzoomlevelrange
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapZoomLevelRange extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The minimum zoom level for a [MapTileSource](maptilesource.md).
     * @type {Float}
     */
    Min {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The maximum zoom level for a [MapTileSource](maptilesource.md).
     * @type {Float}
     */
    Max {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }
}
