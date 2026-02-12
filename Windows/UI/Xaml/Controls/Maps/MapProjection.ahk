#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to transform the latitudes and longitudes of the map
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapprojection
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapProjection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WebMercator => 0

    /**
     * @type {Integer (Int32)}
     */
    static Globe => 1
}
